#include "script_component.hpp"

[
  "unit", {
  params ["_newUnit", ""];

	private _id = missionNamespace getVariable [QGVAR(bleedOutHandler), -1];
	if(_id > -1) then { [_id] call CBA_fnc_removePerFrameHandler; };
	if(isNull _newUnit) exitWith {};

	private _handle = [{
  		private _unit = _this select 0;
  		//check if player is awake
  		if(! (_unit getVariable ["ACE_isUnconscious", false])) exitWith {};

  		private _bloodVolume = _unit getVariable ["ace_medical_bloodVolume", 6.0];

  		if([_unit] call ace_medical_blood_fnc_isBleeding && {_bloodVolume < 3.5}) then {
  			_unit setVariable ["ace_medical_bloodVolume", 3.5];
  		};
  	},
    0,
    _newUnit
  ] call CBA_fnc_addPerFrameHandler;
	missionNamespace setVariable [QGVAR(bleedOutHandler), _handle];
},
true
] call CBA_fnc_addPlayerEventHandler;
