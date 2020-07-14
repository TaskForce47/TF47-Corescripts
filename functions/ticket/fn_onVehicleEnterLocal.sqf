#include "script_component.hpp"
params ["_unit", "_role", "_vehicle", "_turret"];

private _tickets = _vehicle call FUNC(getTicketCost);
[
	["Entered a vehicle!",2, 0, 6],
	[format ["Type: %1", _vehicle call EFUNC(util,getVehicleName)], 2, 0, 6],
	[format ["This vehicle costs %1 tickets.", _tickets], 2, 0, 6]
] spawn BIS_fnc_EXP_camp_SITREP;