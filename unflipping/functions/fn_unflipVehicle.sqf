/*
    vet_unflipping_fnc_unflipVehicle

    File: fn_unflipVehicle.sqf
    Date: 2019-03-13
    Last Update: 2019-04-01
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Applies force to vehicle that should unflip it, not 100%.

    Parameter(s):
        _vehicle - Vehicle to unflip [OBJECT, defaults to objNull]

    Returns:
        Vehicle was unflipped [BOOL]
*/

#define UNFLIP_FORCEFACTOR_EXPIRATIONTIME   300

params [
    ["_vehicle", objNull, [objNull]]
];

if (isNull _vehicle) exitWith {false};

private _upsideDown = (vectorUp _vehicle vectorDotProduct surfaceNormal getPos _vehicle) < -0.80;
private _bank = _vehicle call BIS_fnc_getPitchBank select 1;

private _flipLeft = _bank >= 0;
// When upside down then left is right and right is left
if (_upsideDown) then {
    _flipLeft = !_flipLeft;
};

if (!_upsideDown && 55 > abs _bank) exitWith {false};

private _bbr = boundingBoxReal _vehicle;
private _vehicleWidth = abs (_bbr#0#0 * 2);

// force factor is set in vet_unflipping_unflip_start event
private _lastUnflipAttempt = _vehicle getVariable ["vet_lastUnflipAttempt", CBA_missionTime];
private _forceFactor = if ((CBA_missionTime - _lastUnflipAttempt) < UNFLIP_FORCEFACTOR_EXPIRATIONTIME) then {
    _vehicle getVariable ["vet_forceFactor", 1]
} else {
    _vehicle setVariable ["vet_forceFactor", nil];
    1
};
_vehicle setVariable ["vet_lastUnflipAttempt", CBA_missionTime];

private _force = getMass _vehicle * ([1 + (_vehicleWidth/10), _vehicleWidth] select _upsideDown) * _forceFactor;

private _forcePointX = _bbr select ([0, 1] select _flipLeft) select 0;
private _forcePointZ = _bbr select ([1, 0] select _upsideDown) select 2;

_vehicle addForce [
    _vehicle vectorModelToWorld [[_force, -_force] select _flipLeft, 0, 0],
    [_forcePointX, 0, _forcePointZ]
];

true
