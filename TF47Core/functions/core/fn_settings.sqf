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
	["Enable ", "Enable or disable the performance tracking for server and clients"],
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
	["Enable ", "Enable or disable the chat tracker"],
	["TF47 Corescripts", "Logging"],
	false,
	1,
	nil,
	true
] call CBA_fnc_addSetting;

[
	QGVAR(useKillTracker),
	"CHECKBOX",
	["Enable ", "Enable or disable the kill tracker"],
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


//technical setup
[
	QGVAR(maxConnections),
	"LIST",
	["Maximum Database connections", "Maximum database connections that will be created"],
	["TF47 Corescripts", "Tech"],
	[[1,2,3,4,5,6,7,8], [], 2],
	1,
	nil,
	true
] call CBA_fnc_addSetting;

[
	QGVAR(missionName),
	"EDITBOX",
	["Mission name", "e.g. liberation tanoa"],
	["TF47 Corescripts", "Tech"],
  	"unkown mission",
	nil,
	true
] call CBA_fnc_addSetting;