#include "script_component.hpp"

LOG("STARTING TICKET SERVER INIT!");

GVAR(vehicleList) = [];
GVAR(tickets) = 0;
GVAR(roundFinished) = false;

call FUNC(addVehicleClassEventhandler);
call FUNC(addOutOfTicketsEvent);
call FUNC(handlePlayerDisconnect);

private _fnc_startNewRound = {
	GVAR(tickets) = EGVAR(core,startingTickets);
	TRACE_1("STARTING NEW ROUND WITH DEFAULT STARTING TICKETS", GVAR(tickets));
	[QEGVAR(database,insertTicketSession), GVAR(tickets)] call CBA_fnc_serverEvent;
};

private _lastRoundData = [EGVAR(core,missionId)] call EFUNC(database,getLastSessionTickets);
TRACE_1("LAST ROUND DATA", _lastRoundData);

if(_lastRoundData isEqualTo []) exitWith {
	//we don't have any data
	LOG("NO LAST ROUND DATA FOUND. STARING FRESH!");
	call _fnc_startNewRound;
	publicVariable QGVAR(tickets);
};

//if the last round has been finished [session_id, ticket_count, finished]
if(_lastRoundData select 2) then {
	LOG("LAST ROUND HAS FINISHED. STARING FRESH!");
	call _fnc_startNewRound;
} else { //if the last round has not finished get the data
	TRACE_1("RESUMED WITH SAME TICKETS AS ENDED IN LAST ROUND!", _lastRoundData select 1);
	GVAR(tickets) = _lastRoundData select 1;
	[QEGVAR(database,insertTicketSession), GVAR(tickets)] call CBA_fnc_serverEvent;
};

publicVariable QGVAR(tickets);

LOG("TICKET SEVRER INIT COMPLETED!");
