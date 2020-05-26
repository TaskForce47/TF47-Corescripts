#include "script_component.hpp"

if(! EGVAR(core,useLogging)) exitWith {};

LOG("STARTING LOGGING SERVER INIT");

[
  QGVAR(updatePerformance),
  {
    _this call FUNC(serverPerformanceTracking);
  }
] call CBA_fnc_addEventHandler;

if(EGVAR(core,usePerformanceTracking)) then {
  private _timeout = EGVAR(core,performanceTrackerUpdateRate);
  [
    {
      [QGVAR(updatePerformance), [CBA_missionTime]] call CBA_fnc_globalEvent;
    },
    _timeout
  ] call CBA_fnc_addPerFrameHandler;
};

call FUNC(addPerformanceMapMarker);
LOG("SERVER INIT COMPLETED");
