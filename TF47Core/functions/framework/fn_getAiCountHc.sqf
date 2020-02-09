#include "script_component.hpp"
/*
 * Author: Dragon
 * This script will evaluted how many groups and units are owned by a unit.
 * It is intended to use with Headless Client load balancing but can also be used
 * for debug or other fancy stuff.
 *
 * Arguments:
 * 0: owner id		<NUMBER>
 *
 * Return Value:
 * Current count of owned groups and units using format [groups, units]	 <ARRAY>
 *
 * Example:
 * [2] call TF47_framework_fnc_getAiCountHc  //will get the result for the server
 *
 * Public: Yes - Server only
 */
params [
	["_ownerId", 0, [-1]]
];

if(!isServer) exitWith {};
if(_ownerId == -1) exitWith { LOG("Error incorrect hc id!"); 0;};

_ownedGroups = {groupOwner  _x == _ownerId} count allGroups;
_ownedUnits = {owner _x == _ownerId} count allUnits;

LOG_3("HC AI COUNT LOG >> HC_ID, LOCAL GROUPS, LOCAL UNITS <<",_ownerId,_ownedGroups,_ownedUnits);
[_ownedGroups, _ownedUnits]