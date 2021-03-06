#include "script_component.hpp"
params [
	["_vehicle", objNull, [objNull]]
];

if(isNull _vehicle || { _vehicle getVariable [QGVAR(killHandled), false] }) exitWith {};

private _cost = _vehicle getVariable [QGVAR(cost), 0];
private _displayName = _vehicle call EFUNC(util,getVehicleName);
private _message = format["%1 was destroyed! <br/> %2 -%3", _displayName, "<t color='#ff4c33'>Ticket loss: </t>", _cost];

[_cost, true, _message] call FUNC(changeTicketCount);
TRACE_2("vehicle with tickets destroyed!", _displayName, _cost);

_vehicle setVariable [QGVAR(killHandled), true];

true
