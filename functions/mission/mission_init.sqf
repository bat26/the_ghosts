/**
	the_ghosts / mission_init
	
	Description: This script sets up various features for Ghost missions
	
	Parameters:

	Returns:
    void

    Created by Bruce on 02/10/2016.
**/

//disable radio chatter
enableRadio false;


//bind ghost functions to specific event handlers
{
    private _unit = _x;
	//ghost event handlers
	if (side _unit isEqualTo WEST) then
	{
		[_unit, "GhostPatchGreen"] call BIS_fnc_setUnitInsignia;
		_unit addEventHandler ["Hit", {[_this select 0, _this select 1] spawn GhostFunctions_fnc_hit;}];
	};
	_unit addEventHandler ["Killed", {[_this select 0, _this select 1] spawn GhostFunctions_fnc_death;}];
    _unit setUnitPos "UP";

} forEach allUnits;

//create a watcher to check the state of tasks in the mission
[{
    if (call GhostFunctions_fnc_missionTasksCompleted) then {
        "end1" call BIS_fnc_endMission;
    }
}, 15, []] call CBA_fnc_addPerFrameHandler;
