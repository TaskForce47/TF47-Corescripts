#include "script_component.hpp"

if(isServer) then {

	GVAR(tickets) = EGVAR(core,startingTickets);
	GVAR(ticketCap) = EGVAR(core,maxTickets);


	if(EGVAR(core,loseOnZeroTickets) && isServer) then {
		["outOfTickets", {
			0 spawn {
				sleep 40;
				["EveryoneLost"] call BIS_fnc_endMissionServer;
			};
		}] call CBA_fnc_addEventHandler
	};

};

if(hasInterface && {!isDedicated}) then {
	call FUNC(clientTicketChangeReceived);
};