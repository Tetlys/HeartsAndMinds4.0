[
	"Tamir",
	"PLACEHOLDER",
	{
		params ["_missilePos", "_targetPos", "_heading"];
		private _dist = _targetPos distance _missilePos;

		private _detonate = false;
		if(_dist <= 10) then {
			private _toTarget = _missilePos vectorFromTo _targetPos;
			private _cos = _heading vectorCos _toTarget;

			"ACE_ammoExplosionLarge" createVehicle ASLtoAGL _missilePos;
			"Karma_Tamir_Proximity" createVehicle ASLtoAGL _missilePos;
			_detonate = true;

		};
		_detonate;
	},
	[
		["ZEMG", 0]
	],
	[99, 80, 10000],
	[25, 25, false, 0.1],
	[
		"karmakut_tamir_missile"
	],
	false
] call IADS_RegisterNewMissileClass;