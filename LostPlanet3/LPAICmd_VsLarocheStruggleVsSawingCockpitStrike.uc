class LPAICmd_VsLarocheStruggleVsSawingCockpitStrike extends LPAICmd_VsLarocheStruggleVsStrikeBase within LPAIControllerVsLaroche;

function Pushed()
{
    super.Pushed();
    Outer.VsLarochePawn.StartSawRunning();
    //return;    
}

function Popped()
{
    Outer.VsLarochePawn.CurrentPawnToApplyStruggleModeDamageTo = none;
    Outer.VsLarochePawn.StopSawRunning();
    Outer.VsLarochePawn.NotifyStoppedSawingTheCockpit();
    // End:0x194
    if(!Outer.bPostFirstLaRocheAttackDialogPlayed)
    {
        Outer.HandleBossFightPhaseEventMessage(EnemyForStrike, 3);
        Outer.bPostFirstLaRocheAttackDialogPlayed = true;
        Outer.TimeForNextNotifyRightShoulderShieldNotDestroyedYetEvent = Outer.WorldInfo.TimeSeconds + Outer.VsLarochePawn.GetTimeBetweenFiringDialogForNotifyRightShoulderShieldNotDestroyedYetEvent();
    }
    super.Popped();
    //return;    
}

function SetDesiredEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];

    super(LPAICmd_Strike).SetDesiredEnemy(InEnemy);
    Outer.VsLarochePawn.CurrentPawnToApplyStruggleModeDamageTo = InEnemy;
    //return;    
}

function GetStruggleSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_VsPlayerVsLarocheStruggleVsSawingCockpitOnRightArmGrabStrike';
    //return ReturnValue;    
}
