class LPSM_PackHunterDie extends SPSM_PlayAnimBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], MyLPAIPawnPackHunterPawn;

    MyLPAIPawnPackHunterPawn = LPAIPawnPackHunter(MySPPawn);
    super.SpecialMoveStarted(bForced, PrevMove);
    MyLPAIPawnPackHunterPawn.Mesh.RootMotionMode = 2;
    MyLPAIPawnPackHunterPawn.Mesh.RootMotionRotationMode = 0;
    //return;    
}

defaultproperties
{
    TranslationExtraction=ERootBoneAxis.RBA_Translate
    RotationExtraction=ERootRotationOption.RRO_Extract
    BlendOutTime=-1.0000000
    bOverride=false
    AnimationTemplateNodeNames=/* Array type was not detected. */
}