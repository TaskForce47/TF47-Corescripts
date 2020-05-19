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
	"TF47_a10a",
	"RHS_A10",
	"rhsusf_f22"
];

GVAR(attackHelicopter) = [
	"RHS_MELB_AH6M",
	"RHS_UH1Y_d_GS",
	"BWA3_Tiger_RMK_Heavy",
	"RHS_AH1Z",
	"RHS_AH64D_d",
	"RHS_AH64D_wd",
	"UK3CB_BAF_Apache_AH1",
	"UK3CB_BAF_Wildcat_AH1_CAS_6C",
	"UK3CB_BAF_Wildcat_AH1_CAS_8C"
];
