#include "script_component.hpp"

params [
  ["_vehicle", objNull, [objNull]],
  ["_cost", 0, [0]]
];

_cost = -1 * (abs _cost);

_vehicle setVariable [QGVAR(lastCommander), objNull];
_vehicle setVariable [QGVAR(cost), _cost];
private _displayName = [_vehicle] call EFUNC(util,getVehicleName);
_vehicle setVariable [QGVAR(displayName), _displayName];

//_vehicle setVariable [QGVAR(lastUsed), CBA_missionTime];

_vehicle addMPEventHandler ["MPKilled", {
  params ["_unit"];
  if(!isServer) exitWith {};
  [_unit] call FUNC(handleVehicleDestroyed);
}];
/*
[
  _vehicle,
  "Killed",
  {
    params ["_unit"];
    systemchat "vehicle destroyed!";
    [_unit] call FUNC(handleVehicleDestroyed);
  }
] call CBA_fnc_addBISEventHandler;*/

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

[
  _vehicle,
  "GetIn", {
    _this call _fnc_findNewCommander;
  }
] call CBA_fnc_addBISEventHandler;

[
  _vehicle,
  "GetOut", {
    _this call _fnc_findNewCommander;
  }
] call CBA_fnc_addBISEventHandler;

[
  _vehicle,
  "SeatSwitched", {
    _this call _fnc_findNewCommander;
  }
] call CBA_fnc_addBISEventHandler;*/

TRACE_2("ADDED TICKET COST TO VEHICLE", _vehicle, _cost);

GVAR(vehicleList) pushBack _vehicle;

true