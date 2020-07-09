#include "script_component.hpp"
call EFUNC(ticket,initPlayer);
call EFUNC(ace,initPlayer);
call EFUNC(util,initPlayer);
call EFUNC(whitelist,initPlayer);
call EFUNC(marker,initPlayer);
call EFUNC(logging,initPlayer);

call FUNC(handlePlayerMovement);
call FUNC(safezone);
call FUNC(restrictBorder);