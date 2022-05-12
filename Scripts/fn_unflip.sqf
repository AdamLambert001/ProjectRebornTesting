/*
file: fn_unflip.sqf
Auth: Wallace
Description: An unflip script, used on land vehicles.
*/
private _getVehicle = cursorTarget;
private _getVehLoc = getPosASL _getVehicle;

if (_getVehicle isKindOf "LandVehicle") then 
{
	_getVehicle allowDamage false;
	_getVehicle setVectorUp surfaceNormal position _getVehicle;
	_getVehicle setPosASL _getVehLoc;
	uiSleep 1;
	_getVehicle allowDamage true;
	hint "Vehicle Flipped!";
} else {
	hint "You are not looking at a vehicle!";
};