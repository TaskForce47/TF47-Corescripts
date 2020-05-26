#include "script_component.hpp"

params [
  ["_vehicle", objNull, [objNull,""]]
];

if(_vehicle isEqualType objNull) then {
  if(isNull _vehicle) exitWith {0};
  _vehicle = typeOf _vehicle;
};

private _vehilceList = GVAR(vehicleTicketcost);
private _id = _vehilceList findIf {_x select 0 == _vehicle};

if(_id == -1) exitWith {0};
private _cost = _vehilceList select _id select 1;

_cost
