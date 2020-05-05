#include "script_component.hpp"
/*
 * Author: TF47 Dragon
 *
 * This script will be called by a bi mission eventhandler
 *
 * Checks if a player namespace already exits and if not this script will
 * create a new player namespace for this player where the data will be stored.
 * This script will also ensure only real player will get created a namespace.
 *
 * Public: No
 */
addMissionEventHandler ["PlayerConnected", {
	params ["", "_uid", "_name", "", "_owner", ""];
	if(_name isEqualTo "__SERVER__") exitWith {};
	if(["HC", _uid] call BIS_fnc_inString) exitWith {
		[_owner] call FUNC(handleConnectionHC);
	};

	private _namespace = true call CBA_fnc_createNamespace;
	_namespace setVariable [QEGVAR(db,playerUid), _uid];
	_namespace setVariable [QEGVAR(db,playerName), _name];

	if(GVAR(useLogging)) then {
		//setup time logging stuff
		_namespace setVariable [QEGVAR(db,timePlayedInf), 0];
		_namespace setVariable [QEGVAR(db,timePlayedVehSmall), 0];
		_namespace setVariable [QEGVAR(db,timePlayedVehTracked), 0];
		_namespace setVariable [QEGVAR(db,timePlayedVehPlane), 0];
		_namespace setVariable [QEGVAR(db,timePlayedVehHelo), 0];
		_namespace setVariable [QEGVAR(db,timePlayedBase), 0]; //lol time "played"
		_namespace setVariable [QEGVAR(db,timePlayedObjective), 0];

		//setup kill tracking
		_namespace setVariable [QEGVAR(db,killsInf), 0];
		_namespace setVariable [QEGVAR(db,killsVehSmall), 0];
		_namespace setVariable [QEGVAR(db,killsVehTracked), 0];
		_namespace setVariable [QEGVAR(db,killsVehPlane), 0];
		_namespace setVariable [QEGVAR(db,killsVehHelo), 0];
		_namespace setVariable [QEGVAR(db,deathsInf), 0];
		_namespace setVariable [QEGVAR(db,deathsVehSmall), 0];
		_namespace setVariable [QEGVAR(db,deathsVehTracked), 0];
		_namespace setVariable [QEGVAR(db,deathsVehHelo), 0];
		_namespace setVariable [QEGVAR(db,deathsVehPlane), 0];
	};

	private _playerId = [_uid] call EFUNC(database,getPlayerId);
	if(_playerId < 1) then { //if user doesn't exist we need to create a new player
		_playerId = [_uid, _name] call EFUNC(database,createNewPlayer);
	};
	_namespace setVariable [QEGVAR(db,playerId), _playerId, true];

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


	/*
	[_playerId,
		{
			params ["_playerId"];
			player setVariable [QGVAR(playerId), _playerId, true];
			QGVAR(playerId) = _playerId;
			TRACE_1("PLAYER: GOT NEW PLAYER ID!", _playerId);
		}
	] remoteExec ["call", _owner];*/


	TRACE_2("PLAYER JOINED! CREATE NEW PROFILE:", _namespace, _name);

	PUSH(GVAR(playerList),_namespace);
}];
