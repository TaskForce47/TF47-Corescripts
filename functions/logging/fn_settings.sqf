#include "script_component.hpp"
[
	QGVAR(useLogging),
	"CHECKBOX",
	["Enable Logging", "Enable or disable the logging system"],
	["TF47 Corescripts", "Logging"],
	false,
	1,
	nil,
	true
] call CBA_fnc_addSetting;

[
	QGVAR(usePerformanceTracking),
	"CHECKBOX",
	["Enable performance tracking", "Enable or disable the performance tracking for server and clients"],
	["TF47 Corescripts", "Logging"],
	false,
	1,
	nil,
	true
] call CBA_fnc_addSetting;

[
	QGVAR(usePerformanceMapMarker),
	"CHECKBOX",
	["Enable HC/Server performance mapmarker", "Shows current server and hc performance on the map"],
	["TF47 Corescripts", "Logging"],
	false,
	1,
	nil,
	true
] call CBA_fnc_addSetting;

[
	QGVAR(performanceTrackerUpdateRate),
	"LIST",
	["Update rate", "Interval in sec the performance will be tracked"],
	["TF47 Corescripts", "Logging"],
	[[10, 20, 30, 60, 120], [], 3],
	1,
	nil,
	true
] call CBA_fnc_addSetting;

[
	QGVAR(useChatTracker),
	"CHECKBOX",
	["Enable chat tracker ", "Enable or disable the chat tracker"],
	["TF47 Corescripts", "Logging"],
	false,
	1,
	nil,
	true
] call CBA_fnc_addSetting;

[
	QGVAR(useKillTracker),
	"CHECKBOX",
	["Enable kill tracker ", "Enable or disable the kill tracker"],
	["TF47 Corescripts", "Logging"],
	false,
	1,
	nil,
	true
] call CBA_fnc_addSetting;