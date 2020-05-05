#include "script_component.hpp"

params [
  ["_unit", objNull, [objNull]]
];

if(isNil "_unit") exitWith {};

private _cost = _unit getVariable [QGVAR(unitCost), 0];
private _slotType = _unit getVariable [QGVAR(slotType), "Rifleman"];
private _message = format ["%1 was killed! %2 tickets lost.", _slotType, _cost];
[QGVAR(changeTicketCount),[_message, _cost]] call CBA_fnc_serverEvent;
TRACE_2("PLAYER WITH REGISTERED TICKETS DESTROYED!", _vehicle, _cost);
