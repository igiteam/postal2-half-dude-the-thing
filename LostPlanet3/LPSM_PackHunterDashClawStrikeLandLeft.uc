class LPSM_PackHunterDashClawStrikeLandLeft extends LPSM_AIBasePlayFullBodyAnimSeq
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    MySPPawn.Mesh.RootMotionRotationMode = 0;
    //return;    
}

defaultproperties
{
    BlendInTime=0.1000000
    BlendOutTime=0.1000000
    AnimationTemplateNodeNames=/* Array type was not detected. */
    bAllowRotationInterpolation=true
}