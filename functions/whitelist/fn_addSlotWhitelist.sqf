#include "script_component.hpp"
params [
  ["_slot", objNull, [objNull,""]],
  ["_requiredPermission", [], [[]]],
  ["_minimalPermission", [], [[]]]
];

TRACE_2("Adding slot to slot whitelist:", _slot, _requiredPermission);

if(_slot isEqualType objNull) then {
  _slot = str _slot;
};

GVAR(slotWhitelist) pushBack [_slot, _requiredPermission, _minimalPermission];
publicVariable QGVAR(slotWhitelist);

true
