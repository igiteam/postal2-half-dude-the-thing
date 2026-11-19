class LPSM_PlayerZiplineRelease extends LPSM_PlayerZiplineBase
    config(Game);

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, PlayerCtrl;

    super.SpecialMoveEnded(PrevMove, NextMove);
    PlayerCtrl = LPPlayerController(MySPPawn.Controller);
    // End:0xE3
    if((PlayerCtrl != none) && !PlayerCtrl.GamePlayEndedState())
    {
        MySPPawn.SetPhysics(2);
        LPPlayerController(MySPPawn.Controller).MPStartState('PlayerFalling');
    }
    //return;    
}

defaultproperties
{
    bManageRootMotionMode=true
    AnimationTemplateNodeNames=/* Array type was not detected. */
}