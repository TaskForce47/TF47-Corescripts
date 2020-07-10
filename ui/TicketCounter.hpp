#define TICKETCOUNTERWIDTH (safeZoneW / 30)
#define TICKETCOUNTERHEIGHT (safezoneH / 30) 
#define TICKETCOUNTERYPOS (safezoneY + safezoneH * (1/10))
class RscTitles{
	class TF47_HUD_tickets{
		idd = 1555;
		movingEnable =  0;
        enableSimulation = 1;
        enableDisplay = 1;
        duration     =  99999;
        fadein       =  0.1;
        fadeout      =  2;
		name = "TF47_HUD_tickets";
		onLoad = "with uiNameSpace do { TF47_HUD_tickets = _this select 0 }";
		class ticketBaseText: RscText {
			idc = -1;
			x = safeZoneX + safeZoneW - TICKETCOUNTERWIDTH;
			y = TICKETCOUNTERYPOS;
			w = TICKETCOUNTERWIDTH;
			h = TICKETCOUNTERHEIGHT;
			colorBackground[] = {0,0,0,0.0};
			colorText[] = {0.8,0.8,0.8,0.8};
		};
		class controls{
			class ticketBackground: ticketBaseText{
				colorBackground[] = {0.1,0.1,0.1,0.2};
			};
			class ticketTitle: ticketBaseText{
				text = "TICKETS:";
				h = TICKETCOUNTERHEIGHT / 2;
			};
			class ticketCount: ticketBaseText{
				idc = 1556;
				text = "000";
				y = TICKETCOUNTERYPOS + (TICKETCOUNTERHEIGHT / 2);
				h = TICKETCOUNTERHEIGHT / 2;
			};
		};
	};
};