[
	"SA-24",
	"IR",
	{
		params ["_missilePos", "_targetPos", "_heading"];
		private _dist = _targetPos distance _missilePos;

		private _detonate = false;
		if(_dist <= 30) then {
			private _toTarget = _missilePos vectorFromTo _targetPos;
			private _cos = _heading vectorCos _toTarget;
			// 20 degrees
			if(_cos >= 0.93969262078) then {
				"ACE_ammoExplosionLarge" createVehicle ASLtoAGL _missilePos;
				"Karma_SA24_Proximity" createVehicle ASLtoAGL _missilePos;
				_detonate = true;
			};
			
		};
		_detonate;
	},
	[
		["APN", 0]
	],
	[99.1, 45, 10000],
	[27, 27, false, 0],
	[
		"karmakut_sa24_missile"
	]
] call IADS_RegisterNewMissileClass;