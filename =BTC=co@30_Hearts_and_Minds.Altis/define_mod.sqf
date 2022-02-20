btc_custom_loc = [
/*
    DESCRIPTION: [POS(Array),TYPE(String),NAME(String),RADIUS (Number),IS OCCUPIED(Bool)]
    Possible types: "NameVillage","NameCity","NameCityCapital","NameLocal","Hill","Airport","NameMarine", "StrongpointArea", "BorderCrossing", "VegetationFir"
    EXAMPLE: [[13132.8,3315.07,0.00128174],"NameVillage","Mountain 1",800,true]
*/

[[7992.46,2640.82,0],"NameCity","Alttarkallio",300,true],
[[7485.87,3194.93,0],"StrongpointArea","Factory Area",300,true],
[[5537.71,6845.14,0],"NameCity","Haukkavuori",300,true],
[[5661.25,9722.75,0],"NameCity","Hirskallio",300,true],
[[2515.95,2128.52,0],"NameCity","Iso Sommeri",300,false],
[[5013.06,6455.55,0],"NameCity","Jokela",300,true],
[[5716.69,8578.26,0],"NameCity","Kappeliniemi",300,true],
[[5819.23,1457.24,0],"NameCity","Heikinhelli",300,true],
[[7195.05,5269.4,0],"NameCity","Kiiskinkyla",300,true],
[[8255.31,3790.26,0],"NameCity","Kippariniemi",300,true],
[[4139.44,9848.19,0],"NameCity","Korkiala",300,true],
[[5213.15,8583.63,0],"NameCity","Kotokallio",300,true],
[[6066.4,7124.71,0],"Hill","Lammaskallio",100,true],
[[6584.79,5291.9,0],"Hill","Lansikallio",100,true],
[[5198.51,4752.33,0],"NameCity","Lettolahti",300,true],
[[5837.71,6074.03,0],"NameMarine","Liiralahdenjarvi",300,true],
[[6502.72,6644.55,0],"NameCity","Liivalahti",300,true],
[[5918.83,7889.03,0],"Hill","Lipeakallio",100,true],
[[6774.58,3256.66,0],"NameCity","Lounatjarvi",300,true],
[[6716.49,2757.71,0],"NameCity","Lounatkorkia",300,false],
[[6800.99,2852.07,0],"NameCity","Lounatkyla",300,false],
[[7331.94,1064.57,0],"NameCity","Lounatrivi",300,true],
[[5549.46,3622.8,0],"NameCity","Maahelli",300,true],
[[5748.37,4111.73,0],"Hill","Maahellinkallio",100,true],
[[4617.28,9197.03,0],"StrongpointArea","Majakallio",100,true],
[[5122.28,8029.08,0],"NameCity","Makiinpaallys",300,true],
[[6676.49,2123.25,0],"NameCity","Mattila",300,true],
[[7282.32,4079.61,0],"NameCity","Miettila",300,true],
[[4128.37,10300.8,0],"Hill","Mustakallio",100,true],
[[5179.23,4395.37,0],"NameCity","Mustalovi",300,true],
[[6282.33,7476.13,0],"NameCity","Niemenkyla",300,true],
[[4673.9,6423.82,0],"NameCity","Notkonhelli",300,true],
[[4935.14,10458,0],"NameCity","Old Fort",300,true],
[[7350.83,3583.02,0],"NameCity","Pahalampi",300,true],
[[6027.01,3020.96,0],"Hill","Pahanraonkallio",100,true],
[[4415.81,9954.85,0],"NameCity","Pohjoiskarokia",300,true],
[[4615.02,11115.7,0],"NameCity","Pohjoisrivi",300,true],
[[5040.46,10158,0],"Hill","pohjoissivunkallio",100,false],
[[4393.95,8602.35,0],"Hill","Purjekallio",100,true],
[[7702.57,4709.99,0],"NameCity","Purjeniemi",300,false],
[[4598.43,10620.7,0],"Hill","Rivinkallio",100,true],
[[6365.5,4648.85,0],"NameMarine","Ruokolahdenjarvi",300,true],
[[10152.8,6478,0],"NameCity","Ruuskeri",300,true],
[[9476.39,10759.5,0],"Airport","Sakkiluoto",300,true],
[[4999.62,5045.26,0],"NameCity","Selkaapajanniemi",300,true],
[[5427.29,5700.04,0],"NameCity","Somerikonkalliot",300,true],
[[5308.56,9028.06,0],"NameCity","Suurkyla",300,true],
[[6992.5,2021.81,0],"NameCity","Vahakorkia",300,true],
[[5859.04,2025.17,0],"NameCity","Vahakorkianniemi",300,true],
[[4212.02,9045.49,0],"NameCity","Vahasomerikonlahti",300,true],
[[7430.95,3889.68,0],"Hill","Valikallio",100,true],
[[6298.3,1636.82,0],"Hill","Valkiakallio",100,true],
[[6353.54,5736.89,0],"Hill","Variskallio",100,false],
[[5986.93,5323.64,0],"NameMarine","Vetelijarvi",300,true]

];

