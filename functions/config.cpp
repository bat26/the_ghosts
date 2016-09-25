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
			class HelloWorld {file = "\the_ghosts\functions\misc\hello_world.sqf";};
		};

        // Scripts for units
		class Unit
		{
		    class Hit {file = "\the_ghosts\functions\unit\hit.sqf";};
		    class Death {file = "\the_ghosts\functions\unit\killed.sqf";}; //killed is a keyword in BIS namespace :o
		};

		// Scripts for missions
		class Mission
		{
		    class MissionChatter {file = "\the_ghosts\functions\mission\chatter.sqf";};
            class MissionSetup {file = "\the_ghosts\functions\mission\setup.sqf";};
            class TaskCompleted {file = "\the_ghosts\functions\mission\task_completed.sqf";};

            //objectives
            class Demolitions {file = "\the_ghosts\functions\mission\objective\demolitions.sqf";};
            class Hostage {file = "\the_ghosts\functions\mission\objective\hostage.sqf";};

		};

		// Scripts for vehicles
		class VehicleScripts
		{
			class VehicleChatter {file = "\the_ghosts\functions\vehicle\vehicle_radio.sqf";};
		};
	};
};