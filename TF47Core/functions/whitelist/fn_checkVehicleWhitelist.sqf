#include "script_component.hpp"
params ["_vehicle", objNull, [objNull]];

if(isNull _vehicle) exitWith {};
if(	  _vehicle isKindOf "Man" ||
	{ _vehicle getVariable [QGVAR(disableVehCheck), false] == true } ||
	{ (player getCargoIndex _vehicle) > -1} ||
	{ !isTouchingGround _vehicle}
) exitWith {};

if(_vehicle isKindOf "Tank" || {_vehicle isKindOf "Wheeled_APC"}) then {
	if([WHITELIST_TANK] call FUNC(checkWhitelist)) exitWith {
		player action ["Eject", vehicle player];
	};
};

if(_vehicle isKindOf "Helicopter") then {
	if([WHITELIST_HELO] call FUNC(checkWhitelist)) exitWith {
		player action ["GetOut", vehicle player];
	};
};

if(_vehicle isKindOf "Plane") then {
	if([WHITELIST_PLANE] call FUNC(checkWhitelist)) exitWith {
		player action ["GetOut", vehicle player];
	};
};

true


