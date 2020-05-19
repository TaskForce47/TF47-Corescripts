class TF47_core
{
	class core
	{
		file = "TF47Core\functions\core";

		class handleConnectionHC {};
		class handleDisconnectHC {};
		class handlePlayerConnected {};
		class handlePlayerDisconnected {};
		class init {postInit = 1;};
		class initCustomEvents {preInit = 1;};
		class initPlayer {};
		class initServer {};
		class settings {preInit = 1;};
	};
};