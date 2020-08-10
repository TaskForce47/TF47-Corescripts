#include "script_component.hpp"

params ["_unit", "_vehicle"];

if (isNull _vehicle) exitWith {};

if(GVAR(enableSlotTraits)) then {
	[_unit, _vehicle] call FUNC(checkslotTrait);
};

if !([[WHITELIST_UAV]] call FUNC(checkWhitelistSimple)) exitWith {
	[_unit, _vehicle, "You are not whitelisted for drones!"] call FUNC(kickPlayerUAV);
};

if(GVAR(enableWhitelistAttack) && { _vehicle call EFUNC(util,isAttackAircraft) } && { ![[WHITELIST_ATTACK_AIR]] call FUNC(checkWhitelistSimple) }) exitWith {
	[_unit, _vehicle, "You are not whitelisted for attack drones!"] call FUNC(kickPlayerUAV);
};

true