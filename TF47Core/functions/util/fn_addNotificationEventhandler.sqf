#include "script_component.hpp"

[
  QGVAR(showNotification),
  {
    params ["_notification", "_message"];
    [
      _notification,
      [_message]
    ] call BIS_fnc_showNotification;
  }
] call CBA_fnc_addEventHandler;
