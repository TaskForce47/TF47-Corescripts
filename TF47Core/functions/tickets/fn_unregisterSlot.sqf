#include "script_component.hpp"

params [
  ["_unit", objNull, [objNull]]
];

if(isNull _unit) exitWith {false};

_unit setVariable [QGVAR(unitCost), nil];
_unit setVariable [QGVAR(slotType), nil];
private _killedEhId = _unit getVariable [QGVAR(killedEh), -1];

if(_killedEhId < 0) then {
  _unit removeEventHandler ["Killed", _killedEhId];
};

true
