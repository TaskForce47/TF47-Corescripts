#include "script_component.hpp"

/*
 * Author: TF47 Dragon
 *
 * This function adds cba settings to the addon menu and will be
 * automaticly called by the core scripts upon mission start
 *
 * Arguments:
 * 		none
 *
 * Return Value:
 * 		none
 *
 * Public: no
 */

//core
[
	QGVAR(useSafezone),
	"CHECKBOX",
	["Enable Safezone", "Players inside a safezone will not take any damage"],
	["TF47 Corescripts", "Core"],
	false,
	1,
	nil,
	true
] call CBA_fnc_addSetting;

[
	QGVAR(useBaseShootingProtection),
	"CHECKBOX",
	["Enable Safezone shooting protection", "Players will not be able to fire inside the base"],
	["TF47 Corescripts", "Core"],
	false,
	1,
	nil,
	true
] call CBA_fnc_addSetting;

[
	QGVAR(addWorldBorder),
	"CHECKBOX",
	["Punish player for leaving the map", "If a player is outside the world border for a timeout passed he will be punished!"],
	["TF47 Corescripts", "Core"],
	false,
	1,
	nil,
	true
] call CBA_fnc_addSetting;

[
	QGVAR(worldBorderTimeout),
	"LIST",
	["Worldborder return time", "Time a player can stay outside the worldborder before beeing punished"],
	["TF47 Corescripts", "Core"],
	[[10, 20, 30, 60, 120], [], 3],
	1,
	nil,
	true
] call CBA_fnc_addSetting;

[
	QGVAR(worldBorderDestroyVehicle),
	"CHECKBOX",
	["Worldborder destroy vehicle", "Also destroy the vehicle of a player who has been outside of the world border for too long"],
	["TF47 Corescripts", "Core"],
	false,
	1,
	nil,
	true
] call CBA_fnc_addSetting;
//whitelist
[
	QGVAR(useWhitelist),
	"CHECKBOX",
	["Enable Whitelist", "Enable or disable the whitelist"],
	["TF47 Corescripts", "Whitelist"],
	true,
	1,
	nil,
	true
] call CBA_fnc_addSetting;

[
	QGVAR(useWhitelistAttack),
	"CHECKBOX",
	["Whitelist check for attack aircrafts", "Checks for planes if the plane is attack craft"],
	["TF47 Corescripts", "Whitelist"],
	false,
	1,
	nil,
	true
] call CBA_fnc_addSetting;

[
	QGVAR(useSlotRestriction),
	"CHECKBOX",
	["Restrict vehicles to whitelisted slots", "Only whitelisted slots will be able to get in certain vehicles"],
	["TF47 Corescripts", "Whitelist"],
	false,
	1,
	nil,
	true
] call CBA_fnc_addSetting;

//technical setup
[
	QGVAR(maxConnections),
	"LIST",
	["Maximal Database connections", "Maximum database connections that will be created"],
	["TF47 Corescripts", "Tech"],
	[[1,2,3,4,5,6,7,8], [], 2],
	1,
	nil,
	true
] call CBA_fnc_addSetting;

[
	QGVAR(missionId),
	"SLIDER",
	["Gadget Mission ID", "e.g. 1 for tf47 liberation"],
	["TF47 Corescripts", "Tech"],
	[0, 100, 1, 0],
	1,
	nil,
	true
] call CBA_fnc_addSetting;
