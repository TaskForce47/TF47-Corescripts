#include "script_component.hpp"
//if (hasInterface) then
//{
//	exitWith {};
//}

// Infantry: 						4 Tickets
// Infantry Medics/Engis: 			6 Tickets
// Sniper/Spotter: 					5 Tickets
// Tank Crew: 						8 Tickets
// Rotary Transport Pilot/AC: 		10 Tickets
// Rotary Transport Crew: 			10 Tickets
// Rotary Transport Air Medic: 		13 Tickets
// Rotary Attack Pilot/AC/Gunner: 	15 Tickets
// Fixed Attack Pilot:				15 Tickets
// Mission Control Slots:			10 Tickets
// Admin Slot:						0 Tickets

private _infantryTicketsData = [

	[TOC01, 10, "TOC Officer"],		[TOC02, 10, "TOC Officer"],

	[MED01, 6, "Medic"],		[MED02, 6, "Medic"],		[MED03, 6, "Medic"],		[MED04, 6, "Medic"],
	[MED05, 6, "Medic"],		[MED06, 6, "Medic"],		[MED07, 6, "Medic"],		[MED08, 6, "Medic"],
	[MED09, 6, "Medic"],		[MED10, 6, "Medic"],

	[ENG01, 6, "Engineer"],		[ENG02, 6, "Engineer"],		[ENG03, 6, "Engineer"],		[ENG04, 6, "Engineer"],
	[ENG05, 6, "Engineer"],		[ENG06, 6, "Engineer"],		[ENG07, 6, "Engineer"],		[ENG08, 6, "Engineer"],

	[HP01, 10, "Helicopter Pilot"],	[HP02, 10, "Helicopter Pilot"],	[HP03, 10, "Helicopter Pilot"],	[HP04, 10, "Helicopter Pilot"],
	[CC01, 8, "Crew Chief"],				[CC02, 8, "Crew Chief"],				[CC03, 8, "Crew Chief"],				[CC04, 8, "Crew Chief"],

	[AH11, 15, "Attack Helicopter Pilot"],		[AH12, 15, "Attack Helicopter Gunner"],
	[AH21, 15, "Attack Helicopter Pilot"],		[AH22, 15, "Attack Helicopter Gunner"],

	[JP1, 15, "Jet Pilot"],		[JP2,  15, "Jet Pilot"],	[JP3,  15, "Jet Pilot"],

	[T11, 8, "Tank Crew"],		[T12,  8, "Tank Crew"],		[T13,  8, "Tank Crew"],		[T14,  8, "Tank Crew"],
	[T21, 8, "Tank Crew"],		[T22,  8, "Tank Crew"],		[T23,  8, "Tank Crew"], 	[T24,  8, "Tank Crew"]

];

private _variableCheck = false;
{
    if(isNil (x select 0)) exitWith {_variableCheck = true;};
} forEach _infantryTicketsData;
if(_variableCheck) exitWith { LOG("Cannot add tickets to Infantry. One or more slots does not exist") };

// Init Slots
{
	_x call EFUNC(ticket,registerSlot);
} forEach _infantryTicketsData;
