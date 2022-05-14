/*
file: fn_saveLoadout.sqf
Auth: Wallace & Pixie Garfunkel
Description: saving players loadout

Params:
this addAction ["LD 1", "call PR_fnc_saveLoadout", 0];
this addAction ["LD 2", "call PR_fnc_saveLoadout", 1];
this addAction ["LD 3", "call PR_fnc_saveLoadout", 2];
this addAction ["LD 4", "call PR_fnc_saveLoadout", 3];
this addAction ["LD 5", "call PR_fnc_saveLoadout", 4];
*/

private _unit = player;
private _getLoadout = getUnitLoadout  _unit;
private _loadout = _unit getVariable "_loadout";
private _loadoutNum = _this select 3;

if isNil {_loadout select _loadoutNum} then {
	_loadout set [_loadoutNum, _getLoadout];
	hint "Saved Loadout";
} else {
	player setUnitLoadout (_loadout select _loadoutNum);
	hint "Loaded gear";
};

player setVariable ["_loudout", _loadout];

//hint format ["%1", _loadoutNum];


