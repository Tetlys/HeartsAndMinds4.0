
/* ----------------------------------------------------------------------------
Function: btc_slot_fnc_serializeState

Description:
    Serialize player slot.

Parameters:
    _unit - Unit. [Object]

Returns:

Examples:
    (begin example)
        [allPlayers#0] call btc_slot_fnc_serializeState;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_unit", objNull, [objNull]]
];

if (
    isNil {_unit getVariable "btc_slot_name"}
) exitWith {};

private _loadout = getUnitLoadout _unit;
if (["acre_api"] call ace_common_fnc_isModLoaded) then {
    _loadout = [_loadout] call acre_api_fnc_filterUnitLoadout;
};

// Add earplugs to uniform if has them plugged in (temporary until Variables support)
if (_unit call ace_hearing_fnc_hasEarPlugsIn && {!((_loadout select 3) isEqualTo [])}) then {
    ((_loadout select 3) select 1) pushBack ["ACE_EarPlugs", 1];
};

private _data = [
    getPosASL _unit,
    getDir _unit,
    _loadout,
    getForcedFlagTexture _unit,
    _unit in btc_chem_contaminated,
    [_unit] call ace_medical_fnc_serializeState,
    vehicle _unit,
    [
        _unit getVariable ["acex_field_rations_thirst", 0],
        _unit getVariable ["acex_field_rations_hunger", 0]
    ]
];

if (btc_debug || btc_debug_log) then {
    [format ["%1", name _unit], __FILE__, [btc_debug, btc_debug_log, btc_debug]] call btc_debug_fnc_message;
    [format ["%1", _data], __FILE__, [false, btc_debug_log, false]] call btc_debug_fnc_message;
};

btc_slots_serialized set [_unit getVariable ["btc_slot_name", [0, 0, 0]], _data];