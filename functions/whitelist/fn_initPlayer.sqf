#include "script_component.hpp"

if(! EGVAR(core,useWhitelist)) exitWith {};

LOG("STARTING PLAYER WHITELIST INIT!");
[{
  [QGVAR(reloadWhitelist), EGVAR(core,playerId)] call CBA_fnc_serverEvent;
},60*10] call CBA_fnc_addPerFrameHandler;

//[QGVAR(refreshWhitelist), EGVAR(core,playerId)] call CBA_fnc_serverEvent;
//TODO: wait until TF47_whitelist_whitelist is defined!
[{
  private _namespace = EGVAR(core,playerNamespace);
  (_namespace getVariable [QGVAR(whitelist), 0]) isEqualType []
},
{
  /*
  ["vehicle", {
    params ["_unit", "_newVehicle"];

  	[QGVAR(doVehicleWhitelistCheck), _newVehicle] call CBA_fnc_localEvent;
  },true] call CBA_fnc_addPlayerEventHandler;*/
  player addEventHandler ["GetInMan", {
  	params ["", "", "_vehicle"];
    [QGVAR(doVehicleWhitelistCheck), _vehicle] call CBA_fnc_localEvent;
  }];
  player addEventHandler ["SeatSwitchedMan", {
    params ["", "", "_vehicle"];
	  [QGVAR(doVehicleWhitelistCheck), _vehicle] call CBA_fnc_localEvent;
  }];
  /*
  ["turret", {
  	params ["_unit", ""];
  	[QGVAR(doVehicleWhitelistCheck), vehicle _unit] call CBA_fnc_localEvent;
  },true] call CBA_fnc_addPlayerEventHandler;*/

  [QGVAR(doSlotWhitelistCheck),nil] call CBA_fnc_localEvent;
}] call CBA_fnc_waitUntilAndExecute;

LOG("WHITELISTED PLAYER INIT COMPLETED!");
