class LPMetagameData extends LPUnlockable;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MetagameData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MetagameManager;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MetagameIndex;

// Export ULPMetagameData::execIsTracked(FFrame&, void* const)
native final simulated function IsTracked()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPMetagameData::execGetMetagameData(FFrame&, void* const)
native final simulated function GetMetagameData()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

simulated function OnStatModified()
{
    local /*0x97E50000-0x00000000*/ private @NULL Stat[8388609];
    local /*0x97E50000-0x00000000*/ private int ChangedVal[8388609];
    local /*0x97E50000-0x00000000*/ private byte ModType[8388609];
    local /*0x97E50000-0x00000000*/ private int PrevVal, CurVal;
    local /*0x97E50000-0x00000000*/ private @NULL Cell;

    // End:0xF6
    if(int(ModType) == int(0))
    {
        CurVal = Stat.Evaluate(2);
        PrevVal = CurVal - ChangedVal;
        Cell = GetMetagameCell();
        // End:0xF6
        if((ChangedVal > 0) && float(PrevVal) < Cell.StatAmount)
        {
            MetagameManager.MyPC.ShowMetagameTracker(Cell, float(CurVal));
        }
    }
    //return;    
}

simulated function GetMetagameCell()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return MetagameManager.GetCellByIndex(MetagameIndex);
    //return ReturnValue;    
}

simulated function SetTrackingStatus()
{
    local /*0x97E50000-0x00000000*/ private bool bTrack[8388609];

    GetMetagameData().bTracked = bTrack;
    //return;    
}

defaultproperties
{
    // Reference: LPMetagameSerializableData'Default__LPMetagameData.LPMetagameSerializableData_DefObj'
    begin object name=LPMetagameSerializableData_DefObj class=Class'LPMetagameSerializableData'
    end object
    SerializableDynamicData=LPMetagameSerializableData_DefObj
}