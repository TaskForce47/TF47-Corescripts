#include "script_component.hpp"

GVAR(tickets) = 0;

private _fnc_startNewRound = {
	GVAR(tickets) = GVAR(startingTickets);
	[EGVAR(database,insertTicketSession), GVAR(tickets)] call CBA_fnc_serverEvent;
};

private _lastRoundData = call EFUNC(database,getLastSessionTickets);
if(_lastRoundData isEqualTo []) then {
	//we don't have any data
	call _fnc_startNewRound;
};

//if the last round has been finished
if(_lastRoundData select 2) then {
	call _fnc_startNewRound;
} else { //if the last round has not finished get the data
	GVAR(tickets) = _lastRoundData select 1;
};
