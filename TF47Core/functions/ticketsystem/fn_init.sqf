#include "script_component.hpp"

GVAR(tickets) = QEGVAR(core, startingTickets);
GVAR(ticketCap) = QEGVAR(core, maxTickets);


if(EGVAR(core, loseOnZeroTickets) && isServer) then {
	["outOfTickets", {
		0 spawn {
			sleep 40;
			["EveryoneLost"] call BIS_fnc_endMissionServer;
		};
	}] call CBA_fnc_addEventHandler
};