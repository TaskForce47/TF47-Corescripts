#include "script_component.hpp"
params ["_killed", "", ""];
if(! (isPlayer _killed)) exitWith {};
if(! (vehicle player == player)) exitWith {};
_cost = _killed getVariable [QGVAR(unitCost), 0];
_message = format ["Player %1 died! -%2 tickets", name _killed ,_cost];
[_message, _cost, true] call FUNC(changeTicketCount);