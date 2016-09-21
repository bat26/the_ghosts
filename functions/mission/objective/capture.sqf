/*
    capture.sqf
    This function is used to capture enemy combatants who are of high value in a scenario

    TODO
*/

params ["_combatant"];


// Select random animation
_animation = selectRandom ["Acts_AidlPsitMstpSsurWnonDnon01","Acts_AidlPsitMstpSsurWnonDnon02","Acts_AidlPsitMstpSsurWnonDnon03","Acts_AidlPsitMstpSsurWnonDnon04","Acts_AidlPsitMstpSsurWnonDnon05","Acts_ExecutionVictim_Loop"];

// Set Captive Settings
_combatant setCaptive true;
// Remove Items
removeAllWeapons _combatant;
removeBackpack _combatant;
removeVest _combatant;
removeAllAssignedItems _combatant;
_combatant switchMove _animation; // SwitchMove to random animation
// Set unit as hurt if it's the Execution animation
if (_animation == "Acts_ExecutionVictim_Loop") then {
	_captive setDamage .5;
};
_combatant disableAI "MOVE"; // Disable AI Movement
_combatant disableAI "AUTOTARGET"; // Disable AI Autotarget
_combatant disableAI "ANIM"; // Disable AI Behavioural Scripts
_combatant allowFleeing 0; // Disable AI Fleeing
_combatant setBehaviour "Careless"; // Set Behaviour to Careless because, you know, ARMA AI.

// Add Hold Action to Free Hostage
[
/* 0 object */				        _combatant,
/* 1 action title */				"Free Hostage",
/* 2 idle icon */				"\a3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_unbind_ca.paa",
/* 3 progress icon */				"\a3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_unbind_ca.paa",
/* 4 condition to show */			"true",
/* 5 condition for action */			"true",
/* 6 code executed on start */			{},
/* 7 code executed per tick */			{},
/* 8 code executed on completion */      	{
						        if (_this select 3 select 0 == "Acts_ExecutionVictim_Loop") then {
								_this select 0 playMove "Acts_ExecutionVictim_Unbow";
							} else {
								_this select 0 switchMove "Acts_AidlPsitMstpSsurWnonDnon_out";
							};
							_complMessage = selectRandom ["I thought I was gonna die in here!","Thank you so much man.","I think I shit my pants...","Can I hug you?","I'M ALIVE.","Where the hell am I?"];
							["Hostage", _complMessage] remoteExec ["BIS_fnc_showSubtitle"];
							sleep 5.5;
							(_this select 0) enableAI "MOVE";
							(_this select 0) enableAI "AUTOTARGET";
							(_this select 0) enableAI "ANIM";
							(_this select 0) setBehaviour "SAFE";
							[(_this select 0)] joinSilent player;
							[(_this select 0),(_this select 2)] remoteExec ["bis_fnc_holdActionRemove",[0,-2] select isDedicated,true];

						},
/* 9 code executed on interruption */       {
						_intrMessage = selectRandom ["Hey! I don't wanna die here!","Don't leave me here man! Please!","THEY'RE EATING PEOPLE. GET ME OUT OF HERE.","*Mumbles* Shit shit shit..."];
						["Hostage", _intrMessage] remoteExec ["BIS_fnc_showSubtitle"];
					    },
/* 10 arguments */			    [_animation],
/* 11 action duration */		    3,
/* 12 priority */			    0,
/* 13 remove on completion */		    true,
/* 14 show unconscious */		    false
] remoteExec ["BIS_fnc_holdActionAdd",[0,-2] select isDedicated,true];