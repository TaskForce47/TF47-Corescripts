#include "script_component.hpp"

//[this, 10] call TF47_ticket_fnc_registerVehicle;
params [
  ["_vehicle", objNull, [objNull]],
  ["_cost", 0, [0]]
];

if(! (_vehicle getVariable [QGVAR(enabled), true])) exitWith {};

_cost = -1 * (abs _cost);
_vehicle setVariable [QGVAR(lastCommander), objNull];
_vehicle setVariable [QGVAR(cost), _cost];
_vehicle setVariable [QGVAR(lasttimeUsed), CBA_missionTime];

//_vehicle setVariable [QGVAR(lastUsed), CBA_missionTime];

_vehicle addMPEventHandler ["MPKilled", {
  params ["_unit"];
  if(!isServer) exitWith {};
  [_unit] call FUNC(handleVehicleDestroyed);
}];

//now we need to keep track of the last commanding user
/*
private _fnc_findNewCommander = {
  params ["_vehicle"];
  private _commander = commander _vehicle;
  private _gunner = gunner _vehicle;
  private _driver = driver _vehicle;

  _vehicle setVariable [QGVAR(lastUsed), CBA_missionTime];

  if(! isNull _commander && {isPlayer _commander}) exitwith {
    _vehicle setVariable [QGVAR(lastCommander), _commander];
    TRACE_2("NEW COMMANDER FOR VEHICLE (commander)", _vehilce, _commander);
  };
  if(! isNull _gunner && {isPlayer _gunner}) exitwith {
    _vehicle setVariable [QGVAR(lastCommander), _commander];
    TRACE_2("NEW COMMANDER FOR VEHICLE (gunner)", _vehilce, _commander);
  };
  if(! isNull _driver && {isPlayer _driver}) exitwith {
    _vehicle setVariable [QGVAR(lastCommander), _driver];
    TRACE_2("NEW COMMANDER FOR VEHICLE (driver)", _vehilce, _commander);
  };
};
*/
[
  _vehicle,
  "GetIn",
  {
    _vehicle setVariable [QGVAR(lastTimeUsed), CBA_missionTime]
  }
] call CBA_fnc_addBISEventHandler;

[
  _vehicle,
  "GetOut",
  {
    _vehicle setVariable [QGVAR(lastTimeUsed), CBA_missionTime]
  }
] call CBA_fnc_addBISEventHandler;

TRACE_2("ADDED TICKET COST TO VEHICLE", typeOf _vehicle, _cost);

GVAR(vehicleList) pushBack _vehicle;

true
