class LPAICmd_DefenderHiveLurk extends LPAICmd_StationaryLaunchEngagement within LPAIControllerDefenderHive;

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

event NotifyOfCoreHit()
{
    local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

event NotifyOfNonCoreHit()
{
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function MinSeperationToEnemyAllowedForLaunch()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.DefenderHivePawn.TuneDataDefenderHive.MinSeperationRequiredToMaintainLoiterPof.GetValue();
    //return ReturnValue;    
}

function MaxSeperationToEnemyAllowedForLaunch()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.DefenderHivePawn.TuneDataDefenderHive.MaxSeperationRequiredToMaintainLoiterPof.GetValue();
    //return ReturnValue;    
}

function ShouldTryToLaunch()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float timeSinceLastLaunch;

    // End:0x4E
    if(Outer.DefenderHivePawn.TuneDataDefenderHive.bNotAllowedToLaunchDefendersAtAll)
    {
        return false;
    }
    timeSinceLastLaunch = Outer.WorldInfo.TimeSeconds - Outer.LastTimeLaunchedDefender;
    // End:0xEE
    if(timeSinceLastLaunch >= Outer.DefenderHivePawn.DelayAfterLastLaunchToAllowAnotherLaunch)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}
