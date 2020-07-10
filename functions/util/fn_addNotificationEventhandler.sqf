#include "script_component.hpp"

[QGVAR(showNotification), {
  params ["_notification", "_message"];
  [_notification, _message] call FUNC(sendNotification);
}] call CBA_fnc_addEventHandler;
