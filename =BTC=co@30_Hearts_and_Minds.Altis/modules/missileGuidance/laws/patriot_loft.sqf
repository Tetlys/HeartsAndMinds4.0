[
	"PATRIOT LOFT",
	{
		params ["_deltaTime", "_targetState", "_guidanceState", "_missileID", "_flightParams", "_timeElapsed", "_missile"];
		
		_guidanceState params ["_yaw", "_pitch", "_oldMissilePos", "_missilePos", "_missileVelocity", "_missileHeading"];
		
		_targetState params ["_lastVelocity", "_oldTargetPos", "_target", "_lastAcceleration", "_targetPos", "_targetVelocity"];

		_flightParams params ["_pitchRate", "_yawRate", "_isBangBangGuidance", "_stabilityCoefficient"];
		
		
		// Depending on range, less aggressive angle

		private _range = (_targetPos) distance (_missilePos);

		private _angle = 70;

		_angle = _angle - (_range / 500);

		_angle = 10 max _angle;

		private _baseLoft = "ZEMG LOFT" call IADS_GetGuidanceLaw;
		private _result = [_deltaTime, _targetState, _guidanceState, _missileID, _flightParams, _timeElapsed, _missile, _angle, 4000, 8] call _baseLoft;
		_result set [2, format["%1\nDesired Loft Angle: %2", _result#2, _angle]];

		_result
	}
] call IADS_RegisterNewGuidanceLaw;