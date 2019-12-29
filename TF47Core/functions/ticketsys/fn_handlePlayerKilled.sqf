params ["_killed", "", ""];
if(! (isPlayer _killed)) exitWith {};
_cost = _killed getVariable [QGVAR(unitCost), 0];
_message = format ["Player died! -%1 tickets", _cost];
[_message, _cost, true] call FUNC(changeTicketCount);