#include "script_component.hpp"
if(! EGVAR(core,markerSystem)) exitWith {};
if(EGVAR(core,markerRestriction)) then {
	call FUNC(addMapmarkerRestriction);
};