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
			if ((_UnitRole == "O.G.R.E Commander@O.G.R.E (Logistics)")
			or (_UnitRole == "O.G.R.E Engineer")) then
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

  // STALKER
	if ((_UnitRole == "STALKER 1 Pilot@Joint Air Command 1")
	or (_UnitRole == "STALKER 2 Pilot@Joint Air Command 2")) then
	{_Role = "STALKER"};

	//Empty array of gear to add to the arsenal per player.
	Private _GearToAdd = [];

	//Define the gear for each Role
	Private _DefaultGear = [
	//Uniform
    "rhs_uniform_acu_ocp",
	"rhs_uniform_g3_rgr",
	"rhs_uniform_g3_m81",
	"rhs_uniform_g3_mc",
	"rhs_uniform_acu_oefcp",
	"U_B_CombatUniform_mcam",
	"U_B_CombatUniform_mcam_tshirt",
	"rhs_uniform_cu_ocp",
	//Vest
    "V_PlateCarrierL_CTRG",
	"V_PlateCarrierH_CTRG",
	"rhsusf_iotv_ocp_Grenadier",
	"rhsusf_iotv_ocp_Medic",
	"rhsusf_iotv_ocp_Repair",
	"rhsusf_iotv_ocp_Rifleman",
	"rhsusf_iotv_ocp_SAW",
	"rhsusf_iotv_ocp_Teamleader",
	"rhsusf_spcs_ocp_grenadier",
	"rhsusf_spcs_ocp_machinegunner",
	"rhsusf_spcs_ocp_medic",
	"rhsusf_spcs_ocp_rifleman_alt",
	"rhsusf_spcs_ocp_rifleman",
	"rhsusf_spcs_ocp_saw",
	"rhsusf_spcs_ocp_teamleader_alt",
	"rhsusf_spcs_ocp_teamleader",
	"Crye_AVS_1",
  "Crye_AVS_1_RG",
  "Crye_AVS_1_1",
  "Crye_AVS_1_1_RG",
  "Crye_AVS_1_2",
  "Crye_AVS_1_2_RG",
  "Crye_AVS_1_3",
  "Crye_AVS_1_3_RG",
  "Crye_AVS_3",
  "Crye_AVS_3_RG",
  "Crye_AVS_3_1",
  "Crye_AVS_3_1_RG",
  "Crye_AVS_3_2",
  "Crye_AVS_3_2_RG",
  "Crye_AVS_3_3",
  "Crye_AVS_3_3_RG",
	//Bagpack
	"kat_stretcherBag",
	"B_Parachute",
    "ACE_TacticalLadder_Pack",
	"B_AssaultPack_mcamo",
	"B_Carryall_mcamo",
	"rhsusf_assault_eagleaiii_ocp",
	"B_Kitbag_mcamo",
	//helm
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
	"rhsusf_opscore_mc_cover_pelt_cam",
	"rhsusf_opscore_mc_cover_pelt_nsw",
	//weapons
	"rhs_weap_m4a1_carryhandle",
	"rhs_weap_m4a1_blockII",
	"rhs_weap_m4a1_blockII_d",
	"rhs_weap_m16a4_carryhandle",
	"rhs_weap_m4",
	"rhs_weap_mk18",
	"rhs_weap_mk18_d",
	//secondary
	"rhsusf_weap_glock17g4",
	"rhsusf_weap_m9",
	"ACE_Flashlight_Maglite_ML300L",
	"rhs_weap_m1911a1",
	//launchers
	"rhs_weap_M136",
	"rhs_weap_M136_hedp",
	"rhs_weap_M136_hp",
	//ammo
	"rhs_mag_30Rnd_556x45_M855A1_Stanag",
	"rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",
	//sec ammo
	"11Rnd_45ACP_Mag",
	"rhsusf_mag_17Rnd_9x19_JHP",
	"rhsusf_mag_15Rnd_9x19_JHP",
	//ammo specific roles
	"rhsusf_20Rnd_762x51_SR25_m62_Mag",
	"rhsusf_20Rnd_762x51_SR25_m993_Mag",
	"ACE_20Rnd_762x51_M993_AP_Mag",
	"ACE_20Rnd_762x51_Mag_Tracer",
	"rhsusf_5Rnd_300winmag_xm2010",
	"rhsusf_100Rnd_762x51_m62_tracer",
	"rhsusf_100Rnd_762x51_m61_ap",
	"rhsusf_200Rnd_556x45_mixed_soft_pouch",
	"rhs_fgm148_magazine_AT",
	"MRAWS_HE_F",
	"MRAWS_HEAT55_F",
	"MRAWS_HEAT_F",
	//GL ammo
	"1Rnd_HE_Grenade_shell",
	"rhs_mag_M397_HET",
	"rhs_mag_M433_HEDP",
	"ACE_HuntIR_M203",
	"ACE_40mm_Flare_white",
	"ACE_40mm_Flare_red",
	"ACE_40mm_Flare_green",
	"ACE_40mm_Flare_ir",
	"rhs_mag_m713_Red",
	"rhs_mag_m714_White",
	"rhs_mag_m715_Green",
	"rhs_mag_m716_yellow",
	//attachments
	//sights
	"optic_arco",
	"optic_holosight",
	"optic_mrco",
	"optic_hamr",
	"rhsusf_acc_acog",
	"rhsusf_acc_eotech_552",
	"rhsusf_acc_compm4",
	"rhsusf_acc_acog_rmr",
	"rhsusf_acc_acog_usmc",
	"optic_erco_blk_f",
	//rail
	"rhsusf_acc_anpeq15side_bk",
	"rhsusf_acc_anpeq15_bk_top",
	"rhsusf_acc_anpeq15_bk",
	"rhsusf_acc_anpeq15_bk_light",
	//muzzle
	"ace_muzzle_mzls_l",
	"rhsusf_acc_nt4_black",
	"rhsusf_acc_nt4_tan",
	//bipod
	"rhsusf_acc_grip2",
	"rhsusf_acc_grip1",
	"rhsusf_acc_kac_grip",
	"rhsusf_acc_rvg_blk",
	"rhsusf_acc_tdstubby_blk",
	"rhsusf_acc_grip3",
	//Grenades
	"SmokeShellGreen",
	"SmokeShellRed",
	"SmokeShell",
	"SmokeShellYellow",
	"HandGrenade",
	"B_IR_Grenade",
	"ACE_HandFlare_Green",
	"ACE_HandFlare_Red",
	"ACE_HandFlare_White",
	"ACE_HandFlare_Yellow",
	"ACE_Chemlight_HiGreen",
	"ACE_Chemlight_HiRed",
	"ACE_Chemlight_HiWhite",
	"ACE_Chemlight_HiYellow",
	"ACE_Chemlight_IR",
	"ACE_M84",
	"rhs_grenade_mki_mag",
	"rhs_mag_m7a3_cs",
	//facewear
	"M40_Gas_mask_nbc_v1_d",
	"rhs_googles_black",
	"rhs_googles_clear",
	"rhs_googles_orange",
	"rhs_googles_yellow",
	"G_Sport_Blackred",
  "rhsusf_shemagh_grn",
  "rhsusf_shemagh2_grn",
  "rhsusf_shemagh_od",
  "rhsusf_shemagh2_od",
  "rhsusf_shemagh_tan",
  "rhsusf_shemagh2_tan",
  "rhsusf_shemagh_white",
  "rhsusf_shemagh2_white",
  "rhsusf_shemagh_gogg_grn",
  "rhsusf_shemagh2_gogg_grn",
  "rhsusf_shemagh_gogg_od",
  "rhsusf_shemagh2_gogg_od",
  "rhsusf_shemagh_gogg_tan",
  "rhsusf_shemagh2_gogg_tan",
  "rhsusf_shemagh_gogg_white",
  "rhsusf_shemagh2_gogg_white",
	//items
	"Attachable_Helistretcher",
	"hgun_esd_01_F",
  "ACE_rope36",
  "ACE_rope27",
  "ACE_rope18",
	"ACE_Banana",
	"ACE_fieldDressing",
	"ACE_elasticBandage",
	"ACE_packingBandage",
	"ACE_quikclot",
	"ACE_salineIV",
	"ACE_salineIV_250",
	"ACE_salineIV_500",
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
	"ACE_SpraypaintRed",
	"ACE_tourniquet",
	"ACE_wirecutter",
	"ACE_NVG_Wide_Black",
	"ACE_NVG_Wide",
	"Laserdesignator",
	"Laserbatteries",
	"ACE_Vector",
	"ItemMap",
	"ItemGPS",
	"ItemAndroid",
	"ItemcTab",
	"ItemWatch",
	"TFAR_anprc152",
	"ACE_VMH3",
	"ACE_WaterBottle",
	"tfw_rf3080Item",
	"ACE_RangeTable_82mm",
	"ACE_artilleryTable",
	"ACE_DefusalKit",
	"kat_guedel",
    "kat_Pulseoximeter",
	"kat_chestSeal"
	];

	Private _ADMIN = [
	//secondary
	"rhs_weap_M320",
	//uniform
	//vests
	"rhsusf_iotv_ocp_Squadleader",
	"rhsusf_spcs_ocp",
	"rhsusf_spcs_ocp_squadleader",
	//backpacks
	"B_rhsusf_B_BACKPACK",
	"tfw_ilbe_whip_black",
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
	"kat_bloodIV_O",
	"kat_bloodIV_O_250",
	"kat_bloodIV_O_500"
	];

	Private _CO = [
	//secondary
	"rhs_weap_M320",
	//backpacks
	"B_rhsusf_B_BACKPACK",
	"B_UAV_01_backpack_F",
	"tfw_ilbe_whip_mc",
	//vests
    "rhsusf_iotv_ocp_Squadleader",
	"rhsusf_spcs_ocp",
	"rhsusf_spcs_ocp_squadleader",
    //items
	"ACE_HuntIR_monitor",
	"B_UavTerminal"
    ];

	Private _SL = [
	//secondary
	"rhs_weap_M320",
	//backpacks
	"B_UAV_01_backpack_F",
	"tfw_ilbe_whip_mc",
	//vests
    "rhsusf_iotv_ocp_Squadleader",
	"rhsusf_spcs_ocp",
	"rhsusf_spcs_ocp_squadleader",
	//items
	"ACE_HuntIR_monitor",
	"B_UavTerminal"
	];

	Private _MEDIC = [
	//uniforms
	//vests
	//items
	"ACE_adenosine",
	"ACE_surgicalKit",
	"kat_aatKit",
    "kat_accuvac",
    "kat_X_AED",
    "kat_Painkiller",
    "kat_AED",
    "kat_crossPanel",
    "kat_chestSeal",
    "kat_larynx",
    "kat_stethoscope",
	"KAT_Empty_bloodIV_250",
	"KAT_Empty_bloodIV_500",
	"kat_bloodIV_O",
	"kat_bloodIV_O_250",
	"kat_bloodIV_O_500"
	];

	Private _MARKSMAN = [
	//vests
	//weapons
	"rhs_weap_sr25_ec",
	"arifle_SPAR_03_blk_F",
	"rhs_weap_m14ebrri",
	"rhs_weap_XM2010",
	//attachments
	"optic_sos",
	"optic_dms",
	"optic_nvs",
	"rhsusf_acc_acog_mdo",
	"ace_muzzle_mzls_b",
	"muzzle_snds_b",
	"bipod_01_f_blk",
	"bipod_01_f_mtp",
	"rhsusf_acc_m2010s",
	"optic_ams",
	//Items
	"ACE_ATragMX",
	"ACE_Kestrel4500",
	"ACE_Flashlight_KSF1",
	"ACE_RangeCard",
	"ACE_DAGR"
	];

	Private _ENGINEER = [
	//vests
	//helm
	"rhsusf_cvc_helmet",
	"rhsusf_cvc_alt_helmet",
	"rhsusf_cvc_ess",
	//backpacks
	"tfw_ilbe_whip_mc",
	//Explosives
	"SatchelCharge_Remote_Mag",
	"ATMine_Range_Mag",
	"rhsusf_m112_mag",
	"rhsusf_m112x4_mag",
	"B_UGV_02_Demining_backpack_F",
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
    "rhs_weap_m240B",
	"rhs_weap_m249_pip_ris",
	//attachments
	"rhsusf_acc_acog_mdo",
	"rhsusf_acc_ardec_m240",
	"ace_muzzle_mzls_b",
	"muzzle_snds_h_mg",
	"rhsusf_acc_saw_bipod",
	"bipod_01_f_blk",
	"bipod_01_f_mtp",
	//vests
	//Items
	"ACE_WaterBottle"
	];

	Private _AT = [
	//launchers
	"rhs_weap_fgm148",
	"launch_MRAWS_sand_F"
	//vests
	];

	Private _RIFLEMAN = [
	//weapons
    "rhs_weap_m4a1_carryhandle_m203",
	"rhs_weap_m4a1_blockII_M203",
	"rhs_weap_m4_m203",
	"rhs_weap_m4_m320",
	"rhs_weap_m4a1_blockII_M203_d",
	"rhs_weap_m16a4_carryhandle_M203",
	"rhs_weap_mk18_m320",
	//secondary
	"rhs_weap_M320",
	//items
	"ACE_Banana",
	"ACE_WaterBottle"
	];

	Private _STALKER = [
	//uniforms
	"U_B_HeliPilotCoveralls",
	//vests
	"rhsusf_spcs_ocp_crewman",
	"rhsusf_spcs_ocp",
	//helm
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
	//backpacks
	"tfw_ilbe_whip_mc",
	//Items
	"ToolKit",
	"B_UavTerminal",
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
