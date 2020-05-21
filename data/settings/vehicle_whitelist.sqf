#include "..\script_component.hpp"
/* For the whitelist if a player is allowed to fly attack craft the vehicle is checked against this list.
 * if the vehicle is not found in this list it will get treated as any other transport vehicle.
 */

GVAR(attackPlanes) = [
	"FIR_F22",
	"FIR_F15SE",
	"FIR_F15E",
	"JS_JC_FA18E",
	"JS_JC_FA18F",
	"TF47_A10A",
	"FIR_A10A",
	"TF47_A10C",
	"FIR_A10C",
	"RHS_A10",
	"TF47_F15C",
	"TF47_F15E",
	"CUP_B_AV8B_DYN_USMC",
	"rhsusf_f22"
];

GVAR(attackHelicopter) = [
	"CUP_B_MH60L_DAP_4x_US",
	"CUP_B_MH60L_DAP_4x_USN",
	"RHS_UH1Y_d_GS",
	"RHS_MELB_AH6M",
	"RHS_AH1Z",
	"RHS_AH64D_noradar_wd",
	"RHS_AH64D_d",
	"RHS_AH64D_wd",
	"UK3CB_BAF_Apache_AH1_JS",
	"UK3CB_BAF_Wildcat_AH1_CAS_6A",
	"UK3CB_BAF_Wildcat_AH1_CAS_6B",
	"UK3CB_BAF_Wildcat_AH1_HEL_6A"
];
