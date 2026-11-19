class LPSM_VsLarocheBackwardsSeperation extends SPSM_PlayAnimBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], LarochePawn;

    MySPPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
    MySPPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    super.SpecialMoveStarted(bForced, PrevMove);
    LarochePawn = LPAIPawnVsLaroche(MySPPawn);
    // End:0xDD
    if(LarochePawn != none)
    {
        PlayBackRate = LarochePawn.TuneDataVsLaroche.PlayRateForSeperationAfterStrikesAnimation;
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    MySPPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
    MySPPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    super.SpecialMoveEnded(PrevMove, NextMove);
    // End:0x12B
    if(int(MySPPawn.Mesh.RootMotionMode) != int(2))
    {
        // End:0x12B
        if(bManageRootMotionMode)
        {
            MySPPawn.Mesh.RootMotionMode = 2;
            MySPPawn.Mesh.RootMotionRotationMode = 0;
        }
    }
    //return;    
}

defaultproperties
{
    TranslationExtraction=ERootBoneAxis.RBA_Translate
    RotationExtraction=ERootRotationOption.RRO_Extract
    bManageRootMotionMode=true
    AnimationTemplateNodeNames=/* Array type was not detected. */
}