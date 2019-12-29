#include "script_component.hpp"

if(hasInterface && {!isDedicated}) then {
	call FUNC(checkSlotWhitelist); //slot whitelist check
	["vehicle", {
    	params ["_unit", "_newVehicle"];
		[_newVehicle] call FUNC(checkVehicleWhitelist);
	}, true] call CBA_fnc_addPlayerEventHandler;
	["turret", {
		params ["_unit", ""];
		[vehicle _unit] call FUNC(checkVehicleWhitelist)
	}, true] call CBA_fnc_addPlayerEventHandler;
};