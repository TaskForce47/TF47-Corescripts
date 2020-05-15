#include "script_component.hpp"

params [
  ["_unit", objNull, [objNull]],
  ["_permissions", [], [[]]]
];

_unit setVariable [QGVAR(slotRestrictions), _permissions];

true
