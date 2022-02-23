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
			or (_UnitRole == "Charlie")) then
			{_Role = "MEDIC"};
		//MARKSMAN
			if ((_UnitRole == "Alpha Marksman")
			or (_UnitRole == "Bravo Marksman")
			or (_UnitRole == "Charlie Marksman")) then
			{_Role = "MARKSMAN"};
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

	// ARMOUR
	if ((_UnitRole == "Armor 1 Vehicle Commander@Armor 1 (Armor)")
	or (_UnitRole == "Armor 1 Driver")
	or (_UnitRole == "Armor 1 Gunner")
	or (_UnitRole == "Armor 2 Vehicle Commander@Armor 2 (Armor)")
	or (_UnitRole == "Armor 2 Driver")
	or (_UnitRole == "Armor 2 Gunner")) then
	{_Role = "ARMOR"};

	// STALKER
	if ((_UnitRole == "STALKER 1 Pilot@Joint Air Command 1")
	or (_UnitRole == "STALKER 2 Pilot@Joint Air Command 2")) then
	{_Role = "STALKER"};


	//Empty array of gear to add to the arsenal per player.
	Private _GearToAdd = [];

	//Define the gear for each Role
	Private _DefaultGear = [
	//Uniform
    "U_B_CombatUniform_mcam_tshirt",
    "rhs_uniform_g3_mc",
	"rhs_uniform_g3_tan",
	"rhs_uniform_g3_rgr",
    "U_lxWS_ION_Casual1",
		"U_C_ArtTShirt_01_v5_F",
		"U_C_ArtTShirt_01_v3_F",
		"U_C_ArtTShirt_01_v4_F",
		"U_C_ArtTShirt_01_v1_F",
		"U_I_C_Soldier_Bandit_2_F",
		"U_I_C_Soldier_Bandit_3_F",
		"U_BG_Guerilla2_2",
		"U_BG_Guerilla2_1",
		"U_BG_Guerilla2_3",
		"U_C_Journalist",
		"U_Rangemaster",
	//Vest
    "rhsusf_mbav_grenadier",
    "rhsusf_mbav_light",
    "rhsusf_mbav_mg",
    "rhsusf_mbav_medic",
    "rhsusf_mbav_rifleman",
    "rhsusf_plateframe_grenadier",
    "rhsusf_plateframe_light",
    "rhsusf_plateframe_machinegunner",
    "rhsusf_plateframe_marksman",
    "rhsusf_plateframe_medic",
    "rhsusf_plateframe_rifleman",
    "rhsusf_plateframe_teamleader",
		"rhsusf_iotv_ocp_Medic",
		"rhsusf_iotv_ocp_Rifleman",
		"rhsusf_iotv_ocp_SAW",
		"rhsusf_iotv_ocp_Squadleader",
		"rhsusf_iotv_ocp_Teamleader",
	"rhsusf_spc_corpsman",
	"rhsusf_spc_iar",
	"rhsusf_spc_light",
	"rhsusf_spc_mg",
	"rhsusf_spc_marksman",
	"rhsusf_spc_rifleman",
	"rhsusf_spc_squadleader",
	"rhsusf_spc_teamleader",
    "V_TacVestIR_blk",
	"V_PlateCarrier1_rgr",
	"V_PlateCarrier2_rgr",
	"V_PlateCarrierSpec_rgr",
	"V_PlateCarrierSpec_mtp",
	//Bagpack
	"kat_stretcherBag",
	"B_Parachute",
    "ACE_TacticalLadder_Pack",
    "B_AssaultPack_cbr",
    "B_AssaultPack_rgr",
    "B_AssaultPack_khk",
    "B_AssaultPack_mcamo",
    "B_Carryall_cbr",
    "B_Carryall_green_F",
    "B_Carryall_khk",
    "B_Carryall_mcamo",
    "B_Carryall_oli",
    "B_Kitbag_cbr",
    "B_Kitbag_rgr",
    "B_Kitbag_mcamo",
    "B_Kitbag_sgg",
    "B_Kitbag_tan",
    "B_TacticalPack_mcamo",
    "B_TacticalPack_oli",
    "tfw_ilbe_blade_coy",
    "tfw_ilbe_blade_gr",
    "tfw_ilbe_blade_mc",
	//helm
	"rhs_booniehat2_marpatd",
    "H_Booniehat_khk",
    "H_Booniehat_mcamo",
    "H_Booniehat_oli",
    "H_Booniehat_tan",
    "H_Cap_tan",
    "H_Cap_blk_CMMG",
    "H_Cap_blk_ION",
    "H_Cap_khaki_specops_UK",
    "H_Cap_usblack",
    "H_Cap_tan_specops_US",
    "rhsusf_ach_bare_tan",
    "rhsusf_ach_bare_tan_ess",
    "rhsusf_ach_bare_tan_headset",
    "rhsusf_ach_bare_tan_headset_ess",
    "rhsusf_ach_bare_ess",
    "rhsusf_ach_bare_headset",
    "rhsusf_ach_bare_headset_ess",
    "rhsusf_opscore_fg",
    "rhsusf_opscore_fg_pelt",
    "rhsusf_opscore_fg_pelt_cam",
    "rhsusf_opscore_fg_pelt_nsw",
    "rhsusf_opscore_mc_cover",
    "rhsusf_opscore_mc_cover_pelt",
    "rhsusf_opscore_mc_cover_pelt_nsw",
    "rhsusf_opscore_mc",
    "rhsusf_opscore_mc_pelt",
    "rhsusf_opscore_mc_pelt_nsw",
	"lxWS_H_bmask_base",
	"lxWS_H_bmask_camo01",
	"lxWS_H_bmask_white",
	"lxWS_H_bmask_camo02",
	"lxWS_H_bmask_yellow",
	//weapons
	"rhs_weap_g36c",
	"rhs_weap_g36kv",
	"rhs_weap_g36kv_ag36",
    "rhs_weap_m4a1_blockII_bk",
	"rhs_weap_m4a1_blockII_M203_bk",
	"rhs_weap_m4a1_blockII_d",
	"rhs_weap_m4a1_blockII_M203_d",
	"rhs_weap_m16a4_imod",
	"rhs_weap_m16a4_imod_M203",
	"rhs_weap_mk18_d",
    "rhs_weap_mk18_bk",
	"rhs_weap_mk18_m320",
	"rhsusf_weap_MP7A2",
	"rhsusf_weap_MP7A2_desert",
    "SMG_03C_TR_black",
	"SMG_03C_TR_khaki",
    "arifle_Mk20_plain_F",
    "arifle_Mk20_GL_plain_F",
    "rhs_weap_vhsd2",
    "rhs_weap_vhsd2_bg",
    "rhs_weap_ak103_zenitco01_b33",
    "rhs_weap_ak103_gp25_npz",
    "rhs_weap_ak104_zenitco01_b33",
		"rhs_weap_ak105_zenitco01_b33",
	"arifle_TRG21_F",
	"rhsusf_weap_glock17g4",
	"rhsusf_weap_m9",
	"hgun_Pistol_heavy_01_F",
	"rhs_weap_m1911a1",
	"rhs_weap_M320",
	//launchers
	"rhs_weap_M136",
	"rhs_weap_M136_hedp",
	"rhs_weap_M136_hp",
	//ammo
	"rhssaf_30rnd_556x45_Tracers_G36",
	"rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",
	"rhs_30Rnd_762x39mm_polymer",
	"rhs_30Rnd_762x39mm_polymer_tracer",
	"rhs_30Rnd_762x39mm_polymer_U",
	"rhsusf_mag_40Rnd_46x30_JHP",
	"50Rnd_570x28_SMG_03",
	"rhs_30Rnd_545x39_AK_plum_green",
	//ammoroles
    "ACE_20Rnd_762x51_Mag_Tracer",
	"ACE_20Rnd_762x51_M993_AP_Mag",
	"rhsusf_20Rnd_762x51_SR25_m62_Mag",
	"rhsusf_20Rnd_762x51_SR25_m993_Mag",
	"rhsusf_200Rnd_556x45_mixed_soft_pouch_coyote",
	"rhs_fgm148_magazine_AT",
	"MRAWS_HE_F",
	"MRAWS_HEAT55_F",
	"MRAWS_HEAT_F",
	"rhs_fim92_mag",
	//GL ammo
	"1Rnd_HE_Grenade_shell",
	"rhs_mag_M397_HET",
	"rhs_mag_M433_HEDP",
	"ACE_HuntIR_M203",
	"ACE_40mm_Flare_white",
	"rhs_mag_m713_Red",
	"rhs_mag_m714_White",
	"rhs_mag_m715_Green",
	"rhs_mag_m716_yellow",
	"rhs_GDM40",
    "rhs_VG40MD",
    "rhs_VOG25",
	// attachments
	"optic_arco_blk_f",
	"optic_arco_ak_blk_f",
	"optic_holosight_blk_f",
	"optic_holosight_smg_blk_f",
	"optic_mrco",
	"optic_hamr",
	"rhsusf_acc_g33_t1",
	"rhsusf_acc_g33_xps3",
	"rhsusf_acc_eotech_552",
	"rhsusf_acc_compm4",
	"optic_erco_blk_f",
	"rhsusf_acc_su230_3d",
	"rhsusf_acc_acog_rmr",
	"rhsusf_acc_eotech_xps3",
	"rhsusf_acc_anpeq15side_bk",
	"rhsusf_acc_anpeq15_bk_top",
	"rhsusf_acc_anpeq15_bk",
	"rhsusf_acc_anpeq15_bk_light",
	"ace_muzzle_mzls_l",
	"ace_muzzle_mzls_b",
	"rhsusf_acc_nt4_black",
	"rhsusf_acc_nt4_tan",
	"rhsusf_acc_grip2",
	"rhsusf_acc_grip1",
	"rhsusf_acc_harris_bipod",
	"rhsusf_acc_kac_grip",
	"rhsusf_acc_rvg_blk",
	"rhsusf_acc_aac_762sd_silencer",
	"acc_flashlight_pistol",
	"ace_muzzle_mzls_smg_02",
	"muzzle_snds_570",
	"rhsusf_acc_omega9k",
	"rhs_acc_at4_handler",
	"rhs_weap_optic_smaw",
	"ace_muzzle_mzls_smg_01",
	"muzzle_snds_acp",
	"ace_muzzle_mzls_smg_01",
	"muzzle_snds_acp",
	"rhs_acc_dtk3",
	"rhs_acc_tgpa",
	//Grenades
	"SmokeShell",
	"SmokeShellBlue",
	"SmokeShellGreen",
	"SmokeShellOrange",
	"SmokeShellPurple",
	"SmokeShellRed",
	"SmokeShellYellow",
	"HandGrenade",
	"B_IR_Grenade",
	"ACE_HandFlare_Green",
	"ACE_HandFlare_Red",
	"ACE_HandFlare_White",
	"ACE_HandFlare_Yellow",
	"rhs_mag_an_m14_th3",
	"rhs_mag_mk84",
	"ACE_Chemlight_HiBlue",
	"ACE_Chemlight_HiGreen",
	"ACE_Chemlight_HiRed",
	"ACE_Chemlight_HiWhite",
	"ACE_Chemlight_HiYellow",
	"ACE_Chemlight_IR",
	"ACE_Chemlight_UltraHiOrange",
	//facewear
	"M40_Gas_mask_nbc_v1_d",
	"rhs_googles_black",
	"rhs_googles_clear",
	"rhs_googles_orange",
	"rhs_googles_yellow",
	"G_Sport_Blackred",
	"rhsusaf_shemagh_grn",
	"rhsusaf_shemagh2_grn",
	"rhsusaf_shemagh_gogg_grn",
	"rhsusaf_shemagh2_gogg_grn",
	"rhsusaf_shemagh_od",
	"rhsusaf_shemagh2_od",
	"rhsusaf_shemagh_gogg_od",
	"rhsusaf_shemagh2_gogg_od",
	"rhsusf_shemagh_tan",
	"rhsusf_shemagh2_tan",
	//items
	"Attachable_Helistretcher",
    "ACE_rope36",
    "ACE_rope27",
    "ACE_rope18",
	"ACE_Banana",
	"ACE_fieldDressing",
	"ACE_elasticBandage",
	"ACE_packingBandage",
	"ACE_quikclot",
	"kat_bloodIV_O",
  "kat_bloodIV_O_250",
  "kat_bloodIV_O_500",
	"ACE_bodyBag",
	"ACE_CableTie",
	"ACE_EarPlugs",
	"ACE_EntrenchingTool",
	"ACE_epinephrine",
	"ItemcTabHCam",
	"ACE_IR_Strobe_Item",
	"ACE_Flashlight_XL50",
	"ACE_MapTools",
	"ACE_microDAGR",
	"ACE_morphine",
	"ACE_personalAidKit",
	"ACE_splint",
	"ACE_SpraypaintGreen",
	"ACE_SpraypaintRed",
	"ACE_tourniquet",
	"ACE_wirecutter",
	"ACE_NVG_Wide_Black",
	"ACE_NVG_Wide",
	"Laserdesignator",
	"ACE_Vector",
	"ItemMap",
	"ItemGPS",
	"ItemAndroid",
	"ItemcTab",
	"ItemWatch",
	"TFAR_anprc152",
	"ACE_VMH3",
	"ACE_WaterBottle",
	"tfw_rf3080Item"
	];

	Private _ADMIN = [
	//uniform
	"U_I_C_Soldier_Bandit_4_F",
	//vests
	//backpacks
	//items
	"ToolKit",
	"ACE_wirecutter",
	"ACE_surgicalKit",
	"ACE_SpareBarrel_Item",
	"ACE_RangeCard",
	"ACE_Clacker",
	"ACE_M26_Clacker",
	"ACE_DefusalKit",
	"adv_aceCPR_AED",
	"ACE_adenosine",
	"ACE_HuntIR_monitor",
	"B_UavTerminal",
	"kat_aatKit",
    "kat_accuvac",
    "kat_X_AED",
    "kat_AED",
    "kat_crossPanel",
    "kat_chestSeal",
    "KAT_Empty_bloodIV_250",
    "KAT_Empty_bloodIV_500",
    "kat_larynx",
    "kat_stethoscope",
    "kat_guedel",
    "kat_Pulseoximeter"
	];

	Private _CO = [
	//backpacks
	//vests
	"rhsusf_spc_patchless",
	"rhsusf_spc_patchless_radio",
    //items
	"ACE_HuntIR_monitor",
	"B_UavTerminal"
    ];

	Private _SL = [
	//backpacks
	//vests
	"rhsusf_spc_patchless",
	"rhsusf_spc_patchless_radio",
	//items
	"ACE_HuntIR_monitor",
	"B_UavTerminal"
	];

	Private _MEDIC = [
	//uniforms
	"U_Marshal",
	"U_C_Scientist",
	//vests
	//items
	"ACE_adenosine",
	"ACE_surgicalKit",
	"kat_aatKit",
    "kat_accuvac",
    "kat_X_AED",
    "kat_AED",
    "kat_crossPanel",
    "kat_chestSeal",
    "KAT_Empty_bloodIV_250",
    "KAT_Empty_bloodIV_500",
    "kat_larynx",
    "kat_stethoscope",
    "kat_guedel",
    "kat_Pulseoximeter"
	];

	Private _MARKSMAN = [
	//vests
	//weapons
	"rhs_weap_m14_ris",
	"rhs_weap_m14_ris_wd",
	"rhs_weap_m14ebrri",
	"srifle_DMR_03_F",
	"srifle_DMR_05_blk_F",
	"rhs_weap_sr25_ec",
	//attachments
	"optic_sos",
	"optic_dms",
	"ace_muzzle_mzls_93mmg",
	"muzzle_snds_93mmg",
	//Items
	"ACE_ATragMX",
	"ACE_Kestrel4500",
	"ACE_Flashlight_KSF1",
	"ACE_RangeCard",
	"ACE_SpottingScope"
	];

	Private _ENGINEER = [
	//vests
    "V_PlateCarrierGL_rgr",
	"V_PlateCarrierGL_mtp",
	//Explosives
	"SatchelCharge_Remote_Mag",
	"rhsusf_m112_mag",
	"rhsusf_m112x4_mag",
	"DemoCharge_Remote_Mag",
	//Items
	"ToolKit",
	"ACE_DefusalKit",
	"ACE_M26_Clacker",
	"ACE_Clacker",
	"B_UavTerminal"
	];

	Private _AUTORIFLEMAN = [
	//weapons
	"rhs_weap_minimi_para_railed",
	"rhs_weap_m249_pip",
	"rhs_weap_m249_light_L",
	"rhs_weap_m249_light_S",
	"rhs_weap_m240B",
	"MMG_02_black_F",
	//vests
	//Items
	"ACE_WaterBottle"
	];

	Private _AT = [
	//launchers
	"rhs_weap_fgm148",
	"launch_MRAWS_sand_F",
	"rhs_weap_fim92"
	//vests
	];

	Private _RIFLEMAN = [
	"ACE_Banana",
	"ACE_WaterBottle"
	];

	Private _ARMOR = [
	//uniforms
	"U_C_WorkerCoveralls",
	//helm
	"rhs_tsh4",
	"rhs_tsh4_bala",
	"rhs_tsh4_ess",
	"rhs_tsh4_ess_bala",
	"rhsusf_cvc_green_alt_helmet",
	"rhsusf_cvc_green_ess",
	"rhsusf_cvc_helmet",
	"rhsusf_cvc_alt_helmet",
	"rhsusf_cvc_ess",
	//vests
	"rhsusf_spc_crewman",
	"V_Chestrig_rgr",
	"V_Chestrig_khk",
	"V_Chestrig_oli",
	//Items
	"ACE_adenosine",
	"adv_aceCPR_AED",
	"ACE_surgicalKit",
	"ToolKit",
	"B_UavTerminal",
	"kat_aatKit",
    "kat_accuvac",
    "kat_X_AED",
    "kat_AED",
    "kat_crossPanel",
    "kat_chestSeal",
    "KAT_Empty_bloodIV_250",
    "KAT_Empty_bloodIV_500",
    "kat_larynx",
    "kat_stethoscope",
    "kat_guedel",
    "kat_Pulseoximeter"
	];

	Private _STALKER = [
	//uniforms
	"U_B_HeliPilotCoveralls",
	"U_B_PilotCoveralls",
	//vests
	"rhsusf_spc_crewman",
	"V_Chestrig_rgr",
	"V_Chestrig_khk",
	"V_Chestrig_oli",
	//helm
	"RHS_jetpilot_usaf",
	"rhsusf_hgu56p_black",
	"rhsusf_hgu56p_mask_black",
	"rhsusf_hgu56p_visor_black",
	"rhsusf_hgu56p_visor_mask_black",
	"rhsusf_hgu56p_green",
	"rhsusf_hgu56p_mask_green",
	"rhsusf_hgu56p_visor_green",
	"rhsusf_hgu56p_visor_mask_green",
	"rhsusf_hgu56p_olive",
	"rhsusf_hgu56p_mask_olive",
	"rhsusf_hgu56p_visor_olive",
	"rhsusf_hgu56p_visor_mask_olive",
	"rhsusf_hgu56p_pink",
	"rhsusf_hgu56p_visor_pink",
	"rhsusf_hgu56p_tan",
	"rhsusf_hgu56p_visor_tan",
	"rhsusf_hgu56p_tan",
    "rhsusf_hgu56p_mask_tan",
    "rhsusf_hgu56p_visor_tan",
    "rhsusf_hgu56p_visor_mask_tan",
    "rhsusf_ihadss",
	//Items
	"ACE_adenosine",
	"adv_aceCPR_AED",
	"ACE_surgicalKit",
	"ToolKit",
	"B_UavTerminal",
	"kat_aatKit",
    "kat_accuvac",
    "kat_X_AED",
    "kat_AED",
    "kat_crossPanel",
    "kat_chestSeal",
    "KAT_Empty_bloodIV_250",
    "KAT_Empty_bloodIV_500",
    "kat_larynx",
    "kat_stethoscope",
    "kat_guedel",
    "kat_Pulseoximeter"
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
	  case "AUTORIFLEMAN": {
	    _GearToAdd = _DefaultGear + _AUTORIFLEMAN;
	  };
	  case "AT": {
	    _GearToAdd = _DefaultGear + _AT;
	  };
	  case "RIFLEMAN": {
	    _GearToAdd = _DefaultGear + _RIFLEMAN;
	  };
	  case "ARMOR": {
	    _GearToAdd = _DefaultGear + _ARMOR;
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
