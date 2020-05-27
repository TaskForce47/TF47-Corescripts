switch (TF47_core_missionId) do {
	case 2: 
		{
			#include "lib_inf_tickets.sqf"
			#include "lib_slot_whitelist.sqf"
		}:
	case 3:
		{
			#include "domi_inf_tickets.sqf"
			#include "domi_slot_whitelist.sqf"
		}:
	default { LOG("No Mission set!") };
};
