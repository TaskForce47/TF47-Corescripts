#include "script_component.hpp"
/*
 * Author: TF47 Dragon
 *
 * This script will be called by a bi mission eventhandler
 *
 * Saves all data from a players namespace and will save the data to the database.
 * After that the namespace will be deleted.
 * This script will also ensure only real player will get the namespace deleted.
 *
 * Public: No
 */
addMissionEventHandler ["PlayerDisconnected", {
	params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];

	if(_name isEqualTo "__SERVER__") exitWith {};
	if(["HC", _uid] call BIS_fnc_inString) exitWith {
		[_owner] call FUNC(handleDisconnectHC);
	};


	private _index = GVAR(playerList) findIf { _x getVariable [QGVAR(playerUid), ""] == _uid };
	if(_index < 0) exitWith {
		ERROR_2("On player disconnect, player namespace seems not to exist", _uid, _name);
	};
	private _namespace = GVAR(playerList) select _index;

	if(GVAR(useLogging)) then {
	//TODO: save players playetime and kills
	};

	_namespace call CBA_fnc_deleteNamespace;
	//this removes the old reference on the namespace [objref1, nil, objref2] -> [objref1, objref2]
	GVAR(playerList) arrayIntersect GVAR(playerList);
	GVAR(playerList) = GVAR(playerList) - [objNull];
	TRACE_1("Cleaned up namespace for player", _name);
}];
