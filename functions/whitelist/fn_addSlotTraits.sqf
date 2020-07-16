#include "script_component.hpp"
params [
	["_slotName", "", [""]],
	["_traits", [], [[]]]
];

if(_slotName isEqualTo "") exitWith {};
private _id = GVAR(slotTraits) findIf {(_x select 0) isEqualTo _slotName};
if(_id == -1) exitWith {
	LOG_1("Slot has allready been registered!", _slotName);
};


_traits = _traits apply {
	switch _x do {
		case WHITELIST_TANK: {
			TF47_IS_TANKER
		};
		case WHITELIST_HELO: {
			TF47_IS_PILOT_HELICOPTER
		};
		case WHTIELIST_PLANE: {
			TF47_IS_PILOT_PLANE
		};
		default {
			nil
		};
	};
};

_traits = _traits select {! isNil "_x"};
GVAR(slotTraits) pushBack [_slotName, _traits];
publicVariable QGVAR(slotTraits);


true
