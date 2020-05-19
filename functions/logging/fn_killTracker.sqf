iF(hasInterface && !isDedicated) then {
	//players can track their own kills local and therefor we save cpu power
	[
		"CAManBase",
		"Killed",
		{
			params ["_killed", "_killer", "_instigator"];
		}
	] call CBA_fnc_addClassEventHandler;
};
