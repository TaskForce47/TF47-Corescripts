#include "script_component.hpp"
/*
 * Author: TF47 Dragon
 * 
 * Adds ticket cost to a slot.
 * This script must be placed in the init of each player controllable unit.
 * You don't have to watch out for the sign, it will always 
 * be converted to a negative number.
 *
 * Arguments:
 * 0: unit object 		<objNull>
 * 1: ticket cost   	<NUMBER> (Default: 0)

 * Return Value:
 * 		none
 *
 * Example:
 * [this, 20] call ace_common_fnc_imanexample
 *
 * Public: Yes
 */
params [
	["_unit", objNull, [objNull]],
	["_cost", 0, [0]]
];

_unit setVariable [QGVAR(unitCost), _cost];

true

