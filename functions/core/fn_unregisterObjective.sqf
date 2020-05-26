#include "script_component.hpp"

params [
  ["_id", -1, [0]]
];

private _index = GVAR(objectiveList) findIf { _x select 0 == _id};
if(_index == -1) exitWith {false};

GVAR(objectiveList) deleteAt _index;
publicVariable QGVAR(objectiveList);

true
