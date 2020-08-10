/*
    TF47_unflipping_fnc_initAction

    File: fn_initAction.sqf
    Date: 2019-03-18
    Last Update: 2020-04-20
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:

    Parameter(s):

    Returns:
*/

// Add ACE3 or Vanilla actions to vehicles
if (TF47_unflipping_enable) then {
	if (isClass(configFile >> "CfgPatches" >> "ace_main")) then {

		private _unflipAction = ["TF47_unflipping_unflip", localize "STR_TF47_unflipping_act", "\a3\3den\data\attributes\loiterdirection\cw_ca.paa",
			{
				_target call TF47_unflipping_fnc_unflipAction;
			},
			{
				[_player, _target, []] call ACE_common_fnc_canInteractWith
				&& {!(_target isKindOf "Boxloader_Pallet_base")}
				&& {[_player, _target] call TF47_unflipping_fnc_canUnflipLocal}
			}
		] call ACE_interact_menu_fnc_createAction;
		["LandVehicle", 0, ["ACE_MainActions"], _unflipAction, true] call ACE_interact_menu_fnc_addActionToClass;

	} else {
		[
			"LandVehicle",
			"Init",
			{(_this#0) call TF47_unflipping_fnc_addUnflipActionLocal},
			true,
			["Boxloader_Pallet_base"],
			true
		] call CBA_fnc_addClassEventHandler;
	};
};