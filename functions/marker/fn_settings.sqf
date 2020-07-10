#include "script_component.hpp"
[
	QGVAR(markerSystem),
	"CHECKBOX",
	["Use Markersystem", "Enables or disables all marker related features"],
	["TF47 Corescripts", "Markersystem"],
	false,
	1,
	nil,
	true
] call CBA_fnc_addSetting;

[
	QGVAR(markerRestriction),
	"CHECKBOX",
	["Prevent side and global markers", "Moves all side and global markers created by players to group chat"],
	["TF47 Corescripts", "Markersystem"],
	false,
	1,
	nil,
	true
] call CBA_fnc_addSetting;

[
	QGVAR(markerRestrictionWhitelist),
	"CHECKBOX",
	["Allow side and global for TF users", "Use the whitelist to determine TF47 members and allow those people to draw on the map"],
	["TF47 Corescripts", "Markersystem"],
	false,
	1,
	nil,
	true
] call CBA_fnc_addSetting;
