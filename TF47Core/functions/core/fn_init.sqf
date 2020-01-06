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
	GVAR(playerList) = []; //initialize list where player namespaces will be saved
	GVAR(hcList) = [];

	[GVAR(maxConnections), GVAR(missionName)] call EFUNC(database,init);

	call FUNC(handlePlayerConnected);
	call FUNC(handlePlayerDisconnected);
	if(GVAR(useTicketsystem)) then {
		call EFUNC(ticket,init);
	};
	call EFUNC(ace,init);
};


if(hasInterface && {!isDedicated}) then {
	[{ (! (isNil QGVAR(playerNamespace))) && (!isnull (finddisplay 46))}, {
		if(GVAR(useTicketsystem)) then {
			call EFUNC(ticket,init);
		};

		if(GVAR(useWhitelist)) then {
			call EFUNC(whitelist,init);
		};

		if(GVAR(markerSystem)) then {
			call EFUNC(marker,init);
		};
		
		//disable in case ace fixed their shitzzle
		call EFUNC(ace,preventPlayerBleedout);

	}] call CBA_fnc_waitUntilAndExecute;

};
