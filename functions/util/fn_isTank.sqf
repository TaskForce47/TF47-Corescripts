#include "script_component.hpp"
params [
	["_vehicle", objNull, [objNull]]
];

if(isNull _vehicle) exitWith {false};

_vehicle isKindOf "Tank" || {_vehicle isKindOf "Wheeled_APC"} || {_vehicle isKindOf "Wheeled_APC_F"}