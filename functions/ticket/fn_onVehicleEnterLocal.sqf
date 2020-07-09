#include "script_component.hpp"
params ["_unit", "_role", "_vehicle", "_turret"];

private _tickets = _vehicle call FUNC(getTicketCost);
[
	"Entered a vehicle!",
	format ["Type: %1", _vehicle call EFUNC(util,getVehicleName)],
	format ["This vehicle costs %1 tickets.", _tickets];
] spawn BIS_fnc_infoText;