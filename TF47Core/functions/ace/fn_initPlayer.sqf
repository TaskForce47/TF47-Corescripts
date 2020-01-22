#include "script_component.hpp"
["ace_unconscious", {
	params ["_unit", "_state"];

	if(_state) then {
		_unit setUnitTrait ["audibleCoef", 0];
	} else {
		_unit setUnitTrait ["audibleCoef", 1];
	};
}] call CBA_fnc_addEventHandler;

call FUNC(preventPlayerBleedout);