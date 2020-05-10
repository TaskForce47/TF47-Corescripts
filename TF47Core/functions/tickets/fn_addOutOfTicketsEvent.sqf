#include "script_component.hpp"

if(! EGVAR(core,loseOnZeroTickets)) exitwith {};

[
  QGVAR(outOfTickets),
  {
    [QGVAR(endSession), []] call CBA_fnc_serverEvent;
    [
      {
        "EveryoneLost" call BIS_fnc_endMissionServer;
      },
      nil,
      30
    ] call CBA_fnc_waitAndExecute;
  }
] call CBA_fnc_addEventHandlerArgs;
