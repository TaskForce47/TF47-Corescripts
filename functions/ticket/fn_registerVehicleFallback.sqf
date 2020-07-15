#include "script_component.hpp"
params [
	["_vehicle", objNull, [objNull]]
];

if(isNull _vehicle) exitWith {};

switch true do {
	case ((_vehicle call EFUNC(util,isHelicopter) && (! (_vehicle call EFUNC(util,isAttackAircraft))))): {
		LOG_2("Vehicle fallback (helicopter) with default tickets", typeof _vehicle, GVAR(defaultCostHelicopters));
		[_vehicle, true, GVAR(defaultCostHelicopters)] call FUNC(registerVehicle);
	};
	case ((_vehicle call EFUNC(util,isHelicopter)) && (_vehicle call EFUNC(util,isAttackAircraft))): {
		LOG_2("Vehicle fallback (attack helicopter) with default tickets", typeof _vehicle, GVAR(defaultCostAttackHelicopters));
		[_vehicle, true, GVAR(defaultCostAttackHelicopters)] call FUNC(registerVehicle);
	};
	case (_vehicle call EFUNC(util,isPlane)): {
		LOG_2("Vehicle fallback (plane) with default tickets", typeof _vehicle, GVAR(defaultCostPlanes));
		[_vehicle, true, GVAR(defaultCostPlanes)] call FUNC(registerVehicle);
	};
	case (_vehicle call EFUNC(util,isTank)): {
		LOG_2("Vehicle fallback (tank) with default tickets", typeof _vehicle, GVAR(defaultCostTanks));
		[_vehicle, true, GVAR(defaultCostTanks)] call FUNC(registerVehicle);
	};
	case (_vehicle call EFUNC(util,isCar)): {
		LOG_2("Vehicle fallback with default tickets", typeof _vehicle, GVAR(defaultCostVehicles));
		[_vehicle, true, GVAR(defaultCostVehicles)] call FUNC(registerVehicle);
	};
};

true