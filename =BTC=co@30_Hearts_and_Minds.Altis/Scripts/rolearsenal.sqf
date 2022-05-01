//Function Parms
//[0] = Arsenal Object
//[1] = Player
// Usage:
// [_box, _player] call roleArsenal;
roleArsenal = {
	params ["_box", "_player"];

	//diag_log "[Watergard] - Entered Role Restricted Arsenal Script";

	Private _UnitRole = roleDescription _player;

	//Clear the inventory
	clearMagazineCargoGlobal _box;
	clearItemCargoGlobal _box;
	clearBackpackCargoGlobal _box;
	clearWeaponCargoGlobal _box;

	_Role = [];

	// Admin
	if ((_UnitRole == "Admin A @ Admin")
	or (_UnitRole == "Admin B @ Admin")) then
	{_Role = "ADMIN"};

	// Command
	if (_UnitRole == "Company Commander @ CROSSROADS") then
	{_Role = "CO"};

    // GROUND
		//SL
			if ((_UnitRole == "Alpha Squad Leader@Alpha (Infantry)")
			or (_UnitRole == "Bravo Squad Leader@Bravo (Infantry)")
			or (_UnitRole == "Charlie Squad Leader@Charlie (Infantry)")) then
			{_Role = "SL"};
		//MEDIC
			if ((_UnitRole == "Alpha Medic")
			or (_UnitRole == "Bravo Medic")
			or (_UnitRole == "Charlie Medic")) then
			{_Role = "MEDIC"};
		//MARKSMAN
			if ((_UnitRole == "Alpha Marksman")
			or (_UnitRole == "Bravo Marksman")
			or (_UnitRole == "Charlie Marksman")) then
			{_Role = "MARKSMAN"};
		//ARMOR
			if ((_UnitRole == "Armor Commander@Armor 1")
			or (_UnitRole == "Armor Commander@Armor 2")
			or (_UnitRole == "Armor Crew")) then
			{_Role = "ARMOR"};
    //O.G.R.E
			if ((_UnitRole == "O.G.R.E Commander@O.G.R.E")
			or (_UnitRole == "O.G.R.E Engineer")) then
			{_Role = "OGRE"};
		//ENGINEER
		  if ((_UnitRole == "Alpha Engineer")
		  or (_UnitRole == "Bravo Engineer")
		  or (_UnitRole == "Charlie Engineer")) then
			{_Role = "ENGINEER"};
		//AUTORIFLEMAN
			if ((_UnitRole == "Alpha AutoRifleman")
			or (_UnitRole == "Bravo AutoRifleman")
			or (_UnitRole == "Charlie AutoRifleman")) then
			{_Role = "AUTORIFLEMAN"};
		//AT
			if ((_UnitRole == "Alpha AT")
			or (_UnitRole == "Bravo AT")
			or (_UnitRole == "Charlie AT")) then
			{_Role = "AT"};
		//RIFLEMAN
			if ((_UnitRole == "Alpha Rifleman")
			or (_UnitRole == "Bravo Rifleman")
			or (_UnitRole == "Charlie Rifleman")) then
			{_Role = "RIFLEMAN"};
    //GRENADIER
			if ((_UnitRole == "Alpha Grenadier")
			or (_UnitRole == "Bravo Grenadier")
			or (_UnitRole == "Charlie Grenadier")) then
			{_Role = "GRENADIER"};
    // STALKER
	    if ((_UnitRole == "STALKER 1 Pilot@Joint Air Command 1")
	    or (_UnitRole == "STALKER 2 Pilot@Joint Air Command 2")) then
	    {_Role = "STALKER"};

	//Empty array of gear to add to the arsenal per player.
	Private _GearToAdd = [];
  /*
  //Array of gear categories used in definition
  //Primary
  //Secondary
  //Launcher
  //Helm
  //Uniform
  //Vest
  //Backpack
  //Facewear
  //NVG
  //Binocular
  //Radio
  //Sights
  //Rail
  //Muzzle
  //Bipod
  //Magazines
  //Additional Magazines
  //Grenades
  //Explosives
	//items
  */
	//Define the gear for each Role
	Private _DefaultGear = [
  //Primary
  "rhs_weap_m4a1_carryhandle",
  //Secondary
  "rhsusf_weap_glock17g4",
  "rhsusf_weap_m1911a1",
  "rhsusf_weap_m9",
  "ACE_VMH3",
  //Launcher
  "rhs_weap_M136",
  "rhs_weap_M136_hedp",
  "rhs_weap_M136_hp",
  //Helm
  //Uniform
  //Vest
  "rhsusf_iotv_ocp_Rifleman",
  "rhsusf_mbav_rifleman",
  "rhsusf_spcs_ocp_rifleman",
  //Backpack
  "tfw_ilbe_whip_ocp",
  "B_AssaultPack_cbr",
  "B_AssaultPack_mcamo",
  "rhsusf_assault_eagleaiii_coy",
  "rhsusf_assault_eagleaiii_ocp",
  "B_Parachute",
  //Facewear
  "rhs_googles_black",
  "rhs_googles_clear",
  "rhs_googles_orange",
  "rhs_googles_yellow",
  "rhs_ess_black",
  "M40_Gas_mask_nbc_v1_d",
  "G_Shades_Black",
  "G_Shades_Blue",
  "G_Shades_Green",
  "G_Shades_Red",
  "G_Sport_BlackWhite",
  "G_Sport_Checkered",
  "G_Sport_Blackred",
  "rhsusf_oakley_goggles_blk",
  "rhsusf_oakley_goggles_clr",
  "rhsusf_oakley_goggles_ylw",
  "rhsusf_shemagh_od",
  "rhsusf_shemagh2_od",
  "rhsusf_shemagh_gogg_od",
  "rhsusf_shemagh2_gogg_od",
  "rhsusf_shemagh_tan",
  "rhsusf_shemagh2_tan",
  "rhsusf_shemagh_gogg_tan",
  "rhsusf_shemagh2_gogg_tan",
  "rhsusf_shemagh_white",
  "rhsusf_shemagh2_white",
  "rhsusf_shemagh_gogg_white",
  "rhsusf_shemagh2_gogg_white",
  //NVG
  "ACE_NVG_Wide_Black",
	"ACE_NVG_Wide",
  //Binocular
  "Laserdesignator",
	"Laserbatteries",
	"ACE_Vector",
  //Radio
  "TFAR_anprc152",
  //Sights
  "optic_arco_blk_f",
  "optic_arco_ak_blk_f",
  "optic_holosight_blk_f",
  "rhsusf_acc_g33_t1",
  "optic_mrco",
  "optic_hamr",
  "rhsusf_acc_acog",
  "rhsusf_acc_eotech_552",
  "rhsusf_acc_compm4",
  "optic_erco_blk_f",
  "rhsusf_acc_acog_rmr",
  "rhsusf_acc_eotech_xps3",
  //Rail
  "rhsusf_acc_anpeq15side_bk",
  "rhsusf_acc_anpeq15_bk_top",
  "rhsusf_acc_anpeq15_bk",
  "rhsusf_acc_anpeq15_bk_light",
  "acc_flashlight_pistol",
  //Muzzle
  "ace_muzzle_mzls_l",
  "rhsusf_acc_nt4_black",
  "rhsusf_acc_sf3p556",
  "rhsusf_acc_sfmb556",
  "rhsusf_acc_omega9k",
  //Bipod
  "rhsusf_acc_grip2",
  "bipod_01_f_blk",
  "rhsusf_acc_grip1",
  "rhsusf_acc_harris_bipod",
  "rhsusf_acc_kac_grip",
  "rhsusf_acc_rvg_blk",
  "rhsusf_acc_tacsac_blk",
  "rhsusf_acc_tdstubby_blk",
  "rhsusf_acc_grip3",
  //Magazines
  "rhs_mag_30Rnd_556x45_M855A1_Stanag",
  "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",
  "rhsusf_mag_17Rnd_9x19_FMJ",
  "rhsusf_mag_17Rnd_9x19_JHP",
  "rhsusf_mag_7x45acp_MHP",
  "rhsusf_mag_15Rnd_9x19_FMJ",
  "rhsusf_mag_15Rnd_9x19_JHP",
  //Additional Magazines
  "rhsusf_100Rnd_762x51_m61_ap",
  "rhsusf_100Rnd_762x51_m62_tracer",
  "rhsusf_200Rnd_556x45_mixed_soft_pouch_coyote",
  "20Rnd_762x51_Mag",
  "ACE_20Rnd_762x51_M993_AP_Mag",
  "ACE_20Rnd_762x51_Mag_Tracer",
  "rhsusf_20Rnd_762x51_SR25_m993_Mag",
  "rhsusf_20Rnd_762x51_SR25_m62_Mag",
  "rhsusf_mag_40Rnd_46x30_JHP",
  "50Rnd_570x28_SMG_03",
  "30Rnd_45ACP_Mag_SMG_01",
  "MRAWS_HE_F",
  "MRAWS_HEAT55_F",
  "MRAWS_HEAT_F",
  "NLAW_F",
  "rhs_fgm148_magazine_AT",
  "1Rnd_HE_Grenade_shell",
  "1Rnd_SmokeGreen_Grenade_shell",
  "1Rnd_SmokeRed_Grenade_shell",
  "1Rnd_Smoke_Grenade_shell",
  "1Rnd_SmokeYellow_Grenade_shell",
  "ACE_40mm_Flare_white",
  "ACE_40mm_Flare_green",
  "ACE_40mm_Flare_red",
  "ACE_40mm_Flare_ir",
  "kat_Painkiller",
  //Grenades
  "ACE_Chemlight_HiGreen",
  "ACE_Chemlight_HiRed",
  "ACE_Chemlight_HiWhite",
  "ACE_Chemlight_HiYellow",
  "B_IR_Grenade",
  "ACE_HandFlare_Green",
  "ACE_HandFlare_Red",
  "ACE_HandFlare_White",
  "ACE_HandFlare_Yellow",
  "SmokeShellGreen",
  "SmokeShellRed",
  "SmokeShell",
  "SmokeShellYellow",
  "rhs_mag_mk84",
  "rhs_mag_mk3a2",
  "rhs_mag_m67",
  //Explosives
  //FOOD
  "ACE_Can_Franta",
  "ACE_Can_RedGull",
  "ACE_Can_Spirit",
  "ACE_Canteen",
  "ACE_MRE_BeefStew",
  "ACE_MRE_CreamChickenSoup",
  "ACE_MRE_ChickenHerbDumplings",
  "ACE_MRE_LambCurry",
  "ACE_MRE_CreamTomatoSoup",
  "ACE_WaterBottle",
  //items
	"ACE_salineIV",
	"ACE_salineIV_250",
	"ACE_salineIV_500",
  "ACE_epinephrine",
  "ACE_morphine",
	"ACE_fieldDressing",
	"ACE_elasticBandage",
	"ACE_packingBandage",
	"ACE_quikclot",
  "kat_guedel",
  "kat_Pulseoximeter",
	"kat_chestSeal",
	"ACE_bodyBag",
  "ACE_Banana",
	"ACE_CableTie",
	"ACE_EarPlugs",
	"ACE_EntrenchingTool",
	"ItemcTabHCam",
	"ACE_IR_Strobe_Item",
	"ACE_Flashlight_XL50",
	"ACE_MapTools",
	"ACE_microDAGR",
	"ACE_personalAidKit",
	"ACE_splint",
	"ACE_SpraypaintRed",
	"ACE_tourniquet",
	"ACE_wirecutter",
	"ItemMap",
	"ItemGPS",
	"ItemAndroid",
  "ItemcTabHCam",
	"ItemWatch",
	"ACE_VMH3",
	"ACE_RangeTable_82mm",
	"ACE_artilleryTable",
	"ACE_DefusalKit"
	];

	Private _ADMIN = [
  //Primary
  //Secondary
  "rhs_weap_M320",
  //Launcher
  //Helm
  "lxWS_H_bmask_base",
  "H_Construction_headset_black_F",
  //Uniform
  "rhs_uniform_g3_blk",
  //Vest
  "V_PlateCarrier1_blk",
  //Backpack
  "tfw_ilbe_whip_black",
  "B_rhsusf_B_BACKPACK",
  "B_UAV_01_backpack_F",
  //Facewear
  "G_Balaclava_blk",
  //Sights
  //Rail
  //Muzzle
  //Bipod
  //Grenades
  //Explosives
  "DemoCharge_Remote_Mag",
  "SatchelCharge_Remote_Mag",
  "ATMine_Range_Mag",
  //items
  "kat_bloodIV_O",
  "kat_bloodIV_O_250",
  "kat_bloodIV_O_500",
  "kat_IV_16",
  "kat_aatKit",
  "kat_accuvac",
  "kat_X_AED",
  "kat_AED",
  "kat_IO_FAST",
  "KAT_Empty_bloodIV_250",
  "KAT_Empty_bloodIV_500",
  "kat_larynx",
  "kat_naloxone",
  "ACE_HuntIR_monitor",
  "B_UavTerminal",
  "ACE_M26_Clacker",
  "ACE_Clacker",
  "ACE_rope12",
  "ACE_rope15",
  "ACE_rope18",
  "ACE_rope27",
  "ToolKit",
  "ItemcTab",
  "tfw_rf3080Item"
	];

	Private _CO = [
  //Primary
  "rhs_weap_m4a1_blockII",
  "rhs_weap_m16a4_imod",
  "rhs_weap_mk18_bk",
  "rhs_weap_mk18_d",
  //Secondary
  "rhs_weap_M320",
  //Launcher
  //Helm
  "rhsusf_ach_bare_tan",
  "rhsusf_ach_bare_tan_ess",
  "rhsusf_ach_bare_tan_headset",
  "rhsusf_ach_bare_tan_headset_ess",
  "rhsusf_ach_helmet_ocp",
  "rhsusf_ach_helmet_ocp_alt",
  "rhsusf_ach_helmet_ESS_ocp",
  "rhsusf_ach_helmet_ESS_ocp_alt",
  "rhsusf_ach_helmet_headset_ocp",
  "rhsusf_ach_helmet_headset_ocp_alt",
  "rhsusf_ach_helmet_headset_ess_ocp",
  "rhsusf_ach_helmet_headset_ess_ocp_alt",
  "rhsusf_opscore_mc_cover",
  "rhsusf_opscore_mc_cover_pelt",
  "rhsusf_opscore_mc_cover_pelt_nsw",
  "rhsusf_opscore_mc_cover_pelt_cam",
  "rhsusf_opscore_mc",
  "rhsusf_opscore_mc_pelt",
  "rhsusf_opscore_mc_pelt_nsw",
  "rhsusf_opscore_paint",
  "rhsusf_opscore_paint_pelt",
  "rhsusf_opscore_paint_pelt_nsw",
  "rhsusf_opscore_paint_pelt_nsw_cam",
  "H_Booniehat_tan",
  "H_Booniehat_mcamo",
  "H_Booniehat_khk",
  "H_Booniehat_khk_hs",
  "rhs_booniehat2_marpatd",
  "rhs_Booniehat_ocp",
  //Uniform
  "rhs_uniform_acu_ocp",
  "rhs_uniform_acu_oefcp",
  "U_lxWS_B_CombatUniform_desert",
  "U_lxWS_B_CombatUniform_desert_tshirt",
  "U_B_CombatUniform_mcam",
  "U_B_CombatUniform_mcam_tshirt",
  "rhs_uniform_cu_ocp",
  "rhs_uniform_g3_mc",
  "rhs_uniform_g3_tan",
  //Vest
  "rhsusf_iotv_ocp_Teamleader",
  "rhsusf_spcs_ocp_teamleader",
  //Backpack
  "B_rhsusf_B_BACKPACK",
  "B_UAV_01_backpack_F",
  //Facewear
  //Sights
  //Rail
  //Muzzle
  //Bipod
  //items
  "ACE_HuntIR_monitor",
  "B_UavTerminal",
  "ItemcTab",
  "tfw_rf3080Item"
  ];

	Private _SL = [
  //Primary
  "rhs_weap_m4a1_blockII",
  "rhs_weap_m16a4_imod",
  "rhs_weap_mk18_bk",
  "rhs_weap_mk18_d",
  //Secondary
  "rhs_weap_M320",
  //Launcher
  //Helm
  "rhsusf_ach_bare_tan",
  "rhsusf_ach_bare_tan_ess",
  "rhsusf_ach_bare_tan_headset",
  "rhsusf_ach_bare_tan_headset_ess",
  "rhsusf_ach_helmet_ocp",
  "rhsusf_ach_helmet_ocp_alt",
  "rhsusf_ach_helmet_ESS_ocp",
  "rhsusf_ach_helmet_ESS_ocp_alt",
  "rhsusf_ach_helmet_headset_ocp",
  "rhsusf_ach_helmet_headset_ocp_alt",
  "rhsusf_ach_helmet_headset_ess_ocp",
  "rhsusf_ach_helmet_headset_ess_ocp_alt",
  "rhsusf_opscore_mc_cover",
  "rhsusf_opscore_mc_cover_pelt",
  "rhsusf_opscore_mc_cover_pelt_nsw",
  "rhsusf_opscore_mc_cover_pelt_cam",
  "rhsusf_opscore_mc",
  "rhsusf_opscore_mc_pelt",
  "rhsusf_opscore_mc_pelt_nsw",
  "rhsusf_opscore_paint",
  "rhsusf_opscore_paint_pelt",
  "rhsusf_opscore_paint_pelt_nsw",
  "rhsusf_opscore_paint_pelt_nsw_cam",
  "H_Booniehat_tan",
  "H_Booniehat_mcamo",
  "H_Booniehat_khk",
  "H_Booniehat_khk_hs",
  "rhs_booniehat2_marpatd",
  "rhs_Booniehat_ocp",
  //Uniform
  "rhs_uniform_acu_ocp",
  "rhs_uniform_acu_oefcp",
  "U_lxWS_B_CombatUniform_desert",
  "U_lxWS_B_CombatUniform_desert_tshirt",
  "U_B_CombatUniform_mcam",
  "U_B_CombatUniform_mcam_tshirt",
  "rhs_uniform_cu_ocp",
  "rhs_uniform_g3_mc",
  "rhs_uniform_g3_tan",
  //Vest
  "rhsusf_iotv_ocp_Squadleader",
  "rhsusf_spcs_ocp_squadleader",
  //Backpack
  "B_rhsusf_B_BACKPACK",
  "B_UAV_01_backpack_F",
  //Facewear
  //Sights
  //Rail
  //Muzzle
  //Bipod
  //items
  "ACE_HuntIR_monitor",
  "B_UavTerminal",
  "ItemcTab",
  "tfw_rf3080Item"
	];

	Private _MEDIC = [
  //Primary
  "rhs_weap_m4a1_blockII",
  "rhs_weap_m16a4_imod",
  "rhs_weap_mk18_bk",
  "rhs_weap_mk18_d",
  //Secondary
  //Launcher
  //Helm
  "rhsusf_ach_bare_tan",
  "rhsusf_ach_bare_tan_ess",
  "rhsusf_ach_bare_tan_headset",
  "rhsusf_ach_bare_tan_headset_ess",
  "rhsusf_ach_helmet_ocp",
  "rhsusf_ach_helmet_ocp_alt",
  "rhsusf_ach_helmet_ESS_ocp",
  "rhsusf_ach_helmet_ESS_ocp_alt",
  "rhsusf_ach_helmet_headset_ocp",
  "rhsusf_ach_helmet_headset_ocp_alt",
  "rhsusf_ach_helmet_headset_ess_ocp",
  "rhsusf_ach_helmet_headset_ess_ocp_alt",
  "rhsusf_opscore_mc_cover",
  "rhsusf_opscore_mc_cover_pelt",
  "rhsusf_opscore_mc_cover_pelt_nsw",
  "rhsusf_opscore_mc_cover_pelt_cam",
  "rhsusf_opscore_mc",
  "rhsusf_opscore_mc_pelt",
  "rhsusf_opscore_mc_pelt_nsw",
  "rhsusf_opscore_paint",
  "rhsusf_opscore_paint_pelt",
  "rhsusf_opscore_paint_pelt_nsw",
  "rhsusf_opscore_paint_pelt_nsw_cam",
  "H_Booniehat_tan",
  "H_Booniehat_mcamo",
  "H_Booniehat_khk",
  "H_Booniehat_khk_hs",
  "rhs_booniehat2_marpatd",
  "rhs_Booniehat_ocp",
  //Uniform
  "rhs_uniform_acu_ocp",
  "rhs_uniform_acu_oefcp",
  "U_lxWS_B_CombatUniform_desert",
  "U_lxWS_B_CombatUniform_desert_tshirt",
  "U_B_CombatUniform_mcam",
  "U_B_CombatUniform_mcam_tshirt",
  "rhs_uniform_cu_ocp",
  "rhs_uniform_g3_mc",
  "rhs_uniform_g3_tan",
  //Vest
  "rhsusf_iotv_ocp_Medic",
  "rhsusf_mbav_medic",
  "rhsusf_spcs_ocp_medic",
  //Backpack
  "B_Carryall_cbr",
  "B_Carryall_mcamo",
  //Facewear
  //Sights
  //Rail
  //Muzzle
  //Bipod
  //items
  "kat_bloodIV_O",
  "kat_bloodIV_O_250",
  "kat_bloodIV_O_500",
  "kat_IV_16",
  "kat_aatKit",
  "kat_accuvac",
  "kat_X_AED",
  "kat_AED",
  "kat_IO_FAST",
  "KAT_Empty_bloodIV_250",
  "KAT_Empty_bloodIV_500",
  "kat_larynx",
  "kat_naloxone",
  "ACE_surgicalKit",
  "ACE_adenosine"
  ];

	Private _MARKSMAN = [
  //Primary
  "rhs_weap_m14ebrri",
  "rhs_weap_sr25_ec",
  //Secondary
  //Launcher
  //Helm
  "rhsusf_ach_helmet_camo_ocp",
  //Uniform
  "U_B_GhillieSuit",
  //Vest
  "rhsusf_spcs_ocp_sniper",
  //Backpack
  //Facewear
  //Sights
  "optic_sos",
  "optic_nvs",
  "optic_ams",
  //Rail
  //Muzzle
  "rhsusf_acc_aac_762sd_silencer",
  "ace_muzzle_mzls_b"
  //Bipod
  //items
	];

	Private _ENGINEER = [
  //Primary
  "rhs_weap_m4a1_blockII",
  "rhs_weap_m16a4_imod",
  "rhs_weap_mk18_bk",
  "rhs_weap_mk18_d",
  //Secondary
  //Launcher
  //Helm
  "rhsusf_ach_bare_tan",
  "rhsusf_ach_bare_tan_ess",
  "rhsusf_ach_bare_tan_headset",
  "rhsusf_ach_bare_tan_headset_ess",
  "rhsusf_ach_helmet_ocp",
  "rhsusf_ach_helmet_ocp_alt",
  "rhsusf_ach_helmet_ESS_ocp",
  "rhsusf_ach_helmet_ESS_ocp_alt",
  "rhsusf_ach_helmet_headset_ocp",
  "rhsusf_ach_helmet_headset_ocp_alt",
  "rhsusf_ach_helmet_headset_ess_ocp",
  "rhsusf_ach_helmet_headset_ess_ocp_alt",
  "rhsusf_opscore_mc_cover",
  "rhsusf_opscore_mc_cover_pelt",
  "rhsusf_opscore_mc_cover_pelt_nsw",
  "rhsusf_opscore_mc_cover_pelt_cam",
  "rhsusf_opscore_mc",
  "rhsusf_opscore_mc_pelt",
  "rhsusf_opscore_mc_pelt_nsw",
  "rhsusf_opscore_paint",
  "rhsusf_opscore_paint_pelt",
  "rhsusf_opscore_paint_pelt_nsw",
  "rhsusf_opscore_paint_pelt_nsw_cam",
  "H_Booniehat_tan",
  "H_Booniehat_mcamo",
  "H_Booniehat_khk",
  "H_Booniehat_khk_hs",
  "rhs_booniehat2_marpatd",
  "rhs_Booniehat_ocp",
  //Uniform
  "rhs_uniform_acu_ocp",
  "rhs_uniform_acu_oefcp",
  "U_lxWS_B_CombatUniform_desert",
  "U_lxWS_B_CombatUniform_desert_tshirt",
  "U_B_CombatUniform_mcam",
  "U_B_CombatUniform_mcam_tshirt",
  "rhs_uniform_cu_ocp",
  "rhs_uniform_g3_mc",
  "rhs_uniform_g3_tan",
  //Vest
  "rhsusf_iotv_ocp_Repair",
  //Backpack
  "B_Carryall_cbr",
  "B_Carryall_mcamo",
  //Facewear
  //Sights
  //Rail
  //Muzzle
  //Bipod
  //Explosives
  "DemoCharge_Remote_Mag",
  "SatchelCharge_Remote_Mag",
  "ATMine_Range_Mag",
  //items
  "ACE_M26_Clacker",
  "ACE_Clacker"
	];

	Private _OGRE = [
  //Primary
  "rhsusf_weap_MP7A2",
  "SMG_03C_black",
  "SMG_01_F",
  //Secondary
  //Launcher
  //Helm
  "rhsusf_cvc_helmet",
  "rhsusf_cvc_alt_helmet",
  "rhsusf_cvc_ess",
  "H_EarProtectors_black_F",
  //Uniform
  "U_C_WorkerCoveralls",
  //Vest
  "rhsusf_spcs_ocp_crewman",
  //Backpack
  //Facewear
  //Sights
  //Rail
  //Muzzle
  //Bipod
  //items
  "ACE_1Rnd_82mm_Mo_HE",
  "ACE_1Rnd_82mm_Mo_HE_Guided",
  "ACE_1Rnd_82mm_Mo_Illum",
  "ACE_1Rnd_82mm_Mo_HE_LaserGuided",
  "ACE_1Rnd_82mm_Mo_Smoke",
  "ToolKit"
	];

	Private _AUTORIFLEMAN = [
  //Primary
  "rhs_weap_m240B",
  "rhs_weap_m249_pip_ris",
  "rhs_weap_m249_light_S",
  //Secondary
  //Launcher
  //Helm
  "rhsusf_ach_bare_tan",
  "rhsusf_ach_bare_tan_ess",
  "rhsusf_ach_bare_tan_headset",
  "rhsusf_ach_bare_tan_headset_ess",
  "rhsusf_ach_helmet_ocp",
  "rhsusf_ach_helmet_ocp_alt",
  "rhsusf_ach_helmet_ESS_ocp",
  "rhsusf_ach_helmet_ESS_ocp_alt",
  "rhsusf_ach_helmet_headset_ocp",
  "rhsusf_ach_helmet_headset_ocp_alt",
  "rhsusf_ach_helmet_headset_ess_ocp",
  "rhsusf_ach_helmet_headset_ess_ocp_alt",
  "rhsusf_opscore_mc_cover",
  "rhsusf_opscore_mc_cover_pelt",
  "rhsusf_opscore_mc_cover_pelt_nsw",
  "rhsusf_opscore_mc_cover_pelt_cam",
  "rhsusf_opscore_mc",
  "rhsusf_opscore_mc_pelt",
  "rhsusf_opscore_mc_pelt_nsw",
  "rhsusf_opscore_paint",
  "rhsusf_opscore_paint_pelt",
  "rhsusf_opscore_paint_pelt_nsw",
  "rhsusf_opscore_paint_pelt_nsw_cam",
  "H_Booniehat_tan",
  "H_Booniehat_mcamo",
  "H_Booniehat_khk",
  "H_Booniehat_khk_hs",
  "rhs_booniehat2_marpatd",
  "rhs_Booniehat_ocp",
  //Uniform
  //Vest
  "rhsusf_iotv_ocp_SAW",
  "rhsusf_mbav_mg",
  "rhsusf_spcs_ocp_machinegunner",
  "rhsusf_spcs_ocp_saw",
  //Backpack
  "B_Carryall_cbr",
  "B_Carryall_mcamo",
  //Facewear
  //Sights
  //Rail
  //Muzzle
  "rhsusf_acc_ardec_m240",
  "ace_muzzle_mzls_b",
  //Bipod
  "rhsusf_acc_kac_grip_saw_bipod",
  "rhsusf_acc_saw_bipod",
  "rhsusf_acc_grip4_bipod",
  "rhsusf_acc_saw_lw_bipod",
  //items
  "ACE_WaterBottle"
	];

	Private _AT = [
  //Primary
  "rhs_weap_m4a1_blockII",
  "rhs_weap_m16a4_imod",
  "rhs_weap_mk18_bk",
  "rhs_weap_mk18_d",
  //Secondary
  //Launcher
  "launch_MRAWS_green_F",
  "launch_NLAW_F",
  "rhs_weap_fgm148",
  //Helm
  "rhsusf_ach_bare_tan",
  "rhsusf_ach_bare_tan_ess",
  "rhsusf_ach_bare_tan_headset",
  "rhsusf_ach_bare_tan_headset_ess",
  "rhsusf_ach_helmet_ocp",
  "rhsusf_ach_helmet_ocp_alt",
  "rhsusf_ach_helmet_ESS_ocp",
  "rhsusf_ach_helmet_ESS_ocp_alt",
  "rhsusf_ach_helmet_headset_ocp",
  "rhsusf_ach_helmet_headset_ocp_alt",
  "rhsusf_ach_helmet_headset_ess_ocp",
  "rhsusf_ach_helmet_headset_ess_ocp_alt",
  "rhsusf_opscore_mc_cover",
  "rhsusf_opscore_mc_cover_pelt",
  "rhsusf_opscore_mc_cover_pelt_nsw",
  "rhsusf_opscore_mc_cover_pelt_cam",
  "rhsusf_opscore_mc",
  "rhsusf_opscore_mc_pelt",
  "rhsusf_opscore_mc_pelt_nsw",
  "rhsusf_opscore_paint",
  "rhsusf_opscore_paint_pelt",
  "rhsusf_opscore_paint_pelt_nsw",
  "rhsusf_opscore_paint_pelt_nsw_cam",
  "H_Booniehat_tan",
  "H_Booniehat_mcamo",
  "H_Booniehat_khk",
  "H_Booniehat_khk_hs",
  "rhs_booniehat2_marpatd",
  "rhs_Booniehat_ocp",
  //Uniform
  //Vest
  //Backpack
  "B_Carryall_cbr",
  "B_Carryall_mcamo"
  //Facewear
  //Sights
  //Rail
  //Muzzle
  //Bipod
  //items
	];

	Private _RIFLEMAN = [
  //Primary
  "rhs_weap_m4a1_blockII",
  "rhs_weap_m16a4_imod",
  "rhs_weap_mk18_bk",
  "rhs_weap_mk18_d",
  //Secondary
  //Launcher
  //Helm
  "rhsusf_ach_bare_tan",
  "rhsusf_ach_bare_tan_ess",
  "rhsusf_ach_bare_tan_headset",
  "rhsusf_ach_bare_tan_headset_ess",
  "rhsusf_ach_helmet_ocp",
  "rhsusf_ach_helmet_ocp_alt",
  "rhsusf_ach_helmet_ESS_ocp",
  "rhsusf_ach_helmet_ESS_ocp_alt",
  "rhsusf_ach_helmet_headset_ocp",
  "rhsusf_ach_helmet_headset_ocp_alt",
  "rhsusf_ach_helmet_headset_ess_ocp",
  "rhsusf_ach_helmet_headset_ess_ocp_alt",
  "rhsusf_opscore_mc_cover",
  "rhsusf_opscore_mc_cover_pelt",
  "rhsusf_opscore_mc_cover_pelt_nsw",
  "rhsusf_opscore_mc_cover_pelt_cam",
  "rhsusf_opscore_mc",
  "rhsusf_opscore_mc_pelt",
  "rhsusf_opscore_mc_pelt_nsw",
  "rhsusf_opscore_paint",
  "rhsusf_opscore_paint_pelt",
  "rhsusf_opscore_paint_pelt_nsw",
  "rhsusf_opscore_paint_pelt_nsw_cam",
  "H_Booniehat_tan",
  "H_Booniehat_mcamo",
  "H_Booniehat_khk",
  "H_Booniehat_khk_hs",
  "rhs_booniehat2_marpatd",
  "rhs_Booniehat_ocp",
  //Uniform
  //Vest
  "rhsusf_iotv_ocp_Rifleman",
  "rhsusf_mbav_rifleman",
  "rhsusf_spcs_ocp_rifleman"
  //Backpack
  //Facewear
  //Sights
  //Rail
  //Muzzle
  //Bipod
  //items
	];

  Private _GRENADIER = [
  //Primary
  "rhs_weap_m4a1_blockII_M203",
  "rhs_weap_m16a4_imod_M203",
  "rhs_weap_mk18_m320",
  //Secondary
  //Launcher
  //Helm
  "rhsusf_ach_bare_tan",
  "rhsusf_ach_bare_tan_ess",
  "rhsusf_ach_bare_tan_headset",
  "rhsusf_ach_bare_tan_headset_ess",
  "rhsusf_ach_helmet_ocp",
  "rhsusf_ach_helmet_ocp_alt",
  "rhsusf_ach_helmet_ESS_ocp",
  "rhsusf_ach_helmet_ESS_ocp_alt",
  "rhsusf_ach_helmet_headset_ocp",
  "rhsusf_ach_helmet_headset_ocp_alt",
  "rhsusf_ach_helmet_headset_ess_ocp",
  "rhsusf_ach_helmet_headset_ess_ocp_alt",
  "rhsusf_opscore_mc_cover",
  "rhsusf_opscore_mc_cover_pelt",
  "rhsusf_opscore_mc_cover_pelt_nsw",
  "rhsusf_opscore_mc_cover_pelt_cam",
  "rhsusf_opscore_mc",
  "rhsusf_opscore_mc_pelt",
  "rhsusf_opscore_mc_pelt_nsw",
  "rhsusf_opscore_paint",
  "rhsusf_opscore_paint_pelt",
  "rhsusf_opscore_paint_pelt_nsw",
  "rhsusf_opscore_paint_pelt_nsw_cam",
  "H_Booniehat_tan",
  "H_Booniehat_mcamo",
  "H_Booniehat_khk",
  "H_Booniehat_khk_hs",
  "rhs_booniehat2_marpatd",
  "rhs_Booniehat_ocp",
  //Uniform
  //Vest
  "rhsusf_iotv_ocp_Grenadier",
  "rhsusf_mbav_grenadier",
  "rhsusf_spcs_ocp_grenadier"
  //Backpack
  //Facewear
  //Sights
  //Rail
  //Muzzle
  //Bipod
  //items
  ];

	Private _STALKER = [
  //Primary
  "rhsusf_weap_MP7A2",
  "SMG_03C_black",
  "SMG_01_F",
  //Secondary
  //Launcher
  //Helm
  "H_CrewHelmetHeli_B",
  "H_PilotHelmetHeli_B",
  //Uniform
  "U_B_HeliPilotCoveralls",
  "U_B_PilotCoveralls",
  //Vest
  "rhsusf_spcs_ocp_crewman",
  //Backpack
  //Facewear
  //Sights
  //Rail
  //Muzzle
  //Bipod
	//items
  "ACE_rope12",
  "ACE_rope15",
  "ACE_rope18",
  "ACE_rope27",
  "ToolKit"
	];

	switch (_Role) do {
	  case "ADMIN": {
	    _GearToAdd = _DefaultGear + _ADMIN;
	  };
	  case "CO": {
	    _GearToAdd = _DefaultGear + _CO;
	  };
	  case "SL": {
	    _GearToAdd = _DefaultGear + _SL;
	  };
	  case "MEDIC": {
	    _GearToAdd = _DefaultGear + _MEDIC;
	  };
	  case "MARKSMAN": {
	    _GearToAdd = _DefaultGear + _MARKSMAN;
	  };
	  case "ENGINEER": {
	    _GearToAdd = _DefaultGear + _ENGINEER;
	  };
		case "ARMOR": {
	    _GearToAdd = _DefaultGear + _ARMOR;
      };
		case "OGRE": {
	    _GearToAdd = _DefaultGear + _OGRE;
	  };
	  case "AUTORIFLEMAN": {
	    _GearToAdd = _DefaultGear + _AUTORIFLEMAN;
	  };
	  case "AT": {
	    _GearToAdd = _DefaultGear + _AT;
	  };
	  case "RIFLEMAN": {
	    _GearToAdd = _DefaultGear + _RIFLEMAN;
      };
	  case "GRENADIER": {
	    _GearToAdd = _DefaultGear + _GRENADIER;
	  };
	  case "STALKER": {
	    _GearToAdd = _DefaultGear + _STALKER;
	  };
	  default {
	    _GearToAdd = _DefaultGear + ["ACE_Banana"];
	  };
	};

	[_box, false] call ace_arsenal_fnc_removeBox;
	[_box, _GearToAdd, false] call ace_arsenal_fnc_initBox;
}