/*
    Here you can tweak spectator view during respawn screen.
*/
BIS_respSpecAi = false;                  // Allow spectating of AI
BIS_respSpecAllowFreeCamera = false;     // Allow moving the camera independent from units (players)
BIS_respSpecAllow3PPCamera = false;      // Allow 3rd person camera
BIS_respSpecShowFocus = false;           // Show info about the selected unit (dissapears behind the respawn UI)
BIS_respSpecShowCameraButtons = true;    // Show buttons for switching between free camera, 1st and 3rd person view (partially overlayed by respawn UI)
BIS_respSpecShowControlsHelper = true;   // Show the controls tutorial box
BIS_respSpecShowHeader = true;           // Top bar of the spectator UI including mission time
BIS_respSpecLists = true;                // Show list of available units and locations on the left hand side

/*
    Here you can specify which equipment should be added or removed from the arsenal.
    Please take care that there are different categories (weapons, magazines, items, backpacks) for different pieces of equipment into which you have to classify the classnames.
    In all cases, you need the classname of an object.

    Attention: The function of these lists depends on the setting in the mission parameter (Restrict arsenal).
        - "Full": here you have only the registered items in the arsenal available.
        - "Remove only": here all registered items are removed from the arsenal. This only works for the ACE3 arsenal!

    Example(s):
        private _weapons = [
            "arifle_MX_F",          //Classname for the rifle MX
            "arifle_MX_SW_F",       //Classname for the rifle MX LSW
            "arifle_MXC_F"          //Classname for the rifle MXC
        ];

        private _items = [
            "G_Shades_Black",
            "G_Shades_Blue",
            "G_Shades_Green"
        ];
*/
private _weapons = [];
private _magazines = [];
private _items = [];
private _backpacks = [];

btc_custom_arsenal = [_weapons, _magazines, _items, _backpacks];

/*
    Here you can specify which equipment is loaded on player connection.
*/

private _radio = ["tf_anprc152", "ACRE_PRC148"] select (isClass(configFile >> "cfgPatches" >> "acre_main"));
//Array of colored item: 0 - Desert, 1 - Tropic, 2 - Black, 3 - forest
private _uniforms = ["U_B_CombatUniform_mcam", "U_B_CTRG_Soldier_F", "U_B_CTRG_1", "U_B_CombatUniform_mcam_wdl_f"];
private _uniformsCBRN = ["U_B_CBRN_Suit_01_MTP_F", "U_B_CBRN_Suit_01_Tropic_F", "U_C_CBRN_Suit_01_Blue_F", "U_B_CBRN_Suit_01_Wdl_F"];
private _uniformsSniper = ["U_B_FullGhillie_sard", "U_B_FullGhillie_lsh", "U_B_T_FullGhillie_tna_F", "U_B_T_FullGhillie_tna_F"];
private _vests = ["V_PlateCarrierH_CTRG", "V_PlateCarrier2_rgr_noflag_F", "V_PlateCarrierH_CTRG", "V_PlateCarrier2_wdl"];
private _helmets = ["H_HelmetSpecB_paint2", "H_HelmetB_Enh_tna_F", "H_HelmetSpecB_blk", "H_HelmetSpecB_wdl"];
private _hoods = ["G_Balaclava_combat", "G_Balaclava_TI_G_tna_F", "G_Balaclava_combat", "G_Balaclava_combat"];
private _hoodCBRN = "G_AirPurifyingRespirator_01_F";
private _laserdesignators = ["Laserdesignator", "Laserdesignator_03", "Laserdesignator_01_khk_F", "Laserdesignator_01_khk_F"];
private _night_visions = ["NVGoggles", "NVGoggles_INDEP", "NVGoggles_OPFOR", "NVGoggles_INDEP"];
private _weapons = ["arifle_MXC_F", "arifle_MXC_khk_F", "arifle_MXC_Black_F", "arifle_MXC_Black_F"];
private _weapons_machineGunner = ["arifle_MX_SW_F", "arifle_MX_SW_khk_F", "arifle_MX_SW_Black_F", "arifle_MX_SW_Black_F"];
private _weapons_sniper = ["arifle_MXM_F", "arifle_MXM_khk_F", "arifle_MXM_Black_F", "arifle_MXM_Black_F"];
private _bipods = ["bipod_01_F_snd", "bipod_01_F_khk", "bipod_01_F_blk", "bipod_01_F_blk"];
private _pistols = ["hgun_P07_F", "hgun_P07_khk_F", "hgun_P07_F", "hgun_P07_khk_F"];
private _launcher_AT = ["launch_B_Titan_short_F", "launch_B_Titan_short_tna_F", "launch_O_Titan_short_F", "launch_B_Titan_short_tna_F"];
private _launcher_AA = ["launch_B_Titan_F", "launch_B_Titan_tna_F", "launch_O_Titan_F", "launch_B_Titan_tna_F"];
private _backpacks = ["B_AssaultPack_Kerry", "B_AssaultPack_eaf_F", "B_AssaultPack_blk", "B_AssaultPack_wdl_F"];
private _backpacks_big = ["B_Kitbag_mcamo", "B_Kitbag_rgr", "B_Kitbag_rgr", "B_Kitbag_rgr"];
private _backpackCBRN = "B_CombinationUnitRespirator_01_F";

btc_arsenal_loadout = [_uniforms, _uniformsCBRN, _uniformsSniper, _vests, _helmets, _hoods, [_hoodCBRN, _hoodCBRN, _hoodCBRN, _hoodCBRN], _laserdesignators, _night_visions, _weapons, _weapons_sniper, _weapons_machineGunner, _bipods, _pistols, _launcher_AT, _launcher_AA, _backpacks, _backpacks_big, [_backpackCBRN, _backpackCBRN, _backpackCBRN, _backpackCBRN], [_radio, _radio, _radio, _radio]];
