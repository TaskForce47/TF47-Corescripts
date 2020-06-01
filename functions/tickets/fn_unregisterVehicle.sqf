#include "script_component.hpp"

//[vehicle] call TF47_ticket_fnc_unregisterVehicle;

params [
  ["_vehicle", objNull, [objNull]]
];

if(isNull _vehicle || {!isServer}) exitWith {false};

_vehicle setVariable [QGVAR(cost), nil];
private _eventhandlerId = _vehicle getVariable [QGVAR(killedEventhandlerId), -1];
if(_eventhandlerId != -1) then {
  _vehicle removeMPEventHandler ["MPKilled", _eventhandlerId];
};

private _id = GVAR(vehicleList) findif {_x isEqualTo _vehicle};
if(_id != -1) then {
  GVAR(vehicleList) deleteAt _id;
};

TRACE_1("REMOVED TICKETSYSTEM FROM VEHICLE", typeOf _vehicle);

true
