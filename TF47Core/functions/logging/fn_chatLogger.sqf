#include "script_component.hpp"
["cba_events_chatMessageSent", {
    // ignore chat commands
    params ["_message"];
	LOG_1("Chat message", _message);
    if (_message select [0,1] == "#") exitWith {};

	_channel = "unkown";
	switch (currentChannel) do {
		case 0: { _channel = "Global" };
		case 1: { _channel = "Side" };
		case 2: { _channel = "Command" };
		case 3: { _channel = "Group" };
		case 4: { _channel = "Vehicle" };
		case 5: { _channel = "Direct" };
		default  { _channel = "Custom Radio"};
	};
	_namespace = EGVAR(core,playerNamespace);
	_playerId = _namespace getVariable [QEGVAR(core,playerId), 0];
    [
		_playerId,
		_channel,
		_message
	] remoteExec ["TF47_database_fnc_insertChatData", 2];
}] call CBA_fnc_addEventHandler;
