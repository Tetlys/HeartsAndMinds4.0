private [ "_vehmarkers", "_markedveh", "_cfg", "_vehtomark", "_marker" ];

_vehmarkers = [];
_markedveh = [];
_cfg = configFile >> "cfgVehicles";
_vehtomark = [];

_vehtomark = ["RHS_MELB_AH6M", "rhsusf_m1045_w", "rhsusf_M1078A1P2_B_M2_D_fmtv_usarmy", "rhsusf_M1078A1R_SOV_M2_D_fmtv_socom", "rhsusf_m1151_m2_v2_usarmy_d", "rhsusf_M1220_M2_usarmy_d", "rhsusf_m1a2sep1tuskiwd_usarmy", "RHS_M2A3_BUSKIII_wd", "rhsusf_M977A4_usarmy_d", "RHS_MELB_MH6M", "B_T_APC_Tracked_01_CRV_F", "RHS_UH60M_d", "RHS_UH60M_MEV_d","RHSGREF_A29B_HIDF", "RHS_C130J", "C_Plane_Civil_01_racing_F", "RHS_CH_47F_10", "B_T_VTOL_01_vehicle_F"];


// Misc variables
markers_reset = [99999,99999,0];

while { true } do {

    _markedveh = [];
    {
        if (alive _x && (typeof _x) in _vehtomark && (count (crew _x)) == 0) then {
            _markedveh pushback _x;
        };
    } foreach vehicles;

    if ( count _markedveh != count _vehmarkers ) then {
        { deleteMarkerLocal _x; } foreach _vehmarkers;
        _vehmarkers = [];

        {
            _marker = createMarkerLocal [ format [ "markedveh%1" ,_x], markers_reset ];
            _marker setMarkerColorLocal "ColorKhaki";
            _marker setMarkerTypeLocal "mil_dot";
            _marker setMarkerSizeLocal [ 0.75, 0.75 ];
            _vehmarkers pushback _marker;
        } foreach _markedveh;
    };

    {
        _marker = _vehmarkers select (_markedveh find _x);
        _marker setMarkerPosLocal getpos _x;
        _marker setMarkerTextLocal  (getText (_cfg >> typeOf _x >> "displayName"));

    } foreach _markedveh;

    sleep 15;
};