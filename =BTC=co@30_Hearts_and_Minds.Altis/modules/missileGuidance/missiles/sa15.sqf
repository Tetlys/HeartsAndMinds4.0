[
	"SA-15",
	"ARH",
	{
		params ["_missilePos", "_targetPos", "_heading"];
		private _dist = _targetPos distance _missilePos;

		private _detonate = false;
		if(_dist <= 40) then {
			private _toTarget = _missilePos vectorFromTo _targetPos;
			private _cos = _heading vectorCos _toTarget;

			"ACE_ammoExplosionLarge" createVehicle ASLtoAGL _missilePos;
			"Karma_SA20_Proximity" createVehicle ASLtoAGL _missilePos;
			_detonate = true;

		};
		_detonate;
	},
	[
		["SA-15 VLS", 0],
		["SA-20 MID-COURSE", 0]
	],
	[99.2, 120, 10000],
	[55, 55, false, 0.25],
	[
		"M_9M332_AA",
		"karmakut_sa15_missile"
	],
	true
] call IADS_RegisterNewMissileClass;