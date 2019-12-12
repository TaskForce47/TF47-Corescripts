#include "script_component.hpp"

if(isDedicated && !hasInterface) exitWith {};

if(EGVAR(core, markerRestriction)) then {
	call FUNC(addMapmarkerRestriction);
};