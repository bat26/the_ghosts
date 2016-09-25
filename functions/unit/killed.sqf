/*
    Hit.sqf
    This function provides effects when a unit is killed
*/
params ["_unitKilled", "_killer"];

switch (side group _unitKilled) do {

    case west:
        {
            private _deathSound = selectRandom ["tm1_killed_self1","tm1_killed_self2","tm1_killed_self3", "tm1_killed_self4", "tm1_killed_self5","tm1_killed_self6","tm1_killed_self7",
                "tm1_killed_self8", "tm1_killed_self9", "tm1_killed_self10", "tm1_killed_self11","tm1_killed_self12","tm1_killed_self13"];
            _unitKilled say3D [_deathSound,50,1];

            playSound selectRandom ["tm1_killed_team1","tm1_killed_team2", "tm1_killed_team3", "tm2_killed_team1", "tm2_killed_team2", "tm2_killed_team3"];
            sleep 1;
            playMusic selectRandom ["Death1","Death2","Death3", "Death4", "Death5", "Death6"];
            sleep 1;
        };

    case east:
        {
            private _enemyDeathSound = selectRandom ["em1_killed1","em1_killed2","em1_killed3", "em1_killed4", "em1_killed5","em1_killed6","em1_killed7",
            "em1_killed8", "em1_killed9", "em1_killed10", "em1_killed11","em1_killed12","em1_killed13", "em1_killed14"];
            _unitKilled say3D [_enemyDeathSound,50,1];

            if (side _killer isEqualTo WEST) then {
                playSound selectRandom ["tm1_enemy_killed_generic1","tm1_enemy_killed_generic2", "tm1_enemy_killed_generic3", "tm1_enemy_killed_generic4", "tm1_enemy_killed_generic5",
                "tm2_enemy_killed_generic1","tm2_enemy_killed_generic2", "tm2_enemy_killed_generic3", "tm2_enemy_killed_generic4", "tm2_enemy_killed_generic5",
                "tm3_enemy_killed_generic1","tm3_enemy_killed_generic2", "tm3_enemy_killed_generic3", "tm3_enemy_killed_generic4", "tm3_enemy_killed_generic5"
                ];
            }
        };

    default
        {
        };
};