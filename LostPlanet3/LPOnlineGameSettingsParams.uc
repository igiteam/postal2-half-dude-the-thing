class LPOnlineGameSettingsParams extends Object
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string AtmosphereState;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte MatchGameDifficulty[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int RoundsToWin[1073741825];

function GetAtmosphereState()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return AtmosphereState;
    //return ReturnValue;    
}

function SetAtmosphereState()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Value[8388609];

    AtmosphereState = Value;
    //return;    
}

function GetRoundsToWin()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return RoundsToWin;
    //return ReturnValue;    
}

function SetRoundsToWin()
{
    local /*0x97E50000-0x00000000*/ private int Value[8388609];

    RoundsToWin = Value;
    //return;    
}

function GetMatchGameDifficulty()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    return MatchGameDifficulty;
    //return ReturnValue;    
}

function SetMatchGameDifficulty()
{
    local /*0x97E50000-0x00000000*/ private byte Value[8388609];

    MatchGameDifficulty = Value;
    //return;    
}
