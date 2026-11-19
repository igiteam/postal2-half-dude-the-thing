class LPSM_FireWaspSwoopStingStrike extends LPSM_MedFlyerStaticStrikeBase
    config(Game);

function AnimationStartedPlaying()
{
    local /*0x97E50000-0x00000000*/ private @NULL SeqNode[8388609], ChoreographyParams, myLPAIPawnMedFlyerPawn;

    myLPAIPawnMedFlyerPawn = LPAIPawnMedFlyer(MySPPawn);
    // End:0x2DD
    if((myLPAIPawnMedFlyerPawn != none) && myLPAIPawnMedFlyerPawn.SpecialMoveState.CurSMInfo.InteractionActor != none)
    {
        myLPAIPawnMedFlyerPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        ChoreographyParams.MySequence = SeqNode;
        ChoreographyParams.OtherTarget = myLPAIPawnMedFlyerPawn.SpecialMoveState.CurSMInfo.InteractionActor;
        ChoreographyParams.RotationMode = 1;
        ChoreographyParams.OtherTargetMovePercent = 0.0000000;
        ChoreographyParams.bMyIgnoreAllBlockActorsDuringMove = true;
        ChoreographyParams.bIgnoreCollisionWithOther = true;
        ChoreographyParams.AlignmentType = 0;
        ChoreographyParams.ZMatchType = 2;
        ChoreographyParams.BlendTime = 0.1000000;
        ChoreographyParams.AutoShutoffTime = GetAutoShutOffTimeForThisStaticAttack();
        ChoreographyParams.TooCloseTranslationTolerance = 0.0000000;
        ChoreographyParams.TooFarTranslationTolerance = 0.0000000;
        ChoreographyParams.bOverrideTranslationOffset = false;
        ChoreographyParams.OverridenDesiredTranslationOffset = 0.0000000;
        myLPAIPawnMedFlyerPawn.StartPawnChoreography(ChoreographyParams);
    }
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}