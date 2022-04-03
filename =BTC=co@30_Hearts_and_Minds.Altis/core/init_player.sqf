btc_map_mapIllumination = ace_map_mapIllumination;
if !(isNil "btc_custom_loc") then {
    {
        _x params ["_pos", "_cityType", "_cityName", "_radius"];
        private _location = createLocation [_cityType, _pos, _radius, _radius];
        //_location setText _cityName;
    } forEach btc_custom_loc;
};
btc_intro_done = [] spawn btc_respawn_fnc_intro;


WHITELISTED = [
    "76561198047333011", // Tetlys
    "76561197992739622", // Paladin
    "76561198033215112", // TCAS
    "76561198402038100", // N0Ace
    "76561198256704117", // NoAceSecondAccount
    "76561198040185781", // Johnny
    "76561197985304352", // Remer
    "76561198029760083", // Prodegy
    "76561198010606123", // Kyle
    "76561198082213301", // Jayhova
    "76561198051408370", // Chad
    "76561198807583841"  // Cryptic
];



[{!isNull player}, {
    [] call compileScript ["core\doc.sqf"];
    execVM "scripts\empty_vehicles_marker.sqf";

    btc_respawn_marker setMarkerPosLocal player;
    player addRating 9999;
    //["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

    [player] call btc_eh_fnc_player;

    private _arsenal_trait = player call btc_arsenal_fnc_trait;
    if (btc_p_arsenal_Restrict isEqualTo 3) then {
        [_arsenal_trait select 1] call btc_arsenal_fnc_weaponsFilter;
    };
    [] call btc_int_fnc_add_actions;
    [] call btc_int_fnc_shortcuts;

    if (player getVariable ["interpreter", false]) then {
        player createDiarySubject ["btc_diarylog", localize "STR_BTC_HAM_CON_INFO_ASKHIDEOUT_DIARYLOG", '\A3\ui_f\data\igui\cfg\simpleTasks\types\talk_ca.paa'];
    };

    if (player getVariable ["Reserved", false]) then {
        if !(getplayerUID player in WHITELISTED) then {"end1" call BIS_fnc_endMission;};
    };

    switch (btc_p_autoloadout) do {
        case 1: {
            player setUnitLoadout ([_arsenal_trait select 0] call btc_arsenal_fnc_loadout);
        };
        case 2: {
            removeAllWeapons player;
        };
        default {
        };
    };

    [] call btc_respawn_fnc_screen;

    if (btc_debug) then {
        onMapSingleClick "vehicle player setPos _pos";
        player allowDamage false;

        [{!isNull (findDisplay 12)}, {
            ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw", btc_debug_fnc_marker];
        }] call CBA_fnc_waitUntilAndExecute;
    };
}] call CBA_fnc_waitUntilAndExecute;

