class LPSM_PlayerMeleeTakedown extends SPSM_LeaderPawnBase
    config(Game);

function GetAnimTemplateTreeForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], P;

    P = LPPlayerPawn(MySPPawn);
    // End:0x4A
    if(P != none)
    {
        return P.PlayerMeleeAnimTree;
    }
    return super(SPSpecialMove).GetAnimTemplateTreeForSpecialMove();
    //return ReturnValue;    
}

function PrepSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], InteractionActor, PlayerPawn;

    super(SPSpecialMoveStateBased).PrepSpecialMove(PrevMove, InteractionActor);
    // End:0x7B
    if(MySPPawn.IsLocallyControlled())
    {
        SPPlayerController(MySPPawn.Controller).PauseFire();
    }
    // End:0x13E
    if(int(MySPPawn.Role) == int(ROLE_Authority))
    {
        PlayerPawn = LPPlayerPawn(MySPPawn);
        LPPlayerController(MySPPawn.Controller).SetAimDownSightMode(false);
        // End:0x13E
        if(PlayerPawn != none)
        {
            PlayerPawn.SetupMeleeTakedown(LPPlayerPawn(InteractionActor));
        }
    }
    //return;    
}

function AnimFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    MySPPawn.EndCurrentSpecialMove(self);
    //return;    
}

function StartInteraction()
{
    super(SPSM_LeaderFollowerBase).StartInteraction();
    // End:0x153
    if(MySPPawn != none)
    {
        MySPPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        MySPPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        LPPlayerPawn(MySPPawn).TemplateLogicData.TargetPawn = LPPawn(FollowerPawn);
        StartAnimationChoreography(MySPPawn, FollowerPawn, 0, true, AnimFinished,,, 0.0000000);
        Class'SPEngine.SPUtil'.static.SetRBCollision(MySPPawn.Mesh, FollowerPawn.Mesh, false);
    }
    //return;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, PlayerPawn, TakedownTarget, SP;

    MySPPawn.StopPawnChoreography();
    super.SpecialMoveEnded(PrevMove, NextMove);
    MySPPawn.ClearTimer('StopPawnChoreography', MySPPawn);
    // End:0xAC
    if(FollowerPawn != none)
    {
        FollowerPawn.ClearTimer('StopPawnChoreography', FollowerPawn);
    }
    PlayerPawn = LPPlayerPawn(MySPPawn);
    // End:0x20A
    if(PlayerPawn != none)
    {
        // End:0x1EB
        if((NextMove != none) && int(PlayerPawn.Role) == int(ROLE_Authority))
        {
            TakedownTarget = LPPlayerPawn(PlayerPawn.MeleeTakedownActor);
            // End:0x1EB
            if((TakedownTarget != none) && TakedownTarget.IsAliveAndWell())
            {
                SP = TakedownTarget.GetCurrentSpecialMoveInstance();
                // End:0x1EB
                if(ClassIsChildOf(SP.Class, Class'LPSM_PlayerMeleeTakedownDeath'))
                {
                    TakedownTarget.ServerEndCurrentSpecialMove();
                }
            }
        }
        PlayerPawn.ClearMeleeTakedownActor();
    }
    MySPPawn.StopFullBodyAnim(0.0000000);
    // End:0x337
    if(MySPPawn.IsLocallyControlled() && LPPlayerController(MySPPawn.Controller) != none)
    {
        SPPlayerController(MySPPawn.Controller).UnPauseFire();
        LPPlayerController(MySPPawn.Controller).ClearAnimatedCamera();
        LPPlayerController(MySPPawn.Controller).SetDefaultCam();
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

    0.5000000
    0
    0
    return super(SPSM_LeaderFollowerBase).SetUpChoreography(Leader, MySeq, Follower, OtherSeq, ChoreoMetaData, AlignmentType, false, true, PreferredOtherMovementPercent, ZMatchType, RotationMode);
    //return ReturnValue;    
}

function ProcessSMMessage()
{
    local /*0x97E50000-0x00000000*/ private name MessageName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int Data[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    switch(MessageName)
    {
        // End:0x36
        case Class'LPSMMTypes'.default.SMM_ShouldIgnoreDamageType:
            return true;
        // End:0xFFFF
        default:
            return super(SPSpecialMove).ProcessSMMessage(MessageName, Sender, Data);
            break;
    }
    //return ReturnValue;    
}

defaultproperties
{
    FollowerSpecialMoveClass=Class'LPSM_PlayerMeleeTakedownDeath'
    bEndSpecialMoveOnInvalidFollower=true
    AnimationTemplateNodeNames=/* Array type was not detected. */
    bZeroVelocityOnSpecialMoveEnd=true
    bRecordAsGameplayEvent=true
}