#include "script_component.hpp"
params [
  ["_pos", objNull, [[], objNull]]
];

if(_pos isEqualType objNull) then {
  _pos = getPos _pos;
};
private _baseList = GVAR(baseList);

private _id = _baseList findIf {
  private _base = _x;
  private _result = false;
  switch (_base select 3) do {
    case "rectangular": {
      _result = _pos inArea [
        _base select 0, 
        _base select 1 select 0, 
        _base select 1 select 1, 
        _base select 2,
        true
      ];
    };
    case "ellipse": {
      _result = _pos inArea [
        _base select 0,
        _base select 1 select 0,
        _base select 1 select 1,
        _base select 2,
        false
      ];
    };
    _result
  };
};

if(_id != -1) exitWith {true};

false
