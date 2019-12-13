#include "script_component.hpp"
/*
 * Author: TF47 Dragon
 *
 * Changes the amount of tickets remaining on the mission and writes it back to the database
 * This function will trigger outofticket and ticketchange event
 *
 * Arguments:
 * 0: reason or message for the ticket change	<STRING>
 *  Default: "Ticket change"
 * 1: amount of tickets to be changed 			<SCALAR>  
 *	Default: 0
 * 2: negative or positive ticket change 		<BOOLEAN>
 *	Default: true
 *
 * Return Value:
 * 		none
 *
 * Example:
 * ["Pixxel hat die MH-6 versenkt! -25 Tickets", 25, true] call TF47_tickets_changeTickets; 
 *
 * Public: Yes
 */
params [
	["_message", "Ticket change", [""]],
	["_ticketChange", 0, [0]],
	["_negative", false, [true]]
];

if(_negative) then { _ticketChange = (abs _ticketChange) * -1; };

private _oldTicketCount = GVAR(tickets);
GVAR(tickets) = GVAR(tickets) + _ticketChange;

if(GVAR(tickets) < 1) then { ["outOfTickets", [GVAR(tickets), _message]] call CBA_fnc_GlobalEvent;};
if(GVAR(tickets) > GVAR(ticketCap)) then { GVAR(tickets) = GVAR(ticketCap)};

["ticketChange", [_message, GVAR(tickets), _ticketChange]] call CBA_fnc_globalEvent;

[_message, _ticketChange, GVAR(tickets)] call EFUNC(database, insertTicketLog);

true