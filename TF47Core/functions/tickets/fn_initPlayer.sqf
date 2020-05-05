#include "script_component.hpp"
if(! EGVAR(core,useTicketsystem)) exitWith {};
LOG("STARTING TICKET CLIENT INIT!");

call FUNC(clientTicketChangeReceived);
call FUNC(addTicketDisplayLoop);

LOG("TICKET CLIENT INIT COMPLETED!");
