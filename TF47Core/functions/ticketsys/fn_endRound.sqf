#include "script_component.hpp"
/*
 * Author: TF47 Dragon
 * 
 * This function will mark the current session as the ending of the current running mission.
 * On next restart the ticket count will be reset to starting tickets.
 *
 * Arguments:
 *		none
 *
 * Return Value:
 * 		none
 *
 * Example:
 * [] call TF47_ticket_endRound
 *
 * Public: No
 */

[0, true] call EFUNC(database,updateTicket);