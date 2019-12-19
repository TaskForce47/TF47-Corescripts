#include "script_component.hpp"
["ticketChange", {
	params ["_message", "", "_ticketChange"];
	if(_ticketChange > -1) then {
		["TF47_core_notification_ticketGain", [_message]] call BIS_fnc_showNotification;
	} else {
		["TF47_core_notification_ticketLoss", [_message]] call BIS_fnc_showNotification;
	};
}] call CBA_fnc_addEventHandler;

if(EGVAR(core,loseOnZeroTickets)) then {
	["outOfTickets", {
		params ["", "_message"];
		0 spawn {
			sleep 10;
			["TF47_core_notification_outOfTickets", ["This mission will end in 25sec"]] call BIS_fnc_showNotification;
		};
	}] call CBA_fnc_addEventHandler;
};