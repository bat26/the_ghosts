/**
	the_ghosts / eliminate

	Description: Creates kill/destroy task(s)

	Parameters:
	0 - ARRAY - targets to eliminate
	1 - STRING - map marker name for the safe zone

	Returns:
	ARRAY - _objectivesCreated

    Created by Bruce on 06/10/2016.
**/

params ["_targets"];
private _count = 1;
private _objectivesCreated = [];

{
    //element in targets array
    private _target = _x;

    //check if target is group leader or in group? //TODO

    //create eliminate task for this target
    private _eliminateTask = ["eliminateTask", _count] joinString "";
    [
        west,
        _eliminateTask,
        ["Eliminate hostile forces","Neutralise"],
        getPos _target,
        1,
        2,
        true
    ] call BIS_fnc_taskCreate;

   _eliminateTrigger = createTrigger ["EmptyDetector", [0,0,0], true];
   _eliminateTrigger setTriggerArea [0, 0, 0, false];
   _eliminateTrigger setTriggerActivation ["NONE", "present", true];
   _eliminateTrigger setTriggerTimeout [0, 0, 0, true];
   _formCondition = format ["{ alive _x } count units group %1 == 0",_target];
   _formStatement = format ["[""%1"", ""SUCCEEDED"",true] spawn BIS_fnc_taskSetState; [""generic""] call GhostFunctions_fnc_taskCompleted;",_eliminateTask];
   _eliminateTrigger setTriggerStatements [_formCondition, _formStatement , ""];
   _count = _count +1;
   _objectivesCreated pushBack _eliminateTask;


} forEach _targets;
_objectivesCreated