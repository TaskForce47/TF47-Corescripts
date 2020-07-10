#include "script_component.hpp"

params [
  ["_unit", objNull, [objNull]],
  ["_vehicle", objNull, [objNull]]
];

if(isNull _unit || isNull _vehicle) exitWith {};
if(_vehicle isKindOf "Man") exitWith {};

switch true do {
  case (_vehicle call EFUNC(util,isTank)): {
    if(! _unit getUnitTrait TF47_IS_TANKER) exitWith {
      [_unit, "You do not have not the correct slot to use this vehicle"] call FUNC(kickOutPlayer);
    };
  };
  case (_vehicle call EFUNC(util,isUav)): {
    //TODO: add uav logic
  };
  case (_vehicle call EFUNC(util,isHelicopter)): {
    if(! _unit getUnitTrait TF47_IS_PILOT_PLANE) exitWith {
      [_unit, "You do not have the correct slot to use this vehicle"] call FUNC(kickOutPlayer);
    };
  };
  case (_vehicle call EFUNC(util,isPlane)): {
    if(! _unit getUnitTrait TF47_IS_PILOT_HELICOPTER) exitWith {
      [_unit, "You do not have the correct slot to use this vehicle"] call FUNC(kickOutPlayer);
    };
  };
};

