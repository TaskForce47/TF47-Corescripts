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

_infantryTicketsDefault = 4;
_infantryTicketsData = [

["TOC01", 10],	["TOC02", 10],

["MED01", 6],	["MED02", 6],	["MED03", 6],	["MED04", 6],
["MED05", 6],	["MED06", 6],	["MED07", 6],	["MED08", 6],
["MED09", 6],	["MED10", 6],

["ENG01", 6],	["ENG02", 6],	["ENG03", 6],	["ENG04", 6],
["ENG05", 6],	["ENG06", 6],	["ENG07", 6],	["ENG08", 6],

["HP01", 10],	["HP02", 10],	["HP03", 10],	["HP04", 10],
["CC01", 10],	["CC02", 10],	["CC03", 10],	["CC04", 10],

["AH11", 15],	["AH12", 15],
["AH21", 15],	["AH22", 15],

["JP1",  15],	["JP2",  15],	["JP3",  15],

["T11",  8],	["T12",  8],	["T13",  8], ["T14",  8],
["T21",  8],	["T22",  8],	["T23",  8], ["T24",  8]

];

_infantryTickets = [_infantryTicketsData, _infantryTicketsDefault] call CBA_fnc_hashCreate;


// Init Slots
{
	_x call TF47_ticket_fnc_registerSlot;
} forEach _infantryTickets;


