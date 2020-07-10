#include "script_component.hpp"

if(! GVAR(autoSetTicketsOnVehicles)) exitWith {};

[
	"AllVehicles",
	"init", 
	{
		params ["_vehicle"];
		_vehicle call FUNC(registerVehicle);
	},
	true,
	[],
	true
] call CBA_fnc_addClassEventhandler;