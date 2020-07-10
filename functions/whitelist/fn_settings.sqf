#include "script_component.hpp"
//whitelist
[
	QGVAR(enableWhitelist),
	"CHECKBOX",
	["Enable Whitelist", "Enable or disable the whitelist"],
	["TF47 Corescripts", "Whitelist"],
	true,
	1,
	nil,
	true
] call CBA_fnc_addSetting;

[
	QGVAR(enableWhitelistAttack),
	"CHECKBOX",
	["Whitelist check for attack aircrafts", "Checks for planes if the plane is attack craft"],
	["TF47 Corescripts", "Whitelist"],
	false,
	1,
	nil,
	true
] call CBA_fnc_addSetting;

[
	QGVAR(enableSlotWhitelist),
	"CHECKBOX",
	["Enable slot whitelist", "Check if a player is allowed to continue on the current slot"],
	["TF47 Corescripts", "Whitelist"],
	false,
	1,
	nil,
	true
] call CBA_fnc_addSettings;

[
	QGVAR(enableSlotTraits),
	"CHECKBOX",
	["Restrict vehicles to whitelisted slots", "Only whitelisted slots will be able to get in certain vehicles"],
	["TF47 Corescripts", "Whitelist"],
	false,
	1,
	nil,
	true
] call CBA_fnc_addSetting;
