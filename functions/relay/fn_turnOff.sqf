#include "script_component.hpp"

params [
	["_relay", objNull, [objNull]]
];

if (isNull _relay || { !(_relay getVariable [QGVAR(online), false]) }) exitWith {};
if (!isServer) exitWith { [_relay] remoteExec [QFUNC(turnOff),2]; };


_relay setVariable [QGVAR(online), false, true];
_relay call TFAR_antennas_fnc_deleteRadioTower;

[_relay, 1] call BIS_fnc_DataTerminalAnimate;

[_relay, true] call ace_dragging_fnc_setDraggable;
[_relay, true] call ace_dragging_fnc_setCarryable;
[_relay, 2] call ace_cargo_fnc_setSize;

private _marker = getMarkerType (_relay getVariable [QGVAR(marker), ""]);
if (! (_marker isEqualTo "")) then {
	deleteMarker _marker;
	_relay setVariable [QGVAR(marker), "", true];
};

true