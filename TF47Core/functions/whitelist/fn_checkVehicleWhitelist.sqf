#include "script_component.hpp"
params [["_vehicle", objNull, [objNull]]];

if(isNull _vehicle) exitWith {};
if(_vehicle isKindOf "Man" ||
	{ _vehicle getVariable [QGVAR(disableVehCheck), false]} ||
	{ ((assignedVehicleRole player) select 0) isEqualTo "cargo"} ||
	{ !isTouchingGround _vehicle}
) exitWith {};

_kickOutVehicle = {
	player action ["GetOut", vehicle player];
	["TF47_core_notification_notWhitelisted", [format ["You are not whitelisted for %1 vehicles", _this]]] call BIS_fnc_showNotification;
};

//TODO: include APC
if(_vehicle isKindOf "Tank" || {_vehicle isKindOf "Wheeled_APC"}) then {
	if(! ([WHITELIST_TANK] call FUNC(checkWhitelist))) exitWith {
		"Tank" call _kickOutVehicle;
	};
};

if(_vehicle isKindOf "Helicopter") then {
	if(! ([WHITELIST_HELO] call FUNC(checkWhitelist))) exitWith {
		"helicopter" call _kickOutVehicle;
	};
	if(EGVAR(core,useWhitelistAttack) && {_vehicle in TF47_whitelist_attackHelo} && {! ([WHITELIST_ATTACK_AIR] call FUNC(checkWhitelist)) }) exitWith {
		"attack helicopters" call _kickOutVehicle;
	};
};

if(_vehicle isKindOf "Plane") then {
	if(! ([WHITELIST_PLANE] call FUNC(checkWhitelist))) exitWith {
		"plane" call _kickOutVehicle;
	};
	if(EGVAR(core,useWhitelistAttack) && {_vehicle in TF47_whitelist_attackPlanes} && {! ([WHITELIST_ATTACK_AIR] call FUNC(checkWhitelist)) }) exitWith {
		"attack planes" call _kickOutVehicle;
	};
};

true