#include "script_component.hpp"
#define DELAY 20

iF(! GVAR(addWorldBorder)) exitWith {};

player setVariable [QGVAR(outOfBorder), false];


[
	{
		if(vehicle player isKindOf "Air" || 
			{player getVariable [QGVAR(outOfBorder), false]} || 
			{player call EFUNC(util,isInWorldBorder)}) exitWith {};

		player setVariable [QGVAR(outOfBorder), true];
		player setVariable [QGVAR(outOfBorderHack), CBA_missionTime];
		[] spawn {
			while {! (player call EFUNC(util,isInWorldBorder)) && alive player} do {
				private _hackTime = player getVariable [QGVAR(outOfBorderHack), CBA_missionTime];
				private _timeLeft = (_hackTime + GVAR(worldBorderTimeout)) - CBA_missionTime;
				if(_timeLeft < 0) then {
					hint "You have been outside of the battlefield for too long!";
					if(worldBorderDestroyVehicle) then {
						vehicle player setDamage 1;
					};
					player setVariable [QGVAR(outOfBorder), false];
				} else {
					private _message = format ["Return to battlefield or you will be punished!<br/><t color='#ff4c33'>Time left: %1 seconds </t>", round _timeLeft];
					cutText [_message, "PLAIN DOWN", -1, true, true];
					if((_timeLeft % 2) == 0) then {
						playSound "Alarm";
					};
				};
				sleep 1;
			};
			player setVariable [QGVAR(outOfBorder), true];
		};
	},
	DELAY
] call CBA_fnc_addPerFrameHandler;
