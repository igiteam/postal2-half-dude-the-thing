class LPLeaderBoardRead_Playtime extends LPLeaderBoardRead;

// Export ULPLeaderBoardRead_Playtime::execFormatTimeString(FFrame&, void* const)
native function FormatTimeString()
{
    local /*0x97E50000-0x00000000*/ private @NULL Data[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];


}

function GetValueString()
{
    local /*0x97E50000-0x00000000*/ private int rowIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return FormatTimeString(Rows[rowIndex].Columns[0].StatValue);
    //return ReturnValue;    
}

defaultproperties
{
    ViewId=12
    SortColumnId=1
    ColumnIds=/* Array type was not detected. */
    ColumnMappings=/* Array type was not detected. */
    ViewName="Playtime"
}