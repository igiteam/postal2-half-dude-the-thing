class LPSM_MedFlyerStaticStrikeBase extends SPSM_PlayAnimBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AutoShutOffTimeForStrikeSpecialMove[1073741825];

function GetAutoShutOffTimeForThisStaticAttack()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return AutoShutOffTimeForStrikeSpecialMove;
    //return ReturnValue;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function AnimationStartedPlaying()
{
    local /*0x97E50000-0x00000000*/ private @NULL SeqNode[8388609], ChoreographyParams, myLPAIPawnMedFlyerPawn;

    super.AnimationStartedPlaying(SeqNode);
    myLPAIPawnMedFlyerPawn = LPAIPawnMedFlyer(MySPPawn);
    // End:0x2F0
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
        ChoreographyParams.ZMatchType = 0;
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

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, myLPAIPawnMedFlyerPawn;

    myLPAIPawnMedFlyerPawn = LPAIPawnMedFlyer(MySPPawn);
    // End:0x6E
    if(myLPAIPawnMedFlyerPawn != none)
    {
        myLPAIPawnMedFlyerPawn.HandleNotifyPlayerDodgeWindow(12, 1, none);
        myLPAIPawnMedFlyerPawn.StopPawnChoreography();
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

defaultproperties
{
    TranslationExtraction=ERootBoneAxis.RBA_Translate
    bManageRootMotionMode=true
}