#include "script_component.hpp"
params [
	["_vehicle", objNull, [objNull]]
];

if(isNull _vehicle) exitWith {false};
if(isNil {_vehicle getVariable QGVAR(cost)}) exitWith {false};

private _ehId = _vehicle getVariable [QGVAR(killedEhId), -1];
if(_eh != -1) then {
	_vehicle removeMPEventHandler ["Killed", _ehId];
};
_vehicle setVariable [QGVAR(cost), nil, true];

true