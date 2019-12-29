#include "script_component.hpp"
/*
 * Author: TF47 Dragon
 * 
 * Tries to find out if the last session was ended by a lost.
 * If the last mission not lost the function will apply the last ticket count 
 * to the current ticket count.
 *
 * Arguments:
 * 0: Session id   	<SCALAR>
 *
 * Return Value:
 *  	none
 *
 * Example:
 * [123] call tf47_ticket_fnc_checkLastRound
 *
 * Public: Yes
 */
params [
	["_sessionId", 0, []]
];

private _sessionStats = [_sessionId] call EFUNC(database,getLastSessionTicket);
LOG_1("Old session data as returned from the database", _sessionStats)
//in case there is no last session stored we will check against an empty array
if((count _sessionStats > 0) && {!(_sessionStats#2)}) then {
	GVAR(tickets) = _sessionStats#1;
};