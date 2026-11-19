class LPLeaderBoardRead extends OnlineStatsRead
    abstract;

// Export ULPLeaderBoardRead::execSettingsDataToString(FFrame&, void* const)
native function SettingsDataToString()
{
    local /*0x97E50000-0x00000000*/ private @NULL Data[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];


}

function GetValueString()
{
    local /*0x97E50000-0x00000000*/ private int rowIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return SettingsDataToString(Rows[rowIndex].Columns[0].StatValue);
    //return ReturnValue;    
}
