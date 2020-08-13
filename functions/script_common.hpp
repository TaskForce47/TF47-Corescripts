#define PREFIX TF47

#define NOTIFICATION_TICKET_LOSS "TF47_core_notification_ticketLoss"
#define NOTIFICATION_TICKET_GAIN "TF47_core_notification_ticketGain"
#define NOTIFICATION_TICKET_NOTICKETS "TF47_core_notification_outOfTickets"
#define NOTIFICATION_WHITELIST_VEHICLE "TF47_core_notification_notWhitelisted"

#define WHITELIST_USER_ADMIN 1
#define WHITELIST_USER_MODERATOR 2
#define WHITELIST_USER_TF 3
#define WHITELIST_USER_STAMM 4
#define WHITELIST_CCT 5
#define WHITELIST_HELO 6
#define WHITELIST_PLANE 7
#define WHITELIST_ATTACK_AIR 8
#define WHITELIST_UAV 9
#define WHITELIST_TANK 10
#define WHITELIST_BUILDERS 11

#define EVENT_PLAYER_UNCON 1
#define EVENT_PLAYER_DEAD 2
#define EVENT_PLAYER_HEAL 3
#define EVENT_PLAYER_BAD_WEAPON 4

#define EVENT_VEHICLE_DESTROYED_CAR 5
#define EVENT_VEHICLE_DESTROYED_TANK 6
#define EVENT_VEHICLE_DESTROYED_HELO 7
#define EVENT_VEHICLE_DESTROYED_PLANE 8

#define EVENT_CIVILIAN_DEAD 10
#define EVENT_HOUSE_DESTROYED 11

#define EVENT_OBJECTIVE_STARTED 20
#define EVENT_OBJECTIVE_FAILED 21
#define EVENT_OBJECTIVE_COMPLETED 22

#include "..\script_macros_common.hpp"

#define TF47_IS_TANKER "TF47_whitelist_tank_crew"
#define TF47_IS_HELICOPTER_PILOT "TF47_whitelist_helicopter_pilot"
#define TF47_IS_PLANE_PILOT "TF47_whitelist_plane_pilot"
#define TF47_IS_UAV "TF47_whitelist_uav_pilot"
#define TF47_IS_CCT "TF47_whitelist_slot_cct"
#define TF47_IS_HELICOPTER_CREW "TF47_whitelist_helicopter_crew"
#define TF47_IS_PLANE_CREW "TF47_whitelist_plane_crew"

#define IS_SERVER isServer
#define IS_HEADLESS !hasInterface && !isServer
#define IS_CLIENT hasInterface && !isDedicated
#define IS_SINGLEPLAYER hasInterface && isServer