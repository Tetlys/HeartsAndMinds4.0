private [ "_vehmarkers", "_markedveh", "_cfg", "_vehtomark", "_marker" ];

_vehmarkers = [];
_markedveh = [];
_cfg = configFile >> "cfgVehicles";
_vehtomark = [];

_vehtomark = ["rhsusf_m1240a1_m2_usmc_wd","rhsusf_m1240a1_mk19_usmc_wd","C_Offroad_01_F","B_T_Truck_01_flatbed_F","rhsusf_M1078A1R_SOV_M2_D_fmtv_socom","B_T_APC_Wheeled_01_cannon_F","B_T_APC_Tracked_01_CRV_F","RHS_MELB_MH6M","RHS_UH1Y","rhsusf_CH53e_USMC_cargo","rhsusf_mkvsoc","B_Boat_Transport_01_F"];

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