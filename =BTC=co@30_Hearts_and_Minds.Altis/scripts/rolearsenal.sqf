
roleArsenal = {
	params ["_box", "_player"];


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
    //GRENADIER
			if ((_UnitRole == "Alpha Grenadier")
			or (_UnitRole == "Bravo Grenadier")
			or (_UnitRole == "Charlie Grenadier")) then
			{_Role = "GRENADIER"};
    //RIFLEMAN
			if ((_UnitRole == "Alpha Rifleman")
			or (_UnitRole == "Bravo Rifleman")
			or (_UnitRole == "Charlie Rifleman")) then
			{_Role = "RIFLEMAN"};
    //Armor
			if ((_UnitRole == "Warpig Commander@Armor")
			or (_UnitRole == "Warpig Driver")
      or (_UnitRole == "Warpig Gunner")) then
			{_Role = "WARPIG"};
    //O.G.R.E
			if ((_UnitRole == "O.G.R.E Commander@O.G.R.E (Logistics)")
			or (_UnitRole == "O.G.R.E Engineer")) then
			{_Role = "OGRE"};
    //STALKER
	    if ((_UnitRole == "STALKER 1 Pilot@Joint Air Command 1")
	    or (_UnitRole == "STALKER 1 Crew")
      or (_UnitRole == "STALKER 2 Pilot@Joint Air Command 2")
      or (_UnitRole == "STALKER 2 Crew")) then
	    {_Role = "STALKER"};

	//Empty array of gear to add to the arsenal per player.
	Private _GearToAdd = [];
  /*
  //gear categories used in definition
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
	"UK3CB_BAF_L85A2",
	"UK3CB_BAF_L119A1_RIS",
	"UK3CB_BAF_L86A2",
	"UK3CB_BAF_L128A1",
	"UK3CB_BAF_L1A1_Wood",
	"UK3CB_BAF_L1A1",
	"UK3CB_BAF_L119A1_CQB",
	"UK3CB_BAF_L119A1",
  //Secondary
	"UK3CB_BAF_L9A1",
	"UK3CB_BAF_L105A1",
	"UK3CB_BAF_L131A1",
	"rhsusf_weap_glock17g4",
	"ACE_VMH3",
	"ACE_VMM3",
  //Launcher
	"rhs_weap_m72a7",
  //Helm
	"UK3CB_BAF_H_Mk6_DPMT_A",
	"UK3CB_BAF_H_Mk6_DPMT_B",
	"UK3CB_BAF_H_Mk6_DPMT_C",
	"UK3CB_BAF_H_Mk6_DPMT_D",
	"UK3CB_BAF_H_Mk6_DPMT_E",
	"UK3CB_BAF_H_Mk6_DPMT_F",
	"UK3CB_BAF_H_Beret_PR_PRR_Over",
	"UK3CB_BAF_H_Beret_RM_Bootneck_PRR_Over",
  "UK3CB_BAF_H_Mk7_Scrim_A",
  "UK3CB_BAF_H_Mk7_Scrim_F",
  "UK3CB_BAF_H_Mk7_Scrim_ESS_A",
  "UK3CB_BAF_H_Mk7_Scrim_C",
  //Uniform
	"UK3CB_BAF_U_CombatUniform_DPMT",
	"UK3CB_BAF_U_CombatUniform_DPMT_ShortSleeve",
	"UK3CB_BAF_U_Smock_DPMT",
  //Vest
	"UK3CB_BAF_V_Osprey_DPMT2",
	"UK3CB_BAF_V_Osprey_DPMT4",
	"UK3CB_BAF_V_Osprey_DPMT5",
	"UK3CB_BAF_V_Osprey_DPMT6",
	"UK3CB_BAF_V_Osprey_DPMT7",
	"UK3CB_BAF_V_Osprey_DPMT8",
	"UK3CB_BAF_V_Osprey_DPMT9",
  //Backpack
	"UK3CB_BAF_B_Bergen_DPMT_Rifleman_A",
	"UK3CB_BAF_B_Bergen_DPMT_Rifleman_B",
	"UK3CB_BAF_B_Carryall_DPMT",
	"UK3CB_BAF_B_Kitbag_DPMT",
  //Facewear
  "M40_Gas_mask_nbc_v1_d",
  "rhs_googles_black",
  "rhs_googles_clear",
  "rhs_googles_orange",
  "rhs_googles_yellow",
  "rhs_ess_black",
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
  //NVG
  "ACE_NVG_Wide_Black",
	"ACE_NVG_Wide",
	"UK3CB_ANPVS7",
	"UK3CB_BAF_HMNVS",
	"UK3CB_PVS5A",
  //Binocular
  "Laserdesignator",
	"Laserbatteries",
	"UK3CB_BAF_Soflam_Laserdesignator",
	"Binocular",
	"rhsusf_bino_leopold_mk4",
	"ACE_Vector",
	"ACE_VectorDay",
  //Radio
  "TFAR_anprc152",
  "tfw_rf3080Item",
  //Sights
	"uk3cb_baf_susat",
	"rhsusf_acc_acog_rmr",
	"uk3cb_baf_ta31f_hornbill",
	"uk3cb_baf_ta31f",
	"uk3cb_baf_maxikite",
	"uk3cb_baf_kite",
	"uk3cb_baf_specterlds",
	"uk3cb_baf_suit",
  //Rail
	"uk3cb_baf_llm_flashlight_black",
	"uk3cb_baf_llm_flashlight_tan",
	"uk3cb_baf_llm_ir_black",
	"uk3cb_baf_llm_ir_tan",
	"rhsusf_acc_wmx_bk",
	"uk3cb_baf_flashlight_l131a1",
	"acc_flashlight_pistol",
  //Muzzle
	"uk3cb_baf_bayonet_l3a1",
	"uk3cb_baf_silencer_l85",
	"uk3cb_baf_silencer_l105a1",
	"rhsusf_acc_omega9k",
  //Bipod
	"uk3cb_underbarrel_acc_grippod",
	"uk3cb_underbarrel_acc_grippod_g",
	"uk3cb_underbarrel_acc_afg",
	"uk3cb_underbarrel_acc_afg_g",
  //Magazines
	"UK3CB_BAF_762_L42A1_20Rnd",
	"UK3CB_BAF_762_L42A1_20Rnd_T",
	"ACE_20Rnd_762x51_M993_AP_Mag",
	"UK3CB_BAF_556_200Rnd_T",
	"UK3CB_BAF_556_200Rnd",
	"UK3CB_BAF_556_100Rnd_T",
	"UK3CB_BAF_556_100Rnd",
	"UK3CB_BAF_556_30Rnd",
	"UK3CB_BAF_556_30Rnd_T",
	"rhsusf_200rnd_556x45_mixed_box",
	"rhsusf_200Rnd_556x45_box",
	"rhsusf_100Rnd_556x45_mixed_soft_pouch",
	"rhsusf_100Rnd_556x45_soft_pouch",
	"30Rnd_9x21_Mag_SMG_02",
	"30Rnd_9x21_Green_Mag",
	"30Rnd_9x21_Red_Mag",
	"UK3CB_BAF_762_20Rnd",
	"UK3CB_BAF_762_20Rnd_T",
	"UK3CB_BAF_12G_Pellets",
	"UK3CB_BAF_12G_Slugs",
  //Additional Magazines
	"LAW_F",
	"rhs_mag_maaws_HE",
	"rhs_mag_maaws_HEDP",
	"rhs_mag_maaws_HEAT",
	"UK3CB_BAF_1Rnd_HE_Grenade_Shell",
	"UK3CB_BAF_1Rnd_HEDP_Grenade_Shell",
	"UK3CB_BAF_UGL_FlareWhite_F",
	"UK3CB_BAF_UGL_FlareRed_F",
	"UK3CB_BAF_UGL_FlareGreen_F",
	"UK3CB_BAF_UGL_FlareYellow_F",
	"UK3CB_BAF_UGL_FlareCIR_F",
	"UK3CB_BAF_1Rnd_Smoke_Grenade_shell",
	"UK3CB_BAF_1Rnd_SmokeRed_Grenade_shell",
	"UK3CB_BAF_1Rnd_SmokeGreen_Grenade_shell",
	"UK3CB_BAF_1Rnd_SmokeYellow_Grenade_shell",
	"UK3CB_BAF_1Rnd_SmokePurple_Grenade_shell",
	"UK3CB_BAF_1Rnd_SmokeBlue_Grenade_shell",
	"UK3CB_BAF_1Rnd_SmokeOrange_Grenade_shell",
	"ACE_HuntIR_M203",
	"UK3CB_BAF_9_13Rnd",
	"UK3CB_BAF_9_15Rnd",
	"rhsusf_mag_17Rnd_9x19_FMJ",
	"rhsusf_mag_17Rnd_9x19_JHP",
	"UK3CB_BAF_9_17Rnd",
	"UK3CB_BAF_127_100Rnd",
	"UK3CB_BAF_32Rnd_40mm_G_Box",
	"UK3CB_BAF_1Rnd_Milan",
	"UK3CB_BAF_6Rnd_30mm_L21A1_HE",
	"UK3CB_BAF_6Rnd_30mm_L21A1_APDS",
	"UK3CB_BAF_762_800Rnd_T",
	"UK3CB_BAF_762_200Rnd_T",
  //Grenades
  "rhs_mag_an_m14_th3",
  "ACE_Chemlight_HiBlue",
  "ACE_Chemlight_HiGreen",
  "ACE_Chemlight_HiRed",
  "ACE_Chemlight_HiWhite",
  "ACE_Chemlight_HiYellow",
  "B_IR_Grenade",
  "ACE_HandFlare_Green",
  "ACE_HandFlare_Red",
  "ACE_HandFlare_White",
  "ACE_HandFlare_Yellow",
  "SmokeShellBlue",
  "SmokeShellGreen",
  "SmokeShellOrange",
  "SmokeShellPurple",
  "SmokeShellRed",
  "SmokeShellYellow",
  "rhs_mag_m67",
  "SmokeShell",
  "MiniGrenade",
  //Explosives
  "rhsusf_m112_mag",
  "rhsusf_m112x4_mag",
  //items
  "ToolKit",
  "ACE_RangeTable_82mm",
  "ACE_artilleryTable",
  "ACE_Banana",
  "ACE_fieldDressing",
  "ACE_packingBandage",
	"ACE_elasticBandage",
  "ACE_quikclot",
  "ACE_bodyBag",
  "ACE_CableTie",
  "ACE_DefusalKit",
  "ACE_EarPlugs",
  "ACE_EntrenchingTool",
  "ACE_epinephrine",
  "ACE_IR_Strobe_Item",
  "ACE_Clacker",
  "ACE_Flashlight_XL50",
  "ACE_MapTools",
  "ACE_microDAGR",
  "ACE_morphine",
  "kat_Painkiller",
  "ACE_personalAidKit",
  "ACE_RangeCard",
  "ACE_salineIV",
  "ACE_salineIV_250",
  "ACE_salineIV_500",
  "ACE_SpareBarrel_Item",
  "ACE_splint",
  "ACE_SpraypaintRed",
  "ACE_tourniquet",
  "ACE_WaterBottle",
  "ACE_wirecutter",
  "ItemcTabHCam",
	"ItemAndroid",
	"ItemGPS",
  "ItemWatch",
	"ItemMicroDAGR",
	"ItemcTab"
	];

	Private _ADMIN = [
  //Primary
  //Secondary
  //Launcher
  //Helm
  //Uniform
  //Vest
  //Backpack
  "tfw_ilbe_whip_coy",
  "tfw_ilbe_whip_gr",
  "tfw_ilbe_whip_mct",
  "tfw_ilbe_whip_mc",
  "tfw_ilbe_whip_ocp",
  "tfw_ilbe_whip_wd2",
  "B_rhsusf_B_BACKPACK",
  "B_UAV_01_backpack_F",
  "UK3CB_BAF_B_Bergen_DPMT_JTAC_H_A",
  "UK3CB_BAF_B_Bergen_DPMT_JTAC_A",
  "UK3CB_BAF_B_Bergen_DPMT_SL_A",
  "UK3CB_BAF_B_Bergen_OLI_SL_A",
  "UK3CB_BAF_B_Bergen_OLI_JTAC_A",
  "UK3CB_BAF_B_Bergen_OLI_JTAC_H_A",
  //Facewear
  "G_Balaclava_blk",
  //Sights
  //Rail
  //Muzzle
  //Bipod
  //Grenades
  //Explosives
  //items
  "B_UavTerminal",
  "tfw_rf3080Item",
  "ACE_HuntIR_monitor"
	];

	Private _CO = [
  //Primary
  //Secondary
  //Launcher
  //Helm
  //Uniform
  //Vest
  //Backpack
  "tfw_ilbe_whip_coy",
  "tfw_ilbe_whip_gr",
  "tfw_ilbe_whip_mct",
  "tfw_ilbe_whip_mc",
  "tfw_ilbe_whip_ocp",
  "tfw_ilbe_whip_wd2",
  "B_rhsusf_B_BACKPACK",
  "B_UAV_01_backpack_F",
  "B_UavTerminal",
  "UK3CB_BAF_B_Bergen_DPMT_JTAC_H_A",
  "UK3CB_BAF_B_Bergen_DPMT_JTAC_A",
  "UK3CB_BAF_B_Bergen_DPMT_SL_A",
  "UK3CB_BAF_B_Bergen_OLI_SL_A",
  "UK3CB_BAF_B_Bergen_OLI_JTAC_A",
  "UK3CB_BAF_B_Bergen_OLI_JTAC_H_A",
  //items
  "tfw_rf3080Item",
  "ACE_HuntIR_monitor"
  ];

	Private _SL = [
  //Primary
	"UK3CB_BAF_L85A2_UGL",
  //Secondary
  //Launcher
  //Helm
  //Uniform
  //Vest
  //Backpack
  "tfw_ilbe_whip_coy",
  "tfw_ilbe_whip_gr",
  "tfw_ilbe_whip_mct",
  "tfw_ilbe_whip_mc",
  "tfw_ilbe_whip_ocp",
  "tfw_ilbe_whip_wd2",
  "UK3CB_BAF_B_Bergen_DPMT_JTAC_H_A",
  "UK3CB_BAF_B_Bergen_DPMT_JTAC_A",
  "UK3CB_BAF_B_Bergen_DPMT_SL_A",
  "UK3CB_BAF_B_Bergen_OLI_SL_A",
  "UK3CB_BAF_B_Bergen_OLI_JTAC_A",
  "UK3CB_BAF_B_Bergen_OLI_JTAC_H_A",
  //items
  "tfw_rf3080Item",
  "ACE_HuntIR_monitor"
	];

	Private _MEDIC = [
  //Primary
  //Secondary
  //Launcher
  //Helm
  //Uniform
  //Vest
  //Backpack
  //items
  "kat_IV_16",
  "kat_AED",
  "kat_X_AED",
  "kat_EACA",
  "kat_IO_FAST",
  "kat_lidocaine",
  "kat_naloxone",
  "kat_TXA",
  "ACE_adenosine",
  "ACE_bloodIV",
  "ACE_bloodIV_250",
  "ACE_bloodIV_500",
  "ACE_plasmaIV",
  "ACE_plasmaIV_250",
  "ACE_plasmaIV_500",
  "ACE_surgicalKit"
  ];

	Private _MARKSMAN = [
  //Primary
	"UK3CB_BAF_L129A1",
  //Secondary
  //Launcher
  //Helm
  //Uniform
  //Vest
  //Backpack
	"B_rhsusf_B_BACKPACK",
	"B_UAV_01_backpack_F",
	"B_UavTerminal",
  //Facewear
  //Sights
	"optic_lrps",
	"optic_nightstalker",
	"uk3cb_baf_ta31f",
	"rhsusf_acc_m8541",
	"rhsusf_acc_m8541_mrds",
	"rhsusf_acc_m8541_wd",
	"rksl_optic_pmii_312_sunshade",
	"rksl_optic_pmii_525",
  //Rail
	"rhsusf_acc_anpeq15side_bk",
	"rhsusf_acc_anpeq15_bk",
	"rhsusf_acc_anpeq15a",
  //Muzzle
	"uk3cb_underbarrel_acc_fgrip_bipod",
	"uk3cb_underbarrel_acc_bipod",
	"uk3cb_underbarrel_acc_grippod",
	"uk3cb_underbarrel_acc_afg",
	"uk3cb_baf_silencer_l115a3",
  //Bipod
	"uk3cb_underbarrel_acc_fgrip_bipod",
	"uk3cb_underbarrel_acc_bipod",
	"uk3cb_underbarrel_acc_grippod",
	"uk3cb_underbarrel_acc_afg",
  "ItemMicroDAGR",
	"ItemcTab"
	];

	Private _AUTORIFLEMAN = [
  //Primary
	"UK3CB_BAF_L110A2",
	"UK3CB_BAF_L7A2",
  //Secondary
  //Launcher
  //Helm
  //Uniform
  //Vest
  //Backpack
  //Facewear
  //Sights
  //Rail
  //Muzzle
  //Bipod
  "ItemMicroDAGR",
	"ItemcTab"
	];

	Private _AT = [
  //Primary
  //Secondary
  //Launcher
	"launch_NLAW_F",
	"rhs_weap_maaws",
	"UK3CB_BAF_Javelin_Slung_Tube",
	"UK3CB_BAF_Javelin_CLU",
  //Helm
  //Uniform
  //Vest
  //Backpack
	//Magazines
  "ItemMicroDAGR",
	"ItemcTab"
	];

  Private _GRENADIER = [
  //Primary
	"UK3CB_BAF_L85A2_UGL",
	"UK3CB_BAF_L85A2_UGL_HWS",
	"UK3CB_BAF_L85A3_UGL",
  //Secondary
  //Launcher
  //Helm
  //Uniform
  //Vest
  //Backpack
	//Magazines
	"tfw_rf3080Item",
  "ACE_HuntIR_monitor"
  ];

	Private _RIFLEMAN = [
  //Primary
  //Secondary
  //Launcher
  //Helm
  //Uniform
  //Vest
  //Backpack
  //items
	"tfw_rf3080Item",
	"ACE_HuntIR_monitor"
	];

  Private _WARPIG = [
  //Primary
	"UK3CB_BAF_L22",
  //Secondary
  //Launcher
  //Helm
  //Uniform
  //Vest
  //Backpack
  "tfw_ilbe_whip_coy",
  "tfw_ilbe_whip_gr",
  "tfw_ilbe_whip_mct",
  "tfw_ilbe_whip_mc",
  "tfw_ilbe_whip_ocp",
  "tfw_ilbe_whip_wd2",
  "UK3CB_BAF_B_Bergen_DPMT_JTAC_H_A",
  "UK3CB_BAF_B_Bergen_DPMT_JTAC_A",
  "UK3CB_BAF_B_Bergen_DPMT_SL_A",
  "UK3CB_BAF_B_Bergen_OLI_SL_A",
  "UK3CB_BAF_B_Bergen_OLI_JTAC_A",
  "UK3CB_BAF_B_Bergen_OLI_JTAC_H_A",
	//items
  "tfw_rf3080Item"
  ];

	Private _OGRE = [
  //Primary
  //Secondary
  //Launcher
  "UK3CB_BAF_M6",
  "UK3CB_BAF_1Rnd_60mm_Mo_AB_Shells",
  "UK3CB_BAF_1Rnd_60mm_Mo_Shells",
  "UK3CB_BAF_1Rnd_60mm_Mo_Smoke_Red",
  "UK3CB_BAF_1Rnd_60mm_Mo_Flare_White",
  "UK3CB_BAF_1Rnd_60mm_Mo_WPSmoke_White",
  "UK3CB_BAF_1Rnd_60mm_Mo_Smoke_White",
  //Helm
  //Uniform
  //Vest
  //Backpack
  "tfw_ilbe_whip_coy",
  "tfw_ilbe_whip_gr",
  "tfw_ilbe_whip_mct",
  "tfw_ilbe_whip_mc",
  "tfw_ilbe_whip_ocp",
  "tfw_ilbe_whip_wd2",
  "UK3CB_BAF_B_Bergen_DPMT_JTAC_H_A",
  "UK3CB_BAF_B_Bergen_DPMT_JTAC_A",
  "UK3CB_BAF_B_Bergen_DPMT_SL_A",
  "UK3CB_BAF_B_Bergen_OLI_SL_A",
  "UK3CB_BAF_B_Bergen_OLI_JTAC_A",
  "UK3CB_BAF_B_Bergen_OLI_JTAC_H_A",
	//Explosives
  //items
  "ACE_1Rnd_82mm_Mo_HE",
  "ACE_1Rnd_82mm_Mo_HE_Guided",
  "ACE_1Rnd_82mm_Mo_Illum",
  "ACE_1Rnd_82mm_Mo_HE_LaserGuided",
  "ACE_1Rnd_82mm_Mo_Smoke",
  "ACE_rope12",
  "ACE_rope15",
  "ACE_rope18",
  "ACE_rope27",
  "tfw_rf3080Item",
  "kat_IV_16",
  "kat_AED",
  "kat_X_AED",
  "kat_EACA",
  "kat_IO_FAST",
  "kat_lidocaine",
  "kat_naloxone",
  "kat_TXA",
  "ACE_adenosine",
  "ACE_bloodIV",
  "ACE_bloodIV_250",
  "ACE_bloodIV_500",
  "ACE_plasmaIV",
  "ACE_plasmaIV_250",
  "ACE_plasmaIV_500",
  "ACE_surgicalKit"
	];

	Private _STALKER = [
  //Primary
	"UK3CB_BAF_L22",
  //Secondary
  //Launcher
  //Helm
	"UK3CB_BAF_V_Pilot_DPMT",
  //Uniform
	"UK3CB_BAF_U_JumperUniform_DPMT",
  //Vest
  //Backpack
  "tfw_ilbe_whip_coy",
  "tfw_ilbe_whip_gr",
  "tfw_ilbe_whip_mct",
  "tfw_ilbe_whip_mc",
  "tfw_ilbe_whip_ocp",
  "tfw_ilbe_whip_wd2",
	"tfw_ilbe_blade_black",
  "UK3CB_BAF_B_Bergen_DPMT_JTAC_H_A",
  "UK3CB_BAF_B_Bergen_DPMT_JTAC_A",
  "UK3CB_BAF_B_Bergen_DPMT_SL_A",
  "UK3CB_BAF_B_Bergen_OLI_SL_A",
  "UK3CB_BAF_B_Bergen_OLI_JTAC_A",
  "UK3CB_BAF_B_Bergen_OLI_JTAC_H_A",
	//items
	"rhsusf_acc_mrds",
	"rhsusf_acc_eotech_xps3",
  "ACE_rope12",
  "ACE_rope15",
  "ACE_rope18",
  "ACE_rope27",
  "tfw_rf3080Item"
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
	  case "AUTORIFLEMAN": {
	    _GearToAdd = _DefaultGear + _AUTORIFLEMAN;
	  };
	  case "AT": {
	    _GearToAdd = _DefaultGear + _AT;
    };
	  case "GRENADIER": {
	    _GearToAdd = _DefaultGear + _GRENADIER;
    };
	  case "RIFLEMAN": {
	    _GearToAdd = _DefaultGear + _RIFLEMAN;
    };
    case "WARPIG": {
	    _GearToAdd = _DefaultGear + _WARPIG;
	  };
		case "OGRE": {
	    _GearToAdd = _DefaultGear + _OGRE;
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
