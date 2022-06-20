
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
    //BANSHEE
			if ((_UnitRole == "BANSHEE Pilot@Joint Air Command 3")
			or (_UnitRole == "BANSHEE Crew")) then
			{_Role = "BANSHEE"};
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
  "rhs_weap_m4a1_carryhandle",
  "rhs_weap_m4a1_blockII",
  "rhs_weap_m16a4_imod",
  "rhs_weap_mk18",
  "rhs_weap_mk18_wd",
  "Tier1_SR16_Carbine_Mod2_CTR_Black",
  "Tier1_SR16_Carbine_Mod2_IMOD_Black",
  "Tier1_SIG_MCX_115_Virtus_300BLK_Black",
  "Tier1_SIG_MCX_115_Virtus_Black",
  //Secondary
  "ACE_VMH3",
  "ACE_VMM3",
  "rhsusf_weap_glock17g4",
  "rhsusf_weap_m1911a1",
  "rhsusf_weap_m9",
  //Launcher
  "rhs_weap_M136",
  "rhs_weap_M136_hedp",
  "rhs_weap_M136_hp",
  //Helm
  "H_Watchcap_blk",
  "H_Watchcap_cbr",
  "H_Watchcap_camo",
  "H_Watchcap_khk",
  "H_Booniehat_khk_hs",
  "H_Booniehat_khk",
  "H_Booniehat_mcamo",
  "H_Booniehat_oli",
  "H_Booniehat_tan",
  "rhs_Booniehat_m81",
  "rhs_Booniehat_ocp",
  "H_Cap_grn",
  "H_Cap_oli",
  "H_Cap_tan",
  "H_Cap_usblack",
  "H_Cap_tan_specops_US",
  "rhsusf_ach_bare_wood",
  "rhsusf_ach_bare_wood_ess",
  "rhsusf_ach_bare_wood_headset",
  "rhsusf_ach_bare_wood_headset_ess",
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
  "rhsusf_opscore_fg",
  "rhsusf_opscore_fg_pelt",
  "rhsusf_opscore_fg_pelt_cam",
  "rhsusf_opscore_fg_pelt_nsw",
  "rhsusf_opscore_rg_cover",
  "rhsusf_opscore_rg_cover_pelt",
  //Uniform
  "rhs_uniform_acu_oefcp",
  "U_I_G_resistanceLeader_F",
  "rhs_uniform_bdu_erdl",
  "rhs_uniform_g3_m81",
  "rhs_uniform_g3_rgr",
  //Vest
  "rhsusf_iotv_ocp_Rifleman",
  "rhsusf_plateframe_rifleman",
  "rhsusf_spc_rifleman",
  "rhsusf_spcs_ocp_rifleman",
  //Backpack
  "B_Carryall_cbr",
  "B_Carryall_khk",
  "B_Carryall_mcamo",
  "B_Carryall_oli",
  "B_Kitbag_cbr",
  "B_Kitbag_rgr",
  "B_Kitbag_mcamo",
  "B_Kitbag_tan",
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
  //Binocular
  "Laserdesignator",
	"Laserbatteries",
	"ACE_Vector",
  //Radio
  "TFAR_anprc152",
  "tfw_rf3080Item",
  //Sights
  "optic_mrco",
  "optic_hamr",
  "optic_arco_blk_f",
  "optic_holosight_blk_f",
  "optic_erco_blk_f",
  "optic_arco_ak_blk_f",
  "rhsusf_acc_g33_t1",
  "rhsusf_acc_g33_xps3",
  "rhsusf_acc_elcan",
  "rhsusf_acc_acog",
  "rhsusf_acc_eotech_552",
  "rhsusf_acc_compm4",
  "rhsusf_acc_su230a",
  "rhsusf_acc_su230a_mrds",
  "rhsusf_acc_acog_rmr",
  "rhsusf_acc_eotech_xps3",
  "tier1_eotech551_3xmag_black_up",
  "tier1_eotech553_3xmag_black_up",
  "tier1_exps3_0_3xmag_black_up",
  "tier1_microt1_leap_3xmag_black_up",
  "tier1_microt2_3xmag_black_up",
  "tier1_romeo4t_bcd_g33_black_up",
  "tier1_elcan_156_c1_black",
  //Rail
  "acc_flashlight_pistol",
  "rhsusf_acc_anpeq15side_bk",
  "rhsusf_acc_anpeq15_bk_top",
  "rhsusf_acc_anpeq15_bk",
  "rhsusf_acc_anpeq15_bk_light",
  "rhs_acc_at4_handler",
  "tier1_urx4_la5_side",
  "tier1_urx4_la5_top",
  "tier1_urx4_la5_m300c_black",
  "tier1_urx4_la5_m300c_black_fl",
  "tier1_mcx_la5_side",
  "tier1_mcx_la5_top",
  "tier1_mcx_la5_m300c_black",
  "tier1_mcx_la5_m300c_black_fl",
  //Muzzle
  "rhsusf_acc_omega9k",
  "tier1_aac_m42000_black",
  "tier1_sandmans_black",
  "tier1_srd762_black",
  "tier1_socom556_2_mini_black",
  "tier1_socom556_black",
  "tier1_socom556_2_black",
  //Bipod
  "tier1_grippod_black",
  "tier1_harris_bipod_black",
  "tier1_kac_vfg_black",
  "tier1_larue_fug_black",
  "tier1_afg_mlok_black",
  "tier1_harris_bipod_mvg_mlok_black",
  //Magazines
  "Tier1_20Rnd_9x19_FMJ",
  "Tier1_20Rnd_9x19_JHP",
  "rhsusf_mag_7x45acp_MHP",
  "rhsusf_mag_15Rnd_9x19_FMJ",
  "rhsusf_mag_15Rnd_9x19_JHP",
  "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",
  "rhs_mag_30Rnd_556x45_Mk262_Stanag",
  "Tier1_30Rnd_556x45_M856A1_EMag",
  "Tier1_30Rnd_556x45_Mk262Mod1_EMag",
  "Tier1_30Rnd_762x35_300BLK_Stanag",
  "Tier1_30Rnd_762x35_300BLK_RNBT_Stanag",
  //Additional Magazines
  "rhsusf_20Rnd_762x51_SR25_m62_Mag",
  "rhsusf_20Rnd_762x51_SR25_m118_special_Mag",
  "Tier1_20Rnd_762x51_M62_SR25_Mag",
  "Tier1_20Rnd_762x51_M118_Special_SR25_Mag",
  "Tier1_250Rnd_762x51_Belt_M62_Tracer",
  "rhsusf_200Rnd_556x45_mixed_soft_pouch_coyote",
  "rhsusf_20Rnd_762x51_m62_Mag",
  "rhsusf_20Rnd_762x51_m118_special_Mag",
  "ACE_HuntIR_M203",
  "rhs_fim92_mag",
  "MRAWS_HE_F",
  "MRAWS_HEAT55_F",
  "MRAWS_HEAT_F",
  "rhs_fgm148_magazine_AT",
  "NLAW_F",
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
	"ItemMicroDAGR",
	"ItemcTab"
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
  "tfw_ilbe_whip_coy",
  "tfw_ilbe_whip_gr",
  "tfw_ilbe_whip_mct",
  "tfw_ilbe_whip_mc",
  "tfw_ilbe_whip_ocp",
  "tfw_ilbe_whip_wd2",
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
  //items
  "B_UavTerminal",
  "tfw_rf3080Item",
  "ACE_HuntIR_monitor"
	];

	Private _CO = [
  //Primary
  //Secondary
  "rhs_weap_M320",
  //Launcher
  //Helm
  //Uniform
  //Vest
  "rhsusf_iotv_ocp_Squadleader",
  "rhsusf_iotv_ocp_Teamleader",
  "rhsusf_plateframe_teamleader",
  "rhsusf_spc_squadleader",
  "rhsusf_spc_teamleader",
  "rhsusf_spcs_ocp_squadleader",
  "rhsusf_spcs_ocp_teamleader_alt",
  //Backpack
  "tfw_ilbe_whip_coy",
  "tfw_ilbe_whip_gr",
  "tfw_ilbe_whip_mct",
  "tfw_ilbe_whip_mc",
  "tfw_ilbe_whip_ocp",
  "tfw_ilbe_whip_wd2",
  "B_rhsusf_B_BACKPACK",
  "B_UAV_01_backpack_F",
  //items
  "tfw_rf3080Item",
  "ACE_HuntIR_monitor"
  ];

	Private _SL = [
  //Primary
  //Secondary
  "rhs_weap_M320",
  //Launcher
  //Helm
  //Uniform
  //Vest
  "rhsusf_iotv_ocp_Squadleader",
  "rhsusf_iotv_ocp_Teamleader",
  "rhsusf_plateframe_teamleader",
  "rhsusf_spc_squadleader",
  "rhsusf_spc_teamleader",
  "rhsusf_spcs_ocp_squadleader",
  "rhsusf_spcs_ocp_teamleader_alt",
  //Backpack
  "tfw_ilbe_whip_coy",
  "tfw_ilbe_whip_gr",
  "tfw_ilbe_whip_mct",
  "tfw_ilbe_whip_mc",
  "tfw_ilbe_whip_ocp",
  "tfw_ilbe_whip_wd2",
  "B_UAV_01_backpack_F",
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
  "rhsusf_iotv_ocp_Medic",
  "rhsusf_plateframe_medic",
  "rhsusf_spc_corpsman",
  "rhsusf_spcs_ocp_medic",
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
  "rhs_weap_m14ebrri",
  "Tier1_M110k1",
  "Tier1_M110k1_CTR",
  "Tier1_M110k5",
  "Tier1_M110k5_ACS",
  "Tier1_SR25_EC",
  //Secondary
  //Launcher
  //Helm
  //Uniform
  "U_B_FullGhillie_ard",
  "U_B_FullGhillie_lsh",
  "U_B_FullGhillie_sard",
  "U_B_GhillieSuit",
  //Vest
  "rhsusf_plateframe_marksman",
  "rhsusf_spc_marksman",
  "rhsusf_spcs_ocp_sniper",
  //Backpack
  //Facewear
  //Sights
  "tier1_leupoldm3a_adm_black",
  "tier1_leupoldm3a_adm_t2_black",
  "tier1_leupoldm3a_geissele_black",
  "tier1_leupoldm3a_geissele_docter_black",
  "tier1_atacr18_adm_black",
  "tier1_atacr18_adm_t1_black",
  "tier1_atacr18_geissele_black",
  "tier1_atacr18_geissele_docter_black",
  "optic_nightstalker",
  "optic_nvs",
  "tier1_shortdot_adm_black",
  "tier1_shortdot_geissele_black",
  "tier1_shortdot_geissele_docter_black",
  "optic_ams",
  "tier1_razor_gen2_16",
  "tier1_razor_gen2_16_geissele_docter",
  "tier1_razor_gen3_110_adm_t2",
  "tier1_razor_gen3_110_geissele",
  "tier1_razor_gen3_110_geissele_docter",
  //Rail
  "tier1_m110_la5_side",
  "tier1_m110_la5_top",
  "tier1_sr25_la5_side",
  "tier1_sr25_la5_top",
  //Muzzle
  "tier1_sandmans_black",
  "tier1_kac_762_qdc_black",
  "tier1_srd762_black",
  "tier1_socom762_2_mini_black",
  "tier1_socom762_2_black",
  //Bipod
  "tier1_harris_bipod_dd_black",
  "tier1_harris_bipod_black",
  "tier1_harris_bipod_kac_black"
	];

	Private _AUTORIFLEMAN = [
  //Primary
  "rhs_weap_m240B",
  "rhs_weap_m249_pip_ris",
  "rhs_weap_m249_light_S",
  "Tier1_MK48_Mod0",
	"Tier1_MK46_Mod0",
  //Secondary
  //Launcher
  //Helm
  //Uniform
  //Vest
  "rhsusf_iotv_ocp_SAW",
  "rhsusf_plateframe_machinegunner",
  "rhsusf_spc_mg",
  "rhsusf_spcs_ocp_machinegunner",
  //Backpack
  //Facewear
  //Sights
	"rhsusf_acc_acog_mdo",
	"rhsusf_acc_elcan",
	"rhsusf_acc_elcan_ard",
  "rhsusf_acc_acog_mdo",
  //Rail
  //Muzzle
  "rhsusf_acc_ardec_m240",
  "ace_muzzle_mzls_b",
  "tier1_socom762mg_black",
  //Bipod
  "rhsusf_acc_kac_grip_saw_bipod",
  "rhsusf_acc_saw_bipod",
  "rhsusf_acc_grip4_bipod",
  "rhsusf_acc_saw_lw_bipod"
	];

	Private _AT = [
  //Primary
  //Secondary
  //Launcher
  "launch_MRAWS_green_F",
  "launch_NLAW_F",
  "rhs_weap_fim92",
  "rhs_weap_fgm148",
  //Helm
  //Uniform
  //Vest
  //Backpack
	//Magazines
	"rhs_fim92_mag",
  "MRAWS_HE_F",
  "MRAWS_HEAT55_F",
  "MRAWS_HEAT_F",
  "rhs_fgm148_magazine_AT"
	];

  Private _GRENADIER = [
  //Primary
  "rhs_weap_m4a1_carryhandle_m203",
  "rhs_weap_m4a1_blockII_M203",
  "rhs_weap_m16a4_carryhandle_M203",
  "rhs_weap_mk18_m320",
  //Secondary
  //Launcher
  //Helm
  //Uniform
  //Vest
  "rhsusf_iotv_ocp_Grenadier",
  "rhsusf_plateframe_grenadier",
  "rhsusf_spc_iar",
  "rhsusf_spcs_ocp_grenadier",
  //Backpack
	//Magazines
	"1Rnd_HE_Grenade_shell",
	"ACE_40mm_Flare_white",
	"ACE_40mm_Flare_green",
	"ACE_40mm_Flare_ir",
	"1Rnd_Smoke_Grenade_shell",
	"1Rnd_SmokeBlue_Grenade_shell",
	"1Rnd_SmokeGreen_Grenade_shell",
	"1Rnd_SmokeRed_Grenade_shell",
	"1Rnd_SmokeYellow_Grenade_shell"
  ];

	Private _RIFLEMAN = [
  //Primary
  //Secondary
  "tfw_rf3080Item",
  "ACE_HuntIR_monitor"
  //Launcher
  //Helm
  //Uniform
  //Vest
  //Backpack
  //items
	];

  Private _WARPIG = [
  //Primary
  //Secondary
  //Launcher
  //Helm
  "rhsusf_cvc_helmet",
  "rhsusf_cvc_alt_helmet",
  "rhsusf_cvc_ess",
  "H_EarProtectors_black_F",
  //Uniform
  //Vest
  "rhsusf_iotv_ocp",
  "rhsusf_plateframe_sapi",
  "rhsusf_plateframe_light",
  "rhsusf_spc_crewman",
  "rhsusf_spcs_ocp_crewman",
  //Backpack
  "tfw_ilbe_whip_coy",
  "tfw_ilbe_whip_gr",
  "tfw_ilbe_whip_mct",
  "tfw_ilbe_whip_mc",
  "tfw_ilbe_whip_ocp",
  "tfw_ilbe_whip_wd2",
	//items
  "tfw_rf3080Item"
  ];

	Private _OGRE = [
  //Primary
  //Secondary
  //Launcher
  "launch_NLAW_F",
  "launch_MRAWS_green_F",
  "rhs_weap_fim92",
  //Helm
  "rhsusf_cvc_helmet",
  "rhsusf_cvc_alt_helmet",
  "rhsusf_cvc_ess",
  "H_EarProtectors_black_F",
  //Uniform
  //Vest
  "rhsusf_iotv_ocp_Repair",
  "rhsusf_spc_iar",
  //Backpack
  "tfw_ilbe_whip_coy",
  "tfw_ilbe_whip_gr",
  "tfw_ilbe_whip_mct",
  "tfw_ilbe_whip_mc",
  "tfw_ilbe_whip_ocp",
  "tfw_ilbe_whip_wd2",
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
  //Secondary
  //Launcher
  //Helm
  "H_CrewHelmetHeli_B",
  "H_PilotHelmetHeli_B",
	"rhsusf_hgu56p_visor_mask_pink",
	"rhsusf_hgu56p_visor_mask_smiley",
	"rhsusf_hgu56p_tan",
	"rhsusf_hgu56p_mask_tan",
	"rhsusf_hgu56p_visor_tan",
	"rhsusf_hgu56p_visor_mask_tan",
	"rhsusf_hgu56p_usa",
	"rhsusf_hgu56p_visor_usa",
	"rhsusf_hgu56p_visor_mask_green_mo",
	"rhsusf_hgu56p_visor_mask_green",
	"rhsusf_hgu56p_visor_green",
	"rhsusf_hgu56p_visor_mask_Empire_black",
	"rhsusf_hgu56p_visor_saf",
	"rhsusf_hgu56p_visor_mask_saf",
	"rhsusf_ihadss",
	"rhsusf_hgu56p_white",
	"rhsusf_hgu56p_visor_white",
  //Uniform
  "U_B_HeliPilotCoveralls",
  "U_B_PilotCoveralls",
  //Vest
  "rhsusf_iotv_ocp",
  "rhsusf_plateframe_sapi",
  "rhsusf_plateframe_light",
  "rhsusf_spc_crewman",
  "rhsusf_spcs_ocp_crewman",
	"V_PlateCarrier2_blk",
	"V_PlateCarrier2_rgr",
  //Backpack
  "tfw_ilbe_whip_coy",
  "tfw_ilbe_whip_gr",
  "tfw_ilbe_whip_mct",
  "tfw_ilbe_whip_mc",
  "tfw_ilbe_whip_ocp",
  "tfw_ilbe_whip_wd2",
	"tfw_ilbe_blade_black",
	//items
  "ACE_rope12",
  "ACE_rope15",
  "ACE_rope18",
  "ACE_rope27",
  "tfw_rf3080Item"
	];

  Private _BANSHEE = [
  //Primary
  //Secondary
  //Launcher
  //Helm
  "H_CrewHelmetHeli_B",
  "H_PilotHelmetHeli_B",
  //Uniform
  "U_B_HeliPilotCoveralls",
  "U_B_PilotCoveralls",
  //Vest
  "rhsusf_iotv_ocp_Medic",
  "rhsusf_plateframe_medic",
  "rhsusf_spc_corpsman",
  "rhsusf_spcs_ocp_medic",
  //Backpack
  "tfw_ilbe_whip_coy",
  "tfw_ilbe_whip_gr",
  "tfw_ilbe_whip_mct",
  "tfw_ilbe_whip_mc",
  "tfw_ilbe_whip_ocp",
  "tfw_ilbe_whip_wd2",
	//items
  "ACE_rope12",
  "ACE_rope15",
  "ACE_rope18",
  "ACE_rope27",
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
    case "BANSHEE": {
	    _GearToAdd = _DefaultGear + _BANSHEE;
	  };
	  default {
	    _GearToAdd = _DefaultGear + ["ACE_Banana"];
	  };
	};

	[_box, false] call ace_arsenal_fnc_removeBox;
	[_box, _GearToAdd, false] call ace_arsenal_fnc_initBox;
}
