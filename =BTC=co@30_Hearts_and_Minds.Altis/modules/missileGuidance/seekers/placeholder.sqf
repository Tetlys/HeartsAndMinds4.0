// TODO: This will be the active radar homing seeker head with data-link capability for mid-course guidance.
// Means missile goes further away than normal launch range
[
	"PLACEHOLDER",
	{
		params ["_missile", "_seekerPerformance", "_targetState", "_guidanceState", "_launchVehicle"];

		_guidanceState params ["_yaw", "_pitch", "_lastPosition", "_missilePos", "_missileVelocity", "_missileHeading", ["_nextSeekerTick", 0], ["_lastFlares", []]];

		_targetState params ["_lastVelocity", "_lastPos", "_target", "_lastAcceleration", "_targetPos", "_targetVelocity"];

		_seekerPerformance params [["_cmResistance", 98], ["_gimbalLimit", 45], ["_newAcquireRange", 10000]];


		if(diag_tickTime < _nextSeekerTick) exitWith {
			if(IADS_SAM_DEBUG == true) then {
				{

					if((isNull _x)) then {
						continue;
					};
					private _pos = ASLToAGL getPosASLVisual _x;
					private _color = [0,0,1,1];
					

					if(_target isEqualTo _x) then {

						_color = [1,0,0,1];
					};

					drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", _color, _pos, 0.75, 0.75, 0, "VISUAL", 1, 0.025, "TahomaB"];
				} forEach (_lastFlares + [_target]);
			};
		};

		_guidanceState set [6, diag_tickTime + 0.5];


		private _occluded = [_missile, _target] call IADS_TargetOccluded;
		private _newTargetsNearLauncher = [];

		if(_occluded && (alive _launchVehicle)) then {
			
			_target = objNull;

			_newTargetsNearLauncher = _missile nearEntities ["Air", 8000];

			_newTargetsNearLauncher = _newTargetsNearLauncher select {

				private _parachute = typeOf _x;

				if(((toLower _parachute) find "parachute") > -1) then {
					continue;
				};
				
				private _distToLaunchVehicle = _x distance2D _launchVehicle;
				(!([_missile, _x] call IADS_TargetOccluded) && [_missile, _x, _gimbalLimit] call IADS_WithinGimbalLimit && _distToLaunchVehicle < 10000 && (count (crew _x) > 0) && ([side group _launchVehicle, side group _x] call BIS_fnc_sideIsEnemy))
			};


			private _closest = 8000;

			{
				private _dist = _x distance _missile;

				if(_dist < _closest) then {
					_closest = _dist;
					_target = _x;
				};
			} forEach _newTargetsNearLauncher;
			


		};
		_guidanceState set [7, _newTargetsNearLauncher];

		_target setVariable ["RMissileTargetSet", CBA_missionTime, true];
		
		_missile setMissileTarget _target;
		_target
	}
] call IADS_RegisterNewSeeker;