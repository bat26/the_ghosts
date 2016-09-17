/*
    vehicle_radio.sqf
    Creates radio chatter for the given vehicle
*/
params ["_vehicle"];

//because spawn starts a new thread outside the scope of this call, you need to pass any variables in the function call through here
[_vehicle] spawn {
	params [["_vehicle", objNull]];
	if (_vehicle isEqualTo objNull) exitWith { hint "You tried to add radio chatter to a vehicle that doesn't exist";}; //null check

    _loop = true;
    _radioChatter = ["helicopter_radio1", "helicopter_radio2", "helicopter_radio3", "helicopter_radio4", "helicopter_radio5", "helicopter_radio6",
        "helicopter_radio7", "helicopter_radio8", "helicopter_radio9", "helicopter_radio10", "helicopter_radio11", "helicopter_radio12",
        "helicopter_radio13", "helicopter_radio14", "helicopter_radio15", "helicopter_radio16", "helicopter_radio17", "helicopter_radio18",
        "helicopter_radio19", "helicopter_radio20"];
    while {_loop} do
    {
    	//check if player is inside a vehicle
    	_playerDistance = player distance _vehicle;
    	if (_playerDistance < 4) then {
	        sleep 10 + random 5;
	        (0 fadeMusic 0.2);
	        _randomRadioChatter = selectRandom _radioChatter;
	        _vehicle say3D [_randomRadioChatter, 1];
    	};
    };
};