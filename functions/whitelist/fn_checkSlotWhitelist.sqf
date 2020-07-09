params [
	["_unit", objNull, [objNull]]
];

if(! local _unit) exitWith {
	[_unit] remoteExec [QGVAR(checkSlotWhitelist), _unit];
};

private _slotName = str _unit;
private _index = GVAR(slotWhitelist) findIf {_x#0 isEqualTo _slotName};
if(_index == -1)  exitWith {};

private _slotWhitelist = GVAR(slotWhitelist) select _index;
private _isAllowed = [_slotWhitelist#1] call FUNC(checkWhitelistSimple) && {[_slotWhitelist#2] call FUNC(checkWhitelistStrict)};

if(! isAllowed) then {
	["WhitelistedSlot", false] call BIS_fnc_endMission;
};

true
