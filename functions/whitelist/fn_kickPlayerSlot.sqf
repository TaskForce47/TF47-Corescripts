#include "script_component.hpp"
params [
	["_unit", objNull, [objNull]],
	["_endName", "end1", [""]]
];

if(isNull _unit) exitWith {};
if(! local _unit) exitWith {
	[_unit, _endName] remoteExec [QFUNC(kickPlayerSlot), _unit];
};

[_endName, false] call BIS_fnc_endMission;

true