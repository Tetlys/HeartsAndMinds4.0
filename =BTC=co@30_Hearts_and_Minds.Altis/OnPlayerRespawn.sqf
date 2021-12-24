[player] remoteExec ["requestResupplyFlags", 2];

// Loop through all arsenals, and init role restricted arsenal.
// This fixes a bug where when a player joins, 
// they don't have their description or some shit like that.
{
    private _box = _x;
    if (!isNull _box) then 
    {
        //KARMA_ARSENAL_CRATES deleteAt (KARMA_ARSENAL_CRATES find _x);
        [_box, player] call roleArsenal;
    };
} forEach KARMA_ARSENAL_CRATES;



Player addEventHandler ["GetInMan", {
    params ["_unit", "_role", "_vehicle", "_turret"];
    private _ID = getPlayerUID _unit;
    if (_vehicle isKindOf "" && !(_vehicle isKindOf "Steerable_Parachute_F") && {assignedVehicleRole _unit in [['driver'], ['turret', [0]]]}) then {
        if !(_ID in PERMS) then  {["You don't have permission to operate this vehicle"] spawn BIS_fnc_guiMessage;moveOut _unit;};
    };
}];


/*
To create a custom permission, choose or create a UID list from the permissions UID variables above,
then use the bellow code to add a new section to the "GetInMan" Event handler:
    if (_vehicle isKindOf "VEHICLECLASSNAMEHERE" && {assignedVehicleRole _unit in [ROLESFROMABOVEDEBUGHERE]}) then {
        if !(_ID in PERMISSIONLISTHERE) then  {["KICKMESSAGEHERE"] spawn BIS_fnc_guiMessage;moveOut _unit;};
    };
Use :
_RoleArray = assignedVehicleRole player;
hint format ["%1",_RoleArray]
In debug to find the slot for assignedVehicleRole
*/