/*
    Hit.sqf
    This function provides effects when a unit killed
*/

_unit = _this select 0;
_killer = _this select 1;

if (side _killer isEqualTo WEST) then
{
	_sound = ["tangodown1","tangodown2","tangodown3"] call BIS_fnc_selectRandom;
	playSound _sound;
};
if (side _killer isEqualTo EAST || side _killer isEqualTo RESISTANCE || side _unit isEqualTo WEST) then
{
	_sound = ["incapacitated1","incapacitated2","incapacitated3"] call BIS_fnc_selectRandom;
	playSound _sound;
	sleep 1;
	_mandown = ["mandown1","mandown2"] call BIS_fnc_selectRandom;
	playSound _mandown;
	sleep 1;
	_sadmusic = ["rainbowdown1","rainbowdown2","rainbowdown3"] call BIS_fnc_selectRandom;
	playMusic [_sadmusic, 0];
};