#include "script_component.hpp"

params [
  ["_vehicle", objNull, [objNull]],
  ["_cost", objNull, [objNull]]
];

_cost = -1 * (abs _cost);

_vehicle setVariable [QGVAR(lastCommander), objNull];
_vehicle setVariable [QGVAR(cost), _cost];

[
  _vehicle,
  "killed",
  {
    params ["_unit"];
    [_unit] call FUNC(handleVehicleDestroyed);
  }
] call CBA_fnc_addBISEventHandler;

TRACE_2("ADDED TICKET COST TO VEHICLE", _vehicle, _cost);
