#include "script_component.hpp"

LOG("Trying to get last session tickets...");

private _lastRoundData = [EGVAR(core,missionId)] call EFUNC(database,getLastSessionTickets);
LOG_1("Last round data:", _lastRoundData);

private _fnc_startNewRound = {
	GVAR(tickets) = GVAR(startingTickets);
	LOG(format ["Started new session with %1 tickets.", GVAR(tickets)]);
	[QEGVAR(database,insertTicketSession), GVAR(tickets)] call CBA_fnc_serverEvent;
};


if(_lastRoundData isEqualTo []) exitWith {
	LOG("There is no existing data in the database! Starting new session.");
	call _fnc_startNewRound;
	publicVariable QGVAR(tickets);
};

//if the last round has been finished [session_id, ticket_count, finished]
if(_lastRoundData select 2) then {
	LOG("Last round has finished, starting new session!");
	call _fnc_startNewRound;
} else { 
	//if the last round has not finished get the data
	LOG_1("Resumed with ticket count of last round!", _lastRoundData select 1);
	GVAR(tickets) = _lastRoundData select 1;
	[QEGVAR(database,insertTicketSession), GVAR(tickets)] call CBA_fnc_serverEvent;
};

publicVariable QGVAR(tickets);
