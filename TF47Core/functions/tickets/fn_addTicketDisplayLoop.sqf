#include "script_component.hpp"
/*
 * Author: TF47 Dragon
 * 
 * Once executed this functions will hint the current amount of tickets
 * every 10 min
 *
 * Arguments:
 *  none
 *
 * Return Value:
 *  none
 *
 * Example:
 * [] call TF47_ticket_addTicketDisplayLoop
 *
 * Public: No
 */
if(!hasInterface && {!isDedicated}) exitWith {};
[{
	hint format ["Tickets: %1", GVAR(tickets)];
}, 60*10] call CBA_fnc_addPerFrameHandler;