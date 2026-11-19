class LPAICmd_VsLarocheGrabStrikeVsRightArm extends LPAICmd_VsLarocheGrabStrikeBase within LPAIControllerVsLaroche;

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

function StartPostGrabMiss()
{
    super.StartPostGrabMiss();
    // End:0x101
    if(!Outer.bPostFirstLaRocheAttackDialogPlayed)
    {
        Outer.HandleBossFightPhaseEventMessage(EnemyForStrike, 3);
        Outer.bPostFirstLaRocheAttackDialogPlayed = true;
        Outer.TimeForNextNotifyRightShoulderShieldNotDestroyedYetEvent = Outer.WorldInfo.TimeSeconds + Outer.VsLarochePawn.GetTimeBetweenFiringDialogForNotifyRightShoulderShieldNotDestroyedYetEvent();
    }
    //return;    
}

function GetMaxGrabTimeAginstThisTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL TargetOfSawing[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.VsLarochePawn.TuneDataVsLaroche.MaxGrabingUrRightArmTime.GetValue();
    //return ReturnValue;    
}

function StartPostGrabStruggleMode()
{
    super.StartPostGrabStruggleMode();
    // End:0x61
    if(int(Outer.CurrentLaRocheStruggleModeAttempting) == int(3))
    {
        Outer.CmdStruggleVsKnockOutHitsOnUrStrike(EnemyForStrike,, 1);        
    }
    else
    {
        Outer.CmdStruggleVsSawingCockpitStrike(EnemyForStrike,, 1);
    }
    //return;    
}

defaultproperties
{
    bInterruptible=false
}