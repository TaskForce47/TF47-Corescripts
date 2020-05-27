#include "..\script_component.hpp"
private _whitelistSlots = [
	[TOC01, ["CCT"]],	[TOC02, ["CCT"]]
];

private _restrictedSlots = [

	[TOC01, ["Tank","Helo","Plane","AttackAir"]],			[TOC02, ["Tank","Helo","Plane","AttackAir"]],		
	[TOC03, ["Tank","Helo","Plane","AttackAir"]],			[TOC04, ["Tank","Helo","Plane","AttackAir"]],
		
	[THP01, ["Helo"]],		[THP02, ["Helo"]],
		
	[THC01, ["Helo"]],		[THC02, 10, ["Helo"]],
	[THC03, ["Helo"]],		[THC04, 7, ["Helo"]],
		
	[CSAR01, ["Helo"]],		[CSAR02, ["Helo"]],
	[CSAR03, ["Helo"]],		[CSAR04, ["Helo"]],
	[CSAR05, ["Helo"]],		[CSAR06, 7, ["Helo"]],

	[AH11, ["Helo","AttackAir"]],							[AH12, ["Helo","AttackAir"]],
	[AH21, ["Helo","AttackAir"]],							[AH22, ["Helo","AttackAir"]],

	[JP01, ["Plane","AttackAir"]],			
	[JP02, ["Plane","AttackAir"]],		
	[JP03, ["Plane","AttackAir"]],

	[T11, ["Tank"]],				[T12,  ["Tank"]],			[T13,  ["Tank"]],		[T14,  ["Tank"]],
	[T21, ["Tank"]],				[T22,  ["Tank"]],			[T23,  ["Tank"]], 		[T24,  ["Tank"]]
	
];

private _variableCheck = false;
{
    if(isNil {x select 0}) exitWith {_variableCheck = true;};
} forEach _restrictedSlots + _whitelistSlots;
if(_variableCheck) exitWith { LOG("Cannot add restrictions to Infantry. One or more slots does not exist") };

{
	_x call EFUNC(whitelist,addSlotWhitelist);
} forEach _whitelistSlots;

{
	_x call EFUNC(whitelist,addSlotRestriction);
} forEach _restrictedSlots;
