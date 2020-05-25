#include "script_component.hpp"

if(! EGVAR(core,loseOnZeroTickets)) exitwith {};

[
  QGVAR(outOfTickets),
  {
    private _timeout = EGVAR(core,timeoutBeforeLose);
    [_timeout] spawn
    {
      params ["_timeout"];
      while {_timeout > 0} do
      {
        _timeout = _timeout - 1;
        LOG_1("Timeout before mission ends" _timeout);
        sleep 1;
        if(GVAR(tickets) > 0) exitWith {
          private _tickets = GVAR(tickets);
          LOG_2("Sudden deaths aborted, tickets are positive again", _tickets, _timeout);
        };
        if(_timeout == 0) then
        {
          LOG_1("Mission could not been saved, ending now!", _timeout);
          [QGVAR(endSession), []] call CBA_fnc_serverEvent;
          [
            {
              "EveryoneLost" call BIS_fnc_endMissionServer;
            },
            nil,
            5
          ] call CBA_fnc_waitAndExecute;
        };
      };
    };
  }
] call CBA_fnc_addEventHandlerArgs;
