#include "script_component.hpp"

params ["_time"];

private _fps = diag_fps;
private _active = diag_activeScripts;
_active params ["_spawned", "_execVm", "", "_execFSM"];

[
  QGVAR(database,insertPlayerPerformance),
  [
    EGVAR(core,playerId),
    _time,
    _fps,
    _spawned,
    _execVm,
    _execFSM
  ]
] call CBA_fnc_serverEvent;
