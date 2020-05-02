#include "script_component.hpp"
params [
	["_unit", objNull, [objNull]],
	["_cost", 0, [0]],
	["_slotType", "Rifleman", [""]]
];

_unit setVariable [QGVAR(unitCost), _cost];
_unit setVariable [QGVAR(slotType), _slotType];

[
	_unit,
	"killed",
	{
		params ["_unit"];
		[_unit] call FUNC(handlePlayerKilled);
	}
] call CBA_fnc_addBISEventHandler;

TRACE_2("ADDED TICKET COST TO SLOT", _unit, _cost);
