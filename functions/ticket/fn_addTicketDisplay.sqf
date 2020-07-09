#include "script_component.hpp"

//TODO: make the greates overlay in the world, the number one overlay

[
	{hint format ["Current tickets: %1", GVAR(tickets)];},
	60 * 10
] call CBA_fnc_addPerFrameHandler;