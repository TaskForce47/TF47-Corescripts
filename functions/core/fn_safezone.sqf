#include "script_component.hpp"

if(! GVAR(useSafezone)) exitWith {};

[
  QGVAR(playerEnteredBase),
  {
    player allowDamage false;
    playSound "Alarm";
    playSound "Alarm";
    [
      format ["You have entered FOB %1", mapGridPosition player],
      format ["Time: %1%2", date select 3, date select 4],
      "You are now invulnerable!"
    ] call BIS_fnc_infoText;
  }
] call CBA_fnc_addEventHandler;

[
  QGVAR(playerLeftBase),
  {
    player allowDamage true;
    playSound "Alarm";
    [
      format ["You have left FOB %1", mapGridPosition player],
      format ["Time: %1%2", date select 3, date select 4],
      "You are now vulnerable!"
    ] call BIS_fnc_infoText;
  }
] call CBA_fnc_addEventHandler;

if(! GVAR(useBaseShootingProtection)) exitWith {};

[
  QGVAR(playerEnteredBase),
  {
    private _id = player addEventHandler ["Fired", {
      deleteVehicle (_this select 6);
      private _message = format ["<t color='#ff4c33'>Shooting inside the base is not allowed!</t>"];
			cutText [_message, "PLAIN DOWN", -1, true, true];
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
