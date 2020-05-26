#include "script_component.hpp"
params [
  ["_pos", [0,0,0], [[]]],
  ["_radius", 0, [0]]
];

if(_pos isEqualTo [0,0,0]) exitWith {-1};

private _objectiveList = GVAR(objectiveList);

if(count _objectiveList == 0) exitWith {
  GVAR(baseList) pushBack [0, _pos, _radius];
};
private _lastIndex = count _objectiveList -1;
private _id = (_objectiveList select _lastIndex select 0)+1; //this is the last base id
GVAR(objectiveList) pushBack [_id, _pos, _radius];
publicVariable QGVAR(objectiveList);

_id
