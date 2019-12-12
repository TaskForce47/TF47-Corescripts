#include "script_component.hpp"
/*
 * Author: TF47 Dragon
 *
 * Checks if a player has a specific whitelisting for a vehicle or slot
 * This script must be called on the local client
 *
 * Arguments:
 * 0: whitelist id or multiple of them in an array 	<SCALAR, ARRAY>
 *
 * Return Value:
 * whitelist check result 	<BOOLEAN>
 *
 * Example:
 * [4] call tf47_whitelist_fnc_checkWhitelist;
 * [WHITELIST_PLANE] call tf47_whitelist_fnc_checkWhitelist;
 * [[WHITELIST_USER_ADMIN, WHITELIST_USER_MODERATOR]] call tf47_whitelist_fnc_checkWhitelist;
 *
 * Public: Yes
 */

params [
	["_whitelistId", [], [0, []]]
];

if(_whitelistId isEqualType []) then {
	_whitelist = EGVAR(core, playerNamespace) getVariable [QGVAR(whitelist), []];
	{
		if(_x in _whitelist) exitWith { true };
	} forEach _whitelistId;
} else {
	_whitelist = EGVAR(core, playerNamespace) getVariable [QGVAR(whitelist), []];
	if(_whitelistId in _whitelist) exitWith { true };
};



false
