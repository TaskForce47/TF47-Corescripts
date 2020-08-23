#include "script_component.hpp"

params [
	["_vehicle", objNull, [objNull]]
];

if(isNull _vehicle) exitWith {false};

private _isAttack = false;
private _vehicleName = typeOf _vehicle;

switch true do {
	case (_vehicle call FUNC(isHelicopter)): {
		if (_vehicleName in EGVAR(whitelist,attackHelicopter)) exitWith {
			_isAttack = true;
		};
	};
	case (_vehicle call FUNC(isPlane)): {
		if (_vehicleName in EGVAR(whitelist,attackPlanes)) exitWith {
			_isAttack = true;
		};
	};
};

_isAttack