/*
file: fn_collectOrgans.sqf
Auth: Wallace & Pixie Garfunkel
Description: A gathering script of organs off dead bodies. has a chance of multiple & random types
of organs. 
*/
private _unit = player;
private _corpse = cursorObject;
private _items = player getVariable "RR_virtualItems";
private _harvestTime = 2;
private _organList = getArray(missionConfigFile >> "Organs" >> "masterOrgans" >> "allOrgans");
private _totalOrgans = [];
private _organDuplicate = false;
private _organCollected = "";

// checks if unit is dead, organ taker is not in car and the corpse is a character.
if !(isNull objectParent _unit) exitWith {hint "You are in a vehicle!"};
if !(_corpse isKindOf "Man") exitWith {hint "No organs to be found here!"};
if (alive _corpse) exitWith {hint "They're alive!"};
if (_corpse getVariable "_isHarvested") exitWith {hint "Corpse has no organs left"};

//	runs through loop with the random times. (random [2,4,5]) 
for "_organs" from 0 to (random [2,4,5])  do {
	while {_organDuplicate isEqualTo false} do {
		_organCollected = (selectRandom _organList); 
		if !(_organCollected in _totalOrgans) then { //checking if the collected organ is in the current total organs, if it isnt
			_totalOrgans pushBackUnique _organCollected; //this current element pushes into the array. Makes a check to make sure no duplicate organs
			_organDuplicate = true;
		};
	};
	_organDuplicate = false;
};

//forEach runs for each element of the array/var (in this "_totalOrgans"), 
{
	_items pushBack _x; //this current element pushes into the array.
} forEach _totalOrgans;

player setVariable ["RR_virtualItems", _items]; //setting overall/global variable

//loop animation
for "_i" from 0 to (_harvestTime * 4) do 
{
	if ( animationState _unit != "AinvPknlMstpSnonWnonDnon_medic_1" ) then {
    _unit switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
    _unit playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	uiSleep 0.25;
};

//make the body unharvestable after the original harvest.
_corpse setVariable ["_isHarvested", true];
//hint "taking organs";

hint format ["%1", _items];