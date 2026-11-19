class LPUpgradeBase extends Object
    editinlinenew;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UpgradeBaseTuneData;

// Export ULPUpgradeBase::execGetTuneData(FFrame&, void* const)
native final function GetTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

event IsEnabled()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2F
    if(UpgradeBaseTuneData != none)
    {
        return UpgradeBaseTuneData.IsEnabled();
    }
    return false;
    //return ReturnValue;    
}

function PostBeginPlay()
{
    local /*0x97E50000-0x00000000*/ private @NULL InController[8388609];

    //return;    
}
