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
		//ARMOR
			if ((_UnitRole == "Armor Commander@Armor 1")
			or (_UnitRole == "Armor Commander@Armor 2")
			or (_UnitRole == "Armor Crew")) then
			{_Role = "ARMOR"};
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

  // STALKER
	if ((_UnitRole == "STALKER 1 Pilot@Joint Air Command 1")
	or (_UnitRole == "STALKER 2 Pilot@Joint Air Command 2")) then
	{_Role = "STALKER"};

	//Empty array of gear to add to the arsenal per player.
	Private _GearToAdd = [];

	//Define the gear for each Role
	Private _DefaultGear = [
    //helm
    "H_LIB_GER_Helmet",
    "H_LIB_GER_HelmetCamo3",
    "H_LIB_GER_Helmet_Glasses",
    "H_LIB_GER_Helmet_net",
    "H_LIB_GER_Helmet_ns",
    "H_LIB_GER_Helmet_os",
    "H_LIB_GER_HelmetUtility",
    "H_LIB_GER_HelmetUtility_Grass",
    "H_LIB_GER_HelmetUtility_Oak",
    "H_LIB_GER_HelmetCamo2",
    "H_LIB_GER_HelmetCamo",
    "H_LIB_GER_HelmetCamo4",
    "H_LIB_GER_Cap",
	//Uniform
	"U_LIB_GER_Schutze",
    "U_LIB_GER_Soldier3",
    "U_LIB_GER_Soldier_camo2",
    "U_LIB_GER_Soldier_camo",
    "U_LIB_GER_Soldier_camo4",
    "U_LIB_GER_Soldier_camo3",
    "U_LIB_GER_Soldier_camo5",
    "U_LIB_GER_Schutze_HBT",
	//Vest
	"V_LIB_GER_VestKar98",
	//Bagpack
	"B_LIB_GER_A_frame_kit",
	"B_LIB_GER_A_frame_zeltbahn",
	"B_LIB_GER_A_frame",
	"B_LIB_GER_SapperBackpack_empty",
    "B_LIB_GER_Backpack",
	//weapons
	"LIB_K98",
	//secondary
	"LIB_M1896",
	"LIB_P08",
	"LIB_FLARE_PISTOL",
	//launchers
	//ammo
    "LIB_5Rnd_792x57",
	//sec ammo
	"LIB_10Rnd_9x19_M1896",
	"LIB_8Rnd_9x19_P08",
	"LIB_1Rnd_flare_green",
	"LIB_1Rnd_flare_red",
    "LIB_1Rnd_flare_white",
	"LIB_1Rnd_flare_yellow",
	//ammo specific roles
	"LIB_50Rnd_792x57",
	"LIB_32Rnd_9x19",
	"LIB_30Rnd_792x33",
	"LIB_10Rnd_792x57",
	"LIB_1Rnd_G_PZGR_30",
    "LIB_1Rnd_G_PZGR_40",
    "LIB_1Rnd_G_SPRGR_30",
	"LIB_1Rnd_RPzB",
	//GL ammo
	//attachments
	"lib_acc_k98_bayo",
	//sights
	//rail
	//muzzle
	//bipod
	//Grenades
	"LIB_Shg24",
	"LIB_NB39",
	//facewear
	"G_LIB_Dienst_Brille",
	"G_LIB_Dienst_Brille2",
	"G_LIB_Headwrap",
	"G_LIB_Headwrap_gloves",
	"G_LIB_Watch2",
	"G_LIB_Watch1",
	"LIB_GER_Gloves4",
	"LIB_GER_Gloves3",
	"LIB_GER_Gloves2",
	"LIB_GER_Gloves1",
	//items
	"TFAR_rf7800str",
	"ACE_bloodIV",
	"ACE_bloodIV_250",
	"ACE_bloodIV_500",
	"LIB_GER_ItemWatch",
	"LIB_GER_ItemCompass",
	"ACE_Banana",
	"ACE_fieldDressing",
	"ACE_elasticBandage",
	"ACE_packingBandage",
	"ACE_quikclot",
	"ACE_bodyBag",
	"ACE_CableTie",
	"ACE_EarPlugs",
	"ACE_EntrenchingTool",
	//"ACE_epinephrine",
	//"ItemcTabHCam",
	//"ACE_IR_Strobe_Item",
	//"ACE_Flashlight_XL50",
	"ACE_MapTools",
	//"ACE_microDAGR",
	"ACE_morphine",
	"ACE_personalAidKit",
	"ACE_splint",
	"ACE_SpraypaintRed",
	"ACE_tourniquet",
	"ACE_wirecutter",
	//"ACE_NVG_Wide_Black",
	//"ACE_NVG_Wide",
	//"Laserdesignator",
	//"Laserbatteries",
	//"ACE_Vector",
	"ItemMap",
	//"ItemGPS",
	//"ItemAndroid",
	//"ItemcTab",
	//"ItemWatch",
	//"TFAR_anprc152",
	//"ACE_VMH3",
	//"ACE_WaterBottle",
	//"tfw_rf3080Item",
	"ACE_RangeTable_82mm",
	"ACE_artilleryTable"
	//"ACE_DefusalKit",
	//"kat_guedel",
    //"kat_Pulseoximeter",
	//"kat_chestSeal"
	];

	Private _ADMIN = [
	//secondary
	//uniform
	//vests
	//backpacks
	"B_LIB_GER_Radio_ACRE2",
	//items
	"LIB_Binocular_GER"
	];

	Private _CO = [
	//weapons
	"LIB_G3340",
	"LIB_G43",
	"LIB_MP40",
	"LIB_MP44",
	//secondary
	//backpacks
	"B_LIB_GER_Radio_ACRE2",
	//vests
	"V_LIB_GER_VestUnterofficer",
	"V_LIB_GER_FieldOfficer",
    //items
	"Binocular",
	"LIB_Binocular_GER"
    ];

	Private _SL = [
	//weapons
	"LIB_G3340",
	"LIB_G43",
	"LIB_MP40",
	"LIB_MP44",
	//secondary
	//backpacks
	"B_LIB_GER_Radio_ACRE2",
	//vests
	"V_LIB_GER_VestMP40",
	"V_LIB_GER_VestSTG",
	"V_LIB_GER_OfficerVest",
	"V_LIB_GER_VestUnterofficer",
	"V_LIB_GER_FieldOfficer",
	//items
	"Binocular",
	"LIB_Binocular_GER"
	];

	Private _MEDIC = [
	//helms
	"H_LIB_GER_Helmet_Medic",
	//uniforms
	//vests
	"U_LIB_GER_Medic",
	//backpacks
	"B_LIB_GER_MedicBackpack_Empty",
	//items
	"ACE_surgicalKit"
	];

	Private _MARKSMAN = [
	//uniform
	"U_LIB_GER_Scharfschutze",
	//vests
	"V_LIB_GER_SniperBelt",
	//weapons
	"LIB_K98ZF39",
	//attachments
	//Items
	"LIB_Binocular_GER"
	];

	Private _ENGINEER = [
	//vests
	"V_LIB_GER_PioneerVest",
	//helm
	//backpacks
	//Explosives
	"LIB_Ladung_Small_MINE_mag",
	"LIB_Ladung_Big_MINE_mag",
	"LIB_shumine_42_MINE_mag",
	//Items
	"ACE_LIB_LadungPM",
	"LIB_ToolKit",
	"ToolKit"
	];

	Private _ARMOR = [
	//helms
	"H_LIB_GER_TankPrivateCap",
    "H_LIB_GER_TankPrivateCap2",
    "H_LIB_GER_TankOfficerCap",
    "H_LIB_GER_TankOfficerCap2",
	//uniforms
	"U_LIB_GER_Soldier_camo5",
	"U_LIB_GER_Tank_crew_leutnant",
    "U_LIB_GER_Tank_crew_private",
	"U_LIB_GER_Tank_crew_unterofficer",
	//weapons
	"LIB_MP40",
	"LIB_MP44",
	//vests
	"V_LIB_GER_TankPrivateBelt",
	//backpacks
	"B_LIB_GER_Radio_ACRE2",
	//Explosives
	//Items
	"LIB_Binocular_GER",
	"LIB_ToolKit",
	"ToolKit"
	];

	Private _AUTORIFLEMAN = [
	//weapons
	"LIB_MG34",
	"LIB_MG42",
	"LIB_FG42G",
	//attachments
	//vests
	"U_LIB_GER_MG_schutze",
	//Items
	"ACE_WaterBottle",
	"ACE_SpareBarrel"
	];

	Private _AT = [
	//launchers
	"LIB_PzFaust_60m",
	"LIB_RPzB",
	//vests
	//backpacks
	"B_LIB_GER_Panzer_Empty",
	//grenades
	"LIB_Shg24x7"
	];

	Private _RIFLEMAN = [
	//weapons
	//secondary
	//attachments
	"lib_acc_gw_sb_empty"
	//items
	];

	Private _STALKER = [
	//weapons
	"LIB_MP40",
	"LIB_MP44",
	//uniforms
	"U_LIB_GER_LW_pilot",
	//vests
	"V_LIB_GER_VestUnterofficer",
	"V_LIB_GER_OfficerVest",
	//helm
	//backpacks
	"B_LIB_GER_LW_Paradrop",
	"B_LIB_GER_Radio_ACRE2",
	//Items
	"ToolKit",
	"LIB_Binocular_GER"
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
		case "ARMOR": {
	    _GearToAdd = _DefaultGear + _ARMOR;
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
