// Disable ITC Land
// Fired code etc from ITC Land however uses definition here because too lazy to figure out config based.
ITC_LAND_CIWS = false;

IADS_OrdinanceInterceptables = [
	"Sh_155mm_AMOS",
    "Sh_82mm_AMOS_guided",
	"Sh_82mm_AMOS",
    "Missile_AGM_02_F",
    "LaserBombCore",
    "BombCore",
    "itc_land_230mm_he",
    "Missile_AGM_01_F",
    "ammo_Missile_AntiRadiationBase",
    "ammo_Missile_CruiseBase",
    "ammo_Bomb_SDB",
	"R_230mm_HE",
	"Karmakut_AGM88C_HARM"
];

IADS_OrdinanceClasses = createHashMapFromArray [
	[
		"karmakut_missile_target",
		[
			"Missile_AGM_02_F",
			"Missile_AGM_01_F",
			"ammo_Missile_AntiRadiationBase",
			"ammo_Missile_CruiseBase",
			"Karmakut_AGM88C_HARM"
		]
	],
	[
		"karmakut_rocket_target",
		[
			"R_230mm_HE",
			"itc_land_230mm_he"
		]
	]
];


IADS_IsOrdinance = {
	params ["_type"];

	((_type find "missile_target" > -1) || (_type find "shell_target" > -1) || (_type find "rocket_target" > -1))
};

IADS_IsArtilleryOrdinance = {
	params ["_type"];

	((_type find "shell_target" > -1) || (_type find "rocket_target" > -1))
};

IADS_OrdinanceTargetCreate = {
	[
		{
			params ["", "", "", "", "_ammo", "", "_projectile", "_gunner"];
			private _desiredClass = "";

			{

				if(_desiredClass != "") exitWith {};
				private _class = _x;
				private _ammoClasses = _y;

				{
					if(_ammo isKindOf [_x, configFile >> "cfgAmmo"]) exitWith {
						_desiredClass = _class;
					};
				} forEach _ammoClasses;
			} forEach IADS_OrdinanceClasses;
			private _initialClass = if(_desiredClass != "") then [{_desiredClass},{"karmakut_shell_target"}];
			
			private _class = if((side group _gunner) == west) then [{_initialClass + "_b"},{_initialClass + "_o"}];
			_class = if((side group _gunner) == resistance) then [{_initialClass + "_i"},{_class}];
			_target = _class createVehicle [0,0,1000];

			_target setVariable ["underlyingProjectileType", _ammo, true];
			_target setDir (getDirVisual _projectile);
			_target setPos (_projectile modelToWorld [0,-5,0]);
			_target setVelocity (velocity _projectile);
			_target setMass 0;
			_target setobjecttexture [0,""];
			createVehicleCrew _target;
			driver _target disableAI "ALL";
			gunner _target disableAI "ALL";
			_target deleteVehicleCrew (gunner _target);
			[{
				(_this select 0) params ["_projectile", "_target"];
				_canIntercept = (getPosATL _projectile # 2 > 30);
				_descending = (velocity _projectile # 2 < 0);
				blufor ReportRemoteTarget [_target, 10];
				east ReportRemoteTarget [_target, 10];
				resistance ReportRemoteTarget [_target, 10];
				if (!alive _projectile || (!alive _target && _canIntercept)) exitWith {
					deleteVehicle _projectile;
					deleteVehicle _target;
					[_this select 1] call CBA_fnc_removePerFrameHandler;
				};
				if(!_canIntercept && alive _target && _descending) then {
					deleteVehicle _target;
				} else {
					_target setDir (getDirVisual _projectile);
					_target setPos (_projectile modelToWorld [1,-5,1]);
					_target setVelocity (velocity _projectile);
				};
			}, 0, [_projectile, _target]] call CBA_fnc_addPerFrameHandler;
		},
		_this,
		1
	] call CBA_fnc_waitAndExecute;
	

};

IADS_OrdinanceFired = {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];

	if(!local _vehicle) exitWith {};
	private _interceptable = false;
	{
		if(_ammo isKindOf [_x, configFile >> "cfgAmmo"]) exitWith { _interceptable = true; };
	} forEach IADS_OrdinanceInterceptables;


	if(!_interceptable) exitWith {};

	_this call IADS_OrdinanceTargetCreate;
};

