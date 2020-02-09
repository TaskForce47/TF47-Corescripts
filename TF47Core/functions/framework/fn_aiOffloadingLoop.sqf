
[{
	_allGroups = allGroups select {({isPlayer _x } count _x) < 1 }; //all groups excluding groups with players in it
	
	{
		
	} forEach _allGroups;

}, 20] call CBA_fnc_addPerFrameHandler;