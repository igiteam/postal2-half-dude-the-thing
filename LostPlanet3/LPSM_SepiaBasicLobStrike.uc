class LPSM_SepiaBasicLobStrike extends SPSM_PlayAnimBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], myCtrl;

    super.SpecialMoveStarted(bForced, PrevMove);
    myCtrl = SPGFCoverAIController(MySPPawn.Controller);
    // End:0x7C
    if(myCtrl != none)
    {
        myCtrl.PawnZeroVelocity();
    }
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}