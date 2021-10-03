[
	"SA-20",
	"ARH",
	{
		params ["_missilePos", "_targetPos", "_heading"];
		private _dist = _targetPos distance _missilePos;

		private _detonate = false;
		if(_dist <= 70) then {
			private _toTarget = _missilePos vectorFromTo _targetPos;
			private _cos = _heading vectorCos _toTarget;

			"ACE_ammoExplosionLarge" createVehicle ASLtoAGL _missilePos;
			"Karma_SA20_Proximity" createVehicle ASLtoAGL _missilePos;
			_detonate = true;

		};
		_detonate;
			
		
	},
	[
		["VLS ROTATE", 0],
		["SA-20 MID-COURSE", 0]
	],
	[99.4, 120, 10000],
	[65, 65, false, 0.5],
	[
		"ammo_Missile_s750",
		"karmakut_sa20_missile"
	],
	true
] call IADS_RegisterNewMissileClass;