private [ "_vehmarkers", "_markedveh", "_cfg", "_vehtomark", "_marker" ];

_vehmarkers = [];
_markedveh = []; 
_cfg = configFile >> "cfgVehicles";
_vehtomark = [];

_vehtomark = [
// EDEN - CONFIG - VEHICLES TO BE MARKED
"B_APC_Wheeled_01_cannon_F", 
"rhsusf_m1043_w_s_mk19", 
"rhsusf_m1045_w", 
"rhsusf_M1083A1P2_WD_fmtv_usarmy", 
"rhsusf_M1232_MC_M2_usmc_d", 
"rhsusf_m1240a1_m2_usmc_wd", 
"rhsusf_m1a1hc_wd", 
"rhsusf_M977A4_usarmy_d", 
"rhsusf_M977A4_AMMO_usarmy_d", 
"rhsusf_M977A4_REPAIR_usarmy_d", 
"rhsusf_M977A4_BKIT_M2_usarmy_d", 
"rhsusf_M978A4_BKIT_usarmy_d", 
"rhsusf_mkvsoc", 
"rhsusf_mrzr4_d", 
"B_APC_Tracked_01_CRV_F", 
"rhsgref_hidf_canoe", 
"B_Quadbike_01_F", 
"rhsgref_hidf_rhib", 
"B_SDV_01_F", 
"B_T_Boat_Armed_01_minigun_F", 
"RHS_UH1Y_UNARMED", 
"rhsusf_M1230a1_usarmy_wd", 
"rhsusf_CH53E_USMC_GAU21", 
"rhsusf_CH53e_USMC_cargo"
];


// Misc variables
markers_reset = [99999,99999,0];

while { true } do {

    _markedveh = [];
    {
        if (alive _x && (typeof _x) in _vehtomark && (_x distance2d btc_gear_object) > 500 && (count (crew _x)) == 0) then {
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