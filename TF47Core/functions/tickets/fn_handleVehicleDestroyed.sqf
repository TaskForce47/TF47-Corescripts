#include "script_component.hpp"

params [
	["_vehicle", objNull, [objNull]]
];

if(isNil _vehicle) exitWith {
	ERROR("CANNOT HANDLE VEHICLE... VEHICLE objNull");
};

private _cost = _vehicle getVariable [QGVAR(cost), 0];
//private _lastCommander = _vehicle getVariable [QGVAR(lastCommander), objNull];
private _vehicleName = getText (configFile >>  "CfgVehicles" >> _vehicle >> "displayName");
private _message = format ["%1 was destroyed! %2 tickets.", _vehicleName, _cost];

[QGAVR(changeTicketCount),[_message, _cost]] call CBA_fnc_serverEvent; 
TRACE_2("VEHICLE WITH REGISTERED TICKETS DESTROYED!", _vehicle, _cost);

true
