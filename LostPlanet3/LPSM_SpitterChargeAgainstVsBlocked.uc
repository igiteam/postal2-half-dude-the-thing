class LPSM_SpitterChargeAgainstVsBlocked extends LPSM_SpitterStunBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super(LPSM_SpitterAttackMoves).SpecialMoveStarted(bForced, PrevMove);
    MySPPawn.Mesh.RootMotionMode = 0;
    MySPPawn.Mesh.RootMotionRotationMode = 0;
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super(LPSM_SpitterAttackMoves).SpecialMoveEnded(PrevMove, NextMove);
    MySPPawn.Mesh.RootMotionMode = 2;
    MySPPawn.Mesh.RootMotionRotationMode = 0;
    //return;    
}

defaultproperties
{
    RotationExtraction=ERootRotationOption.RRO_Extract
    AnimationTemplateNodeNames=/* Array type was not detected. */
}