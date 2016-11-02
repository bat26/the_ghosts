class CfgPatches
{
    class Ghost_Functions
    {
        units[] = {};
        weapons[] = {};
        requiredVersion = 0.1;
        requiredAddons[] = {};
    };
};

class CfgFunctions
{
	class GhostFunctions
	{
	    // Test scripts
		class Test
		{
			class helloWorld {file = "\the_ghosts\functions\misc\hello_world.sqf";};
		};

        // Scripts for units
		class Unit
		{
		    class hit {file = "\the_ghosts\functions\unit\hit.sqf";};
		    class death {file = "\the_ghosts\functions\unit\killed.sqf";}; //killed is a keyword in BIS namespace :o

            class nvgoggles {file = "\the_ghosts\functions\unit\nvgoggles.sqf";}; //adds nvgoggles to unit if its dark

		};

		// Scripts for missions
		class Mission
		{
            class missionInit {file = "\the_ghosts\functions\mission\mission_init.sqf";};

            //mission objectives
            class demolition {file = "\the_ghosts\functions\mission\objective\demolitions.sqf";};
            class hostage {file = "\the_ghosts\functions\mission\objective\hostage.sqf";};
            class eliminate {file = "\the_ghosts\functions\mission\objective\eliminate.sqf";};
		};

        // Script driven sounds for in mission
		class Sound
		{
		    class ghostConversation {file = "\the_ghosts\functions\mission\sound\ghost_conversation.sqf";};
            class ghostMissionStart {file = "\the_ghosts\functions\mission\sound\ghost_mission_start.sqf";};
            class ghostTaskCompleted {file = "\the_ghosts\functions\mission\sound\ghost_task_completed.sqf";};
		};

		// Scripts for tasks
		class Tasks
		{
            class missionTasksCompleted {file = "\the_ghosts\functions\mission\tasks\mission_tasks_completed.sqf";};
            class getTasksByState {file = "\the_ghosts\functions\mission\tasks\get_tasks_by_state.sqf";};
		};

		// Scripts for vehicles
		class VehicleScripts
		{
			class vehicleRadio {file = "\the_ghosts\functions\vehicle\vehicle_radio.sqf";};
		};
	};
};