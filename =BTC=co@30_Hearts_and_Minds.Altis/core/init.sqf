enableSaving [false, false];

[] call compileFinal preprocessFileLineNumbers "core\FireTeams\init.sqf";
[] call compileScript ["core\def\mission.sqf"];
[] call compileScript ["define_mod.sqf"];

if (isServer) then {
    [] call compileScript ["core\init_server.sqf"];
};

[] call compileScript ["core\init_common.sqf"];

if (!isDedicated && hasInterface) then {
    [] call compileScript ["core\init_player.sqf"];
};

if (!isDedicated && !hasInterface) then {
    [] call compileScript ["core\init_headless.sqf"];
};

//Guilt and Rememberance

if(isServer) then {
// set the civilian types that will act as next-of-kin
GR_CIV_TYPES = ["UK3CB_CHC_C_WORKER","UK3CB_CHC_C_CIV","UK3CB_CHC_C_PRIEST"];

// set the maximum distance from murder that next-of-kin will be spawned
GR_MAX_KIN_DIST = 3000;

// Chance that a player murdering a civilian will get an "apology" mission
GR_MISSION_CHANCE = 20;

};
