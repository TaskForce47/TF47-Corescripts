#include "script_component.hpp"

if(! GVAR(enableTicketsystem)) exitWith {};

call FUNC(getTicketLastSession);

GVAR(suddenDeath) = false;
//add trigger to tickets triggering on reaching 0 tickets
GVAR(tickets) addPublicVariableEventHandler {
	params ["_varName", "_value", "_target"];

	if(_value < 0) exitWith {};

	[QGVAR(outOfTickets), nil] call CBA_fnc_globalEvent;

	if(!GVAR(enableLose)) exitWith {};

	if(GVAR(allowComback) && !GVAR(suddenDeath)) then {
		GVAR(suddenDeath) = true;
		[
			{GVAR(tickets) > 0},
			{
				GVAR(suddenDeath) = false;
				["Crysis averted! Tickets are positive again"] remoteExec ["hint", 0];
			},
			GVAR(timeoutBeforeLose),
			{call FUNC(triggerLose)}
		] call CBA_fnc_waitUntilAndExecute;
	};
};

GVAR(slotCost) = [];