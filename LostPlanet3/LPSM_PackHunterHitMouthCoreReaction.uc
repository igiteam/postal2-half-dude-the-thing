class LPSM_PackHunterHitMouthCoreReaction extends SPSM_PlayAnimBase
    config(Game);

function ShouldReplicate()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

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
    bOverride=false
    AnimationTemplateNodeNames=/* Array type was not detected. */
}