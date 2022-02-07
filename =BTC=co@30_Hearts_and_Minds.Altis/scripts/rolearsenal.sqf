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
		//Headgear
		"rhs_fieldcap",
		"rhs_fieldcap_digi",
		"rhs_vkpo_cap",
		"rhs_beanie_green",
	  "rhs_6b26_digi",
		"rhs_6b26_digi_bala",
		"rhs_6b26_digi_ess",
		"rhs_6b26_digi_ess_bala",
		"rhs_6b26",
		"rhs_6b26_bala",
		"rhs_6b26_ess",
		"rhs_6b26_ess_bala",
		//Vests
		"rhs_6b23_6sh92",
		"rhs_6b23_6sh92_headset",
		"rhs_6b23_6sh116",
		"rhs_6b23_digi_6sh92",
		"rhs_6b23_digi_6sh92_headset",
		//Uniforms
		"rhs_uniform_vkpo",
		"rhs_uniform_vkpo_gloves",
		"rhs_uniform_flora",
		//Bagpacks
		"rhs_tortila_emr",
		"rhs_tortila_olive",
		"rhs_rk_sht_30_emr",
		"rhs_rk_sht_30_olive",
		"B_UAV_01_backpack_F",
		//Weapons
		"rhs_weap_ak74m",
		"rhs_weap_ak74m_camo",
		"rhs_weap_ak74n",
		"rhs_weap_ak74n_2",
		"rhs_weap_akmn",
		"rhs_weap_aks74n",
		"rhs_weap_aks74n_2",
		"rhs_weap_aks74un",
		"hgun_Rook40_F",
		"rhs_weap_makarov_pm",
			//Ammo
			"rhs_30Rnd_545x39_7N6M_AK",
			"rhs_30Rnd_545x39_AK_green",
			"rhs_30Rnd_545x39_7N22_camo_AK",
			"rhs_30Rnd_545x39_7N22_AK",
			"rhs_30Rnd_545x39_7U1_AK",
			"rhs_30Rnd_762x39mm_bakelite_89",
			"rhs_30Rnd_762x39mm_bakelite_tracer",
			"rhs_30Rnd_762x39mm_bakelite_U",
			"rhs_30Rnd_762x39mm_89",
			"rhs_30Rnd_762x39mm_tracer",
			"rhs_30Rnd_762x39mm_U",
			"rhs_20rnd_9x39mm_SP6",
			"16Rnd_9x21_Mag",
			"rhs_mag_9x18_8_57N181S",
			//Attachments
			"rhs_acc_1p63",
			"rhs_acc_1p78_3d",
			"rhs_acc_1pn93_2",
			"rhs_acc_ekp1",
			"rhs_acc_pkas",
			"rhs_acc_2dpzenit",
			"rhs_acc_2dpzenit_ris",
			"rhs_acc_perst1ik",
			"rhs_acc_perst1ik_ris",
			"rhs_acc_grip_ffg2",
			"rhs_acc_grip_rk6",
			"rhs_acc_ak5",
			"rhs_acc_dtk3",
			"rhs_acc_dtk4short",
			"rhs_acc_tgpa",
			"rhs_acc_dtkakm",
			"rhs_acc_dtk1l",
			"rhs_acc_pbs1",
			"muzzle_snds_l",
		  	//Grenades
			"rhs_mag_nspd",
			"rhs_mag_nspn_green",
			"rhs_mag_nspn_red",
			"rhs_mag_nspn_yellow",
			"rhs_mag_rgd5",
			"rhs_mag_rgo",
			"rhs_mag_rdg2_white",
		 	 //Items
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
			"rhs_balaclava",
			"rhs_balaclava1_olive",
			"M40_Gas_mask_nbc_v1_d",
			"rhs_scarf",
			"ACE_NVG_Wide_Black",
			"Rangefinder",
			"ItemMap",
			"ItemGPS",
			"ItemAndroid",
			"ItemcTab",
			"ItemWatch",
			"B_UavTerminal",
			"TFAR_anprc152"
	];

	Private _ADMIN = [
	//Headgear
	"rhs_ushanka",
	//Vests
	//Uniforms
	"rhs_uniform_afghanka_moldovan_ttsko_blue",
	//Bagpacks
	"TFAR_rt1523g_big_bwmod",
	"TFAR_mr3000_bwmod",
	//Weapons
		//Ammo
		//Attachments
	//Items
	"tfw_rf3080Item",
	"ToolKit",
	"ACE_wirecutter",
	"ACE_surgicalKit",
	"ACE_SpareBarrel_Item",
	"ACE_RangeCard",
	"ACE_Clacker",
	"ACE_M26_Clacker",
	"ACE_DefusalKit",
	"adv_aceCPR_AED",
	"ACE_adenosine"
	];

	Private _CO = [
	//Headgear
	"rhs_beret_mvd",
	//Vests
	"rhs_6b23_crewofficer",
	//Uniforms
	//Bagpacks
	"TFAR_rt1523g_big_bwmod",
	"TFAR_mr3000_bwmod",
	//Weapons
		//Ammo
		//Attachments
	//Items
	"tfw_rf3080Item"
	];

	Private _SL = [
	//Headgear
	//Vests
	"rhs_6b23_6sh92_radio",
	//Uniforms
	//Bagpacks
	"TFAR_rt1523g_big_bwmod",
	"TFAR_mr3000_bwmod",
	//Weapons
		//Ammo
		//Attachments
	//Items
	"tfw_rf3080Item"
	];

	Private _MEDIC = [
	//Headgear
	//Vests
	"rhs_6b23_medic",
	"rhs_6b23_digi_medic",
	//Uniforms
	//Bagpacks
	//Weapons
		//Ammo
		//Attachments
	//Items
	"ACE_adenosine",
	"adv_aceCPR_AED",
	"ACE_surgicalKit"
	];

	Private _MARKSMAN = [
	//Headgear
	//Vests
	"rhs_6b23_sniper",
	"rhs_6b23_digi_sniper",
	//Uniforms
	//Bagpacks
	//Weapons
	"rhs_weap_svdp_wd",
	"rhs_weap_vss",
		//Ammo
	"rhs_10Rnd_762x54mmR_7N14",
	"ACE_10Rnd_762x54_Tracer_mag",
		//Attachments
	"rhs_acc_1pn93_1",
	"rhs_acc_pso1m2",
	"rhs_acc_pso1m21",
	"rhs_acc_tgpv",
	"rhs_acc_tgpv2",
	//Items
	"ACE_ATragMX",
	"ACE_Kestrel4500",
	"ACE_Flashlight_KSF1",
	"ACE_RangeCard",
	"ACE_SpottingScope"
	];

	Private _ENGINEER = [
	//Headgear
	//Vests
	"rhs_6b23_engineer",
	"rhs_6b23_digi_engineer",
	//Uniforms
	//Bagpacks
	"rhs_rk_sht_30_emr_engineer_empty",
	"rhs_rk_sht_30_olive_engineer_empty",
	"ACE_TacticalLadder_Pack",
	//Weapons
	"ACE_VMH3",
		//Ammo
		//Attachments
	  //Explosives
  "SatchelCharge_Remote_Mag",
	"rhs_ec200_mag",
	"rhs_ec400_mag",
	"rhs_mine_tm62m_mag",
	"rhssaf_mine_tma4_mag",
	//Items
	"ToolKit",
	"ACE_DefusalKit",
	"ACE_M26_Clacker",
	"ACE_Clacker"
	];

	Private _AUTORIFLEMAN = [
	//Headgear
	//Vests
	//Uniforms
	//Bagpacks
	//Weapons
	"rhs_weap_rpk74m",
	"rhs_weap_pkm",
	"rhs_weap_pkp",
		//Ammo
	"rhs_100Rnd_762x54mmR_7N26",
	"rhs_100Rnd_762x54mmR_green",
		//Attachments
	"rhs_acc_2dpzenit",
	"rhs_acc_perst1ik",
	"rhs_acc_tgpa",
	//Items
	"ACE_WaterBottle"
	];

	Private _GRENADIER = [
	//Headgear
	//Vests
	"rhs_6b23_digi_6sh92_Vog_Spetsnaz",
	"rhs_6b23_6sh116_vog_od",
	//Uniforms
	//Bagpacks
	//Weapons
	"rhs_weap_ak74m_gp25",
  "rhs_weap_ak74n_gp25",
  "rhs_weap_ak74n_2_gp25",
  "rhs_weap_akmn_gp25",
  "rhs_weap_aks74n_gp25",
		//Ammo
	"rhs_GDM40",
	"rhs_GRD40_Green",
	"rhs_GRD40_Red",
	"rhs_GRD40_white",
	"rhs_VG40OP_green",
	"rhs_VG40OP_red",
	"rhs_VG40OP_white",
	"rhs_VG40SZ",
	"rhs_VG40TB",
	"rhs_VOG25"
		//Attachments
	//Items
	];

	Private _AT = [
	//Headgear
	//Vests
	//Uniforms
	//Bagpacks
	"rhs_rpg_empty",
	//Weapons
  "rhs_weap_rpg7",
		//Ammo
	"rhs_rpg7_PG7VL_mag",
	"rhs_rpg7_PG7VR_mag",
	"rhs_rpg7_OG7V_mag",
	"rhs_rpg7_TBG7V_mag",
		//Attachments
	"rhs_acc_pgo7v3"
	//Items
	];

	Private _RIFLEMAN = [
	//Headgear
	//Vests
	//Uniforms
	//Bagpacks
	//Weapons
		//Ammo
		//Attachments
	//Items
	];

	Private _ARMOR = [
	//Headgear
	"rhs_6b48",
	"rhs_tsh4",
	"rhs_tsh4_bala",
	"rhs_tsh4_ess",
	"rhs_tsh4_ess_bala",
	//Vests
	"rhs_6b23_crew",
	"rhs_6b23_digi_crew",
	//Uniforms
	//Bagpacks
	"TFAR_rt1523g_big_bwmod",
	"TFAR_mr3000_bwmod",
	//Weapons
		//Ammo
		//Attachments
	//Items
	"ACE_adenosine",
	"adv_aceCPR_AED",
	"ACE_surgicalKit",
	"ToolKit"
	];

	Private _STALKER = [
	//Headgear
	"rhs_zsh7a_mike_green",
	"rhs_zsh7a_mike_green_alt",
	"rhs_pilotka",
	//Vests
	"rhs_6b23_crew",
	"rhs_6b23_digi_crew",
	//Uniforms
	//Bagpacks
	"TFAR_rt1523g_big_bwmod",
	"TFAR_mr3000_bwmod",
	//Weapons
		//Ammo
		//Attachments
	//Items
	"ACE_adenosine",
	"adv_aceCPR_AED",
	"ACE_surgicalKit",
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
