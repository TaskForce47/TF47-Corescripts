#include "script_component.hpp"

if(! EGVAR(core,usePerformanceMapMarker)) exitWith {};

private _initalMarkerPos = [worldSize + 300, worldSize - 800, 0];
private _initalMarker = createMarker [QGVAR(initalMarker), _initalMarkerPos];
_initalMarker setMarkerText "Server and headless client performance:";
_initalMarker setMarkerType "mil_box";

GVAR(currentPerformance) = [];
GVAR(performanceMapMarker) = [];

[
  QGVAR(updatePerformanceMapMarker),
  {
    params ["_owner", "_fps", "_units", "_time", "_objectCount"];
    private _currentPerformance = GVAR(currentPerformance);
    private _id = _currentPerformance findif {_x select 0 == _owner};
    if(_id == -1) then { //if this owner id doesn't exist in storage
      _currentPerformance pushBack [_owner, _fps, _units, _time, _objectCount];
    } else {
      _currentPerformance set [_id, [_owner, _fps, _units, _time, _objectCount]];
    };
    GVAR(currentPerformance) = _currentPerformance;
  }
] call CBA_fnc_addEventHandler;

//quick function to set the data to the map marker
private _fnc_applyMarkerText = {
  params ["_marker", "_performance"];
  if(_performance select 0 == 2) then {
    _marker setMarkerText format [
      "Server: %1 FPS, %2 units, %4 objects, last update %3 seconds ago",
      _performance select 1,
      _performance select 2,
      (CBA_missionTime - (_performance select 3)),
      _performance select 4
    ];
  } else {
    _marker setMarkerText format [
      "HC%1: %2 FPS, %3 units, %5 objects, last update %4 seconds ago",
      _performance select 0,
      _performance select 1,
      _performance select 2,
      (CBA_missionTime - (_performance select 3)),
      _performance select 4
    ];
  };
};

//iterate over all performance data and add or update the map marker
[
  {
    params ["_fnc_applyMarkerText"];
    private _mapMarker = GVAR(performanceMapMarker);
    private _currentPerformance = GVAR(currentPerformance);
    {
        private _performance = _x;
        private _id = _mapMarker findif { _x == format ["TF47_logging_performanceMarker_%1", _performance select 0]; };
        if(_id == -1) then {
          private _marker = createMarker
                            [
                              format ["TF47_logging_performanceMarker_%1", _performance select 0],
                              [worldSize + 450, worldSize - 900 - (100 * _forEachIndex), 0]
                            ];
          _marker setMarkerType "mil_triangle";
          _marker setMarkerDir 90;
          [_marker, _performance] call _fnc_applyMarkerText;
          _mapMarker pushBack _marker;
        } else {
          [_mapMarker select _id, _performance] call _fnc_applyMarkerText;
        };
    } forEach _currentPerformance;
    GVAR(performanceMapMarker) = _mapMarker;
  },
  20,
  _fnc_applyMarkerText
] call CBA_fnc_addPerFrameHandler;
