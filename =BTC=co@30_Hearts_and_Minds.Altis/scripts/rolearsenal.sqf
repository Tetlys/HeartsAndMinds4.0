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
    //O.G.R.E
			if ((_UnitRole == "O.G.R.E Commander@O.G.R.E")
			or (_UnitRole == "O.G.R.E Engineer")) then
			{_Role = "OGRE"};
    // STALKER
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
  "rhs_weap_m27iar_grip",
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
  "rhs_booniehat2_marpatwd",
  "rhsusf_lwh_helmet_marpatwd",
  "rhsusf_lwh_helmet_marpatwd_blk_ess",
  "rhsusf_lwh_helmet_marpatwd_headset_blk2",
  "rhsusf_lwh_helmet_marpatwd_headset_blk",
  "rhsusf_mich_helmet_marpatwd",
  "rhsusf_mich_helmet_marpatwd_alt",
  "rhsusf_mich_helmet_marpatwd_alt_headset",
  "rhsusf_mich_helmet_marpatwd_headset",
  "rhsusf_mich_helmet_marpatwd_norotos",
  "rhsusf_mich_helmet_marpatwd_norotos_arc",
  "rhsusf_mich_helmet_marpatwd_norotos_arc_headset",
  "rhsusf_mich_helmet_marpatwd_norotos_headset",
  "rhs_8point_marpatwd",
  //Uniform
  "rhs_uniform_FROG01_wd",
  //Vest
  "rhsusf_spc",
  "rhsusf_spc_iar",
  "rhsusf_spc_light",
  "rhsusf_spc_rifleman",
  //Backpack
  "B_Kitbag_cbr",
  "B_Kitbag_rgr",
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
  //Uniform
  //Vest
  "rhsusf_spc_squadleader",
  "rhsusf_spc_teamleader",  
  //Backpack
  "B_rhsusf_B_BACKPACK",
  "B_UAV_01_backpack_F",
  "tfw_ilbe_blade_wd",
  "tfw_ilbe_whip_wd",
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
  //Uniform
  //Vest
  "rhsusf_iotv_ocp_Squadleader",
  "rhsusf_spcs_ocp_squadleader",
  //Backpack
  "B_rhsusf_B_BACKPACK",
  "B_UAV_01_backpack_F",
  "tfw_ilbe_blade_wd",
  "tfw_ilbe_whip_wd",
  //Facewear
  //Sights
  //Rail
  //Muzzle
  //Bipod
  //items
  "ACE_HuntIR_monitor",
  "B_UavTerminal",
  "ItemcTab",
  "tfw_rf3080Item",
  "rhsusf_m112_mag",
  "ACE_Clacker"
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
  //Uniform
  //Vest
  "rhsusf_spc_corpsman",
  //Backpack
  "B_Carryall_cbr",
  "B_Carryall_khk",
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
  "kat_TXA",
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
  //Uniform
  "U_B_GhillieSuit",
  //Vest
  "rhsusf_spc_iar",
  "rhsusf_spc_marksman",
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

	Private _AUTORIFLEMAN = [
  //Primary
  "rhs_weap_m240B",
  "rhs_weap_m249_pip_ris",
  "rhs_weap_m249_light_S",
  //Secondary
  //Launcher
  //Helm
  //Uniform
  //Vest
  "rhsusf_spc_mg",
  //Backpack
  "B_Carryall_cbr",
  "B_Carryall_khk",
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
  //Uniform
  //Vest
  //Backpack
  "B_Carryall_cbr",
  "B_Carryall_khk"
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
  //Uniform
  //Vest
  "rhsusf_spc_teamleader"
  //Backpack
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
  //Vest
  //Backpack
  //Facewear
  //Sights
  //Rail
  //Muzzle
  //Bipod
  //items
  "rhsusf_m112_mag",
  "ACE_Clacker",
  "ACE_1Rnd_82mm_Mo_HE",
  "ACE_1Rnd_82mm_Mo_HE_Guided",
  "ACE_1Rnd_82mm_Mo_Illum",
  "ACE_1Rnd_82mm_Mo_HE_LaserGuided",
  "ACE_1Rnd_82mm_Mo_Smoke",
  "ToolKit",
  //DRIVESHIT
  "U_B_Wetsuit",
  "V_RebreatherB",
  "G_B_Diving",
  "lxWS_H_Headset",
  "arifle_SDAR_F",
  "20Rnd_556x45_UW_mag
"
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
