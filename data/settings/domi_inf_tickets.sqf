#include "..\script_component.hpp"
//if (hasInterface) then
//{
//	exitWith {};
//}

// Infantry: 						5 Tickets
// Infantry Medics/Engis: 			7 Tickets
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

	[TOC01, 10, "TOC Officer"],			[TOC02, 10, "TOC Officer"],		[TOC03, 10, "TOC RTO"],			[TOC04, 10, "TOC RTO"],
		
	[R11, 7, "Spotter"],				[R12, 7, "Sniper"],				
	[R21, 7, "Spotter"],				[R22, 7, "Sniper"],
			
	[MED01, 7, "Medic"],				[MED02, 7, "Medic"],			[MED03, 7, "Medic"],			[MED04, 7, "Medic"],
	[MED05, 7, "Medic"],				[MED06, 7, "Medic"],			[MED07, 7, "Medic"],			[MED08, 7, "Medic"],
				
	[ENG01, 7, "Engineer"],				[ENG02, 7, "Engineer"],			[ENG03, 7, "Engineer"],			[ENG04, 7, "Engineer"],
	[ENG05, 7, "Engineer"],				[ENG07, 7, "Engineer"],			[ENG07, 7, "Engineer"],			[ENG08, 7, "Engineer"],

	[THP01, 10, "Helicopter Pilot"],	[THP02, 10, "Helicopter Pilot"],
	
	[THC01, 10, "Helicopter Pilot"],	[THC02, 10, "Helicopter Pilot"],
	[THC03, 7, "Helicopter Crew"],		[THC04, 7, "Helicopter Crew"],
	
	[CSAR01, 10, "Helicopter Pilot"],	[CSAR02, 10, "Helicopter Pilot"],
	[CSAR03, 7, "Helicopter Crew"],		[CSAR04, 7, "Helicopter Crew"],
	[CSAR05, 7, "Pararescue Jumper"],	[CSAR06, 7, "Pararescue Jumper"],

	[AH11, 15, "Attack Helicopter Pilot"],								[AH12, 15, "Attack Helicopter Gunner"],
	[AH21, 15, "Attack Helicopter Pilot"],								[AH22, 15, "Attack Helicopter Gunner"],

	[JP01, 15, "Jet Pilot"],			[JP02,  15, "Jet Pilot"],		[JP03,  15, "Jet Pilot"],

	[T11, 7, "Tank Crew"],				[T12,  7, "Tank Crew"],			[T13,  7, "Tank Crew"],			[T14,  7, "Tank Crew"],
	[T21, 7, "Tank Crew"],				[T22,  7, "Tank Crew"],			[T23,  7, "Tank Crew"], 		[T24,  7, "Tank Crew"]

];

private _variableCheck = false;
{
    if(isNil {x select 0}) exitWith {_variableCheck = true;};
} forEach _infantryTicketsData;
if(_variableCheck) exitWith { LOG("Cannot add tickets to Infantry. One or more slots does not exist") };

// Init Slots
{
	_x call EFUNC(ticket,registerSlot);
} forEach _infantryTicketsData;
