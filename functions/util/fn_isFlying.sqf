#include "script_component.hpp"
params [
	["_object", objNull, [objNull]]
];

if(isNull _object) exitWith {false};

private _posAGL = getPosATL _object;

(_posAGL select 2) > 2.5 && !(isTouchingGround _object)