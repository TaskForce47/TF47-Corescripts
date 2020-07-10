#include "script_component.hpp"

params [
	["_vehicle", objNull, [objNull]],
	["_isHelicopter", true, [true]],
	["_isPlane", false, [false]]
];

if(isNull _vehicle) exitWith {false};

private _isAttack = false;
private _vehicleName = typeOf _vehicle;

if(_isHelicoter) then {
	private _attackHelicopters = EGVAR(core,attackHelicopter);
	private _id = _attackHelicopters findIf {_x isEqualTo _vehicleName};
	if(_id != -1) exitWith {
		_isAttack = true;
	};
};

if(_isPlane) then {
	private _attackPlanes = EGVAR(core,attackHelicopter);
	private _id = _attackPlanes findIf {_x isEqualTo _vehicleName};
	if(_id != -1) exitWith {
		_isAttack = true;
	};
};

_isAttack
