#include "script_component.hpp"
params [
	["_slotName", "", [""]],
	["_tickets", 0, [0]],
	["_slotType", "Rifleman", [""]]
];

if(GVAR(slotCost) findIf {(_x select 0) isEqualTo _slotName} != -1) exitWith {
	ERROR_1("Warning you are trying to double register a slot!", _slotName);
	false
};

GVAR(slotCost) pushBack [_slotName, _tickets, _slotType];
LOG_3("Slot registered!", _slotName, _tickets,_slotType);

true