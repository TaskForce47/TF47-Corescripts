#include "script_component.hpp"

//[this, 15] call TF47_ticket_fnc_registerSlot

params [
	["_unit", objNull, [objNull]],
	["_cost", 0, [0]],
	["_slotType", "Rifleman", [""]]
];

_unit setVariable [QGVAR(unitCost), _cost];
_unit setVariable [QGVAR(slotType), _slotType];

TRACE_2("ADDED TICKET COST TO SLOT", _unit, _cost);

true
