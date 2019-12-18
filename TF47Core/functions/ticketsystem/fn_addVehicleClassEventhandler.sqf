#include "script_component.hpp"
["AllVehicles", "InitPost", {
	params ["_vehicle"];
	if(!isServer) exitWith {};
	_id = tf47_tickets_vehicles findIf { _x == _vehicle };
	if(_id == -1) exitWith {};
	TRACE_2("Adding cost to vehicle", _vehicle, tf47_tickets_vehicles#_id#1);
	[_vehicle, tf47_tickets_vehicles#_id#1] call EFUNC(ticket, addVehicle);
},true,[], true] call CBA_fnc_addClassEventHandler;