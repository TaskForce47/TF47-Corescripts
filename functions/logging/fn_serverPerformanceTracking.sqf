#include "script_component.hpp"

params ["_time"];

private _fps = diag_fps;
private _active = diag_activeScripts;
_active params ["_spawned", "_execVm", "", "_execFSM"];
private _objectCount = count allMissionObjects "";
private _unitCount = count (allUnits select {local _x});

[
  QGVAR(database,insertHcPerformance),
  [
    _time,
    _fps,
    _spawned,
    _execVm,
    _execFSM,
    _objectCount,
    _unitCount
  ]
] call CBA_fnc_serverEvent;
