class LPSM_CarrierDefaultStandingStun extends LPSM_CarrierStunHold
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    MySPPawn.ZeroRotationRate();
    MySPPawn.Mesh.RootMotionMode = 2;
    MySPPawn.Mesh.RootMotionRotationMode = 0;
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    MySPPawn.ResetRotationRate();
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}