/*
	Addon configuration
*/
class CfgPatches
{
	// Directory under which all content contained in the PBO can be referenced ingame
	class Example_Campaign
	{
		// You can set up restrictions using these requirements
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] ={};
	};
};

class CfgMissions
{
	class Campaigns
	{
		// The campaign package
		class Example_Campaign
		{
			// Location of the campaign files. Note that it uses the defined directory in CfgPatches
			directory = "\the_ghosts\campaign\Campaign";
		};
	};
};