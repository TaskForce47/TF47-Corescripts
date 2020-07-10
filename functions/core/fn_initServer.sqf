#include "script_component.hpp"

GVAR(playerList) = []; //initialize list where player namespaces will be saved
GVAR(hcList) = [];
GVAR(baseList) = [];
GVAR(objectiveList) = [];
publicVariable QGVAR(baseList);
publicVariable QGVAR(objectiveList);

[GVAR(maxConnections), GVAR(missionId)] call EFUNC(database,init);

//DO NOT CHANGE ORDER!
call FUNC(handlePlayerConnected);
call FUNC(handlePlayerDisconnected);
call EFUNC(ticket,initServer);
call EFUNC(logging,initServer);
call EFUNC(marker,initServer);
call EFUNC(ace,initServer);
call EFUNC(whitelist,initServer);
call EFUNC(util,initServer);

if(IS_SINGLEPLAYER) then {
	private _namespace = true call CBA_fnc_createNamespace;
	_namespace setVariable [QGVAR(playerUid), getPlayerUID player];
	_namespace setVariable [QEGVAR(db,playerName), name player];


	private _playerId = (getPlayerUID player) call EFUNC(database,getPlayerId);
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
	0 publicVariableClient QGVAR(playerNamespace);
	0 publicVariableClient QGVAR(playerId);

	TRACE_2("PLAYER JOINED! CREATE NEW PROFILE:", _namespace, _name);

	PUSH(GVAR(playerList),_namespace);

} else {
	addMissionEventHandler ["PlayerConnected", { _this call FUNC(handlePlayerConnected) }];
	addMissionEventHandler ["PlayerDisconnected", { _this call FUNC(handlePlayerDisconnected) }];
};


