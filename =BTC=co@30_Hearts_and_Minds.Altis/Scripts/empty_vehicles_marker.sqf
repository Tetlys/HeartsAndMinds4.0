private [ "_vehmarkers", "_markedveh", "_cfg", "_vehtomark", "_marker" ];

_vehmarkers = [];
_markedveh = [];
_cfg = configFile >> "cfgVehicles";
_vehtomark = [];

_vehtomark = ["LIB_Kfz1_MG42_camo","LIB_OpelBlitz_Ambulance","LIB_OpelBlitz_Ammo","LIB_OpelBlitz_Fuel","LIB_OpelBlitz_Open_Y_Camo","LIB_OpelBlitz_Parm","LIB_PzKpfwIV_H_tarn51d","LIB_PzKpfwVI_B_tarn51d","LIB_PzKpfwVI_E_tarn51d","LIB_SdKfz_7","LIB_SdKfz_7_Ammo","LIB_SdKfz_7_AA","LIB_SdKfz251_FFV","LIB_Pak40","LIB_Nebelwerfer41","LIB_Ju87","LIB_FW190F8_3"];
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
