private [ "_vehmarkers", "_markedveh", "_cfg", "_vehtomark", "_marker" ];

_vehmarkers = [];
_markedveh = [];
_cfg = configFile >> "cfgVehicles";
_vehtomark = [];

_vehtomark = [
"UK3CB_BAF_LandRover_Panama_Green_A_DPMW",
"UK3CB_BAF_FV432_Mk3_GPMG_Green_DPMW",
"UK3CB_BAF_Warrior_A3_W_Camo_MTP",
"B_Truck_01_flatbed_F",
"UK3CB_BAF_Husky_Logistics_GMG_Green_DPMW",
"UK3CB_BAF_Husky_Passenger_GPMG_Green_DPMW",
"UK3CB_BAF_Husky_Passenger_HMG_Green_DPMW",
"UK3CB_BAF_Jackal2_L2A1_W_DPMW",
"UK3CB_BAF_LandRover_Hard_FFR_Green_B_DPMW",
"UK3CB_BAF_LandRover_WMIK_GMG_FFR_Green_B_DPMW",
"UK3CB_BAF_LandRover_WMIK_HMG_FFR_Green_B_DPMW",
"UK3CB_BAF_LandRover_WMIK_Milan_FFR_Green_B_DPMW",
"rhsusf_M1078A1R_SOV_M2_D_fmtv_socom",
"UK3CB_BAF_MAN_HX58_Transport_Green_DPMW",
"UK3CB_BAF_Wildcat_HMA2_TRN_8A_DPMW",
"UK3CB_BAF_Merlin_HC4_18_GPMG_DPMW",
"UK3CB_BAF_Chinook_HC2_cargo_DPMW",
"B_APC_Tracked_01_CRV_F",
"I_Heli_light_03_dynamicLoadout_F"
];


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
