#include "script_component.hpp"

if(isServer) then {
	GVAR(tickets) = EGVAR(core,startingTickets);
	GVAR(ticketCap) = EGVAR(core,maxTickets);

	_lastRound = profileNamespace getVariable [QGVAR(sesionId), -1];
	if(_lastRound == -1) then { 
		[GVAR(tickets)] call FUNC(startNewRound);
	} else {
		[_lastRound] call FUNC(checkLastRound);
		[GVAR(tickets)] call FUNC(startNewRound);
	};
	

	//write current session id to data to check next round 
	profileNamespace setVariable [QGVAR(sesionId), EGVAR(database,sesssessionId)];

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