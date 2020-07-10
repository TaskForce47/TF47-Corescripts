#include "script_component.hpp"

GVAR(playerList) = []; //initialize list where player namespaces will be saved
GVAR(hcList) = [];
GVAR(baseList) = [];
GVAR(objectiveList) = [];
publicVariable QGVAR(baseList);
publicVariable QGVAR(objectiveList);

[GVAR(maxConnections), GVAR(missionId)] call EFUNC(database,init);

//DO NOT CHANGE ORDER!
call EFUNC(ticket,initServer);
call EFUNC(logging,initServer);
call EFUNC(marker,initServer);
call EFUNC(ace,initServer);
call EFUNC(whitelist,initServer);
call EFUNC(util,initServer);

addMissionEventHandler ["PlayerConnected", { _this call FUNC(handlePlayerConnected) }];
addMissionEventHandler ["PlayerDisconnected", { _this call FUNC(handlePlayerDisconnected) }];


