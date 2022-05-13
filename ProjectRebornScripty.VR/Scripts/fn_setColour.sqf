private _getTarget = cursorTarget;
private _unit = player;

if (!alive _unit) exitWith {};
if !(isNull objectParent _unit) exitWith {hint "You are in a vehicle!"};

if (_getTarget isKindOf "LandVehicle" && {player distance _getTarget < 10}) then {
	_getTarget setObjectTextureGlobal [0, "#(argb,8,8,3)color(0.318,0.000,0.580,1.0,CO)"];
	_getTarget setObjectTextureGlobal [1, "#(argb,8,8,3)color(0.318,0.000,0.580,1.0,CO)"];
	_getTarget setObjectTextureGlobal [2, "#(argb,8,8,3)color(0.318,0.000,0.580,1.0,CO)"];
	_getTarget setObjectTextureGlobal [3, "#(argb,8,8,3)color(0.318,0.000,0.580,1.0,CO)"];
	hint "car changed to purple!";
} else {
	hint "Boats and Aircraft cannot be painted or you are too far away!";
};