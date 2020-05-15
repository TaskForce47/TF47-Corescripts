#include "script_component.hpp"

//handle whitelist stuff
[
	QGVAR(doVehicleWhitelistCheck),
	{
		params [
			["_vehicle", objNull, [objNull]]
		];

		TRACE_2("CHECKING WHITELIST FOR PLAYER", _vehicle, player);
		if(isNull _vehicle) exitWith {};
		if(_vehicle isKindOf "Man" ||
			{ _vehicle getVariable [QGVAR(disableWhitelistCheck), false]} ||
			{ ((assignedVehicleRole player) select 0) isEqualTo "cargo"} ||
			{ !isTouchingGround _vehicle}
		) exitWith {};

		private _fnc_kickOutVehicle = {
			player action ["GetOut", vehicle player];
			[
				QEGVAR(util,showNotification),
				[NOTIFICATION_WHITELIST_VEHICLE, format ["You are not whitelisted for %1", _this]]
			] call CBA_fnc_localEvent;
		};

		switch true do {
			case (_vehicle isKindOf "Tank" || {_vehicle isKindOf "Wheeled_APC"} || {_vehicle isKindOf "Wheeled_APC_F"}): {
				if(! (WHITELIST_TANK call FUNC(checkWhitelist))) exitWith {
					"Tanks" call _fnc_kickOutVehicle;
				};
			};
			case (_vehicle isKindOf "Helicopter"): {
				//Do the check if the used vehicle is an attack helicopter
				if((EGVAR(core,useWhitelistAttack)) && 											//is the check enabled?
					{_vehicle in EGVAR(core,attackHelicopter)} && 						//is the vehicle in the list?
					{! ([WHITELIST_ATTACK_AIR] call FUNC(checkWhitelist))}	//do final player whitelist check
				) exitWith {
					"attack helicopters" call _fnc_kickOutVehicle;
				};
				//do the normal helicopter check
				if(! ([WHITELIST_HELO] call FUNC(checkWhitelist))) exitWith {
					"helicopters" call _fnc_kickOutVehicle;
				};
			};
			case (_vehicle isKindOf "Plane"): {
				if((EGVAR(core,useWhitelistAttack)) &&
				 	{_vehicle in EGVAR(core,attackPlanes)} &&
					{! ([WHITELIST_ATTACK_AIR] call FUNC(checkWhitelist))}
				) exitWith {
					"attack planes" call _fnc_kickOutVehicle;
				};
				if(! ([WHITELIST_PLANE] call FUNC(checkWhitelist))) exitWith {
					"planes" call _fnc_kickOutVehicle;
				};
			};
		};
	}
] call CBA_fnc_addEventHandler;

//handle slot restriction for vehicles
[
	QGVAR(doVehicleWhitelistCheck),
	{
		params [
			["_vehicle", objNull, [objNull]]
		];

		TRACE_2("Checking if unit is on a slot allowed for this vehicle", _vehicle, player);

		private _fnc_kickOutVehicle = {
			player action ["GetOut", vehicle player];
			[
				QEGVAR(util,showNotification),
				[NOTIFICATION_WHITELIST_VEHICLE, format ["You need to be on a slot for %1 vehicle", _this]]
			] call CBA_fnc_localEvent;
		};

		private _allowedVehicles = player getVariable [QGVAR(slotRestrictions), []];
		switch true do
		{
			case (_vehicle isKindOf "Tank" || {_vehicle isKindOf "Wheeled_APC"} || {_vehicle isKindOf "Wheeled_APC_F"}):
			{
				if(! (WHITELIST_TANK in _allowedVehicles)) exitWith
				{
					"Tanks" call _fnc_kickOutVehicle;
				};
			};
			case (_vehicle isKindOf "Helicopter"):
			{
				//Do the check if the used vehicle is an attack helicopter
				if(_vehicle in EGVAR(core,attackHelicopter) && 		//is the vehicle in the list?
					{! (WHITELIST_ATTACK_AIR in _allowedVehicles)}	//do final player whitelist check
				) exitWith {
					"attack helicopters" call _fnc_kickOutVehicle;
				};
				//do the normal helicopter check
				if(! (WHITELIST_HELO in _allowedVehicles)) exitWith
				{
					"helicopters" call _fnc_kickOutVehicle;
				};
			};
			case (_vehicle isKindOf "Plane"):
			{
				if(_vehicle in EGVAR(core,attackPlanes) &&
					{! (WHITELIST_ATTACK_AIR in _allowedVehicles)}
				) exitWith
				{
					"attack planes" call _fnc_kickOutVehicle;
				};
				if(! (WHITELIST_PLANE in _allowedVehicles)) exitWith
				{
					"planes" call _fnc_kickOutVehicle;
				};
			};
		};
	}
] call CBA_fnc_addEventHandler;

[
	QGVAR(doSlotWhitelistCheck),
	{
		TRACE_1("Checking if player is allowed for this slot", player);
		//get the whitelist id reference for the check
		private _requiredWhitelist = player getVariable [QGVAR(requiredWhitelist), -1];
		if(_requiredWhitelist == -1) exitwith {
			TRACE_1("No whitelist found!", _requiredWhitelist);
		};

		if(! ([_requiredWhitelist] call FUNC(checkWhitelist))) then {
			["WhitelistedSlot", false] call BIS_fnc_endMission;
		};
	}
] call CBA_fnc_addEventHandler;

true
