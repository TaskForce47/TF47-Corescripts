#include "script_component.hpp"

params ["_time"];

private _fps = diag_fps;
private _active = diag_activeScripts;
_active params ["_spawned", "_execVm", "", "_execFSM"];
private _objectCount = count allMissionObjects "";
private _unitCount = count (allUnits select {local _x});

[
  QEGVAR(database,serverPerformance),
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

[
  QGVAR(updatePerformanceMapMarker),
  [
    clientOwner,
    _fps,
    _unitCount,
    _time,
    _objectCount
  ]
] call CBA_fnc_serverEvent;
