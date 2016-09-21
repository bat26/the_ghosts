/*
    demolitions.sqf
    This function sets up a Demolitions marker, task and provides the demo interaction with the object it is bound to
*/
params ["_targets", "_targetDescription"];
private _count = 1;

//loop through however many targets are set as demolitions objectives
{
        //set variable from magic loop var "x"
        private _thisTarget = _x;

        if(_thisTarget isKindOf "Tank") then {
            _thisTarget setVehicleLock "LOCKED";
        };

        //create map marker
        private _demoMarker = createMarker ["demoMarker" + toString[_count], position _thisTarget];
        _demoMarker setMarkerType "hd_destroy";

        //create demolitions task
        private _demoTask = ["demoMarker", _count] joinString "";
        [west,
        _demoTask,
        [_targetDescription,"Demolition"],
        getMarkerPos _demoMarker,
        1,
        2,
        true] call BIS_fnc_taskCreate;

        //create demolitions interaction - TODO create icon for demolitions
        [
        _thisTarget,
        _targetDescription,
        "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
        "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
        "_this distance _target < 4",
        "_caller distance _target < 4",
        {},
        {},
        {[_this select 3 select 0, "SUCCEEDED",true] spawn BIS_fnc_taskSetState;},
        {},
        [_demoTask],
        10,
        0,
        true,
        false
    ] call BIS_fnc_holdActionAdd;

    _count = _count +1;

} forEach _targets;