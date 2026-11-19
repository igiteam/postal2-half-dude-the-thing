class LPSM_LeechStaticStrikeBase extends SPSM_PlayAnimBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AutoShutOffTimeForStrikeSpecialMove[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bThisStrikeUsesChoreography;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float BlendInTimeChoreo;

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
    local /*0x97E50000-0x00000000*/ private @NULL SeqNode[8388609], ChoreographyParams, myLPAIPawnLeechPawn;
    local /*0x97E50000-0x00000000*/ private editfixedsize array NotifyArray;

    super.AnimationStartedPlaying(SeqNode);
    myLPAIPawnLeechPawn = LPAIPawnLeech(MySPPawn);
    // End:0x2E4
    if((bThisStrikeUsesChoreography && myLPAIPawnLeechPawn != none) && myLPAIPawnLeechPawn.SpecialMoveState.CurSMInfo.InteractionActor != none)
    {
        myLPAIPawnLeechPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        ChoreographyParams.MySequence = SeqNode;
        ChoreographyParams.OtherTarget = myLPAIPawnLeechPawn.SpecialMoveState.CurSMInfo.InteractionActor;
        ChoreographyParams.RotationMode = 1;
        ChoreographyParams.OtherTargetMovePercent = 0.0000000;
        ChoreographyParams.bMyIgnoreAllBlockActorsDuringMove = true;
        ChoreographyParams.bIgnoreCollisionWithOther = true;
        ChoreographyParams.AlignmentType = 0;
        ChoreographyParams.BlendTime = BlendInTimeChoreo;
        ChoreographyParams.AutoShutoffTime = GetAutoShutOffTimeForThisStaticAttack();
        ChoreographyParams.TooCloseTranslationTolerance = 0.0000000;
        ChoreographyParams.TooFarTranslationTolerance = 0.0000000;
        ChoreographyParams.bOverrideTranslationOffset = false;
        ChoreographyParams.OverridenDesiredTranslationOffset = 0.0000000;
        myLPAIPawnLeechPawn.StartPawnChoreography(ChoreographyParams);
    }
    // End:0x37E
    if((myLPAIPawnLeechPawn != none) && SeqNode != none)
    {
        SeqNode.AnimSeq.GetNotifies(Class'LPAnimNotify_PlayerDodgeWindow', NotifyArray);
        // End:0x37E
        if(NotifyArray.Length == 0)
        {
            myLPAIPawnLeechPawn.HandleNotifyPlayerDodgeWindow(11, 0, none);
        }
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, myLPAIPawnLeechPawn;

    myLPAIPawnLeechPawn = LPAIPawnLeech(MySPPawn);
    // End:0x6E
    if(myLPAIPawnLeechPawn != none)
    {
        myLPAIPawnLeechPawn.HandleNotifyPlayerDodgeWindow(11, 1, none);
        myLPAIPawnLeechPawn.StopPawnChoreography();
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

defaultproperties
{
    AutoShutOffTimeForStrikeSpecialMove=-1.0000000
    bThisStrikeUsesChoreography=true
    BlendInTimeChoreo=0.1000000
    TranslationExtraction=ERootBoneAxis.RBA_Translate
    RotationExtraction=ERootRotationOption.RRO_Extract
    bManageRootMotionMode=true
}