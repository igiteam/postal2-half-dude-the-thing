class LPSM_SnowCrabUberStrike extends SPSM_LeaderPawnBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL vsPawn;

function AnimFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    MySPPawn.EndCurrentSpecialMove(self);
    //return;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function StartInteraction()
{
    local /*0x97E50000-0x00000000*/ private @NULL theVicsMove;

    super(SPSM_LeaderFollowerBase).StartInteraction();
    vsPawn = LPBaseVSPlayerPawn(FollowerPawn);
    theVicsMove = LPSM_PlayerVSUberStrikeVictim(FollowerSMInstance);
    PositionLeader(GetBestSequenceTemplateByIndex(0));
    StartAnimationChoreography(MySPPawn, FollowerPawn, 0, true, AnimFinished, theVicsMove.AnimFinished,, 0.0000000);
    //return;    
}

function PositionLeader()
{
    local /*0x97E50000-0x00000000*/ private @NULL Seq[8388609];

    // End:0x6E
    if(FollowerPawn != none)
    {
        MySPPawn.SetRotation(Rotator(FollowerPawn.Location - MySPPawn.Location));
    }
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

    0
    0
    return super(SPSM_LeaderFollowerBase).SetUpChoreography(Leader, MySeq, Follower, OtherSeq, ChoreoMetaData, AlignmentType, bLeaveCollisionOnOther, bIgnoreCollisionBetweenLeaderAndFollower, 0.0000000, ZMatchType, RotationMode);
    //return ReturnValue;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    // End:0x3B
    if(FollowerPawn != none)
    {
        FollowerPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
    }
    StopAnimationChoreography(MySPPawn);
    super.SpecialMoveEnded(PrevMove, NextMove);
    MySPPawn.StopFullBodyAnim(0.5000000);
    //return;    
}

function ProcessSMMessage()
{
    local /*0x97E50000-0x00000000*/ private name MessageName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int Data[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    switch(MessageName)
    {
        // End:0x41
        case Class'LPSMMTypes'.default.SMM_TakeDamageSetParams:
            ModifyDamage();
            // End:0x44
            break;
        // End:0xFFFF
        default:
            break;
    }
    return super(SPSpecialMove).ProcessSMMessage(MessageName, Sender, Data);
    //return ReturnValue;    
}

function ModifyDamage()
{
    // End:0x12A
    if(MySPPawn.TakeDamageParams.Damage >= MySPPawn.Health)
    {
        MySPPawn.TakeDamageParams.Damage = 0;
        MySPPawn.TakeDamageParams.bShouldPlayHitReactAnim = false;
        MySPPawn.TakeDamageParams.bShouldPlayHitEffects = false;
        MySPPawn.TakeDamageParams.DamageType = Class'LPDamageTypeNoHitReact';
    }
    //return;    
}

defaultproperties
{
    FollowerSpecialMoveClass=Class'LPSM_PlayerVSUberStrikeVictim'
    AnimationTemplateNodeNames=/* Array type was not detected. */
}