[
	"SA-6",
	"ARH", // TODO: SA-6s aren't actually ARH but SARH.
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
		["APN", 0]
	],
	[99, 60, 10000],
	[22, 22, false, 0.1],
	[
		"M_9M38_AA",
		"M_9M317_AA",
		"karmakut_sa6_missile"
	]
] call IADS_RegisterNewMissileClass;