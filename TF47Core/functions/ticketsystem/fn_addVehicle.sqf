#include "script_component.hpp"
/*
 * Author: TF47 Dragon
 *
 * Changes the amount of tickets remaining on the mission and writes it back to the database
 * This function will trigger outofticket and ticketchange event
 *
 * Arguments:
 * 0: vehicle to add cost on                	<OBJECT>
 * 1: The worth of the vehicle in Tickets 		<SCALAR>  
 *
 * Return Value:
 * 		none
 *
 * Example:
 * [vehicle player, 25] call TF47_tickets_addVehicle;
 *
 * Public: Yes
 */
params [
	["_vehicle", objNull, [objNull]],
	["_worth", 0, [0]]
];

_worth = abs _worth; //make sure to only allow positive values

if(isNull _vehicle) exitWith { ERROR("Unable to add vehicle to ticketsystem, vehicle is objNull"); };
//if already defined with a cost variable
if(!isNil {_vehicle getVariable QGVAR(cost)}) exitWith {};

_vehicle setVariable [QGVAR(cost), _worth];
//save last commander as array of [player object, player name, player uid]
_vehicle setVariable [QGVAR(lastCommander), []];

[_vehicle, "Killed", {	
	params ["_unit", "", "", ""];
	[_unit] remoteExecCall [QFUNC(handleVehicleDestroyed), 2];
}, nil] remoteExecCall ["CBA_fnc_addBISEventHandler", 0, true];

_vehicle addEventHandler ["GetIn", {
	params ["_vehicle", "_role", "_unit", ""];
	if(_role isEqualTo "cargo" || {!isPlayer _unit}) exitWith {};
	if(_role isEqualTo "gunner" && {isNull commander _vehicle}) exitWith {
		_vehicle setVariable [QGVAR(lastCommander), [_unit, name _unit, getPlayerUID _unit]];
	};
	if(isNull commander _vehicle && {isNull gunner _vehicle}) exitWith {
		_vehicle setVariable [QGVAR(lastCommander), [_unit, name _unit, getPlayerUID _unit]];
	};
}];

_vehicle addEventHandler ["GetOut", {
	params ["_vehicle", "_role", "_unit", ""];
	if(_role isEqualTo "cargo" || {!isPlayer _unit}) exitWith {};
	if(_role isEqualTo "gunner" && {isNull commander _vehicle}) exitWith {
		_vehicle setVariable [QGVAR(lastCommander), [_unit, name _unit, getPlayerUID _unit]];
	};
	if(isNull commander _vehicle && {isNull gunner _vehicle}) exitWith {
		_vehicle setVariable [QGVAR(lastCommander), [_unit, name _unit, getPlayerUID _unit]];
	};
}];

_vehicle addEventHandler ["SeatSwitched", {
	params ["_vehicle", "", ""];

	_commander = commander _vehicle;
	if(! (objNull _commander) && {isPlayer _commander}) exitWith {
		_vehicle setVariable [QGVAR(lastCommander), [_commander, name _commander, getPlayerUID _commander]];
	};
	_gunner = gunner _vehicle;
	if(! (objNull _gunner) && {isPlayer _gunner}) then {
		_vehicle setVariable [QGVAR(lastCommander), [_gunner, name _gunner, getPlayerUID _gunner]];
	};
	_driver = commander _vehicle;
	if(! (objNull _driver) && {isPlayer _driver}) exitWith {
		_vehicle setVariable [QGVAR(lastCommander), [_driver, name _driver, getPlayerUID _driver]];
	};	
}];

TRACE_1("Vehicle added to ticketsystem", _vehicle);

true