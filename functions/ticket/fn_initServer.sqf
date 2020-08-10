#include "script_component.hpp"

if(! GVAR(enableTicketsystem)) exitWith {};

GVAR(slotCost) = [];
GVAR(suddenDeath) = false;
GVAR(registeredVehicles) = [];

call FUNC(getTicketLastSession);
call FUNC(addVehicleRegistering);

//add trigger to tickets triggering on reaching 0 tickets
QGVAR(tickets) addPublicVariableEventHandler {
	params ["_varName", "_value", "_target"];

	if(_value > 0) exitWith {};

	[QGVAR(outOfTickets), nil] call CBA_fnc_globalEvent;

	if(!GVAR(enableLose)) exitWith {};

	if(GVAR(allowComback) && !GVAR(suddenDeath)) then {
		GVAR(suddenDeath) = true;
		[
			[format ["We have run out of tickets, you have %1 seconds before the mission is lost!", GVAR(timeoutBeforeLose)], 2, 0, 6]
		] remoteExec ["BIS_fnc_EXP_camp_SITREP", 0];
		[
			{GVAR(tickets) > 0},
			{
				GVAR(suddenDeath) = false;
				[
					["Success! We got a few tickets back and are back in business!", 2, 0, 6]
				] remoteExec ["BIS_fnc_EXP_camp_SITREP", 0];
			},
			nil,
			GVAR(timeoutBeforeLose),
			{call FUNC(triggerLose)}
		] call CBA_fnc_waitUntilAndExecute;
	};
	if(! GVAR(allowComback)) then {
		call FUNC(triggerLose);
	};
};

addMissionEventHandler ["HandleDisconnect", {
	params ["_unit"];

  	_unit call FUNC(onPlayerDisconnect);
}];
