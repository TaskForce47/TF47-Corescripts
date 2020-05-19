#include "script_component.hpp"

//[this, ["Tank", "Helo", "Plane", "AttackAir"]] call TF47_whitelist_fnc_addSlotRestriction
params [
  ["_unit", objNull, [objNull]],
  ["_permissions", [], [[]]]
];

private _result = [];

{
    switch true do
    {
        case (_x isEqualTo "Tank"): {
          _result pushBack WHITELIST_TANK;
        };
        case (_x isEqualTo "Helo"): {
          _result pushBack WHITELIST_HELO;
        };
        case (_x isEqualTo "Plane"): {
          _result pushBack WHITELIST_PLANE;
        };
        case (_x isEqualTo "AttackAir") : {
          _result pushBack WHITELIST_ATTACK_AIR;
        };
    };
} forEach _permissions;

_unit setVariable [QGVAR(slotRestrictions), _permissions];

true
