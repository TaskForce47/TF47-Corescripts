#include "script_component.hpp"

//_this select 0 references the dead unit
player addEventHandler ["Killed", {[_this select 0] remoteExec [QFUNC(handlePlayerKilled),2]}];
player addEventHandler ["GetInMan", {_this call FUNC(onVehicleEnterLocal);}];

private _slotName = str player;
private _id = GVAR(slotCost) findIf {(_x select 0) isEqualTo _slotName};
if(_id == -1) then {
	[
		[format ["This rifleman slot costs %1 tickets", GVAR(defaultSlotCost)], 5, 10, 10]
	] spawn BIS_fnc_EXP_camp_SITREP;
} else {
	[
		[format ["This %1 slot costs %2 tickets", toLower (GVAR(slotCost) select _id select 2), GVAR(slotCost) select _id select 1], 5, 10, 10]
	] spawn BIS_fnc_EXP_camp_SITREP;
};

call FUNC(addTicketDisplay);

[
	QGVAR(ticketChange), {
		params ["_oldTickets", "_tickets", "_amount", "_message"];
		if(_amount == 0 && { GVAR(enableZeroTicketNotification) }) exitWith {};
		if(_amount == 0) then {
			["TF47_core_notification_ticketLoss",_message] call EFUNC(util,sendNotification);
		} else {
			["TF47_core_notification_ticketGain", _message] call EFUNC(util,sendNotification);
		};
 	}
] call CBA_fnc_addEventhandler;
