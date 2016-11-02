/**
	the_ghosts / ghost_objective
	
	Description: Plays ghost communication sounds in the game
	
	Parameters:
	0 - STRING - Ghost type e.g. male_01, male_02, female_01
	1 - STRING - Ghost Action e.g. objective, chatter
	
	Returns:
	void

    Created by Bruce on 02/10/2016.
**/
params ["_scenario"];

private _conversation1 = [];
private _conversation2 = [];

switch (_scenario) do
{
    case "normal": {
            _conversation1 = ["tm1_start1a", "tm2_start1a"] call BIS_fnc_selectRandom;
            _conversation2 = ["tm1_start1b", "tm2_start1b"] call BIS_fnc_selectRandom;
    };
    case "night": {
            _conversation1 = ["tm1_start2a", "tm2_start2a"] call BIS_fnc_selectRandom;
            _conversation2 = ["tm1_start2b", "tm2_start2b"] call BIS_fnc_selectRandom;
    };
    case "armour": {
            _conversation1 = ["tm1_start3a", "tm2_start3a"] call BIS_fnc_selectRandom;
            _conversation2 = ["tm1_start3b", "tm2_start3b"] call BIS_fnc_selectRandom;
    };
    default { hint "Cannot find chatter for this scenario" };
};
waitUntil {playSound [_conversation1, true];};
sleep 2;
waitUntil {playSound [_conversation2, true];};
