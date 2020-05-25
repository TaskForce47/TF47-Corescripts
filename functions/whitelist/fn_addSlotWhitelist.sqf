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
 * 1: required permission 												<ARRAY>
 *
 * Return Value:
 * 		none
 *
 * Example:
 * [this, ["CCT"]] call tf47_whitelist_fnc_addSlotWhitelist
 *
 * Public: Yes
 */

params [
 	["_object", objNull, [objNull]],
 	["_requiredPermission", [], [[]]]
];

if(isNull _object) exitWith {};

private _result = [];
{
	switch (_x) do {
		case "CCT": {
			_result pushBack WHITELIST_CCT;
		};
		case "Admin": {
			_result pushBack WHITELIST_USER_ADMIN;
		};
		case "Moderator" : {
			_result pushBack WHITELIST_USER_MODERATOR;
		};
		case "TF47": {
 			_result pushBack WHITELIST_USER_TF;
		};
		case "Stammspieler": {
			_result pushBack WHITELIST_USER_STAMM;
		};
		case "Builders": {
			_result pushBack WHITELIST_BUILDERS;
		};
		default {
			ERROR("WHITELIST TYPE NOT FOUND!");
		};
	};
} forEach _requiredPermission;

_object setVariable [QGVAR(requiredWhitelist), _result];
