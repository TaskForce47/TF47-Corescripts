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

				_vehicle call FUNC(registerVehicleFallback);
			},
			_vehicle,
			10
		] call CBA_fnc_waitAndExecute;
	},
	true,
	[],
	true
] call CBA_fnc_addClassEventhandler;