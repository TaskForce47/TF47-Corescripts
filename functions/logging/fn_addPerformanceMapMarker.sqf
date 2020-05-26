#include "script_component.hpp"

if(! EGVAR(core,usePerformanceMapMarker)) exitWith {};

private _initalMarkerPos = [worldSize + 200, worldSize - 800, 0];
private _initalMarker = createMarker [QGVAR(initalMarker), _initalMarkerPos];
_initalMarker setMarkerText "Server and headless client performance:";
_initalMarker setMarkerType "mil_box";

GVAR(currentPerformance) = [];
GVAR(performanceMapMarker) = [];

[
  QGVAR(updatePerformanceMapMarker),
  {
    params ["_owner", "_fps", "_units", "_time"];
    private _currentPerformance = GVAR(currentPerformance);
    private _id = _currentPerformance findif {_x select 0 == _owner};
    if(_id == -1) then { //if this owner id doesn't exist in storage
      _currentPerformance pushBack [_owner, _fps, _units, _time];
    } else {
      _currentPerformance set [_id, [_owner, _fps, _units, _time]];
    };
    GVAR(currentPerformance) = _currentPerformance;
  }
] call CBA_fnc_addEventHandler;

//quick function to set the data to the map marker
private _fnc_applyMarkerText = {
  params ["_marker", "_performance"];
  if(_performance select 0 == 2) then {
    _marker setMarkerText format [
      "Server: %1 FPS, %2 units, last update %3 seconds ago",
      _performance select 1,
      _performance select 2,
      (CBA_missionTime - (_performance select 3))
    ];
  } else {
    _marker setMarkerText format [
      "HC%1: %2 FPS, %3 units, last update %4 seconds ago",
      _performance select 0,
      _performance select 1,
      _performance select 2,
      (CBA_missionTime - (_performance select 3))
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
        private _id = _mapMarker findif {
          private _markerName = format["performanceMarker_%1", _x select 0];
          _x == QGVAR(_markerName);
        };
        if(_id == -1) then {
          private _markerName = format["performanceMarker_%1", _x select 0];
          private _marker = createMarker
                            [
                              QGVAR(_markerName),
                              [worldSize + 350, worldSize - 900 - (100 * _forEachIndex), 0]
                            ];
          _marker setMarkerType "mil_triangle";
          _marker setMarkerDir 90;
          [_marker, _performance] call _fnc_applyMarkerText;
        } else {
          [_mapMarker select _id, _performance] call _fnc_applyMarkerText;
        };
    } forEach _currentPerformance;
  },
  20,
  _fnc_applyMarkerText
] call CBA_fnc_addPerFrameHandler;
