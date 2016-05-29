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
	_mandown = ["tm1_killed_team1","tm1_killed_team2", "tm1_killed_team3", "tm2_killed_team1", "tm2_killed_team2", "tm2_killed_team3"] call BIS_fnc_selectRandom;
	playSound _mandown;
	sleep 1;
	_sadmusic = ["Death1","Death2","Death3", "Death4", "Death5"] call BIS_fnc_selectRandom;
	playMusic [_sadmusic, 0];
};