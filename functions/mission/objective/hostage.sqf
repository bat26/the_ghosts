/*
    hostage.sqf
    Sets a unit as a hostage and creates an objective to free them and return them to marker

    Argument 1 - Array of Hostages
    Argument 2 - Map marker for Exfiltration point
*/

params ["_hostages", "_extractionPoint"];
private _count = 1;


{
    private _hostage = _x;
    _animation = selectRandom ["Acts_AidlPsitMstpSsurWnonDnon01","Acts_AidlPsitMstpSsurWnonDnon02","Acts_AidlPsitMstpSsurWnonDnon03","Acts_AidlPsitMstpSsurWnonDnon04","Acts_AidlPsitMstpSsurWnonDnon05"];
    _hostage switchMove _animation;

    _hostage setCaptive true;

    removeAllWeapons _hostage;
    removeBackpack _hostage;
    removeVest _hostage;
    removeAllAssignedItems _hostage;

    _hostage disableAI "MOVE";
    _hostage disableAI "AUTOTARGET";
    _hostage disableAI "ANIM";
    _hostage allowFleeing 0;
    _hostage setBehaviour "Careless";

    private _rescueTask = ["hostageMarker", _count] joinString "";
    [
        west,
        _rescueTask,
        ["Locat and free the Hostage","SAR Locate"],
        getPos _hostage,
        1,
        2,
        true
    ] call BIS_fnc_taskCreate;

    [
        _hostage,
        "Release",
        "\a3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_unbind_ca.paa",
        "\a3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_unbind_ca.paa",
        "_this distance _target < 2",
        "_caller distance _target < 2",
        {},
        {},
        {

            _hostage = _this select 0;
            _hostageAnim = _this select 3 select 0;
            _hostageTask = _this select 3 select 1;
            _evacPoint = _this select 3 select 2;
            _evacPoint = _evacPoint call CBA_fnc_getPos;


             if (_hostageAnim == "Acts_ExecutionVictim_Loop") then {
                    _hostage playMove "Acts_ExecutionVictim_Unbow";
                } else {
                   _hostage switchMove "Acts_AidlPsitMstpSsurWnonDnon_out";
                };

            ["hostage"] call GhostFunctions_fnc_TaskCompleted;
            [_hostageTask, _evacPoint] call BIS_fnc_taskSetDestination;
            [_hostageTask, ["Evacuate Hostage to this position", "SAR Evac", _evacPoint]] spawn BIS_fnc_taskSetDescription;
            [_hostageTask, "ASSIGNED"] spawn BIS_fnc_taskHint;

            ( _hostage) enableAI "MOVE";
            ( _hostage) enableAI "AUTOTARGET";
            ( _hostage) enableAI "ANIM";
            ( _hostage) setBehaviour "SAFE";
            _hostage setCaptive false;
            [( _hostage)] joinSilent player;
            [( _hostage),(_this select 2)] remoteExec ["bis_fnc_holdActionRemove",[0,-2] select isDedicated,true];

            //create a frame handler to check if the hostage reaches the evac point, this is better than using a trigger
            [{
                (_this select 0) params ["_hostage", "_evacPoint", "_hostageTask"];

                if (_hostage distanceSqr _evacPoint < 15) then {
                    [_hostageTask, "SUCCEEDED",true] spawn BIS_fnc_taskSetState;
                    [_this select 1] call CBA_fnc_removePerFrameHandler;
                    [( _hostage)] joinSilent grpNull;
                };
            }, 5, [_hostage, _evacPoint,_hostageTask]] call CBA_fnc_addPerFrameHandler;

        },
        {},
        [_animation, _rescueTask, _extractionPoint],
        5,
        0,
        true,
        false
    ] remoteExec ["BIS_fnc_holdActionAdd",[0,-2] select isDedicated, true];

    _count = _count +1;

} forEach _hostages;