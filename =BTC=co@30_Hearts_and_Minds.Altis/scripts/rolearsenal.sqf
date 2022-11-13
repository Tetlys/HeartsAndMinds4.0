
roleArsenal = {
	params ["_box", "_player"];


	Private _UnitRole = roleDescription _player;

	//Clear the inventory
	clearMagazineCargoGlobal _box;
	clearItemCargoGlobal _box;
	clearBackpackCargoGlobal _box;
	clearWeaponCargoGlobal _box;

	//Empty array of gear to add to the arsenal per player.
	Private _GearToAdd = [];

	//Empty Role Array to add to the player
	_Role = [];
	
	if ((_UnitRole == )
	or (_UnitRole == )) then
	{_Role = "A"};

	//Define the gear for each Role
	Private _DefaultGear = [
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
	];

	Private _ADMIN = [
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
	];

	switch (_Role) do {
	  case "ADMIN": {
	    _GearToAdd = _DefaultGear + _ADMIN;
	  };
	  default {
	    _GearToAdd = _DefaultGear + ["ACE_Banana"];
	  };
	};

	[_box, false] call ace_arsenal_fnc_removeBox;
	[_box, _GearToAdd, false] call ace_arsenal_fnc_initBox;
}
