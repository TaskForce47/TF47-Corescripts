#include "script_component.hpp"

if(hasInterface && {!isDedicated}) then {
	["vehicle", {
    	params ["_unit", "_newVehicle"];
		[_newVehicle] call FUNC(checkVehicleWhitelist);
	}, true] call CBA_fnc_addPlayerEventHandler;
};