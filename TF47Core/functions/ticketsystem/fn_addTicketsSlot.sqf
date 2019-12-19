#include "script_component.hpp"

params [
	["_unit", objNull, [objNull]],
	["_worth", 0, [0]]
];

_unit setVariable [QGVAR(unitCost), _worth];

true

