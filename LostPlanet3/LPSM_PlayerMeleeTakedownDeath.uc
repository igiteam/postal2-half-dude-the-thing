class LPSM_PlayerMeleeTakedownDeath extends SPSM_FollowerPawnBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL KillerActor;

simulated function PrepSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], InteractionActor, PlayerPawn, LPPC;

    super(SPSpecialMoveStateBased).PrepSpecialMove(PrevMove, InteractionActor);
    KillerActor = SPPawn(InteractionActor);
    PlayerPawn = LPPlayerPawn(MySPPawn);
    // End:0xDD
    if((PlayerPawn != none) && PlayerPawn.Controller != none)
    {
        LPPC = LPPlayerController(PlayerPawn.Controller);
        LPPC.GotoState('PlayerTakeDownDeath');
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
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, P;
    local /*0x97E50000-0x00000000*/ private int Damage;
    local /*0x97E50000-0x00000000*/ private @NULL SP;

    MySPPawn.StopPawnChoreography();
    super.SpecialMoveEnded(PrevMove, NextMove);
    MySPPawn.StopFullBodyAnim();
    Damage = 0;
    P = LPPlayerPawn(MySPPawn);
    // End:0x324
    if((P != none) && P.IsAliveAndWell())
    {
        // End:0x235
        if((KillerActor != none) && KillerActor.IsAliveAndWell())
        {
            SP = KillerActor.GetCurrentSpecialMoveInstance();
            // End:0x232
            if((SP == none) || ClassIsChildOf(SP.Class, Class'LPSM_PlayerMeleeTakedown'))
            {
                Damage = int(P.TuneDataPlayerPawn.MeleeTakedownDamage.GetValue());
                P.TakeDamage(Damage, ((KillerActor != none) ? KillerActor.Controller : none), P.Location, vect(0.0000000, 0.0000000, 0.0000000), Class'LPDamageTypePlayerMeleeVisceralTakedown');
            }            
        }
        else
        {
            MySPPawn.EndRagdoll();
            // End:0x297
            if(int(MySPPawn.Physics) != int(2))
            {
                MySPPawn.SetPhysics(1);
            }
            // End:0x324
            if((int(MySPPawn.Role) == int(ROLE_Authority)) && MySPPawn.Controller != none)
            {
                LPPlayerController(MySPPawn.Controller).MPEnterWalkState();
            }
        }
    }
    // End:0x3F0
    if(MySPPawn.IsLocallyControlled() && LPPlayerController(MySPPawn.Controller) != none)
    {
        LPPlayerController(MySPPawn.Controller).ClearAnimatedCamera();
        LPPlayerController(MySPPawn.Controller).SetDefaultCam();
    }
    //return;    
}

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

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
    bZeroVelocityOnSpecialMoveEnd=true
    bRecordAsGameplayEvent=true
    bIgnorePlayerMoveInput=true
}