
/* ----------------------------------------------------------------------------
Function: btc_log_fnc_init

Description:
    Fill me when you edit me !

Parameters:
    _obj - [Object]

Returns:

Examples:
    (begin example)
        _result = [] call btc_log_fnc_init;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_obj", objNull, [objNull]]
];

if (btc_log_obj_created pushBackUnique _obj isEqualTo -1) exitWith {};
btc_curator addCuratorEditableObjects [[_obj], false];

if (
    _obj isKindOf "DeconShower_01_F" ||
    _obj isKindOf "DeconShower_02_F"
) then {
    btc_chem_decontaminate pushBackUnique _obj;
};

private _type = typeOf _obj;
if (
    _type in btc_log_def_loadable &&
    {getNumber (configOf _obj >> "ace_cargo_canLoad") isEqualTo 0}
) then {
    [_obj, round ((sizeOf _type)/1.3)] call ace_cargo_fnc_setSize;
};

if (
    _type in btc_log_def_can_load &&
    {getNumber (configOf _obj >> "ace_cargo_hasCargo") isEqualTo 0}
) then {
    [_obj, round ((sizeOf _type)/1.3)] call ace_cargo_fnc_setSpace;
};

if (_type == "B_Slingload_01_Cargo_F") then {[_obj, 50] call ace_cargo_fnc_setSpace;};