/*
file: fn_heal.sqf
Auth: Wallace
Description: A simple heal script that plays an animation and checks when the player is in a vehicle.
The healing will not happen when the player is in a vehicle.
*/
private _unit = player;
private _timeToHeal = 10;

if (!alive _unit) exitWith {};

//Checking if player is in a vehicle and exits if they are in it, notifys they are in a vehicle
if !(isNull objectParent _unit) exitWith {hint "You are in a vehicle!"};
if (damage _unit isEqualTo 0) exitWith {hint "You are on full health!"};  

for "_i" from 0 to (_timeToHeal * 4) do 
{
	if ( animationState _unit != "AinvPknlMstpSnonWnonDnon_medic_1" ) then {
    _unit switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
    _unit playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	uiSleep 0.25;
};
//waits 5 seconds then cancels current anim and heals player.

_unit switchMove "";
_unit setDamage 0;
//notify player of status.
hint "You have been healed";