/**
	the_ghosts / nvgoggles
	
	Description: Adds NV goggles to specified unit, if it is night time.
	
	Parameters:
	0 - OBJ - unit that will have goggles added

	Returns:
	void

    Created by Bruce on 30/10/2016.
**/

params ["_unit"];

if ((serverTime < 6.5) || (serverTime > 20)) then {
     _unit addItem "NVGoggles";
     _unit assignItem "NVGoggles";
     _unit action["NVGoggles", _unit];
}
