#include "script_component.hpp"
if(! EGVAR(core,useLogging)) exitWith {};

LOG("STARTING LOGGING PLAYER INIT");

private _namespace = EGVAR(core,playerNamespace);
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

_namespace setVariable [QGVAR(timeInf), 0];
_namespace setVariable [QGVAR(timeVehicle), 0];
_namespace setVariable [QGVAR(timeTank), 0];
_namespace setVariable [QGVAR(timeHelo), 0];
_namespace setVariable [QGVAR(timePlane), 0];
_namespace setVariable [QGVAR(timeOb), value]

call FUNC(killTracker);
call FUNC(chatLogger);

[
  QGVAR(updatePerformance),
  {
    _this call FUNC(clientPerformanceTracking);
  }
] call CBA_fnc_addEventHandler;


LOG("LOGGING PLAYER INIT DONE!");
