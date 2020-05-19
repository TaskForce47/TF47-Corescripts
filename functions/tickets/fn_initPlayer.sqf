#include "script_component.hpp"
if(! EGVAR(core,useTicketsystem)) exitWith {};
LOG("STARTING TICKET CLIENT INIT!");

//handle the player death
[
  player,
  "Killed",
  {
    params ["_unit"];
    [_unit] remoteExec [QFUNC(handlePlayerKilled),2]
  }
] call CBA_fnc_addBISEventhandler;


LOG("TICKET CLIENT INIT COMPLETED!");
