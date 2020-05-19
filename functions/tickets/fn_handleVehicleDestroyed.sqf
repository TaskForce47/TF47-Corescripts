#include "script_component.hpp"

params [
	["_vehicle", objNull, [objNull]]
];

if(isNull _vehicle) exitWith {
	ERROR("CANNOT HANDLE VEHICLE... VEHICLE objNull");
};

private _cost = _vehicle getVariable [QGVAR(cost), 0];
//private _lastCommander = _vehicle getVariable [QGVAR(lastCommander), objNull];
private _displayName = [_vehicle] call EFUNC(util,getVehicleName);
private _message = format ["%1 was destroyed! %2 tickets.", _displayName, _cost];

[QGVAR(changeTicketCount),[_message, _cost]] call CBA_fnc_serverEvent;
TRACE_2("VEHICLE WITH REGISTERED TICKETS DESTROYED!", _displayName, _cost);

private _vehicleList = GVAR(vehicleList);
GVAR(vehicleList) = _vehicleList - [_vehicle];

true
