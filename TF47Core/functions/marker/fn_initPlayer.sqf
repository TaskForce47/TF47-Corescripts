#include "script_component.hpp"
if(! GVAR(markerSystem)) exitWith {};
if(EGVAR(core,markerRestriction)) then {
	call FUNC(addMapmarkerRestriction);
};