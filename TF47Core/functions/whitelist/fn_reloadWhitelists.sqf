#include "script_component.hpp"
params [
	["_playerId", 9999, [0]]
];

private _namespaces = EGVAR(core,playerList);
private  _index = _namespaces findIf { (_x getVariable [QEGVAR(core,playerId), -1]) == _playerId };
if(_index < 0) exitWith {
	ERROR_2("player disconnect or is not present, player namespace seems not to exist", _uid, _name);
};

private _playerNamespace = _namespaces select _index;
private _whitelist = [_playerId] call EFUNC(database,getPlayerWhitelist);

_playerNamespace setVariable [QGVAR(whitelist), _whitelist, true];

true