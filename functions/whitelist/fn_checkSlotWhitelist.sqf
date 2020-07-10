#include "script_component.hpp"
params [
	["_unit", objNull, [objNull]]
];

if(! local _unit) exitWith {
	_unit remoteExec [QFUNC(checkSlotWhitelist), _unit];
};

private _slotName = str _unit;
private _index = GVAR(slotWhitelist) findIf {(_x select 0) isEqualTo _slotName};
if(_index == -1)  exitWith {};

private _slotWhitelist = GVAR(slotWhitelist) select _index;
private _isAllowed = [_slotWhitelist select 1] call FUNC(checkWhitelistSimple) && {[_slotWhitelist select 2] call FUNC(checkWhitelistStrict)};

if(! _isAllowed) then {
	[player, "WhitelistedSlot"] call FUNC(kickPlayerSlot);
};

true
