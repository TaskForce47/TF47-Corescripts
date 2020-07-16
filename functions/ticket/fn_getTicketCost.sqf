#include "script_component.hpp"
params [
	["_object", objNull, [objNull]]
];

if(isNull _object) exitWith {0};

private _cost = 0;
if(vehicle _object == _object) then {
	private _slotName = str _object;
	private _id = GVAR(slotCost) findIf {(_x select 0) isEqualTo _slotName};
	if(_id != -1) then {
		_cost = GVAR(slotClost) select _id select 1;
	};
} else {
	if(_object call FUNC(isVehicleRegistered)) then {
		_cost = _object getVariable [QGVAR(cost), 0];
	};
};

_cost