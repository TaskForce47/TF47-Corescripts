#include "script_component.hpp"
if(! EGVAR(core,useTicketsystem)) exitWith {};
call FUNC(clientTicketChangeReceived);
call FUNC(addTicketDisplayLoop);