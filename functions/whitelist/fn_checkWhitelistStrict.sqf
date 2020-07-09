#include "script_component.hpp"

params [
  ["_whitelist", [], [[]]]
];

private _isWhitelisted = true;
{
    if(! _x in GVAR(whitelist)) exitWith {
      _isWhitelisted = false;
    };
} forEach _whitelist;

_isWhitelisted
