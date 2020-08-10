#include "script_component.hpp"
params [
	["_vehicle", objNull, [objNull]]
];

if(isNull _vehicle) exitWith {false};
if(isNil {_vehicle getVariable QGVAR(cost)}) exitWith {false};

private _ehId = _vehicle getVariable [QGVAR(killedEhId), -1];
if(_ehId != -1) then {
	_vehicle removeMPEventHandler ["Killed", _ehId];
};
_vehicle setVariable [QGVAR(cost), nil, true];
_vehicle setVariable [QGVAR(registered), false, true];

private _id = GVAR(registeredVehicles) findif { _x isEqualTo _vehicle };
if(_id != -1) then {
	GVAR(registeredVehicles) deleteAt _id;
};


true