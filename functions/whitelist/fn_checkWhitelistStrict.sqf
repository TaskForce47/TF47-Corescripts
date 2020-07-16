#include "script_component.hpp"

params [
  ["_whitelist", [], [[]]]
];

if(_whitelist isEqualTo []) exitWith {true};

private _isWhitelisted = true;
private _playerWhitelist = EGVAR(core,playerNamespace) getVariable [QGVAR(whitelist), []];

{
    if(! (_x in _playerWhitelist)) exitWith {
      _isWhitelisted = false;
    };
} forEach _whitelist;

_isWhitelisted
