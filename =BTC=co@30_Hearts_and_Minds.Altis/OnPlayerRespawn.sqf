[player] remoteExec ["requestResupplyFlags", 2];


{
    private _box = _x;
    if (!isNull _box) then
    {

        [_box, player] call roleArsenal;
    };
} forEach ARSENAL_CRATES;

if (player distance (getMarkerPos "Respawn_west") >500) then{

_ActionID1 = player addAction  
    [  
    "Respawn", // title  
    {  
    params ["_target", "_caller", "_actionId", "_arguments"]; // script  
    player removeAction _actionID;
	player setPos (getMarkerPos "Respawn_west");
	},  
    nil,  // arguments  
    1.5,  // priority  
    true,  // showWindow  
    true,  // hideOnUse  
    "",   // shortcut  
    "",   // Conditions
    -1,   // radius  
    false //Allow when Uncon 
    ];

sleep 30;
player removeAction _actionID1
}


Player addEventHandler ["GetInMan", {
    params ["_unit", "_role", "_vehicle", "_turret"];
    private _ID = getPlayerUID _unit;
    if (_vehicle isKindOf "" && !(_vehicle isKindOf "Steerable_Parachute_F") && {assignedVehicleRole _unit in [['driver'], ['turret', [0]]]}) then {
        if !(_ID in PERMS) then  {["You don't have permission to operate this vehicle"] spawn BIS_fnc_guiMessage;moveOut _unit;};
    };
}];
