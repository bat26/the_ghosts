/*
    Hit.sqf
    This function provides effects when a unit is killed
*/
params ["_unit", "_killer"];

playSound selectRandom ["tm1_killed_self1","tm1_killed_self2","tm1_killed_self3", "tm1_killed_self4", "tm1_killed_self5","tm1_killed_self6","tm1_killed_self7",
    "tm1_killed_self8", "tm1_killed_self9", "tm1_killed_self10", "tm1_killed_self11","tm1_killed_self12","tm1_killed_self13"];
sleep 1;

    if !(side group _killer isEqualTo WEST ) then
    {
        playSound selectRandom ["tm1_killed_team1","tm1_killed_team2", "tm1_killed_team3", "tm2_killed_team1", "tm2_killed_team2", "tm2_killed_team3"];
        sleep 1;
        playMusic selectRandom ["Death1","Death2","Death3", "Death4", "Death5", "Death6"];
        sleep 1;
    }
    else
    {
        playSound selectRandom ["tm1_enemy_killed_generic1","tm1_enemy_killed_generic2", "tm1_enemy_killed_generic3", "tm1_enemy_killed_generic4", "tm1_enemy_killed_generic5",
        "tm2_enemy_killed_generic1","tm2_enemy_killed_generic2", "tm2_enemy_killed_generic3", "tm2_enemy_killed_generic4", "tm2_enemy_killed_generic5",
        "tm3_enemy_killed_generic1","tm3_enemy_killed_generic2", "tm3_enemy_killed_generic3", "tm3_enemy_killed_generic4", "tm3_enemy_killed_generic5"
        ];
        sleep 1;
    };