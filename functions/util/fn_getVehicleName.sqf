#include "script_component.hpp"
params [
  ["_vehicle", objNull, ["",objNull]]
];

if(_vehicle isEqualType objNull) then {
  _vehicle = typeOf _vehicle;
};
private _displayName = getText (configFile >>  "CfgVehicles" >> _vehicle >> "displayName");

_displayName
