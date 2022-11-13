
[compileScript ["core\init.sqf"]] call CBA_fnc_directCall;


//EDEN - ARSENAL 
[] call compileFinal preprocessFileLineNumbers "scripts\rolearsenal.sqf";

ARSENAL_CRATES = [];
Arsenal_typename = "C_supplyCrate_F"; // CONFIG - ARSENAL TYPE

[Arsenal_typename, "init",
{
    private _box = (_this select 0);
    private _player = player;

    diag_log format ["ROLE ARSENAL EH Role: %1", roleDescription _player];


    ARSENAL_CRATES pushback _box;
    [roleArsenal, [_box, _player], 5] call CBA_fnc_waitAndExecute;
},
true,
[],
true
] call CBA_fnc_addClassEventHandler;