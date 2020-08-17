#include "script_component.hpp"
[
	{"EveryoneLost" call BIS_fnc_endMissionServer;},
	nil,
	30
] call CBA_fnc_waitAndExecute;
["TF47_core_notification_outOfTickets", "We have run out of tickets, mission failed!"] remoteExec [QEFUNC(util,sendNotification), 0];
[QEGVAR(database,finishSession), nil] call CBA_fnc_serverEvent;