//PLAYER SIXSIX and ODIN WHITELIST

WHITELISTED = [
    // DEVS
    "76561198047333011", //Tetlys
    // ADMIN   
    "76561198128972595", //ADMIN AcidPANTALONES
    "76561198029603889", //ADMIN ArkashaLethal
    "76561198802639523", //ADMIN Barrett
    "76561198025193393", //ADMIN Captain Chuck 1
    "76561198299375049", //ADMIN ChaoticVayne
    "76561198048029351", //ADMIN cg.fu
    "76561197966129199", //ADMIN daedone
    "76561198060737637", //ADMIN DevotedLynx/Lynx Australis
    "76561198042579023", //ADMIN Fleur
    "76561197960548388", //ADMIN GimliTron
    "76561198043834889", //ADMIN Gman
    "76561198066834077", //ADMIN Haruko
    "76561198040185781", //ADMIN JohnnyOmaha
    "76561198009578451", //ADMIN Karmakut
    "76561198024729279", //ADMIN LtDanUSAFX3
    "76561197970792840", //ADMIN Merrick362
    "76561198091844639", //ADMIN MeatPony
    "76561198870892912", //ADMIN Mooskle
    "76561198202157540", //ADMIN Paladinn
    "76561197999232291", //ADMIN Prowlaz
    "76561198010961319", //ADMIN ryanberry
    "76561198062335506", //ADMIN The.Lord.Chanka
    "76561198046930715", //ADMIN watergard
    "76561198146698036", //ADMIN Wayne
    "76561198258070319", //ADMIN ZabariYarin
    "76561199126160178", //ADMIN Tilly
    "76561199051483263", //ADMIN Snow
    "76561198218326732"  //ADMIN Zudren
];


btc_map_mapIllumination = ace_map_mapIllumination;
if !(isNil "btc_custom_loc") then {
    {
        _x params ["_pos", "_cityType", "_cityName", "_radius"];
        private _location = createLocation [_cityType, _pos, _radius, _radius];
        _location setText _cityName;
    } forEach btc_custom_loc;
};
btc_intro_done = [] spawn btc_fnc_intro;

[{!isNull player}, {
    [] call compileScript ["core\doc.sqf"];

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
        player createDiarySubject ["btc_diarylog", localize "STR_BTC_HAM_CON_INFO_ASKHIDEOUT_DIARYLOG"];
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

    if (btc_debug) then {
        onMapSingleClick "vehicle player setPos _pos";
        player allowDamage false;

        [{!isNull (findDisplay 12)}, {
            ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw", btc_debug_fnc_marker];
        }] call CBA_fnc_waitUntilAndExecute;
    };
}] call CBA_fnc_waitUntilAndExecute;
