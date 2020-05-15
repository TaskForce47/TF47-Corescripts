#include "script_component.hpp"

params [
  ["_pos", [0,0,0], [0]],
  ["_center", [0,0,0], [[]]],
  ["_radius", 0, [0]]
];

if(_pos isEqualType objNull) then {
  _pos = _pos getPos _radius;
};

if((_pos distance2d _center) > _radius) exitWith {false};

true
