#include "script_component.hpp"
params [
	["_amount", 0, [0]],
	["_isNegative", true, [true]],
	["_message", "unknown reason", [""]],
	["_isSilent", false, [false]]
];

if(! GVAR(enableTicketsystem)) exitWith {};

if(_isNegative) then {
	_amount = -1 * (abs _amount);
} else {
	_amount = abs _amount;
};

private _oldTickets = GVAR(tickets);
GVAR(tickets) = GVAR(tickets) + _amount;

if(GVAR(tickets) > GVAR(maxTickets)) then {
	["Ticket cap has been reached!"] remoteExec ["hint", 0];
	GVAR(tickets) = GVAR(maxTickets);
};
if(GVAR(tickets) < 0) then {
	GVAR(tickets) = 0;
};
publicVariable QGVAR(tickets);
[QGVAR(ticketChange), [_oldTickets, QGVAR(tickets), _amount, _message]] call CBA_fnc_globalEvent;

true