/*
file: fn_heal.sqf
Auth: Wallace
Description: A simple heal script that plays an animation and checks when the player is in a vehicle.
The healing will not happen when the player is in a vehicle.
*/
private _unit = player;
private _initalTime = time;
private _timeToHeal = 10;

disableSerialization;

if (!alive _unit) exitWith {};

//Checking if player is in a vehicle and exits if they are in it, notifys they are in a vehicle
if !(isNull objectParent _unit) exitWith {hint "You are in a vehicle!"};
if (damage _unit isEqualTo 0) exitWith {hint "You are on full health!"};

"PR_Ex_PB" cutRsc ["ExPBtitle", "PLAIN", 0, false]; //open progressBar

for "_i" from 0 to (_timeToHeal * 4) do 
{
	_progressBar = (uiNamespace getVariable "PR_Progress_var");
	_progressBar progressSetPosition ((time - _initalTime)/_timeToHeal); // Sets the progressBar position and fills on timeToHeal.
	if ( animationState _unit != "AinvPknlMstpSnonWnonDnon_medic_1" ) then {
    _unit switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
    _unit playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	uiSleep 0.25;
};
//waits however many seconds for the _timeToHeal
closeDialog 0; //Closes progressbar
_unit switchMove ""; //Reverts back to stanard anim
_unit setDamage 0; //Actually Heals player
hint "You have been healed"; //notify player of status.