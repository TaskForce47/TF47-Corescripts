#include "script_component.hpp"
params [
	["_unit", objNull, [objNull]]
];

if(! local _unit) exitWith {
	_unit remoteExec [QFUNC(checkSlotWhitelist), _unit];
};

private _slotName = str _unit;
private _index = GVAR(slotWhitelist) findIf {(_x select 0) isEqualTo _slotName};
if(_index == -1)  exitWith {
	LOG("This slot is not whitelisted");
};

private _slotWhitelist = GVAR(slotWhitelist) select _index;
private _isAllowed = [_slotWhitelist select 1] call FUNC(checkWhitelistStrict) && {[_slotWhitelist select 2] call FUNC(checkWhitelistSimple)};

if(! _isAllowed) then {
	[player, "WhitelistedSlot"] call FUNC(kickPlayerSlot);
};

true
