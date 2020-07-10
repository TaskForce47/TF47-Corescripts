#include "script_component.hpp"

[
	{"EveryoneLost" call BIS_fnc_endMissionServer;},
	nil,
	30
] call CBA_fnc_waitAndExecute;
["Mission will end in 30 seconds"] remoteExec ["hint", 0];
[EGVAR(database,finishSession), nil] call CBA_fnc_serverEvent;