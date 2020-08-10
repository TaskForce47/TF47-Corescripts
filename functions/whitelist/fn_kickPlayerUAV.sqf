#include "script_component.hpp"

params [
	["_unit", objNull, [objNull]],
	["_vehicle", objNull, [objNull]],
	["_message", "", [""]]
];

_unit connectTerminalToUAV objNull;
_unit disableUAVConnectability [_vehicle, true];
["TF47_core_notification_notWhitelisted", _message] call EFUNC(util,sendNotification);

true