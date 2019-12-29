#include "script_component.hpp"
/*
 * Author: TF47 Dragon
 * 
 * Adds a whitelist reference numbeer to a current player unit.
 * You can either reference the whitelist by string or the the 
 * coronsponding reference number.
 *
 * Arguments:
 * 0: object the whitelist should be applied on 	<OBJNULL>
 * 1: required permission 							<STRING, NUMBER> 
 *
 * Return Value:
 * 		none
 *
 * Example:
 * [this, "CCT"] call tf47_whitelist_fnc_addSlotWhitelist
 *
 * Public: Yes
 */

params [
	["_object", objNull, [objNull]],
	["_requiredPermission", 0, [0, ""]]
];

if(isNull _object) exitWith {};
if(_requiredPermission == 0) exitWith {};

if(_requiredPermission isEqualType "") then {
	switch (_requiredPermission) do {
		case "CCT": {
			_object setVariable [QGVAR(requiredWhitelist), WHITELIST_CCT];
		};
		case "Admin": {
			_object setVariable [QGVAR(requiredWhitelist), WHITELIST_USER_ADMIN];
		};
		case "Moderator" : {
			_object setVariable [QGVAR(requiredWhitelist), WHITELIST_USER_MODERATOR];
		};
		case "TF": {
			_object setVariable [QGVAR(requiredWhitelist), WHITELIST_USER_TF];
		};
		case "Builders": {
			_object setVariable [QGVAR(requiredWhitelist), WHITELIST_BUILDERS];
		};
		default {
			ERROR("WHITELIST TYPE NOT FOUND!");
		};
	};
} else {
	switch (_requiredPermission) do {
		case 4: {
			_object setVariable [QGVAR(requiredWhitelist), WHITELIST_CCT];
		};
		case 1: {
			_object setVariable [QGVAR(requiredWhitelist), WHITELIST_USER_ADMIN];
		};
		case 2 : {
			_object setVariable [QGVAR(requiredWhitelist), WHITELIST_USER_MODERATOR];
		};
		case 3: {
			_object setVariable [QGVAR(requiredWhitelist), WHITELIST_USER_TF];
		};
		case 10: {
			_object setVariable [QGVAR(requiredWhitelist), WHITELIST_BUILDERS];
		};
		default {
			ERROR("WHITELIST TYPE NOT FOUND!");
		}; 
	};
};