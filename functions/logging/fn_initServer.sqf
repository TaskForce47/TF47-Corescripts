#include "script_component.hpp"

if(! GVAR(useLogging)) exitWith {};

LOG("STARTING LOGGING SERVER INIT");

[
  QGVAR(updatePerformance),
  {
    _this call FUNC(serverPerformanceTracking);
  }
] call CBA_fnc_addEventHandler;

if(GVAR(usePerformanceTracking)) then {
  private _timeout = GVAR(performanceTrackerUpdateRate);
  [
    {
      [QGVAR(updatePerformance), [CBA_missionTime]] call CBA_fnc_globalEvent;
    },
    _timeout
  ] call CBA_fnc_addPerFrameHandler;
};

call FUNC(addPerformanceMapMarker);
LOG("SERVER INIT COMPLETED");
