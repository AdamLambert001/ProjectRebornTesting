/*
file: fn_earplug.sqf
Auth: Wallace
Description: A very simple earplug script.
			 Done with a addAction on a player :)
*/

if (soundVolume isEqualTo 1) then {
	1 fadeSound 0.2;
	hint "Earplugs in!";
} else {
	1 fadeSound 1;
	hint "Earplugs out! Let the tinnitus kick in!";
};