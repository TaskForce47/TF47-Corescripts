#include "script_component.hpp"
params [
	["_unit", objNull, [objNull]],
	["_message", "", [""]]
];

if(isNull _unit) exitWith {};
if(! local _unit) exitWith {
	[_unit, _message] remoteExec [QFUNC(kickOutPlayer), _unit];
};

_unit action ["Eject", _unit];
["TF47_core_notification_notWhitelisted", _message] call EFUNC(util,sendNotification);