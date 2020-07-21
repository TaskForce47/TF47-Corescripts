#include "..\script_component.hpp"
/* For the whitelist if a player is allowed to fly attack craft the vehicle is checked against this list.
 * if the vehicle is not found in this list it will get treated as any other transport vehicle.
 */

GVAR(disabledVehicles) = [
	"rhsusf_m113d_usarmy_M240",
	"rhsusf_m113d_usarmy_MK19",
	"rhsusf_m113d_usarmy",
	"CUP_B_M163_USA",
	"rhsusf_stryker_m1134_wd",
	"rhsusf_stryker_m1132_m2_wd",
	"rhsusf_stryker_m1127_m2_wd",
	"rhsusf_stryker_m1126_mk19_wd",
	"rhsusf_stryker_m1126_m2_wd",
	"rhsusf_M1117_D",
	"itc_land_rhsusf_m109_usarmy",
	"rhsusf_M1230a1_usarmy_wd",
	"rhsusf_m113d_usarmy_medical",
	"CUP_B_M1133_MEV_Woodland",
	
	"rhsusf_m113_usarmy_M240",
	"rhsusf_m113_usarmy_MK19",
	"rhsusf_m113_usarmy",
	"CUP_B_M163_USA",
	"rhsusf_stryker_m1134_d",
	"rhsusf_stryker_m1132_m2_d",
	"rhsusf_stryker_m1127_m2_d",
	"rhsusf_stryker_m1126_mk19_d",
	"rhsusf_stryker_m1126_m2_d",
	"rhsusf_M1117_D",
	"itc_land_rhsusf_m109d_usarmy",
	"rhsusf_M1230a1_usarmy_d",
	"rhsusf_m113_usarmy_medical",
	"CUP_B_M1133_MEV_Desert"
];
