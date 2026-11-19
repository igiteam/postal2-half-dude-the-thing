class LPSM_SpitterFailedChargeStunOut extends LPSM_SpitterStunBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super(LPSM_SpitterAttackMoves).SpecialMoveStarted(bForced, PrevMove);
    MySPPawn.ZeroRotationRate();
    MySPPawn.Mesh.RootMotionMode = 3;
    MySPPawn.Mesh.RootMotionRotationMode = 0;
    // End:0xD8
    if(MySpitterPawn != none)
    {
        MySpitterPawn.SetGrabPointEnabledByIndex(0, true);
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    // End:0x30
    if(MySpitterPawn != none)
    {
        MySpitterPawn.SetGrabPointEnabledByIndex(0, false);
    }
    super(LPSM_SpitterAttackMoves).SpecialMoveEnded(PrevMove, NextMove);
    MySPPawn.ResetRotationRate();
    MySPPawn.Mesh.RootMotionMode = 2;
    MySPPawn.Mesh.RootMotionRotationMode = 0;
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}