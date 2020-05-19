#include "script_component.hpp"
params ["_player"];
if(_player == vehicle _player) exitWith {"foot"};
if(vehicle _player isKindOf "Car") exitWith {"car"};
if(vehicle _player isKindOf "Helicopter") exitWith {"helo"};
if(vehicle _player isKindOf "Plane") exitWith {"Plane"};
"foot"
