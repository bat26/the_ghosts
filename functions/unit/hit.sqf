/*
    Hit.sqf
    This function provides effects when a unit is hit either by enemy / friendly shots
*/

private _unitHit = _this select 0;
private _unitResponsible = _this select 1;

//check if unit damaged itself, if so then exit
if (_unitHit isEqualTo _unitResponsible ) exitWith {};

//check if unit hit is vehicle, if so then exit
if (!_unitHit isEqualTo vehicle _unitHit) exitWith {};

//play hit sound
_sound = ["hit1","hit2","hit3", "hit4", "hit5"] call BIS_fnc_selectRandom;
playSound _sound;
sleep 0.5;
//check if it was friendly fire
if (side _unitHit == side _unitResponsible && side _unitResponsible == WEST) then
{
	_sound = ["friendlyfire1","friendlyfire2"] call BIS_fnc_selectRandom;
	playSound _sound;
};