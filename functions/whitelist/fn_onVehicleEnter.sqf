#include "script_component.hpp"
params [
	["_vehicle", objNull, [objNull]]
];

if(_vehicle call FUNC(isWhitelistTestAllowed)) exitWith {};
if(GVAR(enableSlotTraits)) then {
	[player,_vehicle] call FUNC(checkslotTrait);
};

switch true do {
	case (_vehicle call EFUNC(util,isHelicopter)): {
		private _isAllowd = false;
		if(GVAR(enableWhitelistAttack) && {_vehicle call EFUNC(util,isAttackAircraft)}) then {
			_isAllowed = [WHITELIST_HELO, WHITELIST_ATTACK_AIR] call FUNC(checkWhitelistStrict);
		} else {
			_isAllowed = [WHITELIST_HELO] call FUNC(checkWhitelistSimple);
		};

		if(! _isAllowed) then {
			[player, "You are not whitelisted for this type of helicopter"] call FUNC(kickPlayerVehicle);
		};
	};
	case (_vehicle call EFUNC(util,isTank)): {
		private _isAllowd = [WHITELIST_TANK] call FUNC(checkWhitelistSimple);

		if(! _isAllowed) then {
			[player, "You are not whitelisted for this type of tank"] call FUNC(kickPlayerVehicle);
		};
	};
	case (_vehicle call EFUNC(util,isPlane)): {
		private _isAllowd = false;
		if(GVAR(enableWhitelistAttack) && {_vehicle call EFUNC(util,isAttackAircraft)}) then {
			_isAllowed = [WHITELIST_PLANE, WHITELIST_ATTACK_AIR] call FUNC(checkWhitelistStrict);
		} else {
			_isAllowed = [WHITELIST_PLANE] call FUNC(checkWhitelistSimple);
		};

		if(! _isAllowed) then {
			[player, "You are not whitelisted for this type of plane"] call FUNC(kickPlayerVehicle);
		};
	};
};