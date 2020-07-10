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

if(IS_SERVER) then {
	call FUNC(initServer);
};

if(IS_CLIENT) then {
	[
		{ !(isNil QGVAR(playerNamespace)) && !isnull (finddisplay 46)}, 
		{ [{call FUNC(initPlayer)}] call CBA_fnc_directCall;}
	] call CBA_fnc_waitUntilAndExecute;
};

if(IS_HEADLESS) then {
	call FUNC(initHc);
};
