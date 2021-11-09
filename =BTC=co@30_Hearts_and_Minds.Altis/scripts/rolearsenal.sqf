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

	if ((_UnitRole == "Admin 6 @ Admin")
	or (_UnitRole == "Admin 7 @ Admin")
	or (_UnitRole == "Admin 8 @ Admin")) then
	{_Role = "ADMIN"};

	// Command

	if (_UnitRole == "Company Commander @ CROSSROADS") then
	{_Role = "CO"};


	if (_UnitRole == "Platoon Commander @ HITMAN") then
	{_Role = "PLTCO"};

	if ((_UnitRole == "Assassin 1-7 Platoon Sergeant@Assassin 1 HQ")
	or (_UnitRole == "Assassin 2-7 Platoon Sergeant@Assassin 2 HQ")) then
	{_Role = "PLTXO"};

	if (_UnitRole == "JTAC  @ SUNRAY") then
	{_Role = "PLTJFO"};

	// Squad Leaders

	if ((_UnitRole == "Alpha Squad Leader@Alpha (Infantry)")
	or (_UnitRole == "Bravo Squad Leader@Bravo (Infantry)")
	or (_UnitRole == "Charlie Squad Leader@Charlie (Infantry)")) then
	{_Role = "SQDCO"};

	if ((_UnitRole == "Alpha A Fireteam Leader")
	or (_UnitRole == "Alpha B Fireteam Leader")
	or (_UnitRole == "Bravo A Fireteam Leader")
	or (_UnitRole == "Bravo B Fireteam Leader")
  	or (_UnitRole == "Charlie A Fireteam Leader")
  	or (_UnitRole == "Charlie B Fireteam Leader")) then
	{_Role = "SQDXO"};

	if ((_UnitRole == "Alpha Medic")
	or (_UnitRole == "Bravo Medic")
	or (_UnitRole == "Charlie Medic")) then
	{_Role = "MEDIC"};

	// Normal Squads

	if ((_UnitRole == "Alpha A Rifleman")
	or (_UnitRole == "Alpha B Rifleman")
	or (_UnitRole == "Bravo A Rifleman")
	or (_UnitRole == "Bravo B Rifleman")
	or (_UnitRole == "Charlie A Rifleman")
	or (_UnitRole == "Charlie B Rifleman")) then
	{_Role = "SQDRIFLE"};

	if ((_UnitRole == "Alpha A Automatic Rifleman")
	or (_UnitRole == "Alpha B Automatic Rifleman")
	or (_UnitRole == "Bravo A Automatic Rifleman")
	or (_UnitRole == "Bravo B Automatic Rifleman")
	or (_UnitRole == "Charlie A Automatic Rifleman")
	or (_UnitRole == "Charlie B Automatic Rifleman")) then
	{_Role = "SQDAUTORIFLE"};

	if ((_UnitRole == "Alpha B AT")
	or (_UnitRole == "Bravo B AT")
	or (_UnitRole == "Charlie B AT")) then
	{_Role = "SQDAT"};

	if ((_UnitRole == "Alpha A Grenadier")
	or (_UnitRole == "Bravo A Grenadier")
	or (_UnitRole == "Charlie A Grenadier")) then
	{_Role = "SQDGREN"};

	// Banshee

	if ((_UnitRole == "Medevac Team Leader @ MEDEVAC")
	or (_UnitRole == "Medevac Trauma Specialist")
	or (_UnitRole == "Medevac Trauma Specialist")) then
	{_Role = "BANSHEE"};

	// Air Command

	if ((_UnitRole == "STALKER 1 Pilot@Joint Air Command 1")
	or (_UnitRole == "STALKER 2 Pilot@Joint Air Command 2")
	or (_UnitRole == "STALKER 3 Pilot @Joint Air Command 3")) then
	{_Role = "JAC"};

	// Butcher

	if ((_UnitRole == "Armor 1 Driver")
	or (_UnitRole == "Armor 1 Gunner")
	or (_UnitRole == "Armor 1 Vehicle Commander@Armor 1 (Armor)")
	or (_UnitRole == "Armor 2 Vehicle Commander@Armor 2 (Armor)")
	or (_UnitRole == "Armor 2 Gunner")
	or (_UnitRole == "Armor 2 Driver")) then
	{_Role = "BUTCHER"};

	// Ogre

	if ((_UnitRole == "Logistics Team Leader @ OGRE 1")
	or (_UnitRole == "Logistics Team Leader @ OGRE 2")
	or (_UnitRole == "Logistics Engineer")) then
	{_Role = "OGRE"};

	// Savage

	if ((_UnitRole == "Battery Team Leader@Battery (Indirect Fire)")
	or (_UnitRole == "Battery Operator")) then
	{_Role = "SAVAGE"};


	//Empty array of gear to add to the arsenal per player.
	Private _GearToAdd = [];

	//Define the gear for each Role
	Private _DefaultGear = [
		// Headgear
		"rhsusf_opscore_fg",
		"rhsusf_opscore_fg_pelt",
		"rhsusf_opscore_fg_pelt_cam",
		// UNIFORMS
		"rhs_uniform_g3_rgr",
		// VESTS
		"rhsusf_spc_corpsman",
		"rhsusf_spc_crewman",
		"rhsusf_spc_mg",
		"rhsusf_spc_rifleman",
		"rhsusf_spc_squadleader",
		"rhsusf_spc_teamleader",
		"rhsusf_spc_patchless_radio",
		// GOGGLES
		"rhsusf_oakley_goggles_blk",
		"rhsusf_oakley_goggles_clr",
		"rhsusf_oakley_goggles_ylw",
		// BACKPACKS
		"B_Parachute",
		"B_Carryall_khk",
		"B_Kitbag_cbr",
		"B_Carryall_oli",
		"rhsusf_assault_eagleaiii_ocp",
		"tfw_ilbe_blade_mc",
		"tfw_ilbe_blade_ocp",
		// WEAPONS & AMMO
			// Smokes Chems etc.
			"ACE_IR_Strobe_Item",
			"rhs_mag_an_m8hc",
			"Chemlight_blue",
			"Chemlight_green",
			"ACE_Chemlight_Orange",
			"Chemlight_red",
			"Chemlight_yellow",
			"ACE_Chemlight_White",
			"SmokeShellBlue",
			"SmokeShellGreen",
			"SmokeShellOrange",
			"SmokeShellPurple",
			"SmokeShellRed",
			"SmokeShellYellow",
			"ACE_HandFlare_Green",
			"ACE_HandFlare_Red",
			"ACE_HandFlare_White",
			"ACE_HandFlare_Yellow",
			//weapons
			"rhs_weap_m16a4",
			"rhs_weap_m4",
			"rhs_weap_mk18_bk",
			"rhs_weap_mk18_d",
			"rhs_weap_m4a1_carryhandle",
			"rhs_weap_m4a1_blockII",
			"rhs_weap_m4a1_blockII_bk",
			"rhs_weap_m4a1_blockII_d",
			"rhs_weap_m4a1",
			"rhs_weap_m4a1_d",
			"rhs_weap_M590_5RD",
			"rhs_mag_m67",
			"rhs_weap_m72a7",
			"rhsusf_weap_glock17g4",
			"hgun_Pistol_heavy_01_F",
			"optic_mrd_black",
			"optic_mrd",
			"muzzle_snds_acp",
			"11Rnd_45ACP_Mag",
			"rhsusf_weap_glock17g4",
			"rhsusf_weap_m1911a1",
			"rhsusf_weap_m9",
			"rhsusf_mag_17Rnd_9x19_FMJ",
			"rhsusf_mag_17Rnd_9x19_JHP",
			"rhsusf_acc_omega9k",
			"9Rnd_45ACP_Mag",
			"rhsusf_mag_7x45acp_MHP",
			"rhsusf_mag_15Rnd_9x19_FMJ",
			"rhsusf_mag_15Rnd_9x19_JHP",
			//Attachments
			"rhsusf_acc_harris_bipod",
			"rhsusf_acc_kac_grip",
			"rhsusf_acc_rvg_blk",
			"rhsusf_acc_grip1",
			"rhsusf_acc_tdstubby_blk",
			"rhsusf_acc_nt4_black",
			"rhsusf_acc_nt4_tan",
			"rhsusf_acc_anpeq15side",
			"rhsusf_acc_anpeq16a",
			"rhsusf_acc_anpeq16a_light",
			"rhsusf_acc_anpeq16a_top",
			"rhsusf_acc_anpeq16a_light_top",
			"rhsusf_acc_wmx_bk",
			"optic_erco_blk_f",
			"rhsusf_acc_acog_rmr",
			"rhsusf_acc_acog_d",
			"rhsusf_acc_eotech_xps3",
			"rhsusf_acc_acog_mdo",
			"rhsusf_acc_compm4",
			"rhsusf_acc_eotech_552",
			"rhsusf_acc_eotech_552_d",
			"rhsusf_acc_acog",
			"rhsusf_acc_elcan",
			"rhsusf_acc_g33_xps3",
			"rhsusf_acc_g33_xps3_tan",
			"rhsusf_acc_ardec_m240",
			"rhs_acc_pbs1",
			"rhs_acc_dtk1983",
			"rhs_acc_perst1ik",
			"optic_hamr",
			"optic_mrco",
			"rhsusf_acc_harris_bipod",
			"rhsusf_acc_acog3_usmc",
			"rhsusf_acc_anpeq15",
			"rhsusf_acc_anpeq15_light",
			"rhsusf_acc_grip2",
			"rhsusf_acc_grip2_tan",
			//ammo
			"1Rnd_HE_Grenade_shell",
			"rhs_mag_m4009",
			"ACE_HuntIR_M203",
			"rhs_mag_m714_White",
			"SmokeShell",
			"rhs_mag_m713_Red",
			"ACE_40mm_Flare_white",
			"ACE_40mm_Flare_ir",
			"rhs_mag_30Rnd_556x45_M855A1_Stanag",
			"rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red",
			"rhs_mag_30Rnd_556x45_M193_Stanag",
			"rhs_mag_30Rnd_556x45_M855_Stanag",
			"rhsusf_mag_17Rnd_9x19_FMJ",
			"rhsusf_mag_17Rnd_9x19_JHP",
			"rhsusf_100Rnd_762x51_m61_ap",
			"rhsusf_100Rnd_762x51_m62_tracer",
			"rhsusf_100Rnd_762x51",
			"rhsusf_50Rnd_762x51_m61_ap",
			"rhsusf_50Rnd_762x51_m62_tracer",
			"rhsusf_200rnd_556x45_M855_box",
			"rhsusf_200rnd_556x45_M855_mixed_box",
			"rhsusf_100Rnd_556x45_M855_soft_pouch_ucp",
			"rhsusf_100Rnd_556x45_M855_mixed_soft_pouch_ucp",
		// Misc
			// H&M Stuff
		    "ACE_Banana",
			"ACE_SpraypaintRed",
			"ACE_SpraypaintGreen",
			"ACE_SpraypaintBlue",
			"ACE_wirecutter",
			"M40_Gas_mask_nbc_v1_d",
			// Medical
			"ACE_fieldDressing",
			"ACE_elasticBandage",
			"ACE_packingBandage",
			"ACE_quikclot",
			"ACE_epinephrine",
			"ACE_morphine",
			"ACE_splint",
			"ACE_tourniquet",
			"ACE_bodyBag",
			// General
			"ACE_CableTie",
			"ACE_EarPlugs",
			"ACE_EntrenchingTool",
			"ACE_Flashlight_MX991",
			"ACE_Flashlight_XL50",
			"ACE_MapTools",
			"ACE_DAGR",
			"ACE_microDAGR",
			"ItemcTabHCam",
			"rhsusf_ANPVS_15",
			"rhsusf_ANPVS_14",
			"rhsusf_bino_m24",
			"ItemMap",
			"ItemAndroid",
			"ItemMicroDAGR",
			"ItemcTab",
			"TFAR_anprc152",
			"ItemCompass",
			"ItemWatch",
			"ACE_Altimeter",
			"TFAR_microdagr",
			"Binocular",
			"ACE_Vector",
			"ACE_VMH3",
			"ACE_NVG_Wide"
	];

	Private _CO = [
		// Headgear and uniforms

		// BACKPACKS
		"TFAR_rt1523g",
		"tfw_ilbe_whip_ocp",
		"TFAR_rt1523g_big",
		"tfw_ilbe_blade_ocp",
		"tfw_ilbe_blade_arid",
		"tfw_ilbe_blade_black",
		"B_UAV_01_backpack_F",
		"ACE_UAVBattery",
		// Misc
		"ACE_SpottingScope",
		"tfw_rf3080Item",
		"B_UavTerminal",
		"ACE_HuntIR_monitor",
		"ACE_MX2A",
		"Laserdesignator"
		];

	Private _PLTCO = [
		// BACKPACKS
		"TFAR_rt1523g",
		"TFAR_rt1523g_big",
		"tfw_ilbe_blade_arid",
		"tfw_ilbe_blade_black",
		"B_UAV_01_backpack_F",
		"ACE_UAVBattery",
		// Misc
		"ACE_SpottingScope",
		"tfw_rf3080Item",
		//MISC
		"ACE_VMH3",
		"B_UavTerminal",
		"ACE_HuntIR_monitor",
		"ACE_MX2A",
		"Laserdesignator"
		];

		Private _PLTJFO = [
		// BACKPACKS
		"TFAR_rt1523g",
		"tfw_ilbe_whip_ocp",
		"TFAR_rt1523g_big",
		"tfw_ilbe_blade_ocp",

		"tfw_ilbe_blade_arid",
		"tfw_ilbe_blade_black",

		"B_UAV_01_backpack_F",
		"UK3CB_CW_US_B_LATE_B_KITBAG_Radio",
		// Misc
		"ACE_SpottingScope",
		"tfw_rf3080Item",
		"B_UavTerminal",
		"ACE_HuntIR_monitor",
		"ACE_MX2A",
		"Laserdesignator"
		];

		Private _SQDCO = [
		// BACKPACKS
		"TFAR_rt1523g",
		"tfw_ilbe_blade_arid",
		"tfw_ilbe_blade_black",
		"tfw_rf3080Item",
		"B_UAV_01_backpack_F",
		"B_UavTerminal",

		"TFAR_rt1523g_big",
		"ACE_TacticalLadder_Pack",
		"UK3CB_CW_US_B_LATE_B_KITBAG_Radio",
		//MISC
		"ACE_VMH3",
		"ACE_HuntIR_monitor",
		"ACE_MX2A",
		"Laserdesignator"
		];

		Private _SQDXO = [
		// VESTS
		// BACKPACKS
		"TFAR_rt1523g",
		"TFAR_rt1523g_big",
    	"tfw_ilbe_blade_arid",
		"tfw_ilbe_blade_black",
		"B_UAV_01_backpack_F",
		"B_UavTerminal",
		//M203
		"rhs_weap_M320",
		"rhs_weap_m4a1_carryhandle_m203",
		"rhs_weap_m4a1_m203",
		"rhs_weap_m4a1_m203s_d",
		"rhs_ec200_sand_mag",
		"ACE_DefusalKit",
		"ACE_Clacker",
		"ACE_M26_Clacker",
		//Grenades
		"B_IR_Grenade",
		"rhs_mag_mk84",
		//MISC
		"ACE_VMH3",
		"ACE_HuntIR_monitor"
		];

		Private _MEDIC = [
		// VESTS
		// Misc
		"ACE_surgicalKit",
		"ACE_personalAidKit",
		"adv_aceCPR_AED",
		"ACE_adenosine",
		"ACE_bloodIV_500",
		"ACE_bloodIV_250",
		"ACE_bloodIV"
		];

		Private _SQDRIFLE = [
		// VESTS
		"rhsusf_iotv_ocp_Rifleman",
		"rhsusf_spcs_ocp_rifleman_alt",
		"rhsusf_spcs_ocp_rifleman"
		];

		Private _SQDAUTORIFLE = [
		// WEAPONS & AMMO
		"rhs_weap_m249_pip",
		"rhs_weap_m249_pip_L_para",
		"rhs_weap_m249_light_L",
		"rhs_weap_m249_pip_ris",
		"rhs_weap_m240B",
		"rhsusf_spc_iar",
		"rhs_weap_m27iar",
		"rhs_weap_m27iar_grip",
		"rhsusf_spc_mg"
		];

		Private _SQDAT = [
		// WEAPONS & AMMO
		"rhs_weap_M136",
		"rhs_weap_M136_hedp",
		"rhs_weap_M136_hp",
		"rhs_weap_fim92",
		"rhs_fim92_mag",
		"rhs_weap_fgm148",
		"rhs_fgm148_magazine_AT",
		"B_Carryall_mcamo"
		];

		Private _SQDGREN = [
		//M203
		"rhs_weap_M320",
		"rhs_weap_m4a1_carryhandle_m203",
		"rhs_weap_m4a1_m203",
		"UK3CB_G3KA4_GL",
		"1Rnd_HE_Grenade_shell",
		"rhs_mag_m4009",
		"rhs_mag_m713_Red",
		"rhs_mag_m714_White",
		"ACE_HuntIR_M203",
		"ACE_40mm_Flare_ir",
		"ACE_40mm_Flare_white",
		"rhs_weap_g36kv_ag36",
		"rhs_mag_m4009",
		"rhs_mag_m713_Red",
		"rhs_mag_m714_White",
		"ACE_HuntIR_M203",
		"ACE_40mm_Flare_ir",
		"ACE_40mm_Flare_white",
		"rhs_weap_m4a1_m203s_d"
		];

		Private _BANSHEE = [
		// MISK
		"ACE_TacticalLadder_Pack",
		// VESTS
		"TFAR_rt1523g",
		"TFAR_rt1523g_big",
		"tfw_ilbe_blade_arid",
		"tfw_ilbe_blade_black",
		// BACKPACKS
		// Misc
		"ACE_surgicalKit",
		"adv_aceCPR_AED",
		"ACE_personalAidKit",
		"ACE_adenosine",
		"ACE_bloodIV_500",
		"ACE_bloodIV_250",
		"ACE_bloodIV"
		];

		Private _JAC = [
		// Headgear
		"rhsusf_hgu56p",
		"rhsusf_hgu56p_mask",
		"rhsusf_hgu56p_mask_mo",
		"rhsusf_hgu56p_mask_skull",
		"rhsusf_hgu56p_visor",
		"rhsusf_hgu56p_visor_mask",
		"rhsusf_hgu56p_visor_mask_mo",
		"rhsusf_hgu56p_visor_mask_skull",
		"rhsusf_hgu56p_mask_smiley",
		"rhsusf_hgu56p_visor_mask_smiley",
		"rhsusf_ihadss",
		"RHS_jetpilot_usaf",
		"U_B_HeliPilotCoveralls",
		"H_PilotHelmetFighter_B",
		"H_CrewHelmetHeli_B",
		"B_UAV_01_backpack_F",
		"B_UavTerminal",
		// UNIFORMS
		"U_B_PilotCoveralls",
		// BACKPACKS
		"TFAR_rt1523g",
		"TFAR_rt1523g_big",
		"tfw_ilbe_blade_arid",
		"tfw_ilbe_blade_black",
		"tfw_ilbe_whip_ocp",
		"tfw_ilbe_blade_ocp",
		"ToolKit",
		// WEAPONS & AMMO
		"ACE_rope18"
		];

		Private _BUTCHER = [
		// Headgear
		"rhsusf_cvc_ess",
		"rhsusf_cvc_alt_helmet",
		"rhsusf_cvc_green_helmet",
		"rhsusf_cvc_green_ess",
		"rhsusf_spcs_ucp_crewman",
		"rhsusf_cvc_green_helmet",
		// BACKPACKS
		"TFAR_rt1523g",
		"TFAR_rt1523g_big",
		"tfw_ilbe_blade_arid",
		"tfw_ilbe_blade_black",
		"ToolKit",
		"ACE_VMH3"
		];

		Private _OGRE = [
		//DIVESTUFF
		"arifle_SDAR_F",
		"20Rnd_556x45_UW_mag",
		"B_Assault_Diver",
		"U_B_Wetsuit",
		"V_RebreatherB",
		"G_B_Diving",
		"B_UAV_01_backpack_F",
		"B_UavTerminal",
		// Headgear
		"rhs_weap_M136",
		"rhs_weap_M136_hedp",
		"rhs_weap_M136_hp",
		"rhs_weap_fim92",
		"rhs_fim92_mag",
		"rhs_weap_fgm148",
		"rhs_fgm148_magazine_AT",
		"rhsusf_spcs_ucp_crewman",
		"rhsusf_cvc_ess",
		"rhsusf_cvc_green_helmet",
		// BACKPACKS
		"TFAR_rt1523g",
		"TFAR_rt1523g_big",
		"tfw_ilbe_blade_arid",
		"tfw_ilbe_blade_black",
		"ToolKit",
		"ACE_VMH3",
		"ACE_Clacker",
		"ACE_M26_Clacker",
		"DemoCharge_Remote_Mag",
		"rhsusf_m112x4_mag",
		"rhsusf_m112_mag",
		"ATMine_Range_Mag",
		"SatchelCharge_Remote_Mag",
		"ClaymoreDirectionalMine_Remote_Mag",
		"SLAMDirectionalMine_Wire_Mag",
		"rhs_ec400_mag",
		"rhs_ec200_sand_mag",
		"ACE_DefusalKit"
		];

		Private _SAVAGE = [
		"TFAR_rt1523g",
		"TFAR_rt1523g_big",
		"tfw_ilbe_blade_arid",
		"tfw_ilbe_blade_black",
		"ACE_1Rnd_82mm_Mo_Illum",
		"ACE_1Rnd_82mm_Mo_HE",
		"ACE_artilleryTable"
		];


	switch (_Role) do {
	  case "CO": {
	    _GearToAdd = _DefaultGear + _CO;
	  };
	  case "ADMIN": {
		_GearToAdd = _DefaultGear + _CO;
	  };
	  case "PLTCO": {
	    _GearToAdd = _DefaultGear + _PLTCO;
	  };
	  case "PLTJFO": {
	    _GearToAdd = _DefaultGear + _PLTJFO;
	  };
	  case "SQDCO": {
	    _GearToAdd = _DefaultGear + _SQDCO;
	  };
	  case "SQDXO": {
	    _GearToAdd = _DefaultGear + _SQDXO;
	  };
	  case "MEDIC": {
	    _GearToAdd = _DefaultGear + _MEDIC;
	  };
	  case "SQDRIFLE": {
	    _GearToAdd = _DefaultGear + _SQDRIFLE;
	  };
	  case "SQDAUTORIFLE": {
	    _GearToAdd = _DefaultGear + _SQDAUTORIFLE;
	  };
	  case "SQDAT": {
		_GearToAdd = _DefaultGear + _SQDAT;
	  };
	  case "SQDGREN": {
	    _GearToAdd = _DefaultGear + _SQDGREN;
	  };
	  case "BANSHEE": {
	    _GearToAdd = _DefaultGear + _BANSHEE;
	  };
	  case "JAC": {
	    _GearToAdd = _DefaultGear + _JAC;
	  };
	  case "BUTCHER": {
	    _GearToAdd = _DefaultGear + _BUTCHER;
	  };
	  case "OGRE": {
	    _GearToAdd = _DefaultGear + _OGRE;
	  };
	  case "SAVAGE": {
	    _GearToAdd = _DefaultGear + _SAVAGE;
	  };
	  default {
	    _GearToAdd = _DefaultGear + ["ACE_Banana"];
	  };
	};

	[_box, false] call ace_arsenal_fnc_removeBox;
	[_box, _GearToAdd, false] call ace_arsenal_fnc_initBox;
}
