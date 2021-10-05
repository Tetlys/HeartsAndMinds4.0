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

	if ((_UnitRole == "Odin 6@Odin 6 (Admin)")
	or (_UnitRole == "Odin 7@Odin 7")
	or (_UnitRole == "Odin 7@Odin 8")
	or (_UnitRole == "Odin 7@Odin 9")) then
	{_Role = "ADMIN"};

	// Command 

	if ((_UnitRole == "Assassin 6 Company Commander@Assassin HQ")) then
	{_Role = "CO"};

	if (_UnitRole == "Assassin 7 Company Executive Officer@Assassin HQ") then
	{_Role = "XO"};

	if ((_UnitRole == "Assassin 1-6 Platoon Leader@Assassin 1 HQ (Leadership)")
	or (_UnitRole == "Assassin 2-6 Platoon Leader@Assassin 2 HQ (Leadership)")) then
	{_Role = "PLTCO"};

	if ((_UnitRole == "Assassin 1-7 Platoon Sergeant@Assassin 1 HQ")
	or (_UnitRole == "Assassin 2-7 Platoon Sergeant@Assassin 2 HQ")) then
	{_Role = "PLTXO"};

	if ((_UnitRole == "Assassin 1-8 Platoon JFO@Assassin 1 HQ")
	or (_UnitRole == "Assassin 2-8 Platoon JFO@Assassin 2 HQ")) then
	{_Role = "PLTJFO"};

	// Squad Leaders

	if ((_UnitRole == "Assassin 1-1 Squad Leader@Assassin 1-1 (Infantry)")
	or (_UnitRole == "Assassin 1-2 Squad Leader@Assassin 1-2 (Infantry)")
	or (_UnitRole == "Assassin 1-3 Squad Leader@Assassin 1-3 (Infantry)")
	or (_UnitRole == "Assassin 1-4 Squad Leader@Assassin 1-4 (Weapons)")
	or (_UnitRole == "Assassin 2-1 Squad Leader@Assassin 2-1 (Infantry)")
	or (_UnitRole == "Assassin 2-2 Squad Leader@Assassin 2-2 (Infantry)")
	or (_UnitRole == "Assassin 2-3 Squad Leader@Assassin 2-3 (Infantry)")
	or (_UnitRole == "Assassin 2-4 Squad Leader@Assassin 2-4 (Infantry)")) then
	{_Role = "SQDCO"};

	if ((_UnitRole == "Assassin 1-1 Asst. Squad Leader")
	or (_UnitRole == "Assassin 1-1-B Fireteam Leader")
	or (_UnitRole == "Assassin 1-2 Asst. Squad Leader")
	or (_UnitRole == "Assassin 1-2-B Fireteam Leader")
	or (_UnitRole == "Assassin 1-3 Asst. Squad Leader")
	or (_UnitRole == "Assassin 1-3-B Fireteam Leader")
	or (_UnitRole == "Assassin 1-4-A Team Leader")
	or (_UnitRole == "Assassin 1-4-B Team Leader")
	or (_UnitRole == "Assassin 2-1 Asst. Squad Leader")
	or (_UnitRole == "Assassin 2-1-B Fireteam Leader")
	or (_UnitRole == "Assassin 2-2 Asst. Squad Leader")
	or (_UnitRole == "Assassin 2-2-B Fireteam Leader")
	or (_UnitRole == "Assassin 2-3 Asst. Squad Leader")
	or (_UnitRole == "Assassin 2-3-B Fireteam Leader")
	or (_UnitRole == "Assassin 2-4-A Team Leader")
	or (_UnitRole == "Assassin 1-4-B Team Leader")) then
	{_Role = "SQDXO"};

	if ((_UnitRole == "Assassin 1-1 Corpsman")
	or (_UnitRole == "Assassin 1-2 Corpsman")
	or (_UnitRole == "Assassin 1-3 Corpsman")
	or (_UnitRole == "Assassin 1-4 Corpsman")
	or (_UnitRole == "Assassin 2-1 Corpsman")
	or (_UnitRole == "Assassin 2-2 Corpsman")
	or (_UnitRole == "Assassin 2-3 Corpsman")
	or (_UnitRole == "Assassin 2-4 Corpsman")
	or (_UnitRole == "Ogre Corpsman")) then
	{_Role = "MEDIC"};

	// Normal Squads

	if ((_UnitRole == "Assassin 1-1-A Rifleman")
	or (_UnitRole == "Assassin 1-1-B Rifleman")
	or (_UnitRole == "Assassin 1-2-A Rifleman")
	or (_UnitRole == "Assassin 1-2-B Rifleman")
	or (_UnitRole == "Assassin 1-3-A Rifleman")
	or (_UnitRole == "Assassin 1-3-B Rifleman")
	or (_UnitRole == "Assassin 2-3-A Rifleman")
	or (_UnitRole == "Assassin 2-3-B Rifleman")
	or (_UnitRole == "Assassin 2-1-A Rifleman")
	or (_UnitRole == "Assassin 2-1-B Rifleman")
	or (_UnitRole == "Assassin 2-2-A Rifleman")
	or (_UnitRole == "Assassin 2-2-B Rifleman")) then
	{_Role = "SQDRIFLE"};

	if ((_UnitRole == "Assassin 1-1-B Automatic Rifleman")
	or (_UnitRole == "Assassin 1-1-A Automatic Rifleman")
	or (_UnitRole == "Assassin 1-2-A Automatic Rifleman")
	or (_UnitRole == "Assassin 1-2-B Automatic Rifleman")
	or (_UnitRole == "Assassin 1-3-A Automatic Rifleman")
	or (_UnitRole == "Assassin 1-3-B Automatic Rifleman")
	or (_UnitRole == "Assassin 2-3-A Automatic Rifleman")
	or (_UnitRole == "Assassin 2-3-B Automatic Rifleman")
	or (_UnitRole == "Assassin 2-1-A Automatic Rifleman")
	or (_UnitRole == "Assassin 2-1-B Automatic Rifleman")
	or (_UnitRole == "Assassin 2-2-A Automatic Rifleman")
	or (_UnitRole == "Assassin 2-2-B Automatic Rifleman")) then
	{_Role = "SQDAUTORIFLE"};

	if ((_UnitRole == "Assassin 1-1-A Asst. Automatic Rifleman")
	or (_UnitRole == "Assassin 1-1-B Asst. Automatic Rifleman")
	or (_UnitRole == "Assassin 1-2-A Asst. Automatic Rifleman")
	or (_UnitRole == "Assassin 1-2-B Asst. Automatic Rifleman")
	or (_UnitRole == "Assassin 1-3-A Asst. Automatic Rifleman")
	or (_UnitRole == "Assassin 1-3-B Asst. Automatic Rifleman")
	or (_UnitRole == "Assassin 2-3-A Asst. Automatic Rifleman")
	or (_UnitRole == "Assassin 2-3-B Asst. Automatic Rifleman")
	or (_UnitRole == "Assassin 2-1-A Asst. Automatic Rifleman")
	or (_UnitRole == "Assassin 2-1-B Asst. Automatic Rifleman")
	or (_UnitRole == "Assassin 2-2-A Asst. Automatic Rifleman")
	or (_UnitRole == "Assassin 2-2-B Asst. Automatic Rifleman")) then
	{_Role = "SQDASTRIFLE"};

	// 1-4 

	if ((_UnitRole == "Assassin 1-4-A Machine Gunner")
	or (_UnitRole == "Assassin 1-4-B Machine Gunner")
	or (_UnitRole == "Assassin 2-4-A Machine Gunner")
	or (_UnitRole == "Assassin 2-4-A Machine Gunner")) then
	{_Role = "SQDMCHNGNR"};

	if ((_UnitRole == "Assassin 1-4-A Assistant Gunner")
	or (_UnitRole == "Assassin 1-4-B Assistant Gunner")
	or (_UnitRole == "Assassin 2-4-A Assistant Gunner")
	or (_UnitRole == "Assassin 2-4-A Assistant Gunner")) then
	{_Role = "SQDAT"};

	if ((_UnitRole == "Assassin 1-4-A AT Specialist")
	or (_UnitRole == "Assassin 1-4-B AT Specialist")
	or (_UnitRole == "Assassin 2-4-A AT Specialist")
	or (_UnitRole == "Assassin 2-4-B AT Specialist")) then
	{_Role = "SQDAST"};

	// Banshee 

	if ((_UnitRole == "Banshee Team Leader@Banshee (MEDEVAC)")
	or (_UnitRole == "Banshee Trauma Specialist")
	or (_UnitRole == "Banshee Team Member")) then
	{_Role = "BANSHEE"};

	// Air Command 

	if ((_UnitRole == "JAC 1 Pilot@Joint Air Command 1")
	or (_UnitRole == "JAC 1 Crew @Joint Air Command 1")
	or (_UnitRole == "JAC 2 Pilot@Joint Air Command 1")
	or (_UnitRole == "JAC 2 Crew @Joint Air Command 2")
	or (_UnitRole == "JAC 3 Pilot@Joint Air Command 3")
	or (_UnitRole == "JAC 3 Crew @Joint Air Command 3")
	or (_UnitRole == "JAC 4 Pilot@Joint Air Command 4")
	or (_UnitRole == "JAC 4 Crew @Joint Air Command 4")
	or (_UnitRole == "JAC 5 Pilot@Joint Air Command 5")
	or (_UnitRole == "JAC 5 Crew @Joint Air Command 5")) then
	{_Role = "JAC"};

	// Butcher 

	if ((_UnitRole == "Butcher 1 Driver")
	or (_UnitRole == "Butcher 1 Gunner")
	or (_UnitRole == "Butcher 1 Vehicle Commander@Butcher 1 (Armor)")
	or (_UnitRole == "Butcher 2 Vehicle Commander@Butcher 2 (Armor)")
	or (_UnitRole == "Butcher 1 Gunner")
	or (_UnitRole == "Butcher 1 Driver")) then
	{_Role = "BUTCHER"};

	// Ogre 

	if ((_UnitRole == "Ogre Team Leader@Ogre 2 (Ground Logistics)")
	or (_UnitRole == "Ogre Team Leader@Ogre 1 (Ground Logistics)")
	or (_UnitRole == "Ogre Engineer")) then
	{_Role = "OGRE"};

	// Savage 

	if ((_UnitRole == "Savage Team Leader@Savage (Indirect Fire)")
	or (_UnitRole == "Savage Operator")) then
	{_Role = "SAVAGE"};


	//Empty array of gear to add to the arsenal per player.
	Private _GearToAdd = [];
	
	//Define the gear for each Role
	Private _DefaultGear = [
		// Headgear
			"rhsusf_ach_helmet_ocp",
			"rhsusf_ach_helmet_ocp_alt",
			"rhsusf_ach_helmet_ESS_ocp",
			"rhsusf_ach_helmet_ESS_ocp_alt",
			"rhsusf_ach_helmet_headset_ocp",
			"rhsusf_ach_helmet_headset_ocp_alt",
			"rhsusf_ach_helmet_headset_ess_ocp",
			"rhsusf_ach_helmet_headset_ess_ocp_alt",
			"rhsusf_ach_helmet_ocp_norotos",
			"rhs_googles_black",
			"rhs_ess_black",
		// UNIFORMS
			"rhs_uniform_acu_ocp",
			"rhs_uniform_cu_ocp",
			"rhs_uniform_cu_ocp_101st",
			"rhs_uniform_cu_ocp_10th",
			"rhs_uniform_cu_ocp_1stcav",
			"rhs_uniform_cu_ocp_82nd",
		// VESTS
			"rhsusf_spcs_ocp",
			"rhsusf_iotv_ocp",
		// BACKPACKS
			"rhsusf_assault_eagleaiii_ocp",
			"B_Parachute",
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
			//ammo
			"1Rnd_HE_Grenade_shell",
			"rhs_mag_m4009",
			"ACE_HuntIR_M203",
			"rhs_mag_m714_White",
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
			"rhsusf_mag_40Rnd_46x30_FMJ",
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
			"optic_hamr",
			"optic_mrco",
		// Misc
			// H&M Stuff
		    "ACE_Banana",
			"ACE_SpraypaintRed",
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
			"ACE_NVG_Wide"
	];
	
	Private _CO = [
		// Headgear
		"rhsusf_patrolcap_ocp",
		// BACKPACKS
		"TFAR_rt1523g",
		"tfw_ilbe_whip_ocp",
		"TFAR_rt1523g_big",
		"tfw_ilbe_blade_ocp",
		// Misc
		"ACE_SpottingScope",
		"tfw_rf3080Item",
		"B_UavTerminal",
		"ACE_HuntIR_monitor",
		"ACE_MX2A",
		"Laserdesignator"
		];

		Private _XO = [
		// BACKPACKS
		"TFAR_rt1523g",
		"tfw_ilbe_whip_ocp",
		"tfw_ilbe_blade_ocp",
		"TFAR_rt1523g_big",
		// Misc
		"ACE_SpottingScope",
		"tfw_rf3080Item",
		"B_UavTerminal",
		"ACE_HuntIR_monitor",
		"ACE_MX2A",
		"Laserdesignator"
		];
	
	Private _PLTCO = [
		// VESTS
		"rhsusf_iotv_ocp_Squadleader",
		"rhsusf_spcs_ocp_squadleader",
		// BACKPACKS
		"TFAR_rt1523g",
		"TFAR_rt1523g_big",
		"tfw_ilbe_whip_ocp",
		"tfw_ilbe_blade_ocp",
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

		Private _PLTXO = [
		// VESTS
		"rhsusf_iotv_ocp_Squadleader",
		"rhsusf_spcs_ocp_squadleader",
		// BACKPACKS
		"TFAR_rt1523g",
		"TFAR_rt1523g_big",
		"tfw_ilbe_whip_ocp",
		"tfw_ilbe_blade_ocp",
		// Misc
		"ACE_SpottingScope",
		"tfw_rf3080Item",
		//M203
		"rhs_weap_M320",
		"rhs_weap_m4a1_carryhandle_m203",
		"rhs_weap_m4a1_m203",
		"rhs_weap_m4a1_m203s_d",
		//Grenades
		"B_IR_Grenade",
		"rhs_mag_mk84",
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
		// Misc
		"ACE_SpottingScope",
		"tfw_rf3080Item",
		"B_UavTerminal",
		"ACE_HuntIR_monitor",
		"ACE_MX2A",
		"Laserdesignator"
		];

		Private _SQDCO = [
		// VESTS
		"rhsusf_spcs_ocp_squadleader",
		"rhsusf_iotv_ocp_Squadleader",
		// BACKPACKS
		"TFAR_rt1523g",
		"tfw_rf3080Item",
		"tfw_ilbe_whip_ocp",
		"tfw_ilbe_blade_ocp",
		"TFAR_rt1523g_big",
		//MISC 
		"ACE_VMH3",
		"ACE_HuntIR_monitor",
		"ACE_MX2A",
		"Laserdesignator"
		];

		Private _SQDXO = [
		// VESTS
		"rhsusf_iotv_ocp_Teamleader",
		"rhsusf_spcs_ocp_teamleader_alt",
		"rhsusf_spcs_ocp_teamleader",
		// BACKPACKS
		"TFAR_rt1523g",
		"tfw_ilbe_whip_ocp",
		"TFAR_rt1523g_big",
		"tfw_ilbe_blade_ocp",
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
		"rhsusf_spcs_ocp_medic",
		"rhsusf_iotv_ocp_Medic",
		"B_Carryall_mcamo",
		// Misc
		"ACE_surgicalKit",
		"ACE_personalAidKit",
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
		// VESTS
		"rhsusf_spcs_ocp_saw",
		"rhsusf_iotv_ocp_SAW",
		// WEAPONS & AMMO
		"rhs_weap_m249_pip",
		"rhs_weap_m249_pip_L_para",
		"rhs_weap_m249_light_L",
		"rhs_weap_m249_pip_ris"
		];

		Private _SQDASTRIFLE = [
		// VESTS
		"rhsusf_spcs_ocp_saw",
		"rhsusf_iotv_ocp_SAW"
		];

		Private _SQDMCHNGNR = [
		// VESTS
		"rhsusf_spcs_ocp_machinegunner",
		"rhsusf_iotv_ocp_SAW",
		// WEAPONS & AMMO
		"rhs_weap_m240B",
		"rhs_weap_m240G"
		];

		Private _SQDAT = [
		// WEAPONS & AMMO
		"rhs_weap_M136",
		"B_Carryall_mcamo",
		"rhs_weap_M136_hedp"
		];

		Private _SQDAST = [
		"ACE_bloodIV_500",
		"ACE_bloodIV_250",
		"ACE_bloodIV"
		];

		Private _BANSHEE = [
		// MISK
		"ACE_TacticalLadder_Pack",
		// VESTS
		"rhsusf_spcs_ocp_medic",
		"rhsusf_iotv_ocp_Medic",
		"TFAR_rt1523g",
		"TFAR_rt1523g_big",
		"tfw_ilbe_whip_ocp",
		"tfw_ilbe_blade_ocp",
		// Misc
		"ACE_surgicalKit",
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
		"H_PilotHelmetFighter_B",
		"H_CrewHelmetHeli_B",
		// UNIFORMS
		"U_B_HeliPilotCoveralls",
		"U_B_PilotCoveralls",
		// BACKPACKS
		"TFAR_rt1523g",
		"TFAR_rt1523g_big",
		"tfw_ilbe_whip_ocp",
		"tfw_ilbe_blade_ocp",
		"ToolKit",
		// WEAPONS & AMMO
		"B_UavTerminal",
		"ACE_rope18"
		];

		Private _BUTCHER = [
		// Headgear
		"rhsusf_cvc_helmet",
		"rhsusf_cvc_alt_helmet",
		"rhsusf_cvc_ess",
		// VESTS
		"rhsusf_spcs_ocp_crewman",
		// BACKPACKS
		"TFAR_rt1523g",
		"TFAR_rt1523g_big",
		"tfw_ilbe_whip_ocp",
		"tfw_ilbe_blade_ocp",
		"ToolKit",
		"ACE_VMH3"
		];

		Private _OGRE = [
		// Headgear
		"rhsusf_cvc_helmet",
		"rhsusf_cvc_alt_helmet",
		"rhsusf_cvc_ess",
		// VESTS
		"rhsusf_iotv_ocp_Repair",
		"rhsusf_spcs_ocp_crewman",
		// BACKPACKS
		"TFAR_rt1523g",
		"TFAR_rt1523g_big",
		"tfw_ilbe_whip_ocp",
		"tfw_ilbe_blade_ocp",
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
			"tfw_ilbe_whip_ocp",
			"tfw_ilbe_blade_ocp",
			"ACE_artilleryTable"
		];


	switch (_Role) do {
	  case "CO": {
	    _GearToAdd = _DefaultGear + _CO;
	  };
	  case "XO": {
	    _GearToAdd = _DefaultGear + _XO;
	  };
	  case "PLTCO": {
	    _GearToAdd = _DefaultGear + _PLTCO;
	  };
	  case "PLTXO": {
	    _GearToAdd = _DefaultGear + _PLTXO;
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
	  case "SQDASTRIFLE": {
	    _GearToAdd = _DefaultGear + _SQDASTRIFLE;
	  };
	  case "SQDMCHNGNR": {
	    _GearToAdd = _DefaultGear + _SQDMCHNGNR;
	  };
	  case "SQDAST": {
	    _GearToAdd = _DefaultGear + _SQDAST;
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