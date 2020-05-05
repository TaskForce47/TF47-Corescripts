#include "script_component.hpp"

if(! EGVAR(core,loseOnZeroTickets)) exitwith {};

[
  QGVAR(outOfTickets),
  {
    [QGVAR(finishSession), []] call CBA_fnc_serverEvent;
    "EveryoneLost" call BIS_fnc_endMissionServer;
  }
] call CBA_fnc_addEventHandlerArgs;
