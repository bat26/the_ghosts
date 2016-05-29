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

        // Scripts for Units
		class Unit
		{

		    class Hit {file = "\the_ghosts\functions\unit\hit.sqf";};








		}
	};
};