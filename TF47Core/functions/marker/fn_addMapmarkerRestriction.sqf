#include "script_component.hpp"
/*
* Author: TF47 Dragon
*
* Adds an cba marker eventhandler and checks if a player dares to 
* add a command, side or global marker. If so, the marker will be moved
* to group chat and the player will get a hint.
*
* Arguments:
* 	none
*
* Return Value:
*   none
*
*  Public: No
*/

["created", {
	params["_newMarker"];

	if(!local _newMarker) exitWith {};
	_name = format ["%1", _newMarker];
	_name = _name splitString "/";
	_channel = _name select (count _name -1);
	if(_channel == "0" || { _channel == "1" } || { _channel == "2" }) exitWith {};

	if(EGVAR(core,markerRestrictionWhitelist) && { 
		([[WHITELIST_USER_TF, WHITELIST_USER_ADMIN, WHITELIST_USER_MODERATOR]] call EFUNC(whitelist,checkWhitelist))
	}) exitWith {};
	
	_type = getMarkerType _newMarker;
	_pos = getMarkerPos _newMarker;
	_color = getMarkerColor _newMarker;
	_text = markerText _newMarker;
	_dir = markerDir _newMarker;
	_name set [(count _name) -1, "3"];
	_name = _name joinString "/";
	deleteMarker _newMarker;
	_marker = createMarker [_name, _pos];
	_marker setMarkerPos _pos;
	_marker setMarkerType _type;
	_marker setMarkerColor _color;
	_marker setMarkerText _text;
	_marker setMarkerDir _dir;
	hint "Your marker has been moved to the group channel!";
}] call CBA_fnc_addMarkerEventHandler;