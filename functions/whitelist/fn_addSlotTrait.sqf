#include "script_component.hpp"
params [
  ["_unit", objNull, [objNull]],
  ["_trait", "", [""]]
];

if(isNull _trait) exitWith {};

if(local _unit) then {
  _unit setUnitTrait [_trait, true, true];
} else {
  [_unit, _trait, true] remoteExecCall ["setUnitTrait", _unit];
};

true
