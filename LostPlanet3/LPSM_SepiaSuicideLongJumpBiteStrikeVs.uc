class LPSM_SepiaSuicideLongJumpBiteStrikeVs extends LPSM_SepiaStaticStrikeBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], myAIPawn;

    myAIPawn = LPAIPawn(MySPPawn);
    super.SpecialMoveStarted(bForced, PrevMove);
    myAIPawn.Mesh.RootMotionMode = 0;
    myAIPawn.Mesh.RootMotionRotationMode = 0;
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, myAIPawn;

    super.SpecialMoveEnded(PrevMove, NextMove);
    myAIPawn = LPAIPawn(MySPPawn);
    myAIPawn.Mesh.RootMotionMode = 2;
    myAIPawn.Mesh.RootMotionRotationMode = 0;
    //return;    
}

function AnimationStartedPlaying()
{
    local /*0x97E50000-0x00000000*/ private @NULL SeqNode[8388609], ChoreographyParams, myAIPawn;

    super.AnimationStartedPlaying(SeqNode);
    myAIPawn = LPAIPawn(MySPPawn);
    // End:0x28E
    if((myAIPawn != none) && myAIPawn.SpecialMoveState.CurSMInfo.InteractionActor != none)
    {
        myAIPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        ChoreographyParams.MySequence = SeqNode;
        ChoreographyParams.OtherTarget = myAIPawn.SpecialMoveState.CurSMInfo.InteractionActor;
        ChoreographyParams.RotationMode = 1;
        ChoreographyParams.OtherTargetMovePercent = 0.0000000;
        ChoreographyParams.AlignmentType = 0;
        ChoreographyParams.BlendTime = 0.5000000;
        ChoreographyParams.AutoShutoffTime = -1.0000000;
        ChoreographyParams.TooCloseTranslationTolerance = 0.0000000;
        ChoreographyParams.TooFarTranslationTolerance = 0.0000000;
        ChoreographyParams.bOverrideTranslationOffset = false;
        ChoreographyParams.OverridenDesiredTranslationOffset = 0.0000000;
        myAIPawn.StartPawnChoreography(ChoreographyParams);
    }
    //return;    
}

defaultproperties
{
    bManageRootMotionMode=false
    AnimationTemplateNodeNames=/* Array type was not detected. */
}