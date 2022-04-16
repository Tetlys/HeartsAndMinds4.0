[player] remoteExec ["requestResupplyFlags", 2];


{
    private _box = _x;
    if (!isNull _box) then
    {

        [_box, player] call roleArsenal;
    };
} forEach ARSENAL_CRATES;



Player addEventHandler ["GetInMan", {
    params ["_unit", "_role", "_vehicle", "_turret"];
    private _ID = getPlayerUID _unit;
    if (_vehicle isKindOf "" && !(_vehicle isKindOf "Steerable_Parachute_F") && {assignedVehicleRole _unit in [['driver'], ['turret', [0]]]}) then {
        if !(_ID in PERMS) then  {["You don't have permission to operate this vehicle"] spawn BIS_fnc_guiMessage;moveOut _unit;};
    };
}];
