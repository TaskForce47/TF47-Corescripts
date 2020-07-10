#include "script_component.hpp"
params [
	["_slotName", "", [""]]	
];

if(_slotName isEqualTo "") exitWith {};

private _id = GVAR(slotCost) findif {(_x select 0) isEqualTo _slotName};
if(_id != -1) then {
	GVAR(slotCost) deleteAt _id;
};

LOG_1("Slot has been unregistered from the ticket system", _slotName);

true