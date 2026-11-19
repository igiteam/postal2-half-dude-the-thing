class LPSM_SnowCrabDefaultStandingStun extends LPSM_SnowCrabGrenadeReaction
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    MySPPawn.ZeroRotationRate();
    MySPPawn.Mesh.RootMotionMode = 2;
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
    super(LPSM_SnowCrabStunBase).SpecialMoveEnded(PrevMove, NextMove);
    MySPPawn.ResetRotationRate();
    //return;    
}

defaultproperties
{
    bShouldLoop=true
    AnimationTemplateNodeNames=/* Array type was not detected. */
}