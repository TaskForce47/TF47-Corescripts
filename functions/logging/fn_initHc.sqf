#include "script_component.hpp"

[
  QGVAR(updatePerformance),
  {
    _this call FUNC(hcPerformanceTracking);
  }
] call CBA_fnc_addEventHandler;
