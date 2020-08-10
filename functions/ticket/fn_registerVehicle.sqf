#include "script_component.hpp"

params [
	["_vehicle", objNull, [objNull]],
	["_setCustomCost", false, [true]],
	["_tickets", 0, [0]]
];

//check if the vehicle has allready been registered
if(_vehicle getVariable [QGVAR(registered), false] || {_vehicle getVariable [QGVAR(disabled), false]}) exitWith {};

private _vehicleName = typeOf _vehicle;

if(_setCustomCost) then {
	_vehicle setVariable [QGVAR(cost), _tickets, true];
} else {
	private _cost = _vehicle call FUNC(getTicketCostFromList);
	_vehicle setVariable [QGVAR(cost), _cost, true];
};

_vehicle setVariable [QGVAR(registered), true, true];

private _id = _vehicle addMPEventHandler ["MPKilled", {
  params ["_vehicle"];
  if(!isServer) exitWith {};
  _vehicle call FUNC(handleVehicleKilled);
}];
_vehicle setVariable [QGVAR(killedEhId), _id];

_vehicle addEventHandler ["Get", {
	params ["_unit", "_role", "_vehicle", "_turret"];
	_vehicle setVariable [QGVAR(lastCommander), effectiveCommander _vehicle];
	_vehicle setVariable [QGVAR(lastTimeUsed), CBA_missionTime];
}];

_vehicle addEventHandler ["GetOut", {
	params ["_vehicle", "_role", "_unit", "_turret"];
	_vehicle setVariable [QGVAR(lastCommander), effectiveCommander _vehicle];
	_vehicle setVariable [QGVAR(lastTimeUsed), CBA_missionTime];
}];

GVAR(registeredVehicles) pushBack _vehicle;

true
