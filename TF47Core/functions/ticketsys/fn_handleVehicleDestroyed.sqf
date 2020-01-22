#include "script_component.hpp"

params [
	["_vehicle", objNull, [objNull]]
];

if(isNull _vehicle) exitWith {ERROR_1("Vehicle is not defined in destroyed eventhandler");};
TRACE_2("Vehicle with ticketsystem attached destroyed!", _vehicle, _lastDriver);
_netId = netId _vehicle;

_id = GVAR(activeVehicles) findIf {_x#0 == _netId};
if(_id == -1) exitWith { TRACE_1("Cannot find the vehicle for handling the unitcost", _vehicle)};
_vehicleNamespace = GVAR(activeVehicles) select _id select 1;


private _cost = _vehicleNamespace getVariable [QGVAR(cost), 0];
private _lastDriver = _vehicleNamespace getVariable [QGVAR(lastCommander), []];
private _vehicleName = _vehicleNamespace getVariable [QGVAR(vehicleName), "unknown"];

TRACE_2("Vehicle with ticketsystem attached destroyed!", _vehicle, _lastDriver);

private _message = format ["%1 wurde zerstört!\n -%2 Tickets", _vehicleName, _cost];

[_message, _cost, true] call FUNC(changeTicketCount);

//cleanup 
_vehicleNamespace call CBA_fnc_deleteNamespace;
GVAR(activeVehicles) deleteAt _id;

true