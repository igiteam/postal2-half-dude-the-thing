class LPSM_SnowCrabFailedVsChargeStun extends LPSM_SnowCrabStunBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    MySPPawn.ZeroRotationRate();
    MySPPawn.Mesh.RootMotionMode = 3;
    MySPPawn.Mesh.RootMotionRotationMode = 0;
    // End:0xD7
    if(CrabPawn != none)
    {
        CrabPawn.SetStunnedGrabPointsEnabled(true);
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    // End:0x2F
    if(CrabPawn != none)
    {
        CrabPawn.SetStunnedGrabPointsEnabled(false);
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
    MySPPawn.ResetRotationRate();
    MySPPawn.Mesh.RootMotionMode = 2;
    MySPPawn.Mesh.RootMotionRotationMode = 0;
    //return;    
}

defaultproperties
{
    TranslationExtraction=ERootBoneAxis.RBA_Translate
    bShouldLoop=true
    AnimationTemplateNodeNames=/* Array type was not detected. */
}