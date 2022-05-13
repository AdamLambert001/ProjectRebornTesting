player setVariable ["_loadout", [nil, nil, nil, nil, nil]];
player addAction ["earplugs", "call PR_fnc_earplug"];
				//	title		caller 				id
/*this addAction ["LD 1", "call PR_fnc_saveLoadout", 0];
this addAction ["LD 2", "call PR_fnc_saveLoadout", 1];
this addAction ["LD 3", "call PR_fnc_saveLoadout", 2];
this addAction ["LD 4", "call PR_fnc_saveLoadout", 3];
this addAction ["LD 5", "call PR_fnc_saveLoadout", 4];*/
player addAction ["unflip", "call PR_fnc_unflip"];
player addAction ["repair", "call PR_fnc_repair"];
player addAction ["heal", "call PR_fnc_heal"];