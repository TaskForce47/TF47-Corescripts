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


GVAR(playerList) = []; //initialize list where player namespaces will be saved
GVAR(hcList) = [];

[GVAR(maxConnections), GVAR(missionName)] call EFUNC(database, init);

addMissionEventHandler ["PlayerConnected", _this call FUNC(onPlayerConnected)];
addMissionEventHandler ["PlayerDisconnected", _this call FUNC(onPlayerDisconnected)];

