#include "script_component.hpp"
params ["_vehicle"];

if(isNull _vehicle) exitWith {};

(_vehicle isKindOf "Man" || 
{_vehicle getVariable [QGVAR(checkDisabled),false]} || 
{((assignedVehicleRole player) select 0) isEqualTo "cargo"} ||
{ _vehicle call FUNC(isFlying)})

