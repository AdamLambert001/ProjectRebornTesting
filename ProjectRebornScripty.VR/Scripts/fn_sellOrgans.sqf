/*
file: fn_sellOrgans.sqf
Auth: Wallace
Description: sells said organs to the sign post in mission. Returns a sell value and clears the var.
*/

private _items = player getVariable "RR_virtualItems";
private _sellingItems = _items;
private _totalProfit = 0;
private _soldOrgans = [];

//sell the organs across from collection script.
for "_i" from 0 to (count _items) - 1 do 
{
	_totalProfit = _totalProfit + getNumber ((_items select _i) >> "price");
	//_sellingItems = _sellingItems + getText ((_items select _i) >> "displayname"); Try and pull item name
	_soldOrgans pushBack (_items select _i); //prepare wipe of array
};

//reset the variable so sold items are gone.
_items = _items - _soldOrgans;

player setVariable ["RR_virtualItems", _items];

//Notify mad profit
hint format ["Sold for £%1 %2", _totalProfit, _sellingItems];




//inspiration of this hell
/*_array = [];
for "_i" from 0 to 3 do
{
	for "_i" from 0 to 3 do
	{
		_array pushBack _i;
	};
	_array pushBack _i;
};
hint str _array;


( getNumber (missionConfigFile >> "" >> "killStreak2" >> "xp") );

for "_organs" from 2 to (random [2,4,5]) do {
	_items pushBack (missionConfigFile >> "Organs" >> (selectRandom _organList));
	player setVariable ["RR_virtualItems", _items];
};

*/