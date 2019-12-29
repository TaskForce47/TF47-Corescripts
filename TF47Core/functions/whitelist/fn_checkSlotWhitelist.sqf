#include "script_component.hpp"
/*
 * Author: TF47 Dragon
 * 
 * Checks if the player where this script is called localy is on a 
 * restricted slot and checks if the player is whitelisted for this slot.
 *
 * Arguments:
 *   	none
 *
 * Return Value:
 *		none
 *
 * Example:
 * [] call tf47_whitelist_fnc_checkSlotWhitelist
 *
 * Public: No
 */
LOG_1("Checking if player is allowed for this slot", player);
_requiredWhitelist = player getVariable [QGVAR(requiredWhitelist), -1];
if(_requiredWhitelist == -1) exitwith {
	LOG_1("No whitelist found!", _requiredWhitelist);
};

if(!([_requiredWhitelist] call FUNC(checkWhitelist))) then {
	["WhitelistedSlot", false] call BIS_fnc_endMission;
};

true