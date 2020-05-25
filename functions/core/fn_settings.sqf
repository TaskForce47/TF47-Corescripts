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
//logging
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

//ticketsystem
[
	QGVAR(useTicketsystem),
	"CHECKBOX",
	["Use TicketSystem", "Enables or disables the ticketsystem"],
	["TF47 Corescripts", "Ticketsystem"],
	false,
	1,
	nil,
	true
] call CBA_fnc_addSetting;

[
	QGVAR(startingTickets),
	"LIST",
	["Starting Tickets", "Amount of tickets the server starts after a new round"],
	["TF47 Corescripts", "Ticketsystem"],
	[[50, 100, 120, 150, 200, 250, 300], [], 1],
	1,
	nil,
	true
] call CBA_fnc_addSetting;


[
	QGVAR(maxTickets),
	"LIST",
	["Maximum Tickets", "Maximum ticketcount any further increase will be capped"],
	["TF47 Corescripts", "Ticketsystem"],
	[[50, 100, 150, 200, 250, 300, 350, 400, 450, 500, 550, 600], [], 1],
	1,
	nil,
	true
] call CBA_fnc_addSetting;

[
	QGVAR(loseOnZeroTickets),
	"CHECKBOX",
	["bleedout", "The game is lost as soon the ticket count reaches zero"],
	["TF47 Corescripts", "Ticketsystem"],
	false,
	1,
	nil,
	true
] call CBA_fnc_addSetting;

[
	QGVAR(autoSetTicketsOnVehicles),
	"CHECKBOX",
	["Enable automaticly setting ticket cost on vehicles", "If enabled this will automaticly add ticket cost to all present vehicles and those that are spawned later"],
	["TF47 Corescripts", "Ticketsystem"],
	true,
	1,
	nil,
	true
] call CBA_fnc_addSetting;

[
	QGVAR(defaultSlotCost),
	"LIST",
	["Default slot ticket cost", "Default cost for a slot if no value is found"],
	["TF47 Corescripts", "Ticketsystem"],
	[[0, 2, 5, 10, 15], [], 1],
	1,
	nil,
	true
] call CBA_fnc_addSetting;

[
	QGVAR(enableVehicleDeserting),
	"CHECKBOX",
	["Enable vehicle deserting", "If a vehicle is neither used in a while nor in a base area it will be counted as a loss and will be removed from the game"],
	["TF47 Corescripts", "Ticketsystem"],
	false,
	1,
	nil,
	true
] call CBA_fnc_addSetting;

[
	QGVAR(vehicleDesertingTimeout),
	"LIST",
	["Time in min before a vehicle will count as deserted", "Will be reseted on each time the vehicle is either in a base area or a unit enters the vehicle"],
	["TF47 Corescripts", "Ticketsystem"],
	[[10,30,60,90,120,150,180,210,240], [], 3],
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

//marker

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
