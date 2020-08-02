#include "script_component.hpp"
/*
 * Author: TF47 Dragon
 *
 * Removes an headless client to the headless client list
 *
 * Arguments:
 * 0: client id		<SCALAR>
 *
 * Return Value:
 *  	none
 *
 *
 * Public: No
 */

params ["_owner"];

private _id = GVAR(hcList) findIf { _x isEqualTo _owner };
if(_id == -1) exitWith {};

GVAR(hcList) deleteAt _id;

[QGVAR(hcDisconnected), _owner] call CBA_fnc_serverEvent;