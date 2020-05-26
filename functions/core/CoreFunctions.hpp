class TF47_core
{
	class core
	{
		file = "TF47Core\functions\core";

		class handleConnectionHC {};
		class handleDisconnectHC {};
		class handlePlayerConnected {};
		class handlePlayerDisconnected {};
		class handlePlayerMovement {};
		class init {postInit = 1;};
		class initCustomEvents {preInit = 1;};
		class initHc {};
		class initPlayer {};
		class initServer {};
		class isInBase {};
		class isInObjective {};
		class registerBase {};
		class safezone {};
		class registerObjective {};
		class settings {preInit = 1;};
		class unregisterObjective {};
		class unregisterBase {};
	};
};
