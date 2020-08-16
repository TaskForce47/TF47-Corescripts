#include "script_component.hpp"
params [
	["_relay", objNull, [objNull]]
];

if (isNull _relay || { _relay getVariable [QGVAR(online), false] }) exitWith {};
if (!isServer) exitWith { [_relay] remoteExec [QFUNC(turnOn),2]; };

_relay setVariable [QGVAR(online), true, true];
[_relay, false] call ace_dragging_fnc_setDraggable;
[_relay, false] call ace_dragging_fnc_setCarryable;
[_relay, 0] call ace_cargo_fnc_setSize;

[_relay, GVAR(relayRange)] call TFAR_antennas_fnc_initRadioTower;

[_relay, 3] call BIS_fnc_DataTerminalAnimate;

private _marker = createMarker [(str _relay), getPos _relay];
_marker setMarkerColor "ColorWEST";
_marker setMarkerText "Relay - active";
_marker setMarkerType "loc_Transmitter";
_relay setVariable [QGVAR(marker), _marker, true];

true