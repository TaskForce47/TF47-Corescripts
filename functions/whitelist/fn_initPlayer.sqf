#include "script_component.hpp"

if(! GVAR(enableWhitelist)) then {};

LOG("STARTING WHITELIST PLAYER INIT");

//get user whitelist as soon the player id is available
[
	{! isNil {EGVAR(core,playerId)}},
	{
		[EGVAR(core,playerId)] remoteExec [QFUNC(refreshUserWhitelist), 2];
		[
			{! isNil {EGVAR(core,playerNamespace) getVariable QGVAR(whitelist)}},
			{
				player addEventHandler ["GetInMan",{
					params ["", "", "_vehicle"];
					_vehicle call FUNC(onVehicleEnter);
				}];
				player addEventHandler ["SeatSwitchedMan", {
    				params ["", "", "_vehicle"];
	  				_vehicle call FUNC(onVehicleEnter);
  				}];
				player call FUNC(checkSlotWhitelist);
				player call FUNC(initSlotTrait);
				LOG("WHITELIST EVENTHANDLER ADDED!");
			}
		] call CBA_fnc_waitUntilAndExecute;
	}
] call CBA_fnc_waitUntilAndExecute;

["whitelist-reload", {
	[EGVAR(core,playerId)] remoteExecCall [QFUNC(refreshUserWhitelist), 2];
	systemChat "whitelist updated!";
}] call CBA_fnc_registerChatCommand;


LOG("FINISHED WHITELIST PLAYER INIT");