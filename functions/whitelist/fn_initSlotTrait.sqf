#include "script_component.hpp"
params [
  ["_unit", objNull, [objNull]]
];

if(isNull _trait) exitWith {};

_unit setUnitTrait [TF47_IS_TANKER, false, true];
_unit setUnitTrait [TF47_IS_PILOT_HELICOPTER, false, true];
_unit setUnitTrait [TF47_IS_PILOT_PLANE, false, true];
_unit setUnitTrait [TF47_IS_UAV, false, true];

private _slotName = str _unit;
private _id = GVAR(slotTraits) findIf {(_x select 0) isEqualTo _slotName};
if(_id == -1) exitWith {};

{
  _unit setUnitTrait [_x, true, true];
} forEach (GVAR(slotTraits) select _id select 1);

true
