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
		//GRENADIER
			if ((_UnitRole == "Alpha Grenadier")
			or (_UnitRole == "Bravo Grenadier")
			or (_UnitRole == "Charlie Grenadier")) then
			{_Role = "GRENADIER"};
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
	"rhs_uniform_g3_blk",
	"rhs_uniform_g3_rgr",
	"U_lxWS_ION_Casual1",
	"U_B_CTRG_1",
  "U_B_CTRG_2",
  "U_B_CTRG_3",
  "U_B_CombatUniform_mcam_tshirt",
	"U_B_Wetsuit",
	//Vest
	"V_PlateCarrier1_blk",
	"V_PlateCarrier1_rgr",
	"V_PlateCarrier2_blk",
	"V_PlateCarrier2_rgr",
	"V_PlateCarrierSpec_blk",
	"V_PlateCarrierSpec_rgr",
	"V_Chestrig_blk",
	"rhsusaf_spc_patchless",
	"V_RebreatherB",
	//Bagpack
	"B_Carryall_cbr",
	"B_Carryall_oli",
	"b_carryall_khk",
	"B_TacticalPack_blk",
	"B_TacticalPack_oli",
	"b_tacticalpack_rgr",
	"B_UAV_01_backpack_F",
	"b_assaultpack_rgr",
  "b_assaultpack_blk",
  "b_assaultpack_cbr",
  "b_assaultpack_khk",
  "rhs_d6_Parachute_backpack",
	//helm
	"rhsusf_opscore_bk",
	"rhsusf_opscore_bk_pelt",
	"rhsusf_opscore_fg",
	"rhsusf_opscore_fg_pelt",
	"H_Cap_blk",
	"H_Cap_grn",
	"H_Cap_oli",
	"H_Booniehat_khk",
	"H_Booniehat_oli",
	"H_Booniehat_tan",
	"rhsusf_ach_bare_wood",
  "rhsusf_ach_bare_wood_ess",
  "rhsusf_ach_bare_wood_headset",
  "rhsusf_ach_bare_wood_headset_ess",
  "rhsusf_opscore_rg_cover_pelt",
  "rhsusf_opscore_rg_cover",
  "lxWS_H_bmask_base",
  "lxWS_H_bmask_camo01",
  "lxWS_H_bmask_white",
  "lxWS_H_bmask_camo02",
  "lxWS_H_bmask_yellow",
	//weapons
	"rhs_weap_g36c",
	"rhs_weap_g36kv",
	"rhs_weap_m4a1_blockII_bk",
	"rhs_weap_m4a1_blockII_wd",
	"rhs_weap_m4a1_mstock",
  "rhs_weap_m4a1_wd_mstock",
	"rhs_weap_m16a4_imod",
	"arifle_AK12_F",
	"rhs_weap_ak74m_zenitco01_b33",
	"SMG_03C_black",
	"SMG_03C_camo",
	"SMG_01_F",
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
	"rhssaf_30rnd_556x45_EPR_G36",
	"rhssaf_30rnd_556x45_Tracers_G36",
	"rhs_mag_30Rnd_556x45_M855A1_Stanag",
	"rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red",
	"30Rnd_762x39_AK12_Mag_F",
	"30Rnd_762x39_AK12_Mag_Tracer_F",
	"rhsusf_20Rnd_762x51_m118_special_Mag",
	"rhsusf_20Rnd_762x51_m62_Mag",
	"10Rnd_93x64_DMR_05_Mag",
	"50Rnd_570x28_SMG_03",
	"30Rnd_45ACP_Mag_SMG_01",
	"rhsusf_200Rnd_556x45_mixed_soft_pouch_coyote",
	"rhsusf_100Rnd_762x51_m80a1epr",
	"rhsusf_100Rnd_762x51_m62_tracer",
	"rhsusf_mag_17Rnd_9x19_FMJ",
	"rhsusf_mag_17Rnd_9x19_JHP",
	"rhsusf_mag_15Rnd_9x19_FMJ",
	"rhsusf_mag_15Rnd_9x19_JHP",
	"11Rnd_45ACP_Mag",
	"rhsusf_mag_7x45acp_MHP",
	"rhs_fgm148_magazine_AT",
	"MRAWS_HE_F",
	"MRAWS_HEAT55_F",
	"MRAWS_HEAT_F",
	"rhs_mag_smaw_HEDP",
	"rhs_mag_smaw_HEAA",
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
	//ammo
	"rhssaf_30rnd_556x45_EPR_G36",
	"rhssaf_30rnd_556x45_Tracers_G36",
	"rhs_mag_30Rnd_556x45_M855A1_Stanag",
	"rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red",
	"30Rnd_762x39_AK12_Mag_F",
	"30Rnd_762x39_AK12_Mag_Tracer_F",
	"rhs_30Rnd_545x39_7N22_plum_AK",
	"rhs_30Rnd_545x39_AK_plum_green",
	"rhs_30Rnd_545x39_7N22_AK",
	"ACE_20Rnd_762x51_M118LR_Mag",
	"ACE_20Rnd_762x51_Mag_Tracer",
	"rhsusf_20Rnd_762x51_SR25_m118_special_Mag",
	"rhsusf_20Rnd_762x51_SR25_m62_Mag",
	"50Rnd_570x28_SMG_03",
	"30Rnd_45ACP_Mag_SMG_01",
	"rhsusf_200Rnd_556x45_mixed_soft_pouch_coyote",
	"rhsusf_100Rnd_762x51_m80a1epr",
	"rhsusf_100Rnd_762x51_m62_tracer",
	"130Rnd_338_Mag",
	"rhsusf_mag_17Rnd_9x19_FMJ",
	"rhsusf_mag_17Rnd_9x19_JHP",
	"rhsusf_mag_15Rnd_9x19_FMJ",
	"rhsusf_mag_15Rnd_9x19_JHP",
	"rhs_fgm148_magazine_AT",
	"MRAWS_HE_F",
	"MRAWS_HEAT55_F",
	"MRAWS_HEAT_F",
	"rhs_mag_smaw_HEDP",
	"rhs_mag_smaw_HEAA",
	"bipod_01_f_blk",
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
	//items
	"ACE_Banana",
	"ACE_fieldDressing",
	"ACE_elasticBandage",
	"ACE_packingBandage",
	"ACE_quikclot",
	"ACE_bloodIV",
	"ACE_bloodIV_250",
	"ACE_bloodIV_500",
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
	"M40_Gas_mask_nbc_v1_d",
	"ACE_NVG_Wide_Black",
	"ACE_NVG_Wide",
	"ACE_Vector",
	"ItemMap",
	"ItemGPS",
	"ItemAndroid",
	"ItemcTab",
	"ItemWatch",
	"TFAR_anprc152",
	"rhs_googles_black",
	"rhs_googles_clear",
	"rhs_googles_orange",
	"rhs_googles_yellow",
	"G_Sport_Blackred",
	"G_B_Diving",
	"rhsusaf_shemagh_grn",
  "rhsusaf_shemagh2_grn",
  "rhsusaf_shemagh_gogg_grn",
  "rhsusaf_shemagh2_gogg_grn",
  "rhsusaf_shemagh_od",
  "rhsusaf_shemagh2_od",
  "rhsusaf_shemagh_gogg_od",
  "rhsusaf_shemagh2_gogg_od",
	"ACE_VMH3",
	"ACE_WaterBottle"
	];

	Private _ADMIN = [
	//vests
	"rhsusf_plateframe_teamleader",
  "rhsusf_spc_teamleader",
  "rhsusf_spc_patchless_radio",
	//backpacks
	"tfw_ilbe_blade_black",
	"tfw_ilbe_blade_coy",
	"tfw_ilbe_blade_gr",
	"B_UGV_02_Science_backpack_F",
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
	"B_UavTerminal"
	];

	Private _CO = [
	//backpacks
	"tfw_ilbe_blade_black",
	"tfw_ilbe_blade_coy",
	"tfw_ilbe_blade_gr",
	"B_UGV_02_Science_backpack_F",
	//vests
	"rhsusf_plateframe_teamleader",
  "rhsusf_spc_teamleader",
  "rhsusf_spc_patchless_radio",
	//items
	"ACE_HuntIR_monitor",
	"B_UavTerminal"
  ];

	Private _SL = [
	//backpacks
	"tfw_ilbe_blade_black",
	"tfw_ilbe_blade_coy",
	"tfw_ilbe_blade_gr",
	"B_UGV_02_Science_backpack_F",
	//vests
	"rhsusf_plateframe_teamleader",
  "rhsusf_spc_teamleader",
  "rhsusf_spc_patchless_radio",
	//items
	"ACE_HuntIR_monitor",
	"B_UavTerminal"
	];

	Private _MEDIC = [
	//vests
	"rhsusf_mbav_medic",
  "rhsusf_plateframe_medic",
  "rhsusf_spc_corpsman",
	//items
	"ACE_adenosine",
	"adv_aceCPR_AED",
	"ACE_surgicalKit"
	];

	Private _MARKSMAN = [
	//vests
	"rhsusf_mbav_light",
  "rhsusf_plateframe_marksman",
  "rhsusf_spc_marksman",
	//weapons
	"rhs_weap_m14_ris",
	"rhs_weap_m14_ris_wd",
	"rhs_weap_m14ebrri",
	"srifle_DMR_03_F",
	"srifle_DMR_05_blk_F",
	"rhs_weap_sr25_ec",
  "rhs_weap_sr25_ec_wd",
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
	"rhsusf_mbav_rifleman",
  "rhsusf_plateframe_rifleman",
  "rhsusf_spc_rifleman",
	//backpacks
	"B_UGV_02_Demining_backpack_F",
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
	"rhsusf_mbav_mg",
  "rhsusf_plateframe_machinegunner",
  "rhsusf_spc_mg",
	//Items
	"ACE_WaterBottle"
	];

	Private _GRENADIER = [
	//vests
	"rhsusf_mbav_grenadier",
  "rhsusf_plateframe_grenadier",
  "rhsusf_spc_rifleman",
	//weapons
	"rhs_weap_g36kv_ag36",
	"rhs_weap_m4a1_blockII_M203_bk",
	"rhs_weap_m16a4_imod_M203",
	"arifle_AK12_GL_F",
	"rhs_weap_ak74m_gp25_npz",
  "rhs_weap_m4a1_m203s_wd",
  "rhs_weap_m4a1_m203s"
	];

	Private _AT = [
	//launchers
	"rhs_weap_fgm148",
	"launch_MRAWS_green_F",
	"rhs_weap_smaw",
	//vests
	"rhsusf_mbav_rifleman",
  "rhsusf_plateframe_rifleman",
  "rhsusf_spc_rifleman"
	];

	Private _RIFLEMAN = [
	//vests
	"rhsusf_mbav_rifleman",
  "rhsusf_plateframe_rifleman",
  "rhsusf_spc_rifleman",
	//items
	"ACE_WaterBottle",
	"ACE_Banana"
	];

	Private _ARMOR = [
	//helm
	"rhsusf_cvc_green_helmet",
  "rhsusf_cvc_green_alt_helmet",
  "rhsusf_cvc_green_ess",
	"H_HelmetCrew_B",
	//Items
	"tfw_ilbe_blade_black",
	"tfw_ilbe_blade_coy",
	"tfw_ilbe_blade_gr",
	"ACE_adenosine",
	"adv_aceCPR_AED",
	"ACE_surgicalKit",
	"ToolKit",
	"B_UavTerminal"
	];

	Private _STALKER = [
	//uniforms
	"U_B_HeliPilotCoveralls",
	"U_B_PilotCoveralls",
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
	//Items
	"tfw_ilbe_blade_black",
	"tfw_ilbe_blade_coy",
	"tfw_ilbe_blade_gr",
	"ACE_adenosine",
	"adv_aceCPR_AED",
	"ACE_surgicalKit",
	"ToolKit",
	"B_UavTerminal"
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
		case "GRENADIER": {
	    _GearToAdd = _DefaultGear + _GRENADIER;
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
