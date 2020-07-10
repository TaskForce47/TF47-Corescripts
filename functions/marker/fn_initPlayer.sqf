#include "script_component.hpp"
if(! GVAR(markerSystem)) exitWith {};
if(GVAR(markerRestriction)) then {
	call FUNC(addMapmarkerRestriction);
};