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
		//ARMOR 1
			if ((_UnitRole == "Armor Commander@Armor 1")
			or (_UnitRole == "Armor Crew")) then
			{_Role = "ARMOR 1"};
		//ARMOR 2
			if ((_UnitRole == "Armor Commander@Armor 2")
			or (_UnitRole == "Armor Crew")) then
			{_Role = "ARMOR 2"};
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
	//Uniform
	"U_LIB_GER_Schutze",
	"U_LIB_GER_Soldier2",
	//Vest
	"V_LIB_GER_VestG43",
	//radio
	"TFAR_rf7800str",
	"B_LIB_US_Radio",
	//Bagpack
	"B_LIB_GER_A_frame",
	"B_LIB_GER_SapperBackpack_empty",
	//helm
	"H_LIB_GER_Helmet",
	"H_LIB_GER_Helmet_ns",
	"H_LIB_GER_HelmetUtility",
	"H_LIB_GER_Cap",
	//weapons
	"LIB_K98",
	"LIB_G43",
	//secondary
	"LIB_M1896",
	"LIB_P08",
	"LIB_FLARE_PISTOL",
	//launchers
	//ammo
  "LIB_5Rnd_792x57",
	"LIB_10Rnd_792x57",
	//sec ammo
	"LIB_10Rnd_9x19_M1896",
	"LIB_8Rnd_9x19_P08",
	"LIB_1Rnd_flare_green",
	"LIB_1Rnd_flare_red",
  "LIB_1Rnd_flare_white",
	"LIB_1Rnd_flare_yellow",
	//ammo specific roles
	"LIB_1Rnd_G_PZGR_30",
  "LIB_1Rnd_G_PZGR_40",
  "LIB_1Rnd_G_SPRGR_30",
	"LIB_50Rnd_792x57",
	"LIB_32Rnd_9x19",
	"LIB_30Rnd_792x33",
	"LIB_1Rnd_PzFaust_60m",
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
	//items
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
	//"ACE_CableTie",
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
	//"ACE_SpraypaintRed",
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
	//items
	"ACE_surgicalKit"
	];

	Private _CO = [
	//weapons
	"LIB_MP40",
	"LIB_MP44",
	//secondary
	//backpacks
	//vests
	"V_LIB_GER_VestUnterofficer",
	"V_LIB_GER_FieldOfficer"
  //items
  ];

	Private _SL = [
	//weapons
	"LIB_MP40",
	"LIB_MP44",
	//secondary
	//backpacks
	//vests
	"V_LIB_GER_VestMP40",
	"V_LIB_GER_VestSTG",
	"V_LIB_GER_VestUnterofficer",
	"V_LIB_GER_FieldOfficer"
	//items
	];

	Private _MEDIC = [
	//uniforms
	//vests
	"U_LIB_GER_Medic",
	//items
	"ACE_surgicalKit"
	];

	Private _MARKSMAN = [
	//uniform
	//vests
	//weapons
	"LIB_K98ZF39"
	//attachments
	//Items
	];

	Private _ENGINEER = [
	//vests
	//helm
	//backpacks
	//Explosives
	"LIB_Ladung_Small_MINE_mag",
	"LIB_Ladung_Big_MINE_mag",
	"LIB_shumine_42_MINE_mag",
	//Items
	"ACE_LIB_LadungPM"
	];

	Private _ARMOR = [
	//uniforms
	"U_LIB_GER_Soldier_camo5",
	//weapons
	"LIB_MP40",
	"LIB_MP44",
	//vests
	"V_LIB_GER_VestMP40",
	"V_LIB_GER_VestSTG",
	"V_LIB_GER_VestUnterofficer",
	//helm
	"H_LIB_GER_Helmet_Glasses"
	//backpacks
	//Explosives
	//Items
	];

	Private _AUTORIFLEMAN = [
	//weapons
	"LIB_MG34",
	"LIB_MG42",
	//attachments
	//vests
	"U_LIB_GER_MG_schutze",
	//Items
	"ACE_WaterBottle"
	];

	Private _AT = [
	//launchers
	"LIB_PzFaust_60m",
	//vests
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
	"B_LIB_GER_LW_Paradrop"
	//Items
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
