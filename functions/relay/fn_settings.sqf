#include "script_component.hpp"

[
	QGVAR(relayRange),
	"SLIDER",
	["Relay range", "Distance the relay signal should be enhanced"],
	["TF47 Corescripts", "relay"],
	[0, 10000, 5000, 0],
	1,
	{
		if (! isServer) exitWith {};
		{
			if (_x getVariable [QGVAR(online), false]) then {
				_x call FUNC(turnOff);
				_x call FUNC(turnOn);
			};
		} forEach GVAR(relays);
	},
	false
] call CBA_fnc_addSetting;

[
	QGVAR(maxRelays),
	"SLIDER",
	["Maxium of relays available", ""],
	["TF47 Corescripts", "relay"],
	[0, 20, 3, 0],
	1,
	nil,
	false
] call CBA_fnc_addSetting;

[
	QGVAR(relayTicketCost),
	"LIST",
	["Relay ticket cost", "Defines how many tickets a relay will cost if destroyed"],
	["TF47 Corescripts", "relay"],
	[[0, 5, 10, 20], [], 2],
	1,
	nil,
	false
] call CBA_fnc_addSetting;