class CfgWorlds
{
	// Class of your terrain
	class MyWorld
	{
		cutscenes[] = {"GhostIntro"}; // Class names of used scenes. When more than one is present, the system will pick one randomly.
	};
};
class CfgMissions
{
	class Cutscenes
	{
		class GhostIntro // Class referenced in 'cutscenes' property in CfgWorlds
		{
			directory = "\the_ghosts\missions\ghosts_intro.Altis"; // Path to scenario with the scene
		};
	};
};