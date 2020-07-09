#include "script_component.hpp"

#define DB_GVAR(arg) TF47_database_##arg
#define DB_FUNC(arg) TF47_database_fnc_##arg

if(!hasInterface && !isServer) exitWith {};
//check if server mod is present
if(isClass(configFile >> "CfgPatches" >> "TF47_database")) exitWith {
	TF47_core_isOffline = false;
};

TF47_core_isOnline = true;
DB_GVAR(players) = [["blub", 1]];

DB_FUNC(init) = {
	params [
		["_connections", 1, [0]],
		["_missionId", nil, [0]]
	];
	DB_GVAR(connections) = [];
	DB_GVAR(sessionId) = 0;
	DB_GVAR(missionId) = _missionId;
	TRACE_2("DATABASE INIT HAS BEEN EXECUTED", _connections, _missionId);
};

DB_FUNC(getPlayerWhitelist) = {
	params [
		["_playerId", 0, [0]]
	];
	TRACE_1("DATABASE GETPLAYERWHITELIST HAS BEEN EXECUTED", _playerId);
	[]
};

DB_FUNC(getLastSessionTickets) = {
	params [
		["_missionId", 0, [0]]
	];
	TRACE_1("DATABASE GETLASTSESSIONTICKETS HAS BEEN EXECUTED!", _missionId);
	0
};

DB_FUNC(getPlayerId) = {
	params [
		["_playerUid", "", [""]]
	];
	TRACE_1("DATABASE GETPLAYERID HAS BEEN EXECUTED!", _playerUid);

	private _id = DB_GVAR(players) findIf {(_x select 0) isEqualTo _playerUid};
	private _playerId = 0;

	if(_id == -1) then {
		_playerId = random 1000;
		DB_GVAR(players) pushBack [_playerUid, _playerId];
	} else {
		_playerId = DB_GVAR(players) select _id select 1;
	};

	_playerId
};

DB_FUNC(createNewPlayer) = {
	params [
		["_playerUid", "", [""]],
		["_playerName", "", [""]]
	];
	TRACE_2("DATABASE CREATE NEW PLAYER HAS BEEN EXECUTED!", _playerUid, _playerName);

	private _id = DB_GVAR(players) findIf {(_x select 0) isEqualTo _playerUid};
	private _playerId = 0;

	if(_id == -1) then {
		_playerId = random 1000;
		DB_GVAR(players) pushBack [_playerUid, _playerId];
	} else {
		_playerId = DB_GVAR(players) select _id select 1;
	};

	_playerId
};