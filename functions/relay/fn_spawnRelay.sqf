#include "script_component.hpp"

#define RELAY_OBJECT "Land_DataTerminal_01_F"

params [
	["_pos", [0,0,0]]
];

if (count GVAR(relays) >= GVAR(maxRelays)) exitWith { hint "Maximal amount of relays have been reached!" };
if (!isServer) exitWith { [_relay] remoteExec [QFUNC(turnOn),2]; };


private _relay = RELAY_OBJECT createVehicle [0,0,0];
_relay setPos _pos;
[_relay, true] call ace_dragging_fnc_setDraggable;
[_relay, true] call ace_dragging_fnc_setCarryable;
[_relay, 2] call ace_cargo_fnc_setSize;

_relay setVariable [QGVAR(online), false, true];

GVAR(relays) pushBack _relay;

private _ehId = _relay addEventHandler ["Killed", {
	params ["_relay"];

	_relay removeEventHandler ["Killed", _relay getVariable [QGVAR(ehId), -1]];
	
	[GVAR(relayTicketCost), true, "Relay was destroyed!"] call EFUNC(ticket,changeTicketCount);

	if (_relay getVariable [QGVAR(online), false]) then {
		_relay call TFAR_antennas_fnc_deleteRadioTower;
	};

	GVAR(relays) = GVAR(relays) - [_relay]; 
	publicVariable QGVAR(relays);
}];

_relay setVariable [QGVAR(ehId), _ehId];

private _actionOn = [
	QGVAR(activateRelay),
	"Activate relay",
	"",
	{ systemChat "starting relay..."; _target call FUNC(turnOn); },
	{ ! (_target getVariable [QGVAR(online), false]) }
] call ace_interact_menu_fnc_createAction;

private _actionOff = [
	QGVAR(shutdownRelay),
	"Shutdown relay",
	"",
	{ systemChat "stopping relay..."; _target call FUNC(turnOff); },
	{ _target getVariable [QGVAR(online), false] }
] call ace_interact_menu_fnc_createAction;

[_relay, 0, ["ACE_MainActions"], _actionOn] remoteExec ["ace_interact_menu_fnc_addActionToObject", 0, true];
[_relay, 0, ["ACE_MainActions"], _actionOff] remoteExec ["ace_interact_menu_fnc_addActionToObject", 0, true];

true