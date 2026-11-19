class LPSM_PlayerBurrowerBearTrap extends SPSM_LeaderPawnBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AnimTemplateTree;

function GetAnimTemplateTreeForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x19
    if(AnimTemplateTree != none)
    {
        return AnimTemplateTree;
    }
    return super(SPSpecialMove).GetAnimTemplateTreeForSpecialMove();
    //return ReturnValue;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], PlayerCtrl;

    super.SpecialMoveStarted(bForced, PrevMove);
    PlayerCtrl = LPPlayerController(LPPlayerPawn(MySPPawn).Controller);
    // End:0x85
    if(PlayerCtrl != none)
    {
        PlayerCtrl.BearTrapped();
    }
    //return;    
}

function StartInteraction()
{
    super(SPSM_LeaderFollowerBase).StartInteraction();
    StartAnimationChoreography(MySPPawn, FollowerPawn, 0, true, AnimFinished, None,, 0.0000000);
    //return;    
}

simulated function SetUpChoreography()
{
    local /*0x97E50000-0x00000000*/ private @NULL Leader[8388609], MySeq, Follower, OtherSeq, ChoreoMetaData;

    local /*0x97E50000-0x00000000*/ private byte AlignmentType[8388609];
    local /*0x97E50000-0x00000000*/ private bool bLeaveCollisionOnOther[8388609], bIgnoreCollisionBetweenLeaderAndFollower;
    local /*0x97E50000-0x00000000*/ private float PreferredOtherMovementPercent[9437185];
    local /*0x97E50000-0x00000000*/ private byte ZMatchType[9437185], RotationMode;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL ChoreographyParams;

    0
    0
    // End:0x318
    if((Follower != none) && MySeq != none)
    {
        ChoreographyParams.OtherTarget = Leader;
        ChoreographyParams.MySequence = MySeq;
        ChoreographyParams.OtherTargetSequence = OtherSeq;
        // End:0xED
        if(ChoreoMetaData != none)
        {
            ChoreographyParams.BlendTime = ChoreoMetaData.TimeToFullAlignment;            
        }
        else
        {
            ChoreographyParams.BlendTime = 0.2500000;
        }
        ChoreographyParams.bMyIgnoreAllBlockActorsDuringMove = false;
        ChoreographyParams.AlignmentType = 0;
        ChoreographyParams.TargetPassThroughActor = none;
        ChoreographyParams.bIgnoreCollisionWithOther = bIgnoreCollisionBetweenLeaderAndFollower;
        ChoreographyParams.ZMatchType = 2;
        // End:0x318
        if(OtherSeq != none)
        {
            OtherSeq.Rate = MySeq.Rate;
            ChoreographyParams.bOtherIgnoreAllBlockActorsDuringMove = !bLeaveCollisionOnOther;
            ChoreographyParams.OtherTargetMovePercent = 0.0000000;
            ChoreographyParams.RotationMode = 1;
            ChoreographyParams.bOverrideTranslationOffset = false;
            ChoreographyParams.TooCloseTranslationTolerance = 0.0000000;
            ChoreographyParams.TooFarTranslationTolerance = 0.0000000;
            ChoreographyParams.AutoShutoffTime = 0.0000000;
            Follower.StartPawnChoreography(ChoreographyParams);
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function AnimFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    MySPPawn.EndCurrentSpecialMove(self);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    StopAnimationChoreography(FollowerPawn);
    bZeroVelocityOnSpecialMoveEnd = true;
    super.SpecialMoveEnded(PrevMove, NextMove);
    MySPPawn.StopFullBodyAnim(0.1000000);
    //return;    
}

defaultproperties
{
    AnimTemplateTree=AnimTree'PlayerMoveAnimTemplate.PlayerStruggleAnimations'
    FollowerSpecialMoveClass=Class'LPSM_BurrowerPlayerBearTrap'
    AnimationTemplateNodeNames=/* Array type was not detected. */
}