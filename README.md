# TF47 Corescripts

Die Corescripts stellen vielfälltige Funktionallitäten für Missionen bereit.

## Installation

Verschiebt den Ordner TF47Core in das Hauptverzeichniss eurer Mission.
Da nach tragt ihr folgendes in eure description.ext ein

```bash
CfgFunctions {
    #include "TF47Core\CfgFunctions.hpp"
};

CfgNotification {
    #include "TF47Core\CfgNotifications.hpp"
};

CfgDebriefing {
    #include "TF47Core\CfgDebriefing.hpp"
};
```

## Usage

Nutzt die CBA settings um die Scripts entsprechend zu konfigurieren.

## API

CBA-Eventhandler

Ticketsystem:
``` sqf
Global Events: 
["ticketChange", { params ["_message", "_tickets", "_ticketChange"] }] call CBA_fnc_addEvent;
["outOfTickets", { params ["_message", "_tickets"]} call CBA_fnc_addEvent;
```



## License
--tba--