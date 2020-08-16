#include "script_component.hpp"

GVAR(relays) = [];
publicVariable QGVAR(relays);

["ace_cargoLoaded", {
	params ["_item"];
	if (_item in GVAR(relays) && { _item getVariable [QGVAR(online), false] }) then {
		_relay call TFAR_antennas_fnc_deleteRadioTower;
	};
	private _marker = getMarkerType (_relay getVariable [QGVAR(marker), ""]);
	if (! (_marker isEqualTo "")) then {
		deleteMarker _marker;
		_relay setVariable [QGVAR(marker), "", true];
	};
}] call CBA_fnc_addEventhandler;