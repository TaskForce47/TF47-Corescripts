#include "script_component.hpp"

GVAR(playerList) = []; //initialize list where player namespaces will be saved
GVAR(hcList) = [];
GVAR(baseList) = [];

[GVAR(maxConnections), GVAR(missionId)] call EFUNC(database,init);

//DO NOT CHANGE ORDER!
call FUNC(handlePlayerConnected);
call FUNC(handlePlayerDisconnected);
call EFUNC(ticket,initServer);
call EFUNC(logging,initServer);
call EFUNC(marker,initServer);
call EFUNC(ace,initServer);
call EFUNC(whitelist,initServer);
call EFUNC(util,initServer);
