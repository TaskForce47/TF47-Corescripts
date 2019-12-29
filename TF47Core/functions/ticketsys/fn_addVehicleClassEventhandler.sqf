#include "script_component.hpp"
/*
 * Author: TF47 Dragon
 * 
 * This function tries to register all spawned vehicles (also those that are already present).
 * It can only register the vehicle if the classname is defined in the settings file.
 *
 * Arguments:
 *  none
 *
 * Return Value:
 *  none
 *
 * Example:
 * [] call tf47_ticket_fnc_addVehicleClassEventhandler
 *
 * Public: No
 */
["AllVehicles", "init", {
	params ["_vehicle"];
	if(!isServer) exitWith {};
	_id = tf47_tickets_vehicles findIf { _x#0 == _vehicle };
	if(_id == -1) exitWith {};
	TRACE_2("Adding cost to vehicle", _vehicle, tf47_tickets_vehicles#_id#1);
	[_vehicle, tf47_tickets_vehicles#_id#1] call EFUNC(ticket,registerVehicle);
},true,[], true] call CBA_fnc_addClassEventHandler;