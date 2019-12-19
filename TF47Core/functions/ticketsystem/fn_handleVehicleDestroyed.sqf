#include "script_component.hpp"

params ["_vehicle", objNull, [objNull]];

if(isNull _vehicle) exitWith {ERROR_1("Vehicle is not defined in destroyed eventhandler");};
TRACE_2("Vehicle with ticketsystem attached destroyed!", _vehicle, _lastDriver);
private _cost = _vehicle getVariable [QGVAR(cost), 0];
private _lastDriver = _vehicle getVariable [QGVAR(lastCommander), []];

TRACE_2("Vehicle with ticketsystem attached destroyed!", _vehicle, _lastDriver);

private _message = format ["%1 wurde zerstört! -%2 Tickets", name _vehicle, _cost];

[_message, _cost, true] call FUNC(changeTickets);

true