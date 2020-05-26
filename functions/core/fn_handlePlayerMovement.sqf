#include "script_component.hpp"

GVAR(inObjective) = false;
GVAR(inBase) = false;

[
  {
    private _inObjective = [player] call FUNC(isInObjective);
    private _inBase = [player] call FUNC(isInBase);
    if(_inObjective && {! GVAR(inObjective)}) then {
      [QGVAR(playerEnteredObjective), []] call CBA_fnc_localEvent;
      GVAR(inObjective) = true;
    };
    if(! _inObjective && {GVAR(inObjective)}) then {
      [QGVAR(playerLeftObjective), []] call CBA_fnc_localEvent;
      GVAR(inObjective) = false;
    };
    if(_inBase && {! GVAR(inBase)}) then {
      [QGVAR(playerEnteredBase), []] call CBA_fnc_localEvent;
      GVAR(inBase) = true;
    };
    if(!_inBase && {GVAR(inBase)}) then {
      [QGVAR(playerLeftBase), []] call CBA_fnc_localEvent;
      GVAR(inBase) = false;
    };
  },
  15
] call CBA_fnc_addPerFrameHandler;
