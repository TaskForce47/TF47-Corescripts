#include "script_component.hpp"

#define GLOBAL_CHAT 0
#define SIDE_CHAT 1
#define COMMAND_CHAT 2
#define GROUP_CHAT 3
#define VEHICLE_CHAT 4
#define DIRECT_CHAT 5


["ace_unconscious", {
	params ["_unit", "_state"];

	if !(local _unit) exitWith {};

	if(_state) then {
		_unit setUnitTrait ["audibleCoef", 0];
	} else {
		_unit setUnitTrait ["audibleCoef", 1];
	};
}] call CBA_fnc_addEventHandler;

//["ace_unconscious", {
//	params ["_unit", "_state"];
//	
//  if !(local _unit) exitWith {};
//
//	if (_state) then {
//		SIDE_CHAT enableChannel [false, false];	
//	} else {
//		SIDE_CHAT enableChannel [true, false];
//	};
//}] call CBA_fnc_addEventhandler;

call FUNC(preventPlayerBleedout);

LOG("ACE CLIENT INIT DONE!");

