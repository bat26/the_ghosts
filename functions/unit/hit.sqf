/*
    Hit.sqf
    This function provides effects when a unit is hit either by enemy / friendly shots
*/
params ["_unitHit", "_unitResponsible"];

//check if unit damaged itself, if so then exit
if (_unitHit isEqualTo _unitResponsible ) exitWith {};

//check if unit hit is vehicle, if so then exit
if (!isNull objectParent _unitHit) exitWith {};

if (side _unitHit isEqualTo WEST) then {

    private _woundedSound = selectRandom ["tm1_wounded_self1","tm1_wounded_self2","tm1_wounded_self3", "tm1_wounded_self4", "tm1_wounded_self5","tm1_wounded_self6","tm1_wounded_self7","tm1_wounded_self8", "tm1_wounded_self9", "tm1_wounded_self10", "tm1_wounded_self11","tm1_wounded_self12","tm1_wounded_self13","tm1_wounded_self14","tm1_wounded_self15", "tm1_wounded_self16", "tm1_wounded_self17", "tm1_wounded_self18"];
    _unitHit say3D [_woundedSound,50,1];

        if (side _unitResponsible isEqualTo WEST) then {
            playSound selectRandom ["tm1_ff_generic1","tm1_ff_generic2","tm1_ff_generic3", "tm2_ff_generic1","tm2_ff_generic2","tm2_ff_generic3", "tm3_ff_generic1","tm3_ff_generic2","tm3_ff_generic3"];
        } else {
            playSound selectRandom ["tm1_wounded_team1","tm1_wounded_team2", "tm1_wounded_team3", "tm1_wounded_team1","tm1_wounded_team2", "tm1_wounded_team3", "tm3_wounded_team1","tm3_wounded_team2", "tm3_wounded_team3"];
        };

} else {
private _enemyWoundedSound = selectRandom ["em1_wounded1","em1_wounded2","em1_wounded3", "em1_wounded4", "em1_wounded5","em1_wounded6","em1_wounded7","em1_wounded8", "em1_wounded9", "em1_wounded10", "em1_wounded11","em1_wounded12"];
_unitHit say3D [_enemyWoundedSound,50,1];

};