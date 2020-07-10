#include "script_component.hpp"
params [
	["_vehicle", objNull, [objNull, ""]]
];

if(_vehicle isEqualType "") exitWith {
	private _id = EGVAR(core,vehicleTicketcost)	findIf {(_x select 0) isEqualTo _vehicle};
	private _cost = 0;
	if(_id != -1) then {
		_cost = EGVAR(core,vehicleTicketcost) select _id select 1;
	};
	_cost
};

_vehicle getVariable [QGVAR(cost), 0];