#include "script_component.hpp"

{
	if !(_x call EFUNC(core,isInBase)) then {
		private _lastTimeUsed = _x getVariable [QGVAR(lastTimeUsed), 0];
		private _lastCommander = _x getVariable [QGVAR(lastCommander), objNull];

		if ()
	};
	
	
} forEach GVAR(registeredVehicles);