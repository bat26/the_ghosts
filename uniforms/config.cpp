class CfgPatches
{
    class Ghost_Units
    {
        units[] = {};
        weapons[] = {};
        requiredVersion = 0.1;
        requiredAddons[] = {};
    };
};
class CfgVehicles
{
	class B_Soldier_base_F;

    class Ghost_Woodland_1: B_Soldier_base_F
	{
		scope = 1;
		model = "\A3\Characters_F_Beta\INDEP\ia_soldier_01.p3d";
		hiddenSelections[] = {"camo","insignia"};
		hiddenSelectionsTextures[] = {"\the_ghosts\uniforms\data\woodland_bdu.paa"};
	};
	class Ghost_Woodland_2: B_Soldier_base_F
	{
		scope = 1;
		model = "\A3\Characters_F_Beta\INDEP\ia_soldier_02.p3d";
		hiddenSelections[] = {"camo","insignia"};
		hiddenSelectionsTextures[] = {"\the_ghosts\uniforms\data\woodland_bdu.paa"};
	};
};

class cfgWeapons
{
	class HeadgearItem;
	class ItemInfo;
	class ItemCore;
	class UniformItem;
	
	class Uniform_Base: ItemCore
	{
		class ItemInfo;
	};
	
	class ItemCore : ItemCore
	{
		armor = "0";
		passThrough = 0;
	};

	class Default;	// External class reference
    class Binocular;	// External class reference
    //full night vision
    class NVGoggles : Binocular {
        modelOptics = "";
    };
    class NVGoggles_INDEP : NVGoggles {
        modelOptics = "";
    };
    class NVGoggles_OPFOR : NVGoggles {
        modelOptics = "";
    };

    //
    // Woodland Kit
    //
    class Ghost_Uniform_Woodland_1: Uniform_Base
    {
        scope = 2;
        displayName = "Ghost Woodland Uniform 1";
        picture = "\the_ghosts\goc_logo.paa";
        model = "\A3\Characters_F\Common\Suitpacks\suitpack_blufor_diver";
        author = "ecurb";
        class ItemInfo: UniformItem
        {
            uniformModel = "-";
            uniformClass = "Ghost_Woodland_1";
            containerClass = "Supply60";
            mass = 40;
        };
    };
    class Ghost_Uniform_Woodland_2: Uniform_Base
    {
        scope = 2;
        displayName = "Ghost Woodland Uniform 2";
        picture = "\the_ghosts\goc_logo.paa";
        model = "\A3\Characters_F\Common\Suitpacks\suitpack_blufor_diver";
        author = "ecurb";
        class ItemInfo: UniformItem
        {
            uniformModel = "-";
            uniformClass = "Ghost_Woodland_2";
            containerClass = "Supply60";
            mass = 40;
        };
    };

    class Ghost_Helmet_Woodland: ItemCore
    {
        scope = 2;
        displayName = "Ghost PASGT Woodland";
        picture = "\the_ghosts\goc_logo.paa";
        model = "\A3\Characters_F_Beta\INDEP\headgear_helmet_canvas";
        author = "ecurb";
        hiddenSelections[] = {"camo"};
        hiddenSelectionsTextures[] = {"\the_ghosts\uniforms\data\woodland_helmet.paa"};
        class ItemInfo: HeadgearItem
        {
            mass = 40;
            allowedSlots[] = {901,605};
            uniformModel = "\A3\Characters_F_Beta\INDEP\headgear_helmet_canvas.p3d";
            modelSides[] = {2,3};
            armor = 4;
            passThrough = 0.5;
        };
    };

    class Ghost_Boonie_Helmet: ItemCore
    {
        scope = 2;
        displayName = "Ghost Boonie Woodland";
        model = "\A3\Characters_F\Common\booniehat";
        author = "ecurb";
        picture = "\the_ghosts\goc_logo.paa";
        hiddenSelections[] = {"camo"};
        hiddenSelectionsTextures[] = {"\the_ghosts\uniforms\data\woodland_boonie.paa"};
        class ItemInfo: HeadgearItem
        {
            mass = 10;
            allowedSlots[] = {801,901,701,605};
            uniformModel = "\A3\Characters_F\Common\booniehat";
            modelSides[] = {6};
            armor = 1;
            passThrough = 0;
        };
    };
		
}