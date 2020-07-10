#include "script_component.hpp"

//_this select 0 references the dead unit
player addEventHandler ["Killed", {[_this select 0] remoteExec [QFUNC(handlePlayerKilled),2]}];

player addEventHandler ["GetInMan", {_this call FUNC(onVehicleEnterLocal);}];