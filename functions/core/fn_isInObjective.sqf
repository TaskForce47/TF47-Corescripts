#include "script_component.hpp"
params [
  ["_pos", objNull, [[], objNull]]
];

if(_pos isEqualType objNull) then {
  _pos = getPos _pos;
};
private _objectiveList = GVAR(objectiveList);

private _id = _objectiveList findIf {
                      ((_x select 1) distance2d _pos) < (_x select 2)
                     };
if(_id != -1) exitWith {true};

false
