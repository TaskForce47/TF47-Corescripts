#include "script_component.hpp"
#define TIMEOUT_BEFORE_LOSE 10
[QGVAR(ticketChange), {
	params ["_message", "","_ticketChange"];
	if(_ticketChange > -1) then {
		[
			QEGVAR(util,showNotification),
			[NOTIFICATION_TICKET_GAIN,_message]
		] call CBA_fnc_localEvent;
	} else {
		[
			QEGVAR(util,showNotification),
			[NOTIFICATION_TICKET_LOSS,_message]
		] call CBA_fnc_localEvent;
	};
}] call CBA_fnc_addEventHandler;

if(EGVAR(core,loseOnZeroTickets)) then {
	[QGVAR(outOfTickets), {
		[
			{
				[
					NOTIFICATION_TICKET_NOTICKETS,
					["We will get them next time!"]
				] call CBA_fnc_localEvent;
			},
			nil,
			TIMEOUT_BEFORE_LOSE
		] call CBA_fnc_waitAndExecute;
	}] call CBA_fnc_addEventHandler;
};
