class LPSM_PackHunterAttackAnnounceLonger extends SPSM_PlayAnimBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], MyLPAIPawnPackHunterPawn;

    MyLPAIPawnPackHunterPawn = LPAIPawnPackHunter(MySPPawn);
    MySPPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
    MySPPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    super.SpecialMoveStarted(bForced, PrevMove);
    MyLPAIPawnPackHunterPawn.Mesh.RootMotionMode = 3;
    MyLPAIPawnPackHunterPawn.Mesh.RootMotionRotationMode = 0;
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, MyLPAIPawnPackHunterPawn;

    super.SpecialMoveEnded(PrevMove, NextMove);
    MyLPAIPawnPackHunterPawn = LPAIPawnPackHunter(MySPPawn);
    MyLPAIPawnPackHunterPawn.Mesh.RootMotionMode = 2;
    MyLPAIPawnPackHunterPawn.Mesh.RootMotionRotationMode = 0;
    //return;    
}

defaultproperties
{
    TranslationExtraction=ERootBoneAxis.RBA_Translate
    RotationExtraction=ERootRotationOption.RRO_Extract
    AnimationTemplateNodeNames=/* Array type was not detected. */
    bAllowRotationInterpolation=true
}