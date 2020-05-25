#include "..\script_component.hpp"
private _whitelistSlots = [
	[TOC01, ["CCT"]],	[TOC02, ["CCT"]]
];

private _restrictedSlots = [

	[TOC01, ["Tank","Helo","Plane","AttackAir"]],	[TOC02, ["Tank","Helo","Plane","AttackAir"]],

	[HP01, ["Helo"]],	["HP02", ["Helo"]],	["HP03", ["Helo"]],	["HP04", ["Helo"]],
	[CC01, ["Helo"]],	["CC02", ["Helo"]],	["CC03", ["Helo"]],	["CC04", ["Helo"]],

	[AH11, ["Helo","AttackAir"]],	[AH12, ["Helo","AttackAir"]],
	[AH21, ["Helo","AttackAir"]],	[AH22, ["Helo","AttackAir"]],

	[JP1,  ["Plane","AttackAir"]],	[JP2,  ["Plane","AttackAir"]],	[JP3,  ["Plane","AttackAir"]],

	[T11,  ["Tank"]],	[T12,  ["Tank"]],	[T13,  [Tank]], [T14,  ["Tank"]],
	[T21,  ["Tank"]],	[T22,  ["Tank"]],	[T23,  [Tank]], [T24,  ["Tank"]]
];

private _variableCheck = false;
{
    if(isNil {x select 0}) exitWith {_variableCheck = true;};
} forEach _restrictedSlots + _whitelistSlots;
if(_variableCheck) exitWith { LOG("Cannot add tickets to Infantry. One or more slots does not exist") };

{
	_x call EFUNC(whitelist,addSlotWhitelist);
} forEach _whitelistSlots;

{
	_x call EFUNC(whitelist,addSlotRestriction);
} forEach _restrictedSlots;
