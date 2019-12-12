#include "script_component.hpp"
/*
 * Author: TF47 Dragon
 *
 * Checks if a player has a specific whitelisting for a vehicle or slot
 * This script must be called on the local client
 *
 * Arguments:
 * 0: player id 			<SCALAR>
 *
 * Return Value:
 * whitelist check result 	<BOOLEAN>
 *
 * Example:
 * [playerId] call tf47_whitelist_fnc_checkWhitelist;
 *
 * Public: Yes
 */

params [
	["_whitelistId", 9999, [0]]
];

private _whitelist = EGVAR(core, playerNamespace) getVariable [QGVAR(whitelist), []];
if(! (_whitelistId in _whitelist)) exitWith { false };

true
