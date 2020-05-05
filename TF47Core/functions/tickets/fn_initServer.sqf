#include "script_component.hpp"

LOG("STARTING TICKET SERVER INIT!");

GVAR(vehicleList) = [];
//register server events
call FUNC(addEndSessionEvent);
call FUNC(addOutOfTicketsEvent);
call FUNC(addTicketChangeEvent);
call FUNC(addVehicleClassEventhandler);

GVAR(tickets) = 0;

private _fnc_startNewRound = {
	GVAR(tickets) = EGVAR(core,startingTickets);
	[QEGVAR(database,insertTicketSession), GVAR(tickets)] call CBA_fnc_serverEvent;
};

private _lastRoundData = EGVAR(core,missionId) call EFUNC(database,getLastSessionTickets);
if(_lastRoundData isEqualTo []) exitWith {
	//we don't have any data
	LOG("NO LAST ROUND DATA FOUND. STARING FRESH!")
	call _fnc_startNewRound;
	publicVariable QGVAR(tickets);
};

_lastRoundData = _lastRoundData select 0; //we recvive something like [["blub", 34]]

//if the last round has been finished
if(_lastRoundData select 2) then {
	LOG("LAST ROUND HAS FINISHED. STARING FRESH!")
	call _fnc_startNewRound;
} else { //if the last round has not finished get the data
	TRACE_1("RESUMED WITH SAME TICKETS AS ENDED IN LAST ROUND!", _lastRoundData);
	GVAR(tickets) = _lastRoundData select 1;
	[QEGVAR(database,insertTicketSession), GVAR(tickets)] call CBA_fnc_serverEvent;
};

publicVariable QGVAR(tickets);

LOG("TICKET SEVRER INIT COMPLETED!");
