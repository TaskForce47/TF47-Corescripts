#include "script_component.hpp"
if(hasInterface && !isDedicated) exitWith {
	_namespace = EGVAR(core,playerNamespace);
	_namespace setVariable [QGVAR(killsInf), 0];
	_namespace setVariable [QGVAR(killsVehSmall), 0];
	_namespace setVariable [QGVAR(killsVehTracked), 0];
	_namespace setVariable [QGVAR(killsVehPlane), 0];
	_namespace setVariable [QGVAR(killsVehHelo), 0];
	_namespace setVariable [QGVAR(deathsInf), 0];
	_namespace setVariable [QGVAR(deathsVehSmall), 0];
	_namespace setVariable [QGVAR(deathsVehTracked), 0];
	_namespace setVariable [QGVAR(deathsVehHelo), 0];
	_namespace setVariable [QGVAR(deathsVehPlane), 0];

	call FUNC(killTracker);
};