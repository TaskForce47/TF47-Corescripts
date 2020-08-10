#include "script_component.hpp"
params [
	["_unit", objNull, [objNull]]
];

if(isNull _unit) exitWith {};

private _cost = GVAR(defaultSlotCost);
private _slotName = str _unit;
private _slotType = "Rifleman";
private _id = GVAR(slotCost) findIf {(_x select 0) isEqualTo _slotName};
if(_id != -1) then {
	_cost = GVAR(slotCost) select _id select 1;
	_slotType = GVAR(slotCost) select _id select 2;
};
private _message = format["%1 died! <br/> %2 %3", _slotType, "<t color='#ff4c33'>Ticket Verlust: </t>", _cost];

[_cost, true, _message, GVAR(playerId)] call FUNC(changeTicketCount);

TRACE_2("Player died!", _unit, _cost);

true