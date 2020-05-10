#include "script_component.hpp"
[
  QGVAR(changeTicketCount),
  {
    params [
    	["_message", "Ticket change", [""]],
    	["_ticketChange", 0, [0]],
    	["_positiveChange", false, [false]]
    ];

    if(_positiveChange) then {
    	_ticketChange = abs _ticketChange;
    } else {
    	_ticketChange = -1 * abs _ticketChange;
    };

    //private _oldTicketCount = GVAR(tickets);
    GVAR(tickets) = GVAR(tickets) + _ticketChange;

    //check if we are out of tickets
    if(GVAR(tickets) < 1) then {
    	[QGVAR(outOfTickets), [GVAR(tickets), _message]] call CBA_fnc_serverEvent;
    };

    //check if we exceed the ticket cap
    if(GVAR(tickets) > EGVAR(core,maxTickets)) then {
    	[
    		"The ticket cap has been reached! You cannot gather any more tickets"
    	] remoteExec ["hint", 0];
    	GVAR(tickets) = EGVAR(core,maxTickets);
    };

    //don't allow negative values!
    if(GVAR(tickets) < 0) then { GVAR(tickets) = 0 };

    //send ticket change event
    [QGVAR(ticketChange), [_message, GVAR(tickets), _ticketChange]] call CBA_fnc_GlobalEvent;

    //save ticket change to database
    [
    	QEGVAR(database,insertTicketLog),
    	[GVAR(tickets), _ticketChange, _message]
    ] call CBA_fnc_serverEvent;
    [
    	QEGVAR(database,updateTicketSession),
    	GVAR(tickets)
    ] call CBA_fnc_serverEvent;

    //send out updated tickets (mainly used for the hint loop ticket count)
    publicVariable QGVAR(tickets);
  }
] call CBA_fnc_addEventHandlerArgs;
