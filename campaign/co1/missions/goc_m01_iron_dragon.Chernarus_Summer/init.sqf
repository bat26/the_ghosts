_dateTime = format ["%1/%2/%3 %4", (date select 0), (date select 1), (date select 2), ([dayTime, "HH:MM"] call BIS_fnc_timeToString)];
_mission = briefingName;

enableRadio false;
showHUD [true,true,false,false,true,true,true,true];

[ghost_helo] call GhostFunctions_fnc_VehicleChatter;

titleCut ["", "BLACK FADED", 999];
	[] Spawn {
	waitUntil{!(isNil "BIS_fnc_init")};

	[
	  "<t align='center' size='2'>Operation " + briefingName + "<t/>"
	  ,0 
	  ,0
	  ,3
	  ,1
	] 
	call BIS_fnc_DynamicText;
	//playMusic ["KitMusic",100]; 

	[
	  "<t align='center' size='1'>Neutralise the Insurgent supplies, clear out their encampment and capture their commander.<t/>"
	  ,0 
	  ,0
	  ,4
	  ,1
	] 
	call BIS_fnc_DynamicText;

	
	// Info text
	[str (worldName), str(date select 1) + "." + str(date select 2) + "." + str(date select 0)] spawn BIS_fnc_infoText;

	sleep 4;
	"dynamicBlur" ppEffectEnable true;   
	"dynamicBlur" ppEffectAdjust [6];   
	"dynamicBlur" ppEffectCommit 0;     
	"dynamicBlur" ppEffectAdjust [0.0];  
	"dynamicBlur" ppEffectCommit 5;  
	playMusic "";
	titleCut ["", "BLACK IN", 5];
	};
	
//bind ghost functions to specific event handlers
{
	//ghost event handlers
	if (side _x isEqualTo WEST) then
	{
		[_x,"GhostPatch_OD"] call BIS_fnc_setUnitInsignia;
		_x setUnitPos "UP";
	};
	_x addEventHandler ["Hit", {[_this select 0, _this select 1] spawn GhostFunctions_fnc_Hit;}];
	_x addEventHandler ["Killed", {[_this select 0, _this select 1] spawn GhostFunctions_fnc_Death;}];
} forEach allUnits;
	
	
	
task_1 = player createSimpleTask ["Demo"];
task_1 setSimpleTaskDescription ["TASK DESCRIPTION","Demolitions","Ammo dump"];
task_1 setSimpleTaskDestination (getMarkerPos "demo_1");
task_1 setTaskState "Assigned";
player setCurrentTask task_1;

task_2 = player createSimpleTask ["Clear"];
task_2 setSimpleTaskDescription ["TASK DESCRIPTION","Clear","Camp"];
task_2 setSimpleTaskDestination (getMarkerPos "clear_1");
task_2 setTaskState "Assigned";