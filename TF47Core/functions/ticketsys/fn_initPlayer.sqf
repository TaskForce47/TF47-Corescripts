#include "script_component.hpp"
if(! GVAR(useTicketsystem)) exitWith {};
call FUNC(clientTicketChangeReceived);
call FUNC(addTicketDisplayLoop);