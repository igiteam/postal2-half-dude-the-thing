class LPSM_HSStaticStrikeBase extends SPSM_PlayAnimBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AutoShutOffTimeForStrikeSpecialMove;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bThisStrikeUsesChoreography;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StrikePlaybackRate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StrikeBlendTime;

function GetAnimTemplateTreeForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], HS;

    HS = LPAIPawnHumanSoldier(MySPPawn);
    // End:0x4A
    if(HS != none)
    {
        return HS.HumanSoldierMeleeAnimTree;
    }
    return super.GetAnimTemplateTreeForSpecialMove();
    //return ReturnValue;    
}

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
    local /*0x97E50000-0x00000000*/ private @NULL SeqNode[8388609], ChoreographyParams, HumanSoldierPawn, OtherPlayerPawn;
    local /*0x97E50000-0x00000000*/ private editfixedsize array NotifyArray;
    local /*0x97E50000-0x00000000*/ private @NULL InteractionPawn;

    super.AnimationStartedPlaying(SeqNode);
    HumanSoldierPawn = LPAIPawnHumanSoldier(MySPPawn);
    InteractionPawn = Pawn(HumanSoldierPawn.SpecialMoveState.CurSMInfo.InteractionActor);
    // End:0x3C5
    if((bThisStrikeUsesChoreography && HumanSoldierPawn != none) && InteractionPawn != none)
    {
        HumanSoldierPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        ChoreographyParams.MySequence = SeqNode;
        ChoreographyParams.OtherTarget = InteractionPawn;
        ChoreographyParams.bMyIgnoreAllBlockActorsDuringMove = true;
        ChoreographyParams.bIgnoreCollisionWithOther = false;
        ChoreographyParams.AlignmentType = 1;
        ChoreographyParams.ManualYawDeltaFromCenterline = 0;
        ChoreographyParams.ManualTargetDeltaFromCenterline = -32768;
        ChoreographyParams.OverridenDesiredTranslationOffset = MySPPawn.CylinderComponent.CollisionRadius + InteractionPawn.CylinderComponent.CollisionRadius;
        ChoreographyParams.RotationMode = 1;
        ChoreographyParams.OtherTargetMovePercent = 0.0000000;
        ChoreographyParams.MySequence.Rate = StrikePlaybackRate;
        ChoreographyParams.BlendTime = StrikeBlendTime;
        ChoreographyParams.AutoShutoffTime = GetAutoShutOffTimeForThisStaticAttack();
        ChoreographyParams.TooCloseTranslationTolerance = 0.0000000;
        ChoreographyParams.TooFarTranslationTolerance = 0.0000000;
        ChoreographyParams.bOverrideTranslationOffset = false;
        ChoreographyParams.OverridenDesiredTranslationOffset = 0.0000000;
        HumanSoldierPawn.StartPawnChoreography(ChoreographyParams);
    }
    // End:0x4F6
    if((HumanSoldierPawn != none) && SeqNode != none)
    {
        SeqNode.AnimSeq.GetNotifies(Class'LPAnimNotify_PlayerDodgeWindow', NotifyArray);
        // End:0x45F
        if(NotifyArray.Length == 0)
        {
            HumanSoldierPawn.HandleNotifyPlayerDodgeWindow(16, 0, none);
        }
        OtherPlayerPawn = LPBasePlayerPawn(MySPPawn.SpecialMoveState.CurSMInfo.InteractionPawn);
        // End:0x4F6
        if(OtherPlayerPawn != none)
        {
            HumanSoldierPawn.PublishCombatWindowsFromAnimation(SeqNode, OtherPlayerPawn);
        }
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, HumanSoldierPawn, OtherPlayerPawn;

    HumanSoldierPawn = LPAIPawnHumanSoldier(MySPPawn);
    // End:0x6E
    if(HumanSoldierPawn != none)
    {
        HumanSoldierPawn.HandleNotifyPlayerDodgeWindow(16, 1, none);
        HumanSoldierPawn.StopPawnChoreography();
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
    AutoShutOffTimeForStrikeSpecialMove=3.0000000
    bThisStrikeUsesChoreography=true
    StrikePlaybackRate=0.8000000
    StrikeBlendTime=0.5000000
    TranslationExtraction=ERootBoneAxis.RBA_Translate
    bManageRootMotionMode=true
}