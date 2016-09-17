/*
    Hit.sqf
    This function provides effects when a unit is hit either by enemy / friendly shots
*/
params ["_unitHit", "_unitResponsible"];
private _sound = "";

//check if unit damaged itself, if so then exit
if (_unitHit isEqualTo _unitResponsible ) exitWith {};

//check if unit hit is vehicle, if so then exit
if (!isNull objectParent _unitHit) exitWith {};

//TODO figure out a way to variate sounds between different male sound classes e.g. tm1, tm2, tm3
//assign hit sound from random selection of available sounds
_sound = selectRandom ["tm1_wounded_self1","tm1_wounded_self2","tm1_wounded_self3", "tm1_wounded_self4", "tm1_wounded_self5","tm1_wounded_self6","tm1_wounded_self7","tm1_wounded_self8", "tm1_wounded_self9", "tm1_wounded_self10", "tm1_wounded_self11","tm1_wounded_self12","tm1_wounded_self13","tm1_wounded_self14","tm1_wounded_self15", "tm1_wounded_self16", "tm1_wounded_self17", "tm1_wounded_self18"];
_unitHit say _sound;
sleep 0.5;

//check if it was friendly fire else play radio chatter
if (side _unitHit isEqualTo side _unitResponsible && side _unitResponsible isEqualTo WEST) then
{
	_sound = selectRandom ["tm1_ff_generic1","tm1_ff_generic2","tm1_ff_generic3"];
	playSound _sound;
}
else
{
	_sound = selectRandom ["tm1_wounded_team1","tm1_wounded_team2", "tm1_wounded_team3"];
	playSound _sound;
}