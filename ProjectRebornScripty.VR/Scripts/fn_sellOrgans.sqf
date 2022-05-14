/*
file: fn_sellOrgans.sqf
Auth: Wallace
Description: sells said organs to the sign post in mission. Returns a sell value and clears the var.
*/

private _items = player getVariable "RR_virtualItems";
private _sellingItems = _items;
private _totalProfit = 0;
private _sellingPrice = 0;
private _sellingName = "";
private _soldOrgans = [];

//sell the organs across from collection script.
{
	if isClass(missionConfigFile >> "Organs" >> _x) then {
		_sellingPrice = getNumber(missionConfigFile >> "Organs" >> _x >> "price");
		_sellingName = getText(missionConfigFile >> "Organs" >> _x >> "displayname");
		_totalProfit = _totalProfit + _sellingPrice;
		_soldOrgans pushBack _x; //prepare wipe of array
	};
} forEach _items;

if (_soldOrgans isEqualTo []) exitWith {hint "No Organs to sell"};
//reset the variable so sold items are gone.
_items = _items - _soldOrgans;

player setVariable ["RR_virtualItems", _items];

//Notify mad profit
hint format ["Sold %1 for £%2",_sellingName, _totalProfit];