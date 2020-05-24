#include "script_component.hpp"
/*
 * Author: TF47 Dragon
 *
 * Inital script executed by postInit.
 * This init will setup variables and will initialize other components of
 * the Corescripts.
 *
 * Public: NO
 */

if(isServer && hasInterface && !isDedicated) exitWith {
	ERROR("YOU CANNOT USE THE CORESCRIPTS WHILE IN EDITOR! DISABLED FOR YOUR TESTING!");
};

if(isServer) then {
	call FUNC(initServer);
};


if(hasInterface && {!isDedicated}) then {
	[{ (! (isNil QGVAR(playerNamespace))) && (!isnull (finddisplay 46))}, {
		[{call FUNC(initPlayer)}] call CBA_fnc_directCall;
	}] call CBA_fnc_waitUntilAndExecute;
};
