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

["TOC1", 10],	["TOC2", 10],	["TOC3", 10],	["TOC4", 10],

["R11",  5],	["R12",  5],
["R21",  5],	["R22",  5],

["MED1", 6],	["MED8", 6],	["MED7", 6],	["MED6", 6],
["MED5", 6],	["MED4", 6],	["MED3", 6],	["MED2", 6],

["ENG1", 6],	["ENG2", 6],	["ENG3", 6],	["ENG4", 6],
["ENG5", 6],	["ENG7", 6],	["ENG8", 6],	["ENG6", 6],

["THP1", 10],	["THP2", 10],	
["THC1", 10],	["THC2", 10],	["THC3", 10],	["THC4", 10],

["CSAR1", 10],	["CSAR2", 10],	["CSAR3", 10],	["CSAR4", 10],
["CSAR5", 13],	["CSAR6", 13],

["AH11", 15],	["AH12", 15],
["AH21", 15],	["AH22", 15],

["JP1",  15],	["JP2",  15],	["JP3",  15],

["T11",  8],	["T12",  8],	["T13",  8],
["T21",  8],	["T22",  8],	["T23",  8],
["T31",  8],	["T32",  8],	["T33",  8]

];

_infantryTickets = [_infantryTicketsData, _infantryTicketsDefault] call CBA_fnc_hashCreate;


// Init Slots
{
	_x call TF47_ticket_fnc_registerSlot;
} forEach _infantryTickets;


