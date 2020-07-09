#include "script_component.hpp"
["cba_events_chatMessageSent", {
	params ["_message"];
  	if (_message select [0,1] == "#" ||count _message < 1) exitWith {};

	private _channel = "unknown";
	switch (currentChannel) do {
		case 0: { _channel = "Global" };
		case 1: { _channel = "Side" };
		case 2: { _channel = "Command" };
		case 3: { _channel = "Group" };
		case 4: { _channel = "Vehicle" };
		case 5: { _channel = "Direct" };
		default  { _channel = "Custom Radio"};
	};
	private _playerId = EGVAR(core,playerId);
  [QEGVAR(database,insertChatLog), [_playerId,_channel,_message]] call CBA_fnc_serverEvent;
}] call CBA_fnc_addEventHandler;
