#include "script_component.hpp"
params [
	["_vehicle", objNull, [objNull]]
];

if(isNull _vehicle) exitWith {false};
_vehicle getVariable [QGVAR(registered), false];