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
	params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
	if(_name isEqualTo "__SERVER__") exitWith {};
	if(["HC", _uid] call BIS_fnc_inString) exitWith {
		[_owner] call FUNC(handleConnectionHC);
	};

	_namespace = true call CBA_fnc_createNamespace;
	_namespace setVariable [QGVAR(playerUid), _uid];
	_namespace setVariable [QGVAR(playerName), _name];
	_namespace setVariable [QGVAR(clientId), _owner, true];

	if(GVAR(useLogging)) then {
		//setup time logging stuff
		_namespace setVariable [QGVAR(timePlayedInf), 0];
		_namespace setVariable [QGVAR(timePlayedVehSmall), 0];
		_namespace setVariable [QGVAR(timePlayedVehTracked), 0];
		_namespace setVariable [QGVAR(timePlayedVehPlane), 0];
		_namespace setVariable [QGVAR(timePlayedVehHelo), 0];
		_namespace setVariable [QGVAR(timePlayedBase), 0]; //lol time "played"
		_namespace setVariable [QGVAR(timePlayedObjective), 0];

		//setup kill tracking
		_namespace setVariable [QGVAR(killsInf), 0];
		_namespace setVariable [QGVAR(killsVehSmall), 0];
		_namespace setVariable [QGVAR(killsVehTracked), 0];
		_namespace setVariable [QGVAR(killsVehPlane), 0];
		_namespace setVariable [QGVAR(killsVehHelo), 0];
		_namespace setVariable [QGVAR(deathsInf), 0];
		_namespace setVariable [QGVAR(deathsVehSmall), 0];
		_namespace setVariable [QGVAR(deathsVehTracked), 0];
		_namespace setVariable [QGVAR(deathsVehHelo), 0];
		_namespace setVariable [QGVAR(deathsVehPlane), 0];
	};

	private _playerId = [_uid] call EFUNC(database,getPlayerId);
	if(_playerId == -1) then { //if user doesn't exist we need to create a new player
		_playerId = [_name, _uid] call EFUNC(database,createPlayer); 
	} else {
		[_playerId, _name] call EFUNC(database,updatePlayerName);
		[_playerId] call EFUNC(database,updateNumberConnections);
	};

	//save player database id, we need to reference this on each database call
	_namespace setVariable [QGVAR(playerId),_playerId, true];

	GVAR(playerNamespace) = _namespace; //user will recvive TF47_core_playerNamespace as variable name
	//send player his own namespace
	_owner publicVariableClient QGVAR(playerNamespace);

	[_playerId] remoteExec [QFUNC(setPlayerIdLocal), _owner];
	
	_owner publicVariableClient QGVAR(playerId);
	PUSH(GVAR(playerList),_namespace);

	if(GVAR(useWhitelist)) then {
		[_playerId] call EFUNC(whitelist,reloadWhitelists);
	};
}];
true