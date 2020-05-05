#include "script_component.hpp"
[{
	private _serverTime = serverTime;
	{
		private _playerId = _x getVariable [QEGVAR(core,playerId),0];
		if(_playerId == 0) exitWith {};
		private _pos = getPos _x;
		private _lookingDir = getDir _x;
		private _transportType = [_x] call EFUNC(util,getPlayerTransportType);
		[
			_playerId,
			_serverTime,
			_pos,
			_lookingDir,
			_transportType
		] call CBA_fnc_serverEvent;
	} forEach (call CBA_fnc_players);
}, 20] call CBA_fnc_addPerFrameHandler;
