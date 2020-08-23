#include "script_component.hpp"
params [
	["_slotName", "", [""]],
	["_traits", [], [[]]]
];

if(_slotName isEqualTo "") exitWith {};
private _id = GVAR(slotTraits) findIf {(_x select 0) isEqualTo _slotName};
if(_id != -1) exitWith {
	LOG_1("Slot trait has already been registered!", _slotName);
};


_traits = _traits apply {
	switch _x do {
		case TF47_IS_TANKER: {
			TF47_IS_TANKER
		};
		case TF47_IS_HELICOPTER_PILOT: {
			TF47_IS_HELICOPTER_PILOT
		};
		case TF47_IS_ATTACK_HELICOPTER_PILOT: {
			TF47_IS_ATTACK_HELICOPTER_PILOT
		};
		case TF47_IS_PLANE_PILOT: {
			TF47_IS_PLANE_PILOT
		};
		case TF47_IS_CCT: {
			TF47_IS_CCT
		};
		case TF47_IS_UAV: {
			TF47_IS_UAV
		};
		case TF47_IS_PLANE_CREW: {
			TF47_IS_PLANE_CREW
		};
		case TF47_IS_HELICOPTER_CREW: {
			TF47_IS_HELICOPTER_CREW
		};
		case TF47_IS_ATTACK_HELICOPTER_CREW: {
			TF47_IS_ATTACK_HELICOPTER_CREW
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
