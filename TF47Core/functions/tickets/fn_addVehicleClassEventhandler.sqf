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
[
	"AllVehicles",
	"InitPost", {
		params ["_vehicle"];

		private _vehicleList = EGVAR(core,vehicleTicketcost);
		private _id = _vehicleList findif {typeOf _vehicle == _x select 0};
		if(_id < 0) exitWith {

			ERROR_1("CANNOT FIND VEHICLE IN TICKETCOST LIST! FALLING BACK TO CLASS COST!", typeOf _vehicle);

			switch true do {
			    case (_vehicle isKindOf "Tank" || {_vehicle isKindOf "Wheeled_APC"}): {
						private _cost = (EGVAR(core,vehicleTicketCostFallback)) select 3;
						[_vehicle, _cost] call FUNC(registerVehicle);
					};
					case (_vehicle isKindOf "Plane"): {
						private _cost = (EGVAR(core,vehicleTicketCostFallback)) select 0;
						[_vehicle, _cost] call FUNC(registerVehicle);
					};
					case (_vehicle isKindOf "Helicopter"): {
						private _cost = (EGVAR(core,vehicleTicketCostFallback)) select 1;
						[_vehicle, _cost] call FUNC(registerVehicle);
					};
					case (_vehicle isKindOf "Car"): {
						private _cost = (EGVAR(core,vehicleTicketCostFallback)) select 2;
						[_vehicle, _cost] call FUNC(registerVehicle);
					};
					default {
						ERROR_1("WE FOUND A VEHICLE WITHOUT MATCHING CLASS!", _vehicle);
						private _cost = 0;
						[_vehicle, _cost] call FUNC(registerVehicle);
					};
			};
		};

		private _cost = _vehicleList select _id select 1;
		[_vehicle, _cost] call FUNC(registerVehicle);
	},
	true,
	["Man"],
	true
] call CBA_fnc_addClassEventHandler;
