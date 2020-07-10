#include "script_component.hpp"

params [
	["_vehicle", objNull, [objNull]],
	["_setCustomCost", false, [true]],
	["_tickets", 0, [objNull]]
];

//check if the vehicle has allready been registered
if(isNil {_vehicle getVariable QGVAR(cost)}) exitWith {};

private _vehicleName = typeOf _vehicle;

if(_setCustomCost) then {
	_vehicle setVariable [QGVAR(cost), _tickets, true];
} else {
	private _vehicleList = EGVAR(core,vehicleTicketcost);
	private _id = _vehicleList findif {(_x select 0) isEqualTo _vehicleName};
	if(_id != -1) then {
		_vehicle setVariable [QGVAR(cost), _vehicleList select _id select 1];
	};
};

private _id = _vehicle addMPEventHandler ["MPKilled", {
  params ["_vehicle"];
  if(!isServer) exitWith {};
  _vehicle call FUNC(handleVehicleDestroyed);
}];
_vehicle setVariable [QGVAR(killedEhId), _id];

true
