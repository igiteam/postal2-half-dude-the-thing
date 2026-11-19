class LPSM_ForkArmGrabVictim_Release extends LPSM_ForkArmGrabVictim_Base
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function StartInteraction()
{
    local /*0x97E50000-0x00000000*/ private @NULL CrabPawn;

    super(SPSM_LeaderFollowerBase).StartInteraction();
    CrabPawn = LPAIPawnBaseSnowCrab(MySPPawn);
    // End:0x136
    if(((CrabPawn != none) && CrabPawn.TuneDataIceCrab.TimeAfterVsReleaseStartsToKillSpMove_Tunable.GetValue() > 0.0000000) && int(CrabPawn.WorldInfo.NetMode) != int(NM_Client))
    {
        CrabPawn.SetTimer(CrabPawn.TuneDataIceCrab.TimeAfterVsReleaseStartsToKillSpMove_Tunable.GetValue(), true, 'StopTheReleaseToKillVs');
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, AICtrl, oldLeaderPawn;

    oldLeaderPawn = LeaderPawn;
    super.SpecialMoveEnded(PrevMove, NextMove);
    // End:0xA8
    if(MySPPawn != none)
    {
        AICtrl = LPAIController(MySPPawn.Controller);
        // End:0xA8
        if(AICtrl != none)
        {
            AICtrl.NotifyJustReleasedFromGrapple(self, oldLeaderPawn, false);
        }
    }
    //return;    
}

function EndAnimationFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    super(SPSM_FollowerPawnBase).EndAnimationFinished(Node, InUserData, bInterrupted);
    //return;    
}

defaultproperties
{
    bCanHandlePawnNotificationOfAbruptGrabRelease=true
}