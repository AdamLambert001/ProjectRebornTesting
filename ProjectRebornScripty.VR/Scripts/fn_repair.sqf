/*
file: fn_repair.sqf
Auth: Wallace
Description: uses same framework of heal, instead goes for a vehicle repair.
*/
private _targetVehicle = cursorTarget;
private _unit = player;
private _initalTime = time;
private _timeToRepair = 10;

//checking if dead
if (!alive _unit) exitWith {};
if (!alive  _targetVehicle) exitWith {hint "it's destroyed!"};

//Checking if player is in a vehicle and exits if they are in it, notifys they are in a vehicle
if !(isNull objectParent _unit) exitWith {hint "You are in a vehicle!"}; //checks if player is in a a vehicle
if (_targetVehicle isKindOf "Man") exitWith {hint "Cannot repair people"}; //don't heal people
if (damage _targetVehicle isEqualTo 0) exitWith {hint "it's already fully repaired!"}; //checks if fully repaired

disableSerialization;

if (_unit distance _targetVehicle < 10) then {
	//						Title	 Type  speed show map?
	"PR_Ex_PB" cutRsc ["ExPBtitle", "PLAIN", 0, false]; //open progressBar

	for "_i" from 0 to (_timeToRepair * 4) do 
	{
		_progressBar = (uiNamespace getVariable "PR_Progress_var");
		_progressBar progressSetPosition ((time - _initalTime)/_timeToRepair); // Sets the progressBar position and fills on timeToHeal.
		if ( animationState _unit != "AinvPknlMstpSnonWnonDnon_medic_1" ) then {
	    _unit switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
    	_unit playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
		};
		uiSleep 0.25;
	};
	//waits however many seconds for the _timeToRepair
	closeDialog 0; //Closes progressbar
	_unit switchMove "";
	_targetVehicle setDamage 0; //Actually Heals player
	hint "Vehicle Repaired!"; //notify player of status.
} else {
	hint "You are too far away!";
};