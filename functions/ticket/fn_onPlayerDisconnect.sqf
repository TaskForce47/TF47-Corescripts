#include "script_component.hpp"
params ["_unit"];

//first check for unit registred with cost
private _cost = _unit call FUNC(getTicketCost);
if(_cost == 0) exitWith {};

if(! (_unit call ace_medical_status_fnc_hasStableVitals)) exitWith {
    LOG_1("PLAYER DISCONNECTED IN UNSTABLE CONDITION",_unit);
    _unit call FUNC(handlePlayerKilled);
};