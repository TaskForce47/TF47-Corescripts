class TF47_core_notification {
	title = "";
	iconPicture = "";
	iconText = "";
	description = "%1";
	color[] = {1,1,1,1};
	duration = 5;
	priority = 0;
	difficulty[] = {};
};

class TF47_core_notification_ticketLoss : TF47_core_notification {
	title = "Ticket loss";
	iconPicture = "TF47Core\data\icons\minus.paa";
	description = "%1";
};

class TF47_core_notification_ticketGain : TF47_core_notification {
	title = "Ticket gain";
	iconPicture = "TF47Core\data\icons\plus.paa";
	description = "%1";
};

class TF47_core_notification_notWhitelisted : TF47_core_notification {
	title = "Not whitelisted";
	iconPicture = "TF47Core\data\icons\not_allowed.paa";
	description = "%1";
};
