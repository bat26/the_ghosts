/*
    chatter.sqf
    This function provides sounds effects causing the squad to begin chatting at the start of the mission to add some ambience
*/

params ["_scenario"];
private _conversation1 = [];
private _conversation2 = [];

switch (_scenario) do
{
    case "normal": {
            _conversation1 = ["tm1_start1a", "tm2_start1a"] call BIS_fnc_selectRandom;
            _conversation2 = ["tm1_start1b", "tm2_start1b"] call BIS_fnc_selectRandom;
    };
    default { hint "Cannot find chatter for this scenario" };
};
playSound [_conversation1, true];
sleep 1;
playSound [_conversation2, true];
