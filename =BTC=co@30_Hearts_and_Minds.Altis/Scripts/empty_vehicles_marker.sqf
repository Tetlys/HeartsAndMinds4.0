private [ "_vehmarkers", "_markedveh", "_cfg", "_vehtomark", "_marker" ];

_vehmarkers = [];
_markedveh = [];
_cfg = configFile >> "cfgVehicles";
_vehtomark = [];

_vehtomark = ["B_APC_Tracked_01_CRV_F", "RHS_UH60M_d", "RHS_MELB_AH6M", "rhsusf_m1025_d_m2", "rhsusf_m1045_d", "rhsusf_m113d_usarmy_supply", "rhsusf_m113d_usarmy_medical", "rhsusf_m1165a1_gmv_m2_m240_socom_d", "rhsusf_M977A4_usarmy_d", "rhsusf_M977A4_BKIT_M2_usarmy_d", "RHS_MELB_MH6M"];
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
