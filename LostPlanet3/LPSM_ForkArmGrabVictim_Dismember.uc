class LPSM_ForkArmGrabVictim_Dismember extends LPSM_ForkArmGrabVictim_Base
    config(Game);

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

defaultproperties
{
    bCanHandlePawnNotificationOfAbruptGrabRelease=true
}