#include "script_component.hpp"
/* This event alows mission makers to mark a current round as ended so
 * that upon next mission load the ticket count will be reseted.
 */
[
  QGVAR(endSession),
  {
    [QEGVAR(database,finishSession), nil] call CBA_fnc_serverEvent;
  }
] call CBA_fnc_addEventHandlerArgs;
