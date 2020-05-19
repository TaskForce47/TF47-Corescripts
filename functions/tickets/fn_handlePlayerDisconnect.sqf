#include "script_component.hpp"

addMissionEventHandler ["HandleDisconnect", {
  params ["_unit"];

  //first check for unit registred with cost
  private _cost = _unit getVariable [QGVAR(unitCost), 0];
  if(_cost == 0) exitWith {};

  if(! ([_unit] call ace_medical_status_fnc_hasStableVitals)) exitWith {
    TRACE_1("PLAYER DISCONNECTED IN UNSTABLE CONDITION",_unit);
    [_unit] call FUNC(handlePlayerKilled);
  };
}];
