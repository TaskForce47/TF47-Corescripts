#include "script_component.hpp";

if(! GVAR(useSafezone)) exitWith {};

[
  QGVAR(playerEnteredBase),
  {
    player allowDamage false;
    playSound "Alarm";
    hint "You entered the base you are now invulnerable!";
  }
] call CBA_fnc_addEventHandler;

[
  QGVAR(playerLeftBase),
  {
    player allowDamage true;
    playSound "Alarm";
    hint "You left the base you are now vulnerable!";
  }
] call CBA_fnc_addEventHandler;

if(! GVAR(useBaseShootingProtection)) exitWith {};

[
  QGVAR(playerEnteredBase),
  {
    private _id = player addEventHandler ["Fired", {
      deleteVehicle (_this select 6);
      hint "Shooting inside the base is not allowed!";
    }];
    player setVariable [QGVAR(baseFiredId), _id];
  }
] call CBA_fnc_addEventHandler;

[
  QGVAR(playerLeftBase),
  {
    player removeEventHandler ["Fired", player getVariable [QGVAR(baseFiredId), -1]];
    player setVariable [QGVAR(baseFiredId), -1];
  }
] call CBA_fnc_addEventHandler;
