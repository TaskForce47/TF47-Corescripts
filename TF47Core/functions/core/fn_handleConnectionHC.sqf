#include "script_component.hpp"

/*
 * Author: TF47 Dragon
 *
 * Adds an headless client to the headless client list
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

GVAR(hcList) pushBackUnique _owner;
[QGVAR(hcConnected), _owner] call CBA_fnc_serverEvent;