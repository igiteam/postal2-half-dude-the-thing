class LPSM_SnowCrabAttackPOFStartBase extends LPSM_SnowCrabAttackPOFBase
    config(Game);

function AnimationStartedPlaying()
{
    local /*0x97E50000-0x00000000*/ private @NULL SeqNode[8388609], ChoreographyParams, myAIPawn;

    super.AnimationStartedPlaying(SeqNode);
    myAIPawn = LPAIPawn(MySPPawn);
    // End:0x242
    if(myAIPawn != none)
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

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, myAIPawn;

    myAIPawn = LPAIPawnBaseSnowCrab(MySPPawn);
    // End:0x4A
    if(myAIPawn != none)
    {
        myAIPawn.StopPawnChoreography();
    }
    // End:0xD0
    if(myAIPawn.CurrentDodgeWindowPlayer != none)
    {
        myAIPawn.CurrentDodgeWindowPlayer.ClientNotifyClearDodgeWindow(-1, myAIPawn);
        myAIPawn.CurrentDodgeWindowPlayer = none;
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}
