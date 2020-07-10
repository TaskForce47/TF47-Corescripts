#include "script_component.hpp"
params [
  ["_unit", objNull, [objNull]]
];

if(isNull _trait) exitWith {};

private _slotName = str _unit;
private _id = GVAR(slotTraits) select {(_x select 0) isEqualTo _slotName};
if(_id == -1) exitWith {};

{
  _unit setUnitTrait [_x, true, true];
} forEach (GVAR(slotTraits) select _id select 1);

true
