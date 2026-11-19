class LPSM_NushiSporeLaunchFromStalk extends SPSM_PlayAnimBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], myFlyerPawn;

    myFlyerPawn = LPAIPawnMedFlyer(MySPPawn);
    super.SpecialMoveStarted(bForced, PrevMove);
    myFlyerPawn.Mesh.RootMotionMode = 0;
    myFlyerPawn.Mesh.RootMotionRotationMode = 0;
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, myFlyerPawn;

    super.SpecialMoveEnded(PrevMove, NextMove);
    myFlyerPawn = LPAIPawnMedFlyer(MySPPawn);
    myFlyerPawn.Mesh.RootMotionMode = 2;
    myFlyerPawn.Mesh.RootMotionRotationMode = 0;
    //return;    
}

defaultproperties
{
    TranslationExtraction=ERootBoneAxis.RBA_Translate
    RotationExtraction=ERootRotationOption.RRO_Extract
    AnimationTemplateNodeNames=/* Array type was not detected. */
}