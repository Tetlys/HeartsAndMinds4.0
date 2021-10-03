
/* ----------------------------------------------------------------------------
Function: btc_mil_fnc_createUnits

Description:
    Fill me when you edit me !

Parameters:
    _group - [Group]
    _pos - [Array]
    _number - [Number]
    _pos_iswater - [Boolean]
    _type_units - [Array]
    _type_divers - [Array]

Returns:

Examples:
    (begin example)
        _result = [] call btc_mil_fnc_createUnits;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_group", grpNull, [grpNull]],
    ["_pos", [0, 0, 0], [[], createHashMap]],
    ["_number", 0, [0]],
    ["_pos_iswater", false, [false]],
    ["_type_units", btc_type_units, [[]]],
    ["_type_divers", btc_type_divers, [[]]]
];

// Create Scaling Multiplier 
private _CurrentPlayers = count allPlayers;
//private _currentPlayers = west countSide allUnits;
private _PlayerScale = 0.5 + (_CurrentPlayers / 85.3);

private _numberscaled = _number * _playerScale;

for "_i" from 1 to (round _numberscaled) do {
    private _unit_type = if (_pos_iswater) then {
        selectRandom _type_divers;
    } else {
        selectRandom _type_units;
    };

    [_group, _unit_type, _pos] call btc_delay_fnc_createUnit;
};

_group
