class LPStat extends SPSerializableDynamicDataContainer;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array OnStatModifiedDelegates;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array StatDataByPeriod;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StatManager;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StatData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int StatIndex;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OnStatModified__Delegate;

// Export ULPStat::execGetStatData(FFrame&, void* const)
native final function GetStatData()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPStat::execGetStatName(FFrame&, void* const)
native final function GetStatName()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];


}

// Export ULPStat::execEvaluate(FFrame&, void* const)
native final function Evaluate()
{
    local /*0x97E50000-0x00000000*/ private byte PeriodToEval[9437185];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    2            
}

// Export ULPStat::execModifyStat(FFrame&, void* const)
native final function ModifyStat()
{
    local /*0x97E50000-0x00000000*/ private int Amount[8388609];
    local /*0x97E50000-0x00000000*/ private byte ModType[9437185];

    0                
}

// Export ULPStat::execGetMaxValue(FFrame&, void* const)
native final function GetMaxValue()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}

delegate OnStatModified()
{
    local /*0x97E50000-0x00000000*/ private @NULL Stat[8388609];
    local /*0x97E50000-0x00000000*/ private int ChangedVal[8388609];
    local /*0x97E50000-0x00000000*/ private byte ModType[8388609];

    //return;    
}

final function AddOnStatModifiedDelegate()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> OnStatModifiedDelegate[8388609];

    // End:0x36
    if(OnStatModifiedDelegates.Find(OnStatModifiedDelegate) == )
    {        
        OnStatModifiedDelegates.AddItem(OnStatModifiedDelegate);        
    }
    //return;    
}

final function ClearOnStatModifiedDelegate()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> OnStatModifiedDelegate[8388609];
    local /*0x97E50000-0x00000000*/ private int RemoveIndex;

    RemoveIndex = OnStatModifiedDelegates.Find(OnStatModifiedDelegate);    
    // End:0x48
    if(RemoveIndex != -1)
    {
        OnStatModifiedDelegates.Remove(RemoveIndex, 1);        
    }
    //return;    
}

function InitStat()
{
    local /*0x97E50000-0x00000000*/ private @NULL StatMgr[8388609];
    local /*0x97E50000-0x00000000*/ private int StatIdx[8388609];

    StatManager = StatMgr;
    StatIndex = StatIdx;
    StatDataByPeriod.Length = 3;
    GetStatData().StatName = GetDefinition().StatName;
    StatDataByPeriod[2] = GetStatData().Value;
    //return;    
}

function ResetForPeriod()
{
    local /*0x97E50000-0x00000000*/ private byte PeriodToReset[9437185];
    local /*0x97E50000-0x00000000*/ private int PeriodIndex;

    0
    PeriodIndex = 0;
    J0x11:

    // End:0x4D [Loop If]
    if(PeriodIndex <= int(PeriodToReset))
    {
        StatDataByPeriod[PeriodIndex] = 0;
        PeriodIndex++;
        // [Loop Continue]
        goto J0x11;
    }
    // End:0x82
    if(int(PeriodToReset) == int(2))
    {
        GetStatData().Value = 0;
    }
    //return;    
}

function GetDefinition()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ReturnValue[92274689];

    return StatManager.StatDefinitions[StatIndex];
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: LPStatSerializableData'Default__LPStat.LPStatSerializableData_DefObj'
    begin object name=LPStatSerializableData_DefObj class=Class'LPStatSerializableData'
    end object
    SerializableDynamicData=LPStatSerializableData_DefObj
}