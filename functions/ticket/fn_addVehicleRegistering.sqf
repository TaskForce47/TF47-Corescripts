#include "script_component.hpp"

if(! GVAR(autoSetTicketsOnVehicles)) exitWith {};

[
	"AllVehicles",
	"init", 
	{
		params ["_vehicle"];
		[
			{
				params ["_vehicle"];

				if(_vehicle call FUNC(isVehicleRegistered)) exitWith {};
				//check if vehicle has crew and it is not a player
				if((count crew _vehicle) > 0 && {(count (crew _vehicle select {isPlayer _x})) == 0}) exitWith {};

				private _typeVehicle = typeOf _vehicle;
				private _id = GVAR(vehicleTicketcost) findIf { (_x select 0) isEqualTo _typeVehicle };
				if(_id == -1) then {
					_vehicle call FUNC(registerVehicleFallback);
				} else {
					_vehicle call FUNC(registerVehicle);
				};
			},
			_vehicle,
			10
		] call CBA_fnc_waitAndExecute;
	},
	true,
	[],
	true
] call CBA_fnc_addClassEventhandler;