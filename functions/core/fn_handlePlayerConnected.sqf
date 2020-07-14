#include "script_component.hpp"

params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];

if(_name isEqualTo "__SERVER__") exitWith {};

TRACE_1("PLAYER CONNECTED!", _this);

if(["HC", _uid] call BIS_fnc_inString) exitWith {
	_owner call FUNC(handleConnectionHC);
};

private _namespace = true call CBA_fnc_createNamespace;
_namespace setVariable [QGVAR(playerUid), _uid];
_namespace setVariable [QEGVAR(db,playerName), _name];


private _playerId = _uid call EFUNC(database,getPlayerId);
if(_playerId < 1) then { //if user doesn't exist we need to create a new player
	_playerId = [_uid, _name] call EFUNC(database,createNewPlayer);
};

[QEGVAR(database,updatePlayerConnections), _namespace] call CBA_fnc_serverEvent;
[QEGVAR(database,updatePlayerName), _namespace] call CBA_fnc_serverEvent;

//save player database id, we need to reference this on each database call
_namespace setVariable [QGVAR(playerId),_playerId, true];

//update player connections and name
[QEGVAR(database,updatePlayerConnections),_namespace] call CBA_fnc_serverEvent;

//user will recvive TF47_core_playerNamespace as variable name
GVAR(playerNamespace) = _namespace;
GVAR(playerId) = _playerId;
//send player his own namespace
_owner publicVariableClient QGVAR(playerNamespace);
_owner publicVariableClient QGVAR(playerId);

TRACE_2("PLAYER JOINED! CREATE NEW PROFILE:", _namespace, _name);

PUSH(GVAR(playerList),_namespace);

