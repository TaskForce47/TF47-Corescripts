#include "script_component.hpp"
params [
	["_vehicle", objNull, [objNull]]
];

if(! (_vehicle call FUNC(isWhitelistTestAllowed))) exitWith {};
if(GVAR(enableSlotTraits)) then {
	[player, _vehicle] call FUNC(checkslotTrait);
};

if(! isNil {QGVAR(disabledVehicles)} && { _vehicle in GVAR(disabledVehicles)}) exitWith {};

switch true do {
	case (_vehicle call EFUNC(util,isHelicopter)): {
		private _isAllowed = false;
		if(GVAR(enableWhitelistAttack) && {_vehicle call EFUNC(util,isAttackAircraft)}) then {
			_isAllowed = [[WHITELIST_HELO, WHITELIST_ATTACK_AIR]] call FUNC(checkWhitelistStrict);
		} else {
			_isAllowed = [[WHITELIST_HELO]] call FUNC(checkWhitelistSimple);
		};

		if(! _isAllowed) exitWith {
			[player, "You are not whitelisted for this type of helicopter"] call FUNC(kickPlayerVehicle);
		};
	};
	case (_vehicle call EFUNC(util,isTank)): {
		private _isAllowed = [[WHITELIST_TANK]] call FUNC(checkWhitelistSimple);

		if(! _isAllowed) exitWith {
			[player, "You are not whitelisted for this type of tank"] call FUNC(kickPlayerVehicle);
		};
	};
	case (_vehicle call EFUNC(util,isPlane)): {
		private _isAllowed = false;
		if(GVAR(enableWhitelistAttack) && {_vehicle call EFUNC(util,isAttackAircraft)}) then {
			_isAllowed = [[WHITELIST_PLANE, WHITELIST_ATTACK_AIR]] call FUNC(checkWhitelistStrict);
		} else {
			_isAllowed = [[WHITELIST_PLANE]] call FUNC(checkWhitelistSimple);
		};

		if(! _isAllowed) exitWith {
			[player, "You are not whitelisted for this type of plane"] call FUNC(kickPlayerVehicle);
		};
	};
};