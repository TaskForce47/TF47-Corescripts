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

//if already defined with a cost variable
if(!isNil "_vehicle getVariable QGVAR(cost)") exitWith {};

_vehicle setVariable [QGVAR(cost), _worth];

true