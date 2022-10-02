private [ "_vehmarkers", "_markedveh", "_cfg", "_vehtomark", "_marker" ];

_vehmarkers = [];
_markedveh = []; 
_cfg = configFile >> "cfgVehicles";
_vehtomark = [];

_vehtomark = [
"UK3CB_BAF_Apache_AH1_Generic_Arctic",
"UK3CB_BAF_Coyote_Logistics_L111A1_W_Arctic",
"UK3CB_BAF_Coyote_Logistics_L111A1_W_Arctic",
"UK3CB_BAF_Coyote_Passenger_L134A1_W_Arctic",
"UK3CB_BAF_Coyote_Passenger_L134A1_W_Arctic",
"UK3CB_BAF_Coyote_Passenger_L111A1_W_Arctic",
"UK3CB_BAF_Coyote_Passenger_L111A1_W_Arctic",
"B_Truck_01_flatbed_F",
"B_Truck_01_flatbed_F",
"UK3CB_BAF_Jackal2_L2A1_W_Arctic",
"UK3CB_BAF_Jackal2_L2A1_W_Arctic",
"UK3CB_BAF_Jackal2_L2A1_W_Arctic",
"UK3CB_BAF_Jackal2_L2A1_W_Arctic",
"UK3CB_BAF_LandRover_Amb_FFR_Green_A_DPMW",
"UK3CB_BAF_LandRover_Hard_FFR_Arctic_A_Arctic",
"UK3CB_BAF_LandRover_Hard_FFR_Arctic_A_Arctic",
"UK3CB_BAF_LandRover_Soft_FFR_Arctic_A_Arctic",
"UK3CB_BAF_LandRover_WMIK_HMG_FFR_Green_B_DPMW",
"UK3CB_BAF_LandRover_WMIK_HMG_FFR_Green_B_DPMW",
"UK3CB_BAF_LandRover_WMIK_Milan_FFR_Green_B_DPMW",
"UK3CB_BAF_LandRover_WMIK_Milan_FFR_Green_B_DPMW",
"UK3CB_BAF_MAN_HX58_Cargo_Green_A_Arctic",
"UK3CB_BAF_MAN_HX58_Cargo_Green_A_Arctic",
"UK3CB_BAF_MAN_HX60_Fuel_Green_Arctic",
"UK3CB_BAF_MAN_HX60_Repair_Green_Arctic",
"UK3CB_BAF_MAN_HX60_Transport_Green_Arctic",
"UK3CB_BAF_MAN_HX60_Transport_Green_Arctic",
"UK3CB_BAF_MAN_HX60_Transport_Green_Arctic",
"B_T_APC_Tracked_01_CRV_F",
"UK3CB_BAF_Wildcat_AH1_8_Generic_DDPM",
"UK3CB_BAF_Wildcat_AH1_TRN_8A_Arctic",
"UK3CB_BAF_Wildcat_AH1_TRN_8A_Arctic",
"UK3CB_BAF_Merlin_HC4_Cargo_Arctic",
"UK3CB_BAF_Merlin_HC4_18_GPMG_Arctic"
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
