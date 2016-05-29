/*
    Use this to set default attributes for the missions
*/

//disable radio chatter
enableRadio false;


//bind ghost functions to specific event handlers
{
	//ghost event handlers
	if (side _x isEqualTo WEST) then
	{
		_x addEventHandler ["Hit", {[_this select 0, _this select 1] execVM "scripts\hit.sqf";}];
		_x addEventHandler ["Killed", {[_this select 0, _this select 1] execVM "scripts\killed.sqf";}];
		_x setUnitPos "UP";
		_x enableFatigue false;
	};

	//enemies
	if (side _x isEqualTo EAST || side _x isEqualTo RESISTANCE) then
	{
		_x addEventHandler ["Killed", {[_this select 0, _this select 1] execVM "scripts\killed.sqf";}];
		_x setskill ["spotTime",0.5]; _x setskill ["spotDistance",0.15]; _x setSkill ["aimingspeed", 0.30]; _x setSkill ["aimingaccuracy", 0.17];
	};
} forEach allUnits;