/*
   This function provides effects when completed tasks e.g. playing a sound when a task is done
*/

params ["_taskType"];

    switch (_taskType) do {
        case "demo":
            {
                playSound selectRandom ["tm1_objective_demo1", "tm2_objective_generic1",  "tm3_objective_generic1"];
            };
        case "hostage":
            {
                playSound selectRandom ["tm1_objective_hostage1", "tm2_objective_hostage1",  "tm3_objective_hostage1"];
            };
        case "reached":
            {
                playSound selectRandom ["tm1_objective_location1", "tm2_objective_location1",  "tm3_objective_location1"];
            };
        case "prisoner":
            {
                playSound selectRandom ["tm1_objective_prisoner1", "tm2_objective_prisoner1",  "tm3_objective_prisoner1"];
            };
        case "generic":
            {
                playSound selectRandom ["tm1_objective_generic1", "tm2_objective_generic1",  "tm3_objective_generic1"];
            };
        default
            {
                playSound selectRandom ["tm1_objective_generic1", "tm2_objective_generic1",  "tm3_objective_generic1"];
            };
    };