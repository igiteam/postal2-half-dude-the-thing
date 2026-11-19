class LPSM_SpitterDie extends LPSM_SpitterStunBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super(LPSM_SpitterAttackMoves).SpecialMoveStarted(bForced, PrevMove);
    MySpitterPawn.Mesh.RootMotionMode = 2;
    MySpitterPawn.Mesh.RootMotionRotationMode = 0;
    //return;    
}

defaultproperties
{
    RotationExtraction=ERootRotationOption.RRO_Extract
    BlendOutTime=-1.0000000
    bOverride=false
    AnimationTemplateNodeNames=/* Array type was not detected. */
}