class LPSM_BurrowerStaticStrikeBase extends SPSM_PlayAnimBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AutoShutOffTimeForStrikeSpecialMove[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bThisStrikeUsesChoreography;

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
    local /*0x97E50000-0x00000000*/ private @NULL SeqNode[8388609], ChoreographyParams, BurrowerPawn, OtherPlayerPawn;
    local /*0x97E50000-0x00000000*/ private editfixedsize array NotifyArray;

    super.AnimationStartedPlaying(SeqNode);
    BurrowerPawn = LPAIPawnBurrower(MySPPawn);
    // End:0x373
    if((bThisStrikeUsesChoreography && BurrowerPawn != none) && BurrowerPawn.SpecialMoveState.CurSMInfo.InteractionActor != none)
    {
        BurrowerPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        ChoreographyParams.MySequence = SeqNode;
        ChoreographyParams.OtherTarget = BurrowerPawn.SpecialMoveState.CurSMInfo.InteractionActor;
        ChoreographyParams.RotationMode = 1;
        ChoreographyParams.OtherTargetMovePercent = 0.0000000;
        ChoreographyParams.bMyIgnoreAllBlockActorsDuringMove = true;
        ChoreographyParams.bIgnoreCollisionWithOther = true;
        ChoreographyParams.AlignmentType = 0;
        ChoreographyParams.MySequence.Rate = BurrowerPawn.TuneDataBurrower.StrikePlaybackRate;
        ChoreographyParams.BlendTime = BurrowerPawn.TuneDataBurrower.StrikeBlendTime;
        ChoreographyParams.AutoShutoffTime = GetAutoShutOffTimeForThisStaticAttack();
        ChoreographyParams.TooCloseTranslationTolerance = 0.0000000;
        ChoreographyParams.TooFarTranslationTolerance = 0.0000000;
        ChoreographyParams.bOverrideTranslationOffset = false;
        ChoreographyParams.OverridenDesiredTranslationOffset = 0.0000000;
        BurrowerPawn.StartPawnChoreography(ChoreographyParams);
    }
    // End:0x4B5
    if((BurrowerPawn != none) && SeqNode != none)
    {
        SeqNode.AnimSeq.GetNotifies(Class'LPAnimNotify_PlayerDodgeWindow', NotifyArray);
        // End:0x40D
        if(NotifyArray.Length == 0)
        {
            BurrowerPawn.HandleNotifyPlayerDodgeWindow(13, 0, none);
        }
        OtherPlayerPawn = LPBasePlayerPawn(MySPPawn.SpecialMoveState.CurSMInfo.InteractionPawn);
        // End:0x4B5
        if((OtherPlayerPawn != none) && BurrowerPawn != none)
        {
            BurrowerPawn.PublishCombatWindowsFromAnimation(SeqNode, OtherPlayerPawn);
        }
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, BurrowerPawn, OtherPlayerPawn;

    BurrowerPawn = LPAIPawnBurrower(MySPPawn);
    // End:0x6E
    if(BurrowerPawn != none)
    {
        BurrowerPawn.HandleNotifyPlayerDodgeWindow(13, 1, none);
        BurrowerPawn.StopPawnChoreography();
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
    OtherPlayerPawn = LPBasePlayerPawn(MySPPawn.SpecialMoveState.CurSMInfo.InteractionPawn);
    // End:0x121
    if(OtherPlayerPawn != none)
    {
        OtherPlayerPawn.RemoveActiveCombatWindows(LPPawn(MySPPawn));
    }
    //return;    
}

defaultproperties
{
    bThisStrikeUsesChoreography=true
    TranslationExtraction=ERootBoneAxis.RBA_Translate
    RotationExtraction=ERootRotationOption.RRO_Extract
    bManageRootMotionMode=true
}