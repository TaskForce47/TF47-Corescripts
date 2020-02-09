#include "script_component.hpp"
tf47_player_vehicle = {
	params ["_player"];
	if(_player == vehicle _player) exitWith {"foot"};
	if(vehicle _player isKindOf "Car") exitWith {"car"};
	if(vehicle _player isKindOf "Helicopter") exitWith {"helo"};
	if(vehicle _player isKindOf "Plane") exitWith {"Plane"};
	"foot"
};

[{
	_serverTime = serverTime;;
	{
		_player = [_x getVariable [QEGVAR(core,clientId), ""]] call BIS_fnc_objectFromNetId; //get player object by his owner id
		_pos = getPos _player;
		_lookingDir = getDir _player;
		_transport = _player call tf47_player_vehicle;
		_id = _x getVariable [QEGVAR(core,playerUid), 0];
		[_id, _serverTime, _pos, _lookingDir, _transport] call EFUNC(database,insertPositionData);
	} forEach EGVAR(core,playerList);
}, 20] call CBA_fnc_addPerFrameHandler;