/**
	the_ghosts
	get_task_by_state.sqf
	
	Description: Retreives all tasks in a mission with a specified state e.g. "completed" , "canceled"

	Parameters:
	0 - STRING - State type
	
	Returns:
	ARRAY - Of tasks with requested state

    Created by Bruce on 02/10/2016.
**/
params ["_taskState"];

private _tasksFound = [];
private _taskList = [player] call BIS_fnc_tasksUnit;
{
    if ( _taskState == ([_task] call BIS_fnc_taskState )) then {
        _tasksFound pushBack _task;
    }
} forEach _taskList;

_tasksFound
