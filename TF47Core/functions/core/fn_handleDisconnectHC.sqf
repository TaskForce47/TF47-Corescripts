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

GVAR(hcList) - _owner;