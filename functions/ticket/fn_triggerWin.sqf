#include "script_component.hpp"

[
	{"EveryoneWon" call BIS_fnc_endMissionServer;},
	nil,
	30
] call CBA_fnc_waitAndExecute;
[EGVAR(database,finishSession), nil] call CBA_fnc_serverEvent;