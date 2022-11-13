
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
			if ((_UnitRole == "Alpha Specialist")
			or (_UnitRole == "Bravo Specialist")
			or (_UnitRole == "Charlie Specialist")) then
			{_Role = "SPECIALIST"};
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
    /*
    //Armor
			if ((_UnitRole == "Warpig Commander@Armor")
			or (_UnitRole == "Warpig Driver")
      or (_UnitRole == "Warpig Gunner")) then
			{_Role = "WARPIG"};
    */
    //O.G.R.E
			if ((_UnitRole == "O.G.R.E Commander@O.G.R.E (Logistics)")
			or (_UnitRole == "O.G.R.E Engineer")) then
			{_Role = "OGRE"};
    //STALKER
	    if ((_UnitRole == "STALKER 1 Pilot@Joint Air Command 1")
	    or (_UnitRole == "STALKER 1 Co-Pilot")
      or (_UnitRole == "STALKER 2 Pilot@Joint Air Command 2")
      or (_UnitRole == "STALKER 2 Co-Pilot")) then
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
	"rhs_weap_m4",
	"rhs_weap_m4_carryhandle",
	"rhs_weap_m4_carryhandle_mstock",
	"rhs_weap_m4_mstock",
	"gst_m16a2",
  //Secondary
	"rhsusf_weap_glock17g4",
	"rhsusf_weap_m1911a1",
	"rhsusf_weap_m9",
	"ACE_VMH3",
	"ACE_VMM3",
  //Launcher
	"rhs_weap_m72a7",
	"rhs_weap_M136",
	"rhs_weap_M136_hedp",
  //Helm
	"H_MichB_dcu",
	"H_MichSpecB_dcu",
	"H_MichSpecB_dcu_G",
	"H_MichB_dcu_G",
	"H_MichSpecB_DCU_net",
	"H_MichB_DCU_net",
	"cap_patrel_dcu",
  //Uniform
	"U_B_BDU_DCU",
	"U_B_BDU_DCU_knee_blk",
	"U_B_MC_mopp_blk",
  //Vest
	"V_SPER_Rig_A_m81",
	"V_SPER_rig_B_m81",
	"V_ETLBV",
	"V_IBA_C",
	"V_IBA_Alice",
  //Backpack
	"B_AssaultPack_rgr_05",
	"B_AssaultPack_m81_05",
	"B_patrelPack_m81",
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
	"Binocular",
	"rhsusf_bino_leopold_mk4",
	"ACE_Vector",
	"ACE_VectorDay",
  //Radio
  "TFAR_anprc152",
  "tfw_rf3080Item",
  //Sights
	"rhsusf_acc_acog",
	"rhsusf_acc_eotech_552",
	"rhsusf_acc_compm4",
  //Rail
	"rhsusf_acc_anpeq15side_bk",
	"rhsusf_acc_anpeq15_bk_top",
  //Muzzle
	"rhsusf_acc_sf3p556",
	"rhsusf_acc_sfmb556",
	"rhsusf_acc_nt4_black",
	"ace_muzzle_mzls_l",
  //Bipod
	"rhsusf_acc_grip2",
	"rhsusf_acc_grip1",
	"rhsusf_acc_kac_grip",
	"rhsusf_acc_harris_bipod",
  //Magazines
	"rhs_mag_30Rnd_556x45_M855A1_Stanag",
	"rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",
	"rhsusf_mag_15Rnd_9x19_JHP",
	"rhsusf_mag_15Rnd_9x19_FMJ",
	"rhsusf_mag_17Rnd_9x19_FMJ",
	"rhsusf_mag_17Rnd_9x19_JHP",
	"9Rnd_45ACP_Mag",
	"rhsusf_mag_7x45acp_MHP",
  //Additional Magazines
	"LAW_F",
	"rhs_mag_maaws_HE",
	"rhs_mag_maaws_HEDP",
	"rhs_mag_maaws_HEAT",
	"rhs_fim92_mag",
	"rhs_fgm148_magazine_AT",
	"ACE_HuntIR_M203",
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
	"ItemcTab",
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
  //Facewear
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
	"tfw_ilbe_blade_arid",
	"tfw_ilbe_blade_coy",
  "B_rhsusf_B_BACKPACK",
  "B_UAV_01_backpack_F",
  "B_UavTerminal",
  //items
  "tfw_rf3080Item",
  "ACE_HuntIR_monitor"
  ];

	Private _SL = [
  //Primary
  //Secondary
  //Launcher
  //Helm
  //Uniform
  //Vest
  //Backpack
  "tfw_ilbe_blade_arid",
	"tfw_ilbe_blade_coy",
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
	"B_MedicPack_m81",
	"rhssaf_alice_smb",
	"B_Carryall_oli",
  //items
  "kat_IV_16",
  "kat_AED",
  "kat_X_AED",
  "kat_IO_FAST",
  "kat_naloxone",
  "kat_TXA",
  "kat_EACA",
  "kat_plate",
  "kat_clamp",
  "kat_retractor",
  "kat_scalpel",
  "kat_etomidate",
  "kat_flumazenil",
  "kat_lidocaine",
  "kat_lorazepam",
  "kat_nitroglycerin",
  "kat_norepinephrine",
  "kat_phenylephrine",
  "ACE_adenosine",
  "ACE_bloodIV",
  "ACE_bloodIV_250",
  "ACE_bloodIV_500",
  "ACE_plasmaIV",
  "ACE_plasmaIV_250",
  "ACE_plasmaIV_500",
  "ACE_surgicalKit"
  ];

	Private _SPECIALIST = [
  //Primary
  //Secondary
  //Launcher
  //Helm
  //Uniform
  //Vest
  //Backpack
	"rhs_rk_sht_30_olive_engineer_empty",
	"B_UAV_01_backpack_F",
  "B_UavTerminal",
  //Facewear
  //Sights
  //Rail
  //Muzzle
  //Bipod
	//Explosives
	"rhsusf_m112_mag",
  "rhsusf_m112x4_mag",
  //items
	"ACE_DefusalKit"
	];

	Private _AUTORIFLEMAN = [
  //Primary
	"rhs_weap_m240B",
	"rhs_weap_m240G",
	"rhs_weap_m249_pip_L",
  //Secondary
  //Launcher
  //Helm
  //Uniform
  //Vest
	"V_IBA_DCU_SAW",
	"V_IBA_SAW_Late",
	"V_IBA_SAW",
  //Backpack
	"rhssaf_alice_smb",
	"B_Carryall_oli",
  //Facewear
  //Sights
	"rhsusf_acc_elcan",
	"rhsusf_acc_elcan_ard",
	"rhsusf_acc_acog_mdo",
  //Rail
  //Muzzle
	"ace_muzzle_mzls_b",
	"rhsusf_acc_ardec_m240",
  //Bipod
	"rhsusf_acc_saw_bipod",
	"rhsusf_acc_grip4",
	"rhsusf_acc_grip4_bipod",
	//Magazines
	"rhsusf_200Rnd_556x45_box",
	"rhsusf_200rnd_556x45_mixed_box",
	"rhsusf_100Rnd_762x51_m61_ap",
	"rhsusf_100Rnd_762x51_m62_tracer",
	//items
  "ItemMicroDAGR",
	"ItemcTab"
	];

	Private _AT = [
  //Primary
  //Secondary
  //Launcher
	"launch_NLAW_F",
	"launch_MRAWS_sand_F",
	"rhs_weap_fgm148",
	"rhs_weap_fim92",
  //Helm
  //Uniform
  //Vest
  //Backpack
	"rhssaf_alice_smb",
	"B_Carryall_oli",
	//Magazines
	"rhs_fgm148_magazine_AT",
	"rhs_fim92_mag",
  "ItemMicroDAGR",
	"ItemcTab"
	];

  Private _GRENADIER = [
  //Primary
	"rhs_weap_m4_carryhandle_m203",
	"rhs_weap_m4_m203",
	"gst_m16a2_gl",
  //Secondary
  //Launcher
  //Helm
  //Uniform
  //Vest
	"V_IBA_DCU_FLC_TL_D",
	"V_IBA_FLC_TL",
	"V_IBA_FLC_TL_D",
  //Backpack
	//Magazines
	"1Rnd_HE_Grenade_shell",
	"rhs_mag_M433_HEDP",
	"rhs_mag_M441_HE",
	"rhs_mag_M583A1_white",
	"rhs_mag_M397_HET",
	"rhs_mag_m661_green",
	"rhs_mag_m713_Red",
	"rhs_mag_m714_White",
	"rhs_mag_m715_Green",
	"rhs_mag_m716_yellow",
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

*/
  Private _WARPIG = [
  //Primary
  //Secondary
  //Launcher
  //Helm
	"cvc_d",
	"cvc_mc",
	"cvc_mc_gd",
	"cvc_mc_g",
	"cvc_d_swd",
  //Uniform
	"nomex_Olive",
	"nomex_desert",
  //Vest
  //Backpack
	"tfw_ilbe_blade_arid",
	"tfw_ilbe_blade_coy",
  "B_rhsusf_B_BACKPACK",
	//items
  "tfw_rf3080Item"
  ];

*/
	Private _OGRE = [
  //Primary
  //Secondary
  //Launcher
  //Helm
	"cvc_d",
	"cvc_mc",
	"cvc_mc_gd",
	"cvc_mc_g",
	"cvc_d_swd",
  //Uniform
  //Vest
  //Backpack
	"tfw_ilbe_blade_arid",
	"tfw_ilbe_blade_coy",
  "B_rhsusf_B_BACKPACK",
	"rhssaf_alice_smb",
	"B_Carryall_oli",
	"rhs_rk_sht_30_olive_engineer_empty",
	//Explosives
	"rhsusf_m112_mag",
  "rhsusf_m112x4_mag",
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
  "ACE_surgicalKit",
	"ACE_DefusalKit"
	];

	Private _STALKER = [
  //Primary
  //Secondary
  //Launcher
  //Helm
	"rhsusf_hgu56p_black",
	"rhsusf_hgu56p_mask_black",
	"rhsusf_hgu56p_mask_black_skull",
	"rhsusf_hgu56p_visor_black",
	"rhsusf_hgu56p_visor_mask_black",
	"rhsusf_hgu56p_visor_mask_Empire_black",
	"rhsusf_hgu56p_visor_mask_black_skull",
	"rhsusf_hgu56p_green",
	"rhsusf_hgu56p_visor_green",
	"rhsusf_hgu56p_visor_mask_green_mo",
	"rhsusf_hgu56p",
	"rhsusf_hgu56p_visor",
	"rhsusf_hgu56p_visor_mask_skull",
	"rhsusf_hgu56p_visor_mask_pink",
	"rhsusf_hgu56p_visor_pink",
	"rhsusf_hgu56p_saf",
	"rhsusf_hgu56p_visor_saf",
	"rhsusf_hgu56p_visor_mask_saf",
	"rhsusf_hgu56p_mask_smiley",
	"rhsusf_hgu56p_visor_mask_smiley",
	"rhsusf_hgu56p_tan",
	"rhsusf_hgu56p_visor_tan",
	"rhsusf_hgu56p_visor_mask_tan",
	"rhsusf_hgu56p_usa",
	"rhsusf_hgu56p_visor_usa",
	"rhsusf_ihadss",
  //Uniform
	"nomex_Olive",
	"nomex_desert",
  //Vest
	"Airchew_vest",
	"Airchew_vest_NH",
  //Backpack
	"tfw_ilbe_blade_arid",
	"tfw_ilbe_blade_coy",
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
	    _GearToAdd = _DefaultGear + _SPECIALIST;
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
    */
    case "WARPIG": {
	    _GearToAdd = _DefaultGear + _WARPIG;
	  };
    */
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
