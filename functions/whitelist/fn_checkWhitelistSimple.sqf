#include "script_component.hpp"

params [
  ["_whitelist", [], [[]]]
];

if(_whitelist isEqualTo []) exitWith {true};

private _isWhitelisted = false;

{
  if(_x in GVAR(whitelist)) exitWith {
    _isWhitelisted = true;
  };
} forEach _whitelist;

_isWhitelisted
