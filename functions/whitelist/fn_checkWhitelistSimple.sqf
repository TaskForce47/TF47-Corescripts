#include "script_component.hpp"

params [
  ["_whitelist", [], [[]]]
];

if(_whitelist isEqualTo []) exitWith {true};

private _isWhitelisted = false;
private _playerWhitelist = EGVAR(core,playerNamespace) getVariable [QGVAR(whitelist), []];

{
  if(_x in _playerWhitelist) exitWith {
    _isWhitelisted = true;
  };
} forEach _whitelist;

_isWhitelisted
