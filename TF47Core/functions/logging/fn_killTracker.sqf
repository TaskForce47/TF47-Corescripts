iF(hasInterface && !isDedicated) then {
	//players can track their own kills local and therefor we save cpu power
	[
		"CAManBase",
		"Killed", 
		{
			params ["_killed", "_killer", "_instigator"];
			private
			if (isNull _instigator) then {_instigator = UAVControl vehicle _killer select 0}; // UAV/UGV player operated road kill
			if (isNull _instigator) then {_instigator = _killer} // player driven vehicle road kill
			else {
				_instigator = getText(currentWeapon call CBA_fnc_getItemConfig >> "displayName");
				
			} 


		},
		true, 
		[],
		true
	] call CBA_fnc_addClassEventHandler;
};