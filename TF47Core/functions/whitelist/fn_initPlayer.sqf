#include "script_component.hpp"

if(! EGVAR(core,useWhitelist)) exitWith {};

LOG("STARTING PLAYER WHITELIST INIT!")

call FUNC(addWhitelistEventhandler);

//[QGVAR(refreshWhitelist), EGVAR(core,playerId)] call CBA_fnc_serverEvent;

["vehicle", {
  params ["_unit", "_newVehicle"];
	[QGVAR(doVehicleWhitelistCheck), _newVehicle] call CBA_fnc_localEvent;
},true] call CBA_fnc_addPlayerEventHandler;

["turret", {
	params ["_unit", ""];
	[QGVAR(doSlotWhitelistCheck), vehicle _unit] call CBA_fnc_localEvent;
},true] call CBA_fnc_addPlayerEventHandler;

[{
  [QGVAR(reloadWhitelist), EGVAR(core,playerId)] call CBA_fnc_serverEvent;
},60*10] call CBA_fnc_addPerFrameHandler;

[QGVAR(doSlotWhitelistCheck), EGVAR(core,playerId)] call CBA_fnc_localEvent;

LOG("WHITELISTED PLAYER INIT COMPLETED!");
