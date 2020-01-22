#include "script_component.hpp"
#define INTERVALL_TRACKING 30

[{
	_players = call CBA_fnc_players;
	_serverTime = serverTime;
	{
		_id = _x getVariable [EGVAR(core,playerId), 0];
		_pos = getPos _x;
		_lookingDir = getDir _x;
		_vehicle = vehicle _x;
		_travelingMethod = "foot";

		switch (true) do {
			case (_vehicle isKindOf "Car"): {
				_travelingMethod = "car";
			};
			case (_vehicle isKindOf "Tank"): {
				_travelingMethod = "tank";
			};
			case (_vehicle isKindOf "Helicopter"): {
				_travelingMethod = "helo";
			};
			case (_vehicle isKindOf "Plane"): {
				_travelingMethod = "plane";
			};
			default { };
		};

		[
			_id,
			_serverTime,
			_pos,
			_lookingDir,
			_travelingMethod
		] call TF47_database_fnc_insertPositionData;

	} forEach _players;
}, INTERVALL_TRACKING] call CBA_fnc_addPerFrameHandler;