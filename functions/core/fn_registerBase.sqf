#include "script_component.hpp"

params [
  ["_pos", [0,0,0], [[]]],
  ["_size", [100,100], [[]]],
  ["_rotation", 0, [0]],
  ["_shape", "rectangular", [""]]
];

if(_pos isEqualTo [0,0,0]) exitWith {-1};

private _baseList = GVAR(baseList);

if(count _baseList == 0) exitWith {
  GVAR(baseList) pushBack [0, _pos, _size, _rotation, _shape];
  publicVariable QGVAR(baseList);
  0
};
private _lastIndex = count _baseList -1;
private _id = (_baseList select _lastIndex select 0)+1; //this is the last base id
GVAR(baseList) pushBack [_id, _pos, _size, _rotation, _shape];
publicVariable QGVAR(baseList);
_id
