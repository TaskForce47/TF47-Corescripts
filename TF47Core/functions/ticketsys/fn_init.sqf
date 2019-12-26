#include "script_component.hpp"
/*
 * Author: TF47 Drago
 * 
 * Main ticketsystem init
 * Server side inits:
 *  - sync tickets with last mission
 *  - provides ending of current mission in case of 0 tickets
 * Client side inits:
 *  - BIS notification for ticket events
 *  - Ticket Count hint loop
 *
 * Public: No
 */
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
	profileNamespace setVariable [QGVAR(sesionId), EGVAR(database,sessionId)];

	if(EGVAR(core,loseOnZeroTickets) && isServer) then {
		["outOfTickets", {
			call FUNC(endRound); //make sure next round does not take last ticket count
			0 spawn {
				sleep 40;
				["EveryoneLost"] call BIS_fnc_endMissionServer;
			};
		}] call CBA_fnc_addEventHandler
	};


	addMissionEventHandler ["EntityKilled", {
		params ["_killed", "", ""];
		_cost = _killed getVariable [QGVAR(unitCost), 0];
		_message = format ["Player died! -%1 tickets", _cost];
		[_message, _cost, true] call FUNC(changeTicketCount);
	}];
};

if(hasInterface && {!isDedicated}) then {
	call FUNC(clientTicketChangeReceived);
	call FUNC(addTicketDisplayLoop);
};