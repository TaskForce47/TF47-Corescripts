#include "script_component.hpp"
params [
	["_slotName", "", [""]],
	["_traits", [], [[]]]
];

if(_slotName isEqualTo "") exitWith {};
private _id = GVAR(slotTraits) findIf {(_x select 0) isEqualTo _slotName};
if(_id != -1) exitWith {
	LOG_1("Slot trait has allready been registered!", _slotName);
};


_traits = _traits apply {
	switch _x do {
		case WHITELIST_TANK: {
			TF47_IS_TANKER
		};
		case WHITELIST_HELO: {
			TF47_IS_PILOT_HELICOPTER
		};
		case WHITELIST_PLANE: {
			TF47_IS_PILOT_PLANE
		};
		case WHITELIST_CCT: {
			TF47_IS_CCT
		};
		case WHITELIST_UAV: {
			TF47_IS_UAV
		};
		case TF47_IS_PLANE_CREW: {
			TF47_IS_PLANE_CREW
		};
		case TF47_IS_HELICOPTER_CREW: {
			TF47_IS_HELICOPTER_CREW
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
