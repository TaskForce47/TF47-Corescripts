_whitelistSlots = [
	
	["TOC01", "CCT"],	["TOC02", "CCT"]
	
]

{
	_x call TF47_whitelist_fnc_addSlotWhitelist;
} forEach _whitelistSlots;

_restrictedSlots = [
	
	["TOC01", ["Tank","Helo","Plane","AttackAir"]],	["TOC02", ["CCT","Admin","Moderator"]]

	["HP01", ["Helo"]],	["HP02", ["Helo"]],	["HP03", ["Helo"]],	["HP04", ["Helo"]],
	["CC01", ["Helo"]],	["CC02", ["Helo"]],	["CC03", ["Helo"]],	["CC04", ["Helo"]],

	["AH11", ["Helo","AttackAir"]],	["AH12", ["Helo","AttackAir"]],
	["AH21", ["Helo","AttackAir"]],	["AH22", ["Helo","AttackAir"]],

	["JP1",  ["Plane","AttackAir"]],	["JP2",  ["Plane","AttackAir"]],	["JP3",  ["Plane","AttackAir"]],

	["T11",  ["Tank"]],	["T12",  ["Tank"]],	["T13",  ["Tank"]], ["T14",  ["Tank"]],
	["T21",  ["Tank"]],	["T22",  ["Tank"]],	["T23",  ["Tank"]], ["T24",  ["Tank"]]
	
]

{
	_x call TF47_whitelist_fnc_addSlotRestriction;
} forEach _restrictedSlots;