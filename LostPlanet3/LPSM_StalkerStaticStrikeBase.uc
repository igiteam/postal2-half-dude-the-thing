class LPSM_StalkerStaticStrikeBase extends SPSM_PlayAnimBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AutoShutOffTimeForStrikeSpecialMove;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bThisStrikeUsesChoreography;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StrikePlaybackRate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StrikeBlendTime;

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
    local /*0x97E50000-0x00000000*/ private @NULL SeqNode[8388609], ChoreographyParams, StalkerPawn, OtherPlayerPawn;
    local /*0x97E50000-0x00000000*/ private editfixedsize array NotifyArray;

    super.AnimationStartedPlaying(SeqNode);
    StalkerPawn = LPAIPawnStalker(MySPPawn);
    // End:0x31F
    if((bThisStrikeUsesChoreography && StalkerPawn != none) && StalkerPawn.SpecialMoveState.CurSMInfo.InteractionActor != none)
    {
        StalkerPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        ChoreographyParams.MySequence = SeqNode;
        ChoreographyParams.OtherTarget = StalkerPawn.SpecialMoveState.CurSMInfo.InteractionActor;
        ChoreographyParams.RotationMode = 1;
        ChoreographyParams.OtherTargetMovePercent = 0.0000000;
        ChoreographyParams.bMyIgnoreAllBlockActorsDuringMove = true;
        ChoreographyParams.bIgnoreCollisionWithOther = false;
        ChoreographyParams.AlignmentType = 0;
        ChoreographyParams.MySequence.Rate = StrikePlaybackRate;
        ChoreographyParams.BlendTime = StrikeBlendTime;
        ChoreographyParams.AutoShutoffTime = GetAutoShutOffTimeForThisStaticAttack();
        ChoreographyParams.TooCloseTranslationTolerance = 0.0000000;
        ChoreographyParams.TooFarTranslationTolerance = 0.0000000;
        ChoreographyParams.bOverrideTranslationOffset = false;
        ChoreographyParams.OverridenDesiredTranslationOffset = 0.0000000;
        StalkerPawn.StartPawnChoreography(ChoreographyParams);
    }
    // End:0x450
    if((StalkerPawn != none) && SeqNode != none)
    {
        SeqNode.AnimSeq.GetNotifies(Class'LPAnimNotify_PlayerDodgeWindow', NotifyArray);
        // End:0x3B9
        if(NotifyArray.Length == 0)
        {
            StalkerPawn.HandleNotifyPlayerDodgeWindow(15, 0, none);
        }
        OtherPlayerPawn = LPBasePlayerPawn(MySPPawn.SpecialMoveState.CurSMInfo.InteractionPawn);
        // End:0x450
        if(OtherPlayerPawn != none)
        {
            StalkerPawn.PublishCombatWindowsFromAnimation(SeqNode, OtherPlayerPawn);
        }
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, StalkerPawn, OtherPlayerPawn;

    StalkerPawn = LPAIPawnStalker(MySPPawn);
    // End:0x6E
    if(StalkerPawn != none)
    {
        StalkerPawn.HandleNotifyPlayerDodgeWindow(15, 1, none);
        StalkerPawn.StopPawnChoreography();
    }
    OtherPlayerPawn = LPBasePlayerPawn(MySPPawn.SpecialMoveState.CurSMInfo.InteractionPawn);
    // End:0x105
    if(OtherPlayerPawn != none)
    {
        OtherPlayerPawn.RemoveActiveCombatWindows(LPPawn(MySPPawn));
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

defaultproperties
{
    AutoShutOffTimeForStrikeSpecialMove=3.0000000
    bThisStrikeUsesChoreography=true
    StrikePlaybackRate=1.0000000
    StrikeBlendTime=0.5000000
    TranslationExtraction=ERootBoneAxis.RBA_Translate
    RotationExtraction=ERootRotationOption.RRO_Extract
    bManageRootMotionMode=true
}