#include "script_component.hpp"

if(! EGVAR(enableVehicleDeserting)) exitWith {};

[
  {
    private _vehicles = GVAR(vehicleList);
    private _baseList = EGVAR(core,baseList);
    private _timeout = EGVAR(core,vehicleDisertingTimeout);

    {
      //check if vehicle is inside the base and reset the timer if true
      private _vehilce = _x;
      {
        if([_vehilce, _x select 2, x select 3] call FUNC(isInCircle)) exitWith {
          _vehilce setVariable [QGVAR(lastTimeUsed), CBA_missionTime];
        };
      } forEach _baseList;

      private _lastTimeUsed = _vehilce getVariable [QGVAR(lastTimeUsed), CBA_missionTime];

      if(CBA_missionTime - _lastTimeUsed > (_timeout * 60)) then {
        //check for crew in case somebody sits in the vehicle outside the base for hours
        private _crewCount = count (crew _vehilce select {alive _x});
        if(_crewCount == 0) then {
          //due to performance execute in the next frame
          [
            {
              params ["_vehilce"];
              [_vehilce] call FUNC(handleDesertion)
            },
            _vehilce
          ] call CBA_fnc_execNextFrame;

        } else {
          _vehilce setVariable [QGVAR(lastTimeUsed), CBA_missionTime];
        };
      };
    } forEach _vehicles;
  },
  60,
  []
] call CBA_fnc_addPerFrameHandler;
