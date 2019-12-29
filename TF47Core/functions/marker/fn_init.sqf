#include "script_component.hpp"

if(hasInterface && !isDedicated) then {
	if(EGVAR(core,markerRestriction)) then {
		call FUNC(addMapmarkerRestriction);
	};
};