#include "..\script_component.hpp"
/* This config defines the ticket cost for all vehicles
 * ["class name", vehicle value]
 *
*/
GVAR(vehicleTicketcost) = [

/* Tier-system for vehicle.
unarmed / flatbed
armed / unarmed + add. armor
crows / armed + add. armor / fuel, repair, ammo
Medic / crows + add. armor
*/
 

//Light utility vehicle
	//1 Ticket
	["B_Quadbike_01_F",0],
	["CUP_B_M1030_USMC",0],
	//3 Tickets
    ["CUP_B_LR_Transport_CZ_D",3],							//Land Rover 110 (covered) - Desert
    ["CUP_B_LR_Transport_CZ_W",3],							//Land Rover 110 (covered) - Wood
    ["CUP_B_T810_Unarmed_CZ_DES",3],						//Tatra T810 (covered) - Desert
    ["CUP_B_T810_Unarmed_CZ_WDL",3],						//Tatra T810 (covered) - Wood
    ["rhsusf_m998_d_2dr",3],								//M1097A2 (2D / open) - Desert
    ["rhsusf_m998_w_2dr",3],								//M1097A2 (2D / open) - Wood
    ["rhsusf_m998_d_2dr_halftop",3],						//M1097A2 (2D / open back) - Desert
    ["rhsusf_m998_w_2dr_halftop",3],						//M1097A2 (2D / open back) - Wood
    ["rhsusf_m998_d_2dr_fulltop",3],						//M1097A2 (2D / covered) - Desert
    ["rhsusf_m998_w_2dr_fulltop",3],						//M1097A2 (2D / covered) - Wood
    ["rhsusf_m998_d_4dr",3],								//M1097A2 (4D / open) - Desert
    ["rhsusf_m998_w_4dr",3],								//M1097A2 (4D / open) - Wood
    ["rhsusf_m998_d_4dr_halftop",3],						//M1097A2 (4D / open back) - Desert
    ["rhsusf_m998_w_4dr_halftop",3],						//M1097A2 (4D / open back) - Wood
    ["rhsusf_m998_d_4dr_fulltop",3],						//M1097A2 (4D / closed) - Desert
    ["rhsusf_m998_w_4dr_fulltop",3],						//M1097A2 (4D / closed) - Wood
    ["rhsusf_mrzr4_d",3],									//MRZR 4 (open) - Desert
	["CUP_B_M1151_USA",3],									//M1151 (closed) - Desert
	["CUP_B_M1151_WDL_USA",3],								//M1151 (closed) - Wood
	["CUP_B_M1152_USA",3],									//M1152 ECV (open back) - Desert
	["CUP_B_M1152_WDL_USA",3],								//M1152 ECV (open back) - Wood
    ["UK3CB_BAF_LandRover_Hard_Sand_A",3],					//Land Rover Hardtop (closed) - Desert
    ["UK3CB_BAF_LandRover_Hard_Green_A",3],					//Land Rover Hardtop (closed) - Wood
    ["UK3CB_BAF_LandRover_Hard_Green_B",3],					//Land Rover Hardtop (closed) - Wood
	["UK3CB_BAF_LandRover_Snatch_Sand_A",3],				//Land Rover Snatch (closed) - Desert
    ["UK3CB_BAF_LandRover_Snatch_Green_A",3],				//Land Rover Snatch (closed) - Wood
    ["UK3CB_BAF_LandRover_Soft_Sand_A",3],					//Land Rover SoftTop (covered) - Desert
    ["UK3CB_BAF_LandRover_Soft_Green_A",3],					//Land Rover SoftTop (covered) - Wood
    ["UK3CB_BAF_LandRover_Soft_Green_B",3],					//Land Rover SoftTop (covered) - Wood
    ["rhsusf_m1025_d",3],									//M1025A2 (closed) - Desert
    ["rhsusf_m1025_w",3],									//M1025A2 (closed) - Wood
	
	//5 Tickets
	["UK3CB_BAF_LandRover_Hard_MERT_A",5],					//Land Rover Hardtop (Medic / closed) - Wood
    ["UK3CB_BAF_LandRover_Soft_MERT_A",5],					//Land Rover SoftTop (Medic / covered) - Wood
	["CUP_B_HMMWV_Ambulance_USA",5],						//HMMWV Ambulance (Medic / closed) - Desert
    ["UK3CB_BAF_LandRover_Amb_FFR_Sand_A",5],				//Land Rover Ambulance FFR (Medic / closed) - Desert
    ["UK3CB_BAF_LandRover_Amb_FFR_Green_A",5],				//Land Rover Ambulance FFR (Medic / closed) - Wood
	
	
//Light armored car
	//5 Tickets
    ["rhsusf_m966_d",5],									//M966A1 (TOW / closed) - Desert
    ["rhsusf_m966_w",5],									//M966A1 (TOW / closed) - Wood
    ["CUP_B_HMMWV_AGS_GPK_ACR",5],							//HMMWV M1114 (AGS / closed) - Desert
    ["CUP_B_HMMWV_DSHKM_GPK_ACR",5],						//HMMWV M1114 (DSHKM / closed) - Desert
    ["CUP_B_HMMWV_M2_GPK_USA",5],							//HMMWV M1151 (M2 / closed) - Desert
    ["CUP_B_HMMWV_MK19_USA",5],								//HMMWV (MK19 / closed) - Desert
    ["CUP_B_M1151_Mk19_DSRT_USMC",5],						//HMMWV MK19 Desert
    ["CUP_B_HMMWV_SOV_M2_USA",5],							//HMMWV SOV (MMG, M2 / open) - Desert
    ["CUP_B_HMMWV_SOV_USA",5],								//HMMWV SOV (MMG, MK19 / open) - Desert
    ["CUP_B_LR_Special_Des_CZ_D",5],						//Land Rover 110 (MMG, AGS / open) - Desert
    ["CUP_B_LR_Special_Des_CZ_W",5],						//Land Rover 110 (MMG, AGS / open) - Wood
    ["CUP_B_M1151_Deploy_USA",5],							//M1151 (M2 / closed, Deployment) - Desert
    ["CUP_B_M1151_Deploy_WDL_USA",5],						//M1151 (M2 / closed, Deployment) - Wood
    ["CUP_B_M1151_M2_USA",5],								//M1151 (M2 / closed) - Desert
    ["CUP_B_M1151_M2_WDL_USA",5],							//M1151 (M2 / closed) - Wood
    ["CUP_B_M1151_MK19_USA",5],								//M1151 (MK19 / closed) - Desert
    ["CUP_B_M1151_MK19_USA",5],								//M1151 (MK19 / closed) - Wood
    ["CUP_B_M1165_GMV_USA",5],								//M1165 GMV (M134 / closed) - Desert
    ["CUP_B_M1165_GMV_WDL_USA",5],							//M1165 GMV (M134 / closed) - Wood
    ["CUP_B_M1167_USA",5],									//M1167 (TOW-2 / closed) - Desert
    ["CUP_B_M1167_WDL_USA",5],								//M1167 (TOW-2 / closed) - Wood
    ["UK3CB_BAF_LandRover_Panama_Sand_A",5],				//Land Rover Panama ROV (Drone / closed) - Desert
    ["UK3CB_BAF_LandRover_Panama_Green_A",5],				//Land Rover Panama ROV (Drone / closed) - Wood
    ["UK3CB_BAF_LandRover_WMIK_GMG_FFR_Sand_A",5],			//Land Rover WMIK GMG FFR (MMG, GMG / open) - Desert
    ["UK3CB_BAF_LandRover_WMIK_GMG_FFR_Green_A",5],			//Land Rover WMIK GMG FFR (MMG, GMG / open) - Wood
    ["UK3CB_BAF_LandRover_WMIK_GMG_FFR_Green_B",5],			//Land Rover WMIK GMG FFR (MMG, GMG / open) - Wood
    ["UK3CB_BAF_LandRover_WMIK_GPMG_FFR_Sand_A",5],			//Land Rover WMIK GPMG FFR (MMG, MMG / open) - Desert
    ["UK3CB_BAF_LandRover_WMIK_GPMG_FFR_Green_A",5],		//Land Rover WMIK GPMG FFR (MMG, MMG / open) - Wood
    ["UK3CB_BAF_LandRover_WMIK_GPMG_FFR_Green_B",5],		//Land Rover WMIK GPMG FFR (MMG, MMG / open) - Wood
    ["UK3CB_BAF_LandRover_WMIK_HMG_FFR_Sand_A",5],			//Land Rover WMIK HMG FFR (MMG, M2 / open) - Desert
    ["UK3CB_BAF_LandRover_WMIK_HMG_FFR_Green_A",5],			//Land Rover WMIK HMG FFR (MMG, M2 / open) - Wood
    ["UK3CB_BAF_LandRover_WMIK_HMG_FFR_Green_B",5],			//Land Rover WMIK HMG FFR (MMG, M2 / open) - Wood
    ["UK3CB_BAF_LandRover_WMIK_Milan_FFR_Sand_A",5],		//Land Rover WMIK Milan FFR (MMG, Milan / open) - Desert
    ["UK3CB_BAF_LandRover_WMIK_Milan_FFR_Green_A",5],		//Land Rover WMIK Milan FFR (MMG, Milan / open) - Wood
    ["UK3CB_BAF_LandRover_WMIK_Milan_FFR_Green_B",5],		//Land Rover WMIK Milan FFR (MMG, Milan / open) - Wood
    ["rhsusf_m1025_d_Mk19",5],								//M1025A2 (MK19 / closed) - Desert
    ["rhsusf_m1025_w_Mk19",5],								//M1025A2 (MK19 / closed) - Wood
    ["rhsusf_m1025_d_m2",5],								//M1025A2 (M2 / closed) - Desert
    ["rhsusf_m1025_w_m2",5],								//M1025A2 (M2 / closed) - Wood
    ["rhsusf_m1043_d_m2",5],								//M1043A2 (M2 / closed) - Desert
    ["rhsusf_m1043_w_m2",5],								//M1043A2 (M2 / closed) - Wood
    ["rhsusf_m1043_d_mk19",5],								//M1043A2 (Mk19 / closed) - Desert
    ["rhsusf_m1043_w_mk19",5],								//M1043A2 (Mk19 / closed) - Wood
    ["rhsusf_m1045_d",5],									//M1045A2 (TOW / closed) - Desert
    ["rhsusf_m1045_w",5],									//M1045A2 (TOW / closed) - Wood

	//7 Tickets
	["CUP_B_HMMWV_Crows_M2_USA",7],							//HMMWV (Crows M2 / closed) - Desert
    ["CUP_B_HMMWV_Crows_MK19_USA",7],						//HMMWV (Crows Mk19 / closed) - Desert
    ["UK3CB_BAF_Coyote_Passenger_L111A1_D",7],				//Coyote P HMG (MMG, M2 / open back, open top) - Desert
    ["UK3CB_BAF_Coyote_Passenger_L111A1_D2",7],				//Coyote P HMG (MMG, M2 / open back, open top) - Desert
    ["UK3CB_BAF_Coyote_Passenger_L111A1_G",7],				//Coyote P HMG (MMG, M2 / open back, open top) - Wood
    ["UK3CB_BAF_Coyote_Passenger_L111A1_W",7],				//Coyote P HMG (MMG, M2 / open back, open top) - Wood
    ["UK3CB_BAF_Coyote_Passenger_L134A1_D",7],				//Coyote P GMG (MMG, GMG / open back, open top) - Desert
    ["UK3CB_BAF_Coyote_Passenger_L134A1_D2",7],				//Coyote P GMG (MMG, GMG / open back, open top) - Desert
    ["UK3CB_BAF_Coyote_Passenger_L134A1_G",7],				//Coyote P GMG (MMG, GMG / open back, open top) - Wood
    ["UK3CB_BAF_Coyote_Passenger_L134A1_W",7],				//Coyote P GMG (MMG, GMG / open back, open top) - Wood
    ["UK3CB_BAF_Jackal2_L111A1_D",7],						//Jackal 2 HMG (MMG, M2 / open top) - Desert
    ["UK3CB_BAF_Jackal2_L111A1_D2",7],						//Jackal 2 HMG (MMG, M2 / open top) - Desert
    ["UK3CB_BAF_Jackal2_L111A1_G",7],						//Jackal 2 HMG (MMG, M2 / open top) - Wood
    ["UK3CB_BAF_Jackal2_L111A1_W",7],						//Jackal 2 HMG (MMG, M2 / open top) - Wood
    ["UK3CB_BAF_Jackal2_L134A1_D",7],						//Jackal 2 GMG (MMG, GMG / open top) - Desert
    ["UK3CB_BAF_Jackal2_L134A1_D2",7],						//Jackal 2 GMG (MMG, GMG / open top) - Desert
    ["UK3CB_BAF_Jackal2_L134A1_G",7],						//Jackal 2 GMG (MMG, GMG / open top) - Wood
    ["UK3CB_BAF_Jackal2_L134A1_W",7],						//Jackal 2 GMG (MMG, GMG / open top) - Wood
    ["UK3CB_BAF_Panther_GPMG_Sand_A",7],					//Panther CLV GPMG (Crows MMG / closed) - Desert
    ["UK3CB_BAF_Panther_GPMG_Green_A",7],					//Panther CLV GPMG (Crows MMG / closed) - Wood
    ["CUP_B_HMMWV_Avenger_USA",7],							//M1151 Avenger
	
	//15 Tickets
	["UK3CB_BAF_Coyote_Logistics_L111A1_D",15],				//Coyote .50cal Logistics
    ["UK3CB_BAF_Coyote_Logistics_L134A1_D",15],				//Coyote GMG Logistics
	
	
//MRAP
	//5 Tickets
	["rhsusf_m1240a1_usarmy_d",5],							//M1240 (closed) - Desert
    ["rhsusf_m1240a1_usarmy_wd",5],							//M1240 (closed) - Wood
    ["rhsusf_CGRCAT1A2_usmc_d",5],							//CGR CAT1A2 (closed) - Desert
    ["rhsusf_CGRCAT1A2_usmc_wd",5],							//CGR CAT1A2 (closed) - Wood
    ["rhsusf_M1220_usarmy_d",5],							//M1220 (closed) - Desert
    ["rhsusf_M1220_usarmy_wd",5],							//M1220 (closed) - Wood
	
	//7 Tickets
	["rhsusf_M1220_M2_usarmy_d",7],							//M1220 (M2 / closed) - Desert
    ["rhsusf_M1220_M2_usarmy_wd",7],						//M1220 (M2 / closed) - Wood
    ["rhsusf_M1220_MK19_usarmy_d",7],						//M1220 (MK19 / closed) - Desert
    ["rhsusf_M1220_MK19_usarmy_wd",7],						//M1220 (MK19 / closed) - Wood
	["rhsusf_m1240a1_m2_usarmy_d",7],						//M1240 (M2 / closed) - Desert
	["rhsusf_m1240a1_m2_usarmy_wd",7],						//M1240 (M2 / closed) - Desert
    ["rhsusf_m1240a1_mk19_usarmy_d",7],						//M1240 (MK19 / closed) - Desert
    ["rhsusf_m1240a1_mk19_usarmy_wd",7],					//M1240 (MK19 / closed) - Wood
    ["rhsusf_m1240a1_m240_usarmy_d",7],						//M1240 (MMG / closed) - Desert
    ["rhsusf_m1240a1_m240_usarmy_wd",7],					//M1240 (MMG / closed) - Wood
    ["CUP_B_RG31E_M2_USA",7],								//RG-31 Mk5E (M2 / closed) - Desert
    ["CUP_B_RG31E_M2_OD_USA",7],							//RG-31 Mk5E (M2 / closed) - Wood
    ["CUP_B_RG31_M2_GC_USA",7],								//RG-31 Nyala (M2, GC / closed) - Desert
    ["CUP_B_RG31_M2_OD_GC_USA",7],							//RG-31 Nyala (M2, GC / closed) - Wood
    ["CUP_B_RG31_M2_USA",7],								//RG-31 Nyala (M2 / closed) - Desert
    ["CUP_B_RG31_M2_OD_USA",7],								//RG-31 Nyala (M2 / closed) - Wood
    ["CUP_B_RG31_Mk19_USA",7],								//RG-31 (Mk19 / closed) - Desert
    ["CUP_B_RG31_Mk19_OD_USA",7],							//RG-31 (Mk19 / closed) - Wood
    ["rhsusf_CGRCAT1A2_M2_usmc_d",7],						//CGR CAT1A2 (M2 / closed) - Desert
    ["rhsusf_CGRCAT1A2_M2_usmc_wd",7],						//CGR CAT1A2 (M2 / closed) - Wood
    ["rhsusf_CGRCAT1A2_Mk19_usmc_d",7],						//CGR CAT1A2 (MK19 / closed) - Desert
    ["rhsusf_CGRCAT1A2_Mk19_usmc_wd",7],					//CGR CAT1A2 (MK19 / closed) - Wood
    ["UK3CB_BAF_Husky_Passenger_GMG_Sand",7],				//Husky Passenger GMG (GMG / open back) - Desert
    ["UK3CB_BAF_Husky_Passenger_GMG_Green",7],				//Husky Passenger GMG (GMG / open back) - Wood
    ["UK3CB_BAF_Husky_Passenger_GPMG_Sand",7],				//Husky Passenger GPMG (MMG / open back) - Desert
    ["UK3CB_BAF_Husky_Passenger_GPMG_Green",7],				//Husky Passenger GPMG (MMG / open back) - Wood
    ["UK3CB_BAF_Husky_Passenger_HMG_Sand",7],				//Husky Passenger HMG (M2 / open back) - Desert
    ["UK3CB_BAF_Husky_Passenger_HMG_Green",7],				//Husky Passenger HMG (M2 / open back) - Wood
    ["rhsusf_m1245_m2crows_socom_d",7],						//M1245 (Crows M2 / closed) - Desert
    ["rhsusf_m1245_m2crows_socom_deploy",7],				//M1245 Deploy (Crows M2 / closed) - Desert
    ["rhsusf_m1245_mk19crows_socom_d",7],					//M1245 (Crows MK19 / closed) - Desert
    ["rhsusf_m1245_mk19crows_socom_deploy",7],				//M1245 Deploy (Crows MK19 / closed) - Desert

	//10 Tickets
	["rhsusf_M1232_usarmy_d",10],							//M1230 (closed) - Desert
    ["rhsusf_M1232_usarmy_wd",10],							//M1230 (closed) - Wood
    ["rhsusf_M1239_M2_socom_d",10],							//M1239 (Crows M2 / flatbed) - Desert
    ["rhsusf_M1239_MK19_Deploy_socom_d",10],				//M1239 Deploy (Crows Mk19, Logi / closed) - Desert
    ["rhsusf_M1239_MK19_socom_d",10],						//M1239 (Crows Mk19 / flatbed) - Desert
    ["rhsusf_M1239_socom_d",10],							//M1239 (flatbed) - Desert
	["rhsusf_M1238A1_M2_socom_d",10],						//M1238A1 ASV (Crows M2 / closed) - Desert
    ["rhsusf_M1238A1_Mk19_socom_d",10],						//M1238A1 ASV (Crows MK19 / closed) - Desert
	["rhsusf_M1237_M2_usarmy_d",10],						//M1237 (M2 / closed) - Desert
    ["rhsusf_M1237_M2_usarmy_wd",10],						//M1237 (M2 / closed) - Wood
    ["rhsusf_M1237_MK19_usarmy_d",10],						//M1237 (Mk19 / closed) - Desert
    ["rhsusf_M1237_MK19_usarmy_wd",10],						//M1237 (Mk19 / closed) - Wood
	["rhsusf_M1230_M2_usarmy_d",10],						//M1230 (M2 / closed) - Desert
    ["rhsusf_M1230_M2_usarmy_wd",10],						//M1230 (M2 / closed) - Wood
    ["rhsusf_M1230_MK19_usarmy_d",10],						//M1230 (MK19 / closed) - Desert
    ["rhsusf_M1230_MK19_usarmy_wd",10],						//M1230 (MK19 / closed) - Wood
	["rhsusf_M1220_M153_M2_usarmy_d",10],					//M1220 (Crows M2 / closed) - Desert
    ["rhsusf_M1220_M153_M2_usarmy_wd",10],					//M1220 (Crows M2 / closed) - Wood
    ["rhsusf_M1220_M153_MK19_usarmy_d",10],					//M1220 (Crows MK19 / closed) - Desert		
    ["rhsusf_M1220_M153_MK19_usarmy_wd",10],				//M1220 (Crows MK19 / closed) - Wood
    ["rhsusf_m1240a1_m2crows_usarmy_d",10],					//M1240 (Crows M2 / closed) - Desert
    ["rhsusf_m1240a1_m2crows_usarmy_wd",10],				//M1240 (Crows M2 / closed) - Wood
    ["rhsusf_m1240a1_mk19crows_usarmy_d",10],				//M1240 (Crows MK19 / closed) - Desert
    ["rhsusf_m1240a1_mk19crows_usarmy_wd",10],				//M1240 (Crows MK19 / closed) - Wood
    ["rhsusf_M1232_M2_usarmy_d",10],						//M1232 (M2 / closed) - Desert
    ["rhsusf_M1232_M2_usarmy_wd",10],						//M1232 (M2 / closed) - Wood
    ["rhsusf_M1232_MK19_usarmy_d",10],						//M1232 (MK19 / closed) - Desert
    ["rhsusf_M1232_MK19_usarmy_wd",10],						//M1232 (MK19 / closed) - Wood
	["rhsusf_M1238A1_socom_d",10],							//M1238A1 ASV (closed) - Desert
	["CUP_B_Dingo_GER_Des",10],
	["CUP_B_Dingo_GL_GER_Des",10],
	
	//13 Tickets
	["rhsusf_M1230a1_usarmy_d",13],							//M1230 (Medic / closed) - Desert
	["rhsusf_M1230a1_usarmy_wd",13],						//M1230 (Medic / closed) - Wood
	
	//15 Tickets
	["rhsusf_M1239_M2_Deploy_socom_d",15],					//M1239 Deploy (Crows M2, Logi / closed) - Desert
	["UK3CB_BAF_Husky_Logistics_GMG_Sand",15],				//Husky GMG (GMG, Logi / closed) - Desert
	["UK3CB_BAF_Husky_Logistics_GMG_Green",15],				//Husky GMG (GMG, Logi / closed) - Wood
    ["UK3CB_BAF_Husky_Logistics_GPMG_Sand",15],				//Husky GPMG (MMG, Logi / closed) - Desert
    ["UK3CB_BAF_Husky_Logistics_GPMG_Green",15],			//Husky GPMG (MMG, Logi / closed) - Wood
    ["UK3CB_BAF_Husky_Logistics_HMG_Sand",15],				//Husky HMG (M2, Logi / closed) - Desert
    ["UK3CB_BAF_Husky_Logistics_HMG_Green",15],				//Husky HMG (M2, Logi / closed) - Wood

	
	
//Truck
	//3 Tickets
	["UK3CB_BAF_MAN_HX58_Transport_Sand",3],				//MAN HX58 6x6 Transport (closed) - Desert
    ["UK3CB_BAF_MAN_HX58_Transport_Green",3],				//MAN HX58 6x6 Transport (closed) - Wood
    ["UK3CB_BAF_MAN_HX60_Transport_Sand",3],				//MAN HX60 4x4 Transport (closed) - Desert
    ["UK3CB_BAF_MAN_HX60_Transport_Green",3],				//MAN HX60 4x4 Transport (closed) - Wood
    ["rhsusf_M1078A1P2_D_flatbed_fmtv_usarmy",3],			//M1078A1P2-B (Flatbed) - Desert
    ["rhsusf_M1078A1P2_WD_flatbed_fmtv_usarmy",3],			//M1078A1P2-B (Flatbed) - Wood
    ["rhsusf_M1078A1P2_D_fmtv_usarmy",3],					//M1078A1P2-B (covered) - Desert
    ["rhsusf_M1078A1P2_WD_fmtv_usarmy",3],					//M1078A1P2-B (covered) - Wood
    ["rhsusf_M1084A1P2_B_D_fmtv_usarmy",3],					//M1084A1P2-B (Flatbed) - Desert
    ["rhsusf_M1084A1P2_B_WD_fmtv_usarmy",3],				//M1084A1P2-B (Flatbed) - Wood
	
	//7 Tickets
	["rhsusf_M977A4_BKIT_usarmy_d",7],						//Hemtt
    ["UK3CB_BAF_MAN_HX58_Fuel_Sand",7],						//MAN HX58 6x6 (Fuel / closed) - Desert
    ["UK3CB_BAF_MAN_HX58_Fuel_Green",7],					//MAN HX58 6x6 (Fuel / closed) - Wood
    ["UK3CB_BAF_MAN_HX58_Repair_Sand",7],					//MAN HX58 6x6 (Repair / closed) - Desert
    ["UK3CB_BAF_MAN_HX58_Repair_Green",7],					//MAN HX58 6x6 (Repair / closed) - Wood
    ["UK3CB_BAF_MAN_HX60_Fuel_Sand",7],						//MAN HX60 4x4 (Fuel / closed) - Desert
    ["UK3CB_BAF_MAN_HX60_Fuel_Green",7],					//MAN HX60 4x4 (Fuel / closed) - Wood
    ["UK3CB_BAF_MAN_HX60_Repair_Sand",7],					//MAN HX60 4x4 (Repair / closed) - Desert
    ["UK3CB_BAF_MAN_HX60_Repair_Green",7],					//MAN HX60 4x4 (Repair / closed) - Wood
    ["UK3CB_BAF_MAN_HX58_Cargo_Sand_A",7],					//MAN HX58 6x6 (Empty Cargo / closed) - Desert
    ["UK3CB_BAF_MAN_HX58_Cargo_Green_A",7],					//MAN HX58 6x6 (Empty Cargo / closed) - Wood
    ["UK3CB_BAF_MAN_HX60_Cargo_Sand_A",7],					//MAN HX60 4x4 (Empty Cargo / closed) - Desert
    ["UK3CB_BAF_MAN_HX60_Cargo_Green_A",7],					//MAN HX60 4x4 (Empty Cargo / closed) - Wood
	["CUP_B_T810_Reammo_CZ_DES",7],							//Tatra T810 (Ammo / closed) - Desert
	["CUP_B_T810_Reammo_CZ_WDL",7],							//Tatra T810 (Ammo / closed) - Wood
	["CUP_B_T810_Repair_CZ_DES",7],							//Tatra T810 (Repair / closed) - Desert
	["CUP_B_T810_Repair_CZ_WDL",7],							//Tatra T810 (Repair / closed) - Wood
	["CUP_B_T810_Refuel_CZ_DES",7],							//Tatra T810 (Fuel / closed) - Desert
	["CUP_B_T810_Refuel_CZ_WDL",7],							//Tatra T810 (Fuel / closed) - Wood
	
	//10 Tickets
	["rhsusf_M977A4_REPAIR_BKIT_usarmy_d",10], 				//Hemtt Repair
	["rhsusf_M977A4_AMMO_BKIT_usarmy_d",10],				//Hemtt Ammo
	["rhsusf_M978A4_BKIT_usarmy_d",10],						//Hemtt Fuel
	
	//18 Tickets
	["rhsusf_M1085A1P2_B_D_Medical_fmtv_usarmy",18],		//M1085A1P2B CBPS (Medical Tent / closed) - Desert
    ["rhsusf_M1085A1P2_B_WD_Medical_fmtv_usarmy",18],		//M1085A1P2B CBPS (Medical Tent / closed) - Wood


//Truck armed
	//5 Tickets
    ["rhsusf_M1078A1P2_B_M2_D_flatbed_fmtv_usarmy",5],		//M1078A1P2-B (M2 / Flatbed) - Desert
    ["rhsusf_M1078A1P2_B_M2_WD_flatbed_fmtv_usarmy",5],		//M1078A1P2-B (M2 / Flatbed) - Wood
    ["rhsusf_M1078A1P2_B_M2_D_fmtv_usarmy",5],				//M1078A1P2-B (M2 / covered) - Desert
    ["rhsusf_M1078A1P2_B_M2_WD_fmtv_usarmy",5],				//M1078A1P2-B (M2 / covered) - Wood
    ["rhsusf_M1083A1P2_B_M2_D_flatbed_fmtv_usarmy",5],		//M1083A1P2-B (M2 / Flatbed) - Desert
    ["rhsusf_M1083A1P2_B_M2_WD_flatbed_fmtv_usarmy",5],		//M1083A1P2-B (M2 / Flatbed) - Wood
    ["rhsusf_M1083A1P2_B_M2_D_fmtv_usarmy",5],				//M1083A1P2-B (M2 / covered) - Desert
    ["rhsusf_M1083A1P2_B_M2_WD_fmtv_usarmy",5],				//M1083A1P2-B (M2 / covered) - Wood
    ["rhsusf_M1084A1P2_B_M2_D_fmtv_usarmy",5],				//M1084A1P2-B (M2 / Flatbed) - Desert
    ["rhsusf_M1084A1P2_B_M2_WD_fmtv_usarmy",5],				//M1084A1P2-B (M2 / Flatbed) - Wood
    ["CUP_B_T810_Armed_CZ_DES",5],							//Tatra T810 (MMG / covered) - Desert
    ["CUP_B_T810_Armed_CZ_WDL",5],							//Tatra T810 (MMG / covered) - Wood
	
	//13 Tickets
	["rhsusf_M977A4_REPAIR_BKIT_M2_usarmy_d",13], 			//Hemtt Repair .50cal
	["rhsusf_M977A4_BKIT_M2_usarmy_d",13],					//Hemtt .50cal
	["rhsusf_M977A4_AMMO_BKIT_M2_usarmy_d",13],				//Hemtt Ammo .50cal


//APC
	//5 Tickets
    ["rhsusf_m113d_usarmy_unarmed",5],						//M113A3 (closed) - Desert
    ["rhsusf_m113_usarmy_unarmed",5],						//M113A3 (closed) - Wood
	
	//7 Tickets	
	["rhsusf_m113d_usarmy",7],								//M113A3 (M2 / closed) - Desert
    ["rhsusf_m113_usarmy",7],								//M113A3 (M2 / closed) - Wood
    ["rhsusf_m113d_usarmy_M240",7],							//M113A3 (MMG / closed) - Desert
    ["rhsusf_m113_usarmy_M240",7],							//M113A3 (MMG / closed) - Wood
    ["rhsusf_m113d_usarmy_MK19",7],							//M113A3 (MK19 / closed) - Desert
    ["rhsusf_m113_usarmy_MK19",7],							//M113A3 (MK19 / closed) - Wood
	["rhsusf_M1117_D",7],									//M1117 ASV (M2, MK19 / closed) - Desert
    ["rhsusf_M1117_W",7],									//M1117 ASV (M2, MK19 / closed) - Wood
    ["rhsusf_M1117_O",7],									//M1117 ASV (M2, MK19 / closed) - Wood
	["rhsusf_m113d_usarmy_medical",7],						//M113A3 (Medic / closed) - Desert
    ["rhsusf_m113_usarmy_medical",7],						//M113A3 (Medic / closed) - Wood
	
	//10 Tickets
	["CUP_B_AAV_USMC",10],									//AAVP7/A1 (M2, MK19 / closed) - Wood
	["rhsusf_m113d_usarmy_supply",10],						//M113A3 (M2, Ammo / closed) - Desert
    ["rhsusf_m113_usarmy_supply",10],						//M113A3 (M2, Ammo / closed) - Wood
	["UK3CB_BAF_FV432_Mk3_GPMG_Sand",10],					//FV432 Bulldog 
    ["UK3CB_BAF_FV432_Mk3_RWS_Sand",10],					//FV432 Bulldog .50cal
	
	//18 Tickets
	["I_APC_Wheeled_03_cannon_F",18],						//Pandur
	["B_APC_Tracked_01_rcws_F",18],							//Namer
	["B_APC_Tracked_01_CRV_F",18],							//Nemmera
	
	
//IFV
	//10 Tickets
	["CUP_B_LAV25_HQ_desert_USMC",10],						//LAV HQ
	
	//13 Tickets
	["CUP_B_M1133_MEV_Desert",13],							//Stryker Medic
	["rhsusf_stryker_m1132_m2_d",13],						//Stryker Mineshield
	["rhsusf_stryker_m1127_m2_d",13],						//Stryker Recon
	["rhsusf_stryker_m1126_mk19_d",13],						//Stryker Mk 19
	["rhsusf_stryker_m1126_m2_d",13],						//Stryker .50cal
	["CUP_B_M1129_MC_MK19_Desert",13],						//Stryker Mortar
	
	//15 Tickets
	["I_LT_01_AT_F",15],									//Wiesel TOW
	["RHS_M6",15],											//M6 Linebacker
	["I_LT_01_cannon_F",15],								//Wiesel MK20
	
	//18 Tickets
	["RHS_M2A3",18],										//M2A3 Bradley
    ["RHS_M2A3_BUSKI",18],									//M2A3 Bradley
    ["UK3CB_BAF_Warrior_A3_D_Cage_Camo",18],				//Warrior
    ["I_APC_tracked_03_cannon_F",18],						//Warrior
	["CUP_B_FV510_GB_D_SLAT",18],							//Warrior
	["rhsusf_stryker_m1134_d",18],							//Stryker TOW
    ["CUP_B_LAV25M240_desert_USMC",18],						//LAV25
	["B_APC_Wheeled_01_cannon_F",18],						//Badger
	
	//20 Tickets
	["RHS_M2A3_BUSKIII",20],								//M2A3 Bradley
	["B_AFV_Wheeled_01_up_cannon_F",20],					//Rooikat UP
	["B_AFV_Wheeled_01_cannon_F",20],						//Rooikat
	["CUP_B_M1128_MGS_Desert",20],							//Stryker MGS
	
	
//AA
	//5 Tickets
	["I_LT_01_scout_F",5],									//Wiesel Radar
	
	//15 Tickets
	["CUP_B_M163_USA",15],									//M163 Vulcan
	["I_LT_01_AA_F",15],									//Wiesel Stinger
	
	//20 Tickets
	["B_APC_Tracked_01_AA_F",20],							//Bardelas
	
	
//MBT
	//20 Tickets
    ["rhsusf_m1a1fep_d",20],
	["rhsusf_m1a1aimd_usarmy",20],
	
	//25 Tickets
	["TF47_B_MBT_01_cannon_F",25],							//Merkava Mk IV M
	["TF47_B_MBT_01_TUSK_F",25],							//Merkava Mk IV LIC
	["TF47_CUP_B_Challenger2_Desert_BAF",25],
	["TF47_CUP_B_Leopard2A6DST_GER",25],
    ["rhsusf_m1a1aim_tuski_d",25],
    ["rhsusf_m1a2sep1d_usarmy",25],
    ["B_MBT_01_TUSK_F",25],
    ["B_MBT_01_cannon_F",25],
	
	//28 Tickets
	["rhsusf_m1a2sep1tuskiid_usarmy",28],
	["rhsusf_m1a2sep1tuskid_usarmy",30],
	
//Rotary
	//10 Tickets
	["RHS_UH60M_MEV2",10],
	["rhs_uh1h_hidf",10],
	["RHS_MELB_MH6M",10],									//MH-6M (Obvserver / Skids) - Black
	["RHS_UH60M_d",10],
	["RHS_UH60M_MEV_d",10],
	["RHS_UH60M_MEV",10],
	["RHS_UH1Y_UNARMED",10],
	
	//15 Tickets
	["RHS_UH60M_ESSS2_d",15],
	["RHS_UH60M_ESSS2",15],
	["CUP_B_UH60M_Unarmed_FFV_MEV_US",15],
	["CUP_B_UH60M_FFV_US",15],
	["CUP_B_UH60S_USN",15],
    ["CUP_B_UH1Y_MEV_USMC",15],
    ["CUP_B_UH1Y_UNA_USMC",15],
	
	//18 Tickets
	["RHS_CH_47F_light",18],
	["TF47_MH47E_USA",18],
	["rhsusf_CH53E_USMC_GAU21",18],
	["rhsusf_CH53E_USMC_GAU21_D",18],
	["CUP_B_CH53E_VIV_USMC",18],
	["UK3CB_BAF_Merlin_HC3_Cargo",18],   
    ["UK3CB_BAF_Merlin_HC4_32",18],
    ["UK3CB_BAF_Merlin_HC4_Cargo",18],
    ["UK3CB_BAF_Merlin_HM2_18",18],	
	["CUP_B_MH47E_USA",18],
	["UK3CB_BAF_Merlin_HC3_CSAR",18],
	["UK3CB_BAF_Merlin_HC4_18_GPMG",18],
	
	//25 Tickets
	["CUP_B_MV22_USMC_RAMPGUN",15],
	["CUP_B_MV22_USMC",15],
    ["CUP_B_MV22_VIV_USMC",15],

	
//Rotary Wing Armed
	//15 Tickets
	["RHS_MELB_AH6M",15],									//Loadouts
	["rhs_uh1h_hidf_gunship",15],							//Loadouts
	["RHS_UH1Y",15],										//Loadouts
	["RHS_UH1Y_d",15],										//Loadouts
	["RHS_UH60M_ESSS",15],									//Loadouts
	["RHS_UH60M_ESSS_d",15],								//Loadouts
	["CUP_B_UH1Y_Gunship_Dynamic_USMC",15],
	
	//18 Tickets
	["UK3CB_BAF_Wildcat_AH1_CAS_6A",18],
    ["UK3CB_BAF_Wildcat_AH1_CAS_6B",18],
    ["UK3CB_BAF_Wildcat_AH1_CAS_8A",18],
    ["UK3CB_BAF_Wildcat_AH1_CAS_8B",18],
	["UK3CB_BAF_Wildcat_AH1_HEL_6A",18],
    ["UK3CB_BAF_Wildcat_AH1_HEL_8A",18],
    ["UK3CB_BAF_Wildcat_AH1_TRN_8A",18],
    ["UK3CB_BAF_Wildcat_HMA2_TRN_8A",18],
	["CUP_B_MH60L_DAP_4x_US",18],							//Loadouts
	["CFP_B_USSEALS_MH_60L_DAP_4Pylons_DES_01",18],			//Loadouts
	["CFP_B_USRANGERS_MH_60L_DAP_4Pylons_WDL_01",18],		//Loadouts
	["CFP_B_USARMY_MH60L_DAP_4x_US",18],					//Loadouts
	["CFP_B_USSEALS_MH_60L_DAP_4Pylons_WDL_01",18],			//Loadouts
	["CUP_B_MH60L_DAP_4x_USN",18],							//Loadouts
	["CFP_B_USMC_MH_60S_Knighthawk_ESSS_x4_DES_01",18],		//Loadouts
	
	//20 Tickets
	["rhsgref_mi24g_CAS",20],
	
	//25 Tickets
	["RHS_AH1Z",25],										//Loadouts
	["RHS_AH64D_noradar",25],								//Loadouts
	["RHS_AH64D_noradar_wd",25],							//Loadouts
	
	//30 Tickets
	["RHS_AH64D",30],										//Loadouts
	["RHS_AH64DGrey",30],									//Loadouts
	["RHS_AH64D_wd",30],									//Loadouts
	["UK3CB_BAF_Apache_AH1_DynamicLoadoutUnlimited",30],	//Loadouts
	["UK3CB_BAF_Apache_AH1_JS",30],
	["UK3CB_CW_US_B_LATE_AH64",30],
	

//Fixed Wing
	//7 Tickets
	["USAF_C130J",7], 
	
	//10 Tickets
	["USAF_C130J_Cargo",10],
	
	//15 Tickets
	["RHSGREF_A29B_HIDF",15],								//Super Tucano
	
	//20 Tickets
	["I_Plane_Fighter_04_F",20],							//Loadouts
	
	//25 Tickets
	["CUP_B_AV8B_DYN_USMC",25],								//Loadouts
	["USAF_F35A_STEALTH",25],								//Loadouts
	
	//30 Tickets
	["RHS_A10",30],											//Loadouts
	["JS_JC_FA18E",30],										//Loadouts
	["JS_JC_FA18F",30],										//Loadouts
	["USAF_A10",30],										//Loadouts
	["USAF_F35A",30],										//Loadouts
	["USAF_F22",30],										//Loadouts
	["TF47_F15E",30],
	["FIR_A10A",30],
    ["TF47_A10A",30],
    ["FIR_A10C",30],
    ["TF47_A10C",30],
    ["UK3CB_CW_US_B_LATE_A10",30],

//UAV
	//10 Tickets
	["USAF_MQ9",10],
	["USAF_RQ4A",10]
	
    /*["B_T_VTOL_01_armed_F",30],
    ["B_T_VTOL_01_infantry_F",30],
    ["B_T_VTOL_01_vehicle_F",30]
    */                                 
];
 
GVAR(vehicleTicketCostFallback) = [
    30, //plane 1
    25, //helo 2
    5,  //car 3
    25  //tank 4
];
