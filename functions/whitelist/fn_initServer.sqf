#include "script_component.hpp"

if(! GVAR(enableWhitelist)) then {};

GVAR(slotWhitelist) = [];
GVAR(slotTraits) = [];

addMissionEventHandler ["PlayerViewChanged", {
	params ["", "_newUnit", "", "", "", "_uav"];
	[_newUnit, _uav] remoteExec [QFUNC(handleUavCheck), _newUnit];
}];