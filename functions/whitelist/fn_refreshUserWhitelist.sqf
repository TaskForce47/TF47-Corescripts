#include "script_component.hpp"

params [
  ["_playerId", 0, [0]]
];

if(_playerId < 1) exitWith {
  ERROR("CANNOT RELOAD WHITELIST FOR UNDEFINED PLAYER ID");
};

private _namespaces = EGVAR(core,playerList);
private  _index = _namespaces findIf { (_x getVariable [QEGVAR(core,playerId), -1]) == _playerId };
if(_index < 0) exitWith {
  ERROR("player disconnect or is not present, player namespace seems not to exist");
};

private _playerNamespace = _namespaces select _index;
private _whitelist = _playerId call EFUNC(database,getPlayerWhitelist);

_playerNamespace setVariable [QGVAR(whitelist), _whitelist, true];
TRACE_2("UPDATED WHITELIST FOR PLAYER:", _playerId, _whitelist);

true