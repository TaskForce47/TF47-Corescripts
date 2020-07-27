#include "script_component.hpp"
[
	QGVAR(enableTicketsystem),
	"CHECKBOX",
	["Enable TicketSystem", "Enables or disables the ticketsystem"],
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
	QGVAR(enableLose),
	"CHECKBOX",
	["Lose on zero tickets", "The game is lost as soon the ticket count reaches zero"],
	["TF47 Corescripts", "Ticketsystem"],
	false,
	1,
	nil,
	true
] call CBA_fnc_addSetting;

[
	QGVAR(allowComback),
	"CHECKBOX",
	["Allow comback", "Allows player to archive a comback in timout phase after reaching zero tickets"],
	["TF47 Corescripts", "Ticketsystem"],
	false,
	1,
	nil,
	true
] call CBA_fnc_addSetting;

[
	QGVAR(timeoutBeforeLose),
	"LIST",
	["Timeout before lose", "Allows you to control timeout after reaching zero tickets the mission will terminate"],
	["TF47 Corescripts", "Ticketsystem"],
	[[10,30,60,90,120,150,180,210,240], [], 1],
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
	QGVAR(enableFallback),
	"CHECKBOX",
	["Enable ticket fallback", "If a vehicle is not found in the ticket list it will registered with default ticket cost"],
	["TF47 Corescripts", "Ticketsystem"],
	true,
	1,
	nil,
	true
] call CBA_fnc_addSetting;

[
	QGVAR(defaultCostVehicles),
	"LIST",
	["Default cost vehicles", "Default cost for vehicles if it is not defined in the vehicle cost list"],
	["TF47 Corescripts", "Ticketsystem"],
	[[0, 5, 10, 20, 50], [], 1],
	1,
	nil,
	true
] call CBA_fnc_addSetting;

[
	QGVAR(defaultCostTanks),
	"LIST",
	["Default cost tanks", "Default cost for tanks if it is not defined in the vehicle cost list"],
	["TF47 Corescripts", "Ticketsystem"],
	[[0, 5, 10, 20, 50], [], 1],
	1,
	nil,
	true
] call CBA_fnc_addSetting;

[
	QGVAR(defaultCostHelicopters),
	"LIST",
	["Default cost helicopters", "Default cost for helicopters if it is not defined in the vehicle cost list"],
	["TF47 Corescripts", "Ticketsystem"],
	[[0, 5, 10, 20, 50], [], 1],
	1,
	nil,
	true
] call CBA_fnc_addSetting;

[
	QGVAR(defaultCostAttackHelicopters),
	"LIST",
	["Default cost attack helicopters", "Default cost for  attack helicopters if it is not defined in the vehicle cost list"],
	["TF47 Corescripts", "Ticketsystem"],
	[[0, 5, 10, 20, 50], [], 1],
	1,
	nil,
	true
] call CBA_fnc_addSetting;

[
	QGVAR(defaultCostPlanes),
	"LIST",
	["Default cost for planes", "Default cost for planes if it is not defined in the vehicle cost list"],
	["TF47 Corescripts", "Ticketsystem"],
	[[0, 5, 10, 20, 50], [], 1],
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
	1,
	nil,
	true
] call CBA_fnc_addSetting;

[
	QGVAR(enableZeroTicketNotification),
	"CHECKBOX",
	["Enable zero ticket notification", "If disabled ticket change notification will not be displayed if the amount of changing tickets is 0"],
	["TF47 Corescripts", "Ticketsystem"],
	true,
	1,
	nil,
	true
] call CBA_fnc_addSetting;