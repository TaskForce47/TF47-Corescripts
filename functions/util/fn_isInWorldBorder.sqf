#include "script_component.hpp"

params [
	["_pos", [0,0,0], [objNull,[]]]
];

if(_pos isEqualType objNull) then {
	_pos = getPos _pos;
};

if((_pos select 0) < 0 || (_pos select 1) < 0) exitWith {false};

! ((_pos select 0) > worldSize || (_pos select 1) > worldSize)