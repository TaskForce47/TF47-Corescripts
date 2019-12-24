#include "script_component.hpp"

params [
	["_sessionId", 0, []]
];

private _sessionStats = [_sessionId] call EFUNC(database,getLastSessionTicket);

if(count _sessionStats > 0) then {
	if(!(_sessionStats#2)) then {
		GVAR(tickets) = _sessionStats#1;
	};
};