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

class TF47_core_notification_outOfTickets : TF47_core_notification {
	title = "No tickets remaining";
	iconPicture = "TF47Core\data\icons\fail.paa";
	description = "%1";
};

class TF47_core_notification_notWhitelisted : TF47_core_notification {
	title = "Not whitelisted";
	iconPicture = "TF47Core\data\icons\not_allowed.paa";
	description = "%1";
};

class TF47_core_notification_badWeapon : TF47_core_notification {
	title = "You are not allowed to carry that weapon";
	iconPicture = "TF47Core\data\icons\not_allowed_weapon.paa";
	description = "%1";
};
