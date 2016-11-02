/**
	the_ghosts / mission_tasks_completed.sqf

	Description: Gets all tasks from the mission and checks if they are in a completed state
                 The completed states are : failed, succeeded, canceled

	Parameters:

	Returns:
	BOOL

    Created by Bruce on 02/10/2016.
**/
private _taskList = [player] call BIS_fnc_tasksUnit;
private _taskStates = ["failed", "succeeded", "canceled"];
private _tasksComplete = true;

{
    params ["_task"];

    if !(_task call BIS_fnc_taskState in _taskStates) then {
        _tasksComplete = false;
    }
} forEach _taskList;

_tasksComplete
