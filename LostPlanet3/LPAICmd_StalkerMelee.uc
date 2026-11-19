class LPAICmd_StalkerMelee extends LPAICmd_CoverAIMelee within LPAIControllerStalker;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToActorCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToPosCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StrikeKnockdownCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TauntCommand[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BullStrikeCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BullStrikeLongCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BullStrikeFirstMoveToGoal[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTryBullStrikeWithSpace[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTryBullStrikeWithoutSpace[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPlayedStrikeWarning[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SpeedOnFalldown[536870913];

function Pushed()
{
    Outer.bEnableReactiveAttack = false;
    bPlayedStrikeWarning = false;
    super(LPAICmd_Strike).Pushed();
    //return;    
}

function Popped()
{
    OnExit();
    super(LPAICmd_Strike).Popped();
    //return;    
}

event SPAborted()
{
    super(LPAICmd_Strike).SPAborted();
    //return;    
}

function OnExit()
{
    Outer.bEnableReactiveAttack = true;
    GotoState('None');
    Outer.ClearTimer('DrawMoveGoal', self);
    //return;    
}

function SetDesiredEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];

    super(LPAICmd_Strike).SetDesiredEnemy(InEnemy);
    //return;    
}

function DrawMoveGoal()
{
    //return;    
}

function FindMoveBackLocation()
{
    local /*0x97E50000-0x00000000*/ private float MaxDistanceCheck;
    local /*0x97E50000-0x00000000*/ private @NULL dirToPlayer;

    MaxDistanceCheck = Outer.StalkerPawn.TuneDataStalker.DistanceMoveBackAfterBullStrike;
    dirToPlayer = EnemyForStrike.Location - Outer.Pawn.Location;
    dirToPlayer.Z = 0.0000000;
    dirToPlayer = Normal(dirToPlayer);
    BullStrikeFirstMoveToGoal = Outer.Pawn.Location - (dirToPlayer * MaxDistanceCheck);
    BullStrikeFirstMoveToGoal = Outer.TraceLineToObstacleKynapse(BullStrikeFirstMoveToGoal);
    //return;    
}

function IsThereSpaceInThePlayerBack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

state StateCmdActive
{
    function WantsToJumpOutOfCover()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL CoverAction, MyCover;

        MyCover = Outer.CoverGetCurrent();
        // End:0xFB
        if(!MyCover.Link.Slots[MyCover.SlotIdx].bCanCoverSlip_Left && !MyCover.Link.Slots[MyCover.SlotIdx].bCanCoverSlip_Right)
        {
            return false;
        }
        // End:0x13B
        if(Outer.CoverActionForEnemy(MyCover, EnemyForStrike, CoverAction))
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }
Begin:

    Outer.SetAttackResourceNames();
    // End:0xB6
    if(((EnemySeperation2D()) < Outer.StalkerPawn.TuneDataStalker.DistanceStandardStrike) && !Outer.IsObstacleInTheWay(EnemyForStrike))
    {
        GotoState('KnockDownStrike');        
    }
    else
    {
        // End:0x193
        if(Outer.CoverIsIn() && WantsToJumpOutOfCover())
        {
            // End:0x128
            if(Outer.CoverActionIsDoing())
            {
                Outer.CoverResetAction();
            }
            J0x128:

            // End:0x16A [Loop If]
            if(Outer.IsTransitioning())
            {
                Outer.Sleep(0.1000000);
                // [Loop Continue]
                goto J0x128;
            }
            Outer.CoverExit(,, Class'LPSM_StalkerJumpOutCover');
        }
        GotoState('MovingToTaunt');
    }
    stop;            
}

state MovingToTaunt
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        Outer.AIResetMemoryDamage();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.ClearTimer('TimerTransitions', self);
        StopMoving();
        //return;        
    }

    function StopMoving()
    {
        Outer.AbortCommand(MoveToActorCmd);
        MoveToActorCmd = none;
        //return;        
    }

    function TimerTransitions()
    {
        local /*0x97E50000-0x00000000*/ private @NULL TestLocation;

        // End:0x24
        if(Outer.IsDoingSpecialUninteruptibleMovement())
        {
            return;
        }
        // End:0xDF
        if(Outer.RecentDamageDone > Outer.StalkerPawn.TuneDataStalker.MeleeAmountDamageCancelAttack)
        {
            SpeedOnFalldown = VSize(Outer.StalkerPawn.Velocity);
            GotoState('FallsDown');            
        }
        else
        {
            // End:0x147
            if((EnemySeperation2D()) < Outer.StalkerPawn.TuneDataStalker.TooCloseToTaunt)
            {
                GotoState('MovingToStrike');                
            }
            else
            {
                // End:0x35F
                if(Outer.IsEnemySeenLastFrame(EnemyForStrike) && Outer.GetEnemyVisibleDuration(EnemyForStrike) > 0.2500000)
                {
                    // End:0x35F
                    if((Outer.WorldInfo.TimeSeconds - Outer.TimeStampTaunt) > Outer.StalkerPawn.TuneDataStalker.MinTimeBetweenTaunts)
                    {
                        TestLocation = Outer.StalkerPawn.Location + (Normal(EnemyForStrike.Location - Outer.StalkerPawn.Location) * Outer.StalkerPawn.TuneDataStalker.SpaceInFrontOfMeToTaunt);
                        // End:0x35F
                        if(!Outer.IsObstacleInTheWayKynapseTestLocation(TestLocation))
                        {
                            GotoState('Taunt');
                        }
                    }
                }
            }
        }
        //return;        
    }

    function MoveToEnemyForTaunt()
    {
        MoveToActorCmd = Outer.CmdMoveToActor(EnemyForStrike, none, 0.0000000, Outer.CmdStatus_MoveToActor, 1, Outer.myAIPawn.TuneDataAIPawn.StopTypeForEndOfMoveToStrike);
        //return;        
    }
Begin:

    Outer.SetTimer(0.1000000, true, 'TimerTransitions', self);
    MoveToEnemyForTaunt();
    stop;        
}

state Taunt
{
    ignores BeginState;

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.AbortCommand(TauntCommand);
        Outer.StalkerPawn.EndCurrentSpecialMove();
        Outer.PawnLookAtActor(none);
        Outer.ClearTimer('TimerTransitions', self);
        //return;        
    }

    function TimerTransitions()
    {
        // End:0xB8
        if(Outer.RecentDamageDone > Outer.StalkerPawn.TuneDataStalker.MeleeAmountDamageCancelAttack)
        {
            SpeedOnFalldown = VSize(Outer.StalkerPawn.Velocity);
            GotoState('FallsDown');
        }
        //return;        
    }
Begin:

    Outer.PawnLookAtActor(EnemyForStrike);
    Outer.PawnZeroVelocity();
    Outer.SetTimer(0.1000000, true, 'TimerTransitions', self);
    Outer.TimeStampTaunt = Outer.WorldInfo.TimeSeconds;
    TauntCommand = Outer.CmdSpecialMove(Class'LPSM_StalkerTaunt', true, 0.0000000, 6.0000000,,, false);
    TauntCommand = none;
    GotoState('MovingToStrike');
    stop;        
}

state FallsDown
{
    ignores BeginState, EndState;
Begin:

    // End:0x8F
    if(SpeedOnFalldown > Outer.StalkerPawn.TuneDataStalker.MinSpeedToMovingFalldown)
    {
        Outer.CmdSpecialMove(Class'LPSM_StalkerFallDown', true, 0.0000000, 6.0000000);        
    }
    else
    {
        Outer.CmdSpecialMove(Class'LPSM_StalkerLongHitReaction', true, 0.0000000, 6.0000000);
    }
    Outer.PopCommand(self);
    stop;            
}

state MovingToStrike
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private float probBullStrike;

        Outer.StalkerPawn.SetMaxSpeedScale(Outer.StalkerPawn.TuneDataStalker.MeleeSpeedScale.GetValue());
        // End:0x1E1
        if(Outer.AICanDoStruggleStrike())
        {
            probBullStrike = Outer.StalkerPawn.TuneDataStalker.ProbabilityBullStrikeIfEnoughSpace.GetValue();
            bTryBullStrikeWithSpace = (probBullStrike > 0.0000000) && FRand() <= probBullStrike;
            probBullStrike = Outer.StalkerPawn.TuneDataStalker.ProbabilityBullStrikeIfNotEnoughSpace.GetValue();
            bTryBullStrikeWithoutSpace = (probBullStrike > 0.0000000) && FRand() <= probBullStrike;            
        }
        else
        {
            bTryBullStrikeWithSpace = false;
            bTryBullStrikeWithoutSpace = false;
        }
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.StalkerPawn.SetMaxSpeedScale(Outer.StalkerPawn.TuneDataStalker.GetNormalMaxSpeedScale(Outer.StalkerPawn));
        Outer.ClearTimer('TimerMovingToEnemyToStrike', self);
        StopMoving();
        //return;        
    }

    function StopMoving()
    {
        Outer.AbortCommand(MoveToActorCmd);
        MoveToActorCmd = none;
        //return;        
    }

    function IsThereSpaceInThePlayerBack()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private float DistanceCheck;
        local /*0x97E50000-0x00000000*/ private @NULL dirToPlayer, TestLocation;

        DistanceCheck = Outer.StalkerPawn.TuneDataStalker.CheckDistanceInPlayersBackForBullStrike;
        dirToPlayer = EnemyForStrike.Location - Outer.Pawn.Location;
        dirToPlayer.Z = 0.0000000;
        dirToPlayer = Normal(dirToPlayer);
        TestLocation = Outer.Pawn.Location + (dirToPlayer * DistanceCheck);
        // End:0x166
        if(Outer.IsObstacleInTheWayKynapseTestLocation(TestLocation))
        {
            return false;
        }
        return true;
        //return ReturnValue;        
    }

    function TimerMovingToEnemyToStrike()
    {
        local /*0x97E50000-0x00000000*/ private float separation;
        local /*0x97E50000-0x00000000*/ private bool bTryBullStrike, bSpaceInTheBack;

        // End:0x44
        if(EnemyForStrike.InStruggleMode)
        {
            Outer.PopCommand(self);
            return;
        }
        separation = EnemySeperation2D();
        // End:0x157
        if((!bPlayedStrikeWarning && separation > Outer.StalkerPawn.TuneDataStalker.MinDistancePlayStrikeWarning) && separation < Outer.StalkerPawn.TuneDataStalker.MaxDistancePlayStrikeWarning)
        {
            bPlayedStrikeWarning = true;
            Outer.StalkerPawn.PlayStrikeWarningSound();
        }
        // End:0x17B
        if(Outer.IsDoingSpecialUninteruptibleMovement())
        {
            return;
        }
        // End:0x235
        if(Outer.RecentDamageDone > Outer.StalkerPawn.TuneDataStalker.MeleeAmountDamageCancelAttack)
        {
            SpeedOnFalldown = VSize(Outer.StalkerPawn.Velocity);
            GotoState('FallsDown');
            return;
        }
        // End:0x28E
        if((EnemyZDiff()) > Outer.StalkerPawn.TuneDataStalker.MaxZDiffToAllowStrike)
        {
            return;
        }
        // End:0x316
        if(Outer.bForcedStruggleMode)
        {
            // End:0x314
            if(separation < Outer.StalkerPawn.TuneDataStalker.DistanceBullStrike)
            {
                GotoState('BullStrikeLong');
            }
            return;
        }
        // End:0x3D1
        if(Outer.bForcedBullStrike)
        {
            // End:0x3CF
            if(separation < Outer.StalkerPawn.TuneDataStalker.DistanceBullStrike)
            {
                // End:0x3C1
                if(EnemyForStrike.IsRolling())
                {
                    GotoState('StrikingFailed');                    
                }
                else
                {
                    GotoState('BullStrike');
                }
            }
            return;
        }
        // End:0x566
        if((Outer.bForcedPunch || Outer.bForcedPush) || Outer.bForcedPushBounce)
        {
            // End:0x4D1
            if((separation < Outer.StalkerPawn.TuneDataStalker.DistanceReactiveStrike) && !Outer.IsObstacleInTheWay(EnemyForStrike))
            {
                GotoState('KnockDownStrike');                
            }
            else
            {
                // End:0x564
                if((separation < Outer.StalkerPawn.TuneDataStalker.DistanceStandardStrike) && !Outer.IsObstacleInTheWay(EnemyForStrike))
                {
                    GotoState('KnockDownStrike');
                }
            }
            return;
        }
        // End:0x61B
        if(Outer.AICanDoStruggleStrike() && Outer.WantsToDoStruggleMode(EnemyForStrike))
        {
            // End:0x619
            if(separation < Outer.StalkerPawn.TuneDataStalker.DistanceBullStrike)
            {
                GotoState('BullStrikeLong');
            }
            return;
        }
        bTryBullStrike = false;
        // End:0x6AD
        if(bTryBullStrikeWithoutSpace || bTryBullStrikeWithSpace)
        {
            bSpaceInTheBack = IsThereSpaceInThePlayerBack();
            // End:0x683
            if(bTryBullStrikeWithSpace && bSpaceInTheBack)
            {
                bTryBullStrike = true;                
            }
            else
            {
                // End:0x6AD
                if(bTryBullStrikeWithoutSpace && !bSpaceInTheBack)
                {
                    bTryBullStrike = false;
                }
            }
        }
        // End:0x753
        if(bTryBullStrike)
        {
            // End:0x751
            if(separation < Outer.StalkerPawn.TuneDataStalker.DistanceBullStrike)
            {
                // End:0x743
                if(EnemyForStrike.IsRolling())
                {
                    GotoState('StrikingFailed');                    
                }
                else
                {
                    GotoState('BullStrike');
                }
            }
            return;
        }
        // End:0x80A
        if(EnemyForStrike.IsInCover())
        {
            // End:0x808
            if((separation < Outer.StalkerPawn.TuneDataStalker.DistanceReactiveStrike) && !Outer.IsObstacleInTheWay(EnemyForStrike))
            {
                GotoState('KnockDownStrike');
            }
            return;
        }
        // End:0x89D
        if((separation < Outer.StalkerPawn.TuneDataStalker.DistanceStandardStrike) && !Outer.IsObstacleInTheWay(EnemyForStrike))
        {
            GotoState('KnockDownStrike');
        }
        //return;        
    }

    function MoveToEnemyForStrike()
    {
        MoveToActorCmd = Outer.CmdMoveToActor(EnemyForStrike, none, 0.0000000, Outer.CmdStatus_MoveToActor, 1, Outer.myAIPawn.TuneDataAIPawn.StopTypeForEndOfMoveToStrike);
        //return;        
    }
Begin:

    Outer.SetTimer(0.1000000, true, 'TimerMovingToEnemyToStrike', self);
    MoveToEnemyForStrike();
    stop;        
}

state KnockDownStrike
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        Outer.TimeStampReactiveAttack = Outer.WorldInfo.TimeSeconds;
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.AbortCommand(StrikeKnockdownCmd);
        StrikeKnockdownCmd = none;
        //return;        
    }
Begin:

    StrikeKnockdownCmd = Outer.CmdStalkerStrikeKnockDown(EnemyForStrike);
    StrikeKnockdownCmd = none;
    // End:0x28E
    if((Outer.bMultiplayerMode && EnemyForStrike != none) && EnemyForStrike.IsAliveAndWell())
    {
        // End:0x1D1
        if((EnemySeperation2D()) < Outer.StalkerPawn.TuneDataStalker.DistanceTooCloseToMainEnemy)
        {
            Outer.PawnZeroVelocity();
            Outer.TimeStampTaunt = Outer.WorldInfo.TimeSeconds;
            Outer.Focus = EnemyForStrike;
            TauntCommand = Outer.CmdSpecialMove(Class'LPSM_StalkerTaunt', true, 0.0000000, 3.0000000,,, false);
            TauntCommand = none;
        }
        J0x1D1:

        // End:0x28E [Loop If]
        if(((EnemySeperation2D()) < Outer.StalkerPawn.TuneDataStalker.DistanceStandardStrike) && (EnemyZDiff()) <= Outer.StalkerPawn.TuneDataStalker.MaxZDiffToAllowStrike)
        {
            goto 'Begin';
            // [Loop Continue]
            goto J0x1D1;
        }
    }
    Outer.PopCommand(self);
    stop;        
}

state BullStrike
{
    ignores BeginState;

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        StopStrike();
        //return;        
    }

    function StopStrike()
    {
        Outer.AbortCommand(BullStrikeCmd);
        BullStrikeCmd = none;
        Outer.AbortCommand(MoveToPosCmd);
        MoveToPosCmd = none;
        Outer.AbortCommand(TauntCommand);
        TauntCommand = none;
        //return;        
    }
Begin:

    BullStrikeCmd = Outer.CmdStalkerStrugglePofStrikeBull(EnemyForStrike);
    BullStrikeCmd = none;
    FindMoveBackLocation();
    MoveToPosCmd = Outer.CmdMoveToPosition(BullStrikeFirstMoveToGoal, EnemyForStrike, 10.0000000,, 1);
    MoveToPosCmd = none;
    Outer.PawnLookAtActor(EnemyForStrike);
    Outer.bEnableReactiveAttack = true;
    Outer.TimeStampTaunt = Outer.WorldInfo.TimeSeconds;
    TauntCommand = Outer.CmdSpecialMove(Class'LPSM_StalkerTaunt', true, 0.0000000, 6.0000000,,, false);
    TauntCommand = none;
    Outer.PopCommand(self);
    stop;        
}

state BullStrikeLong
{
    ignores BeginState;

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        StopStrike();
        //return;        
    }

    function StopStrike()
    {
        Outer.AbortCommand(BullStrikeLongCmd);
        BullStrikeLongCmd = none;
        Outer.AbortCommand(MoveToPosCmd);
        MoveToPosCmd = none;
        Outer.AbortCommand(TauntCommand);
        TauntCommand = none;
        //return;        
    }
Begin:

    BullStrikeLongCmd = Outer.CmdStalkerStrugglePofStrikeBullLong(EnemyForStrike);
    BullStrikeLongCmd = none;
    FindMoveBackLocation();
    MoveToPosCmd = Outer.CmdMoveToPosition(BullStrikeFirstMoveToGoal, EnemyForStrike, 10.0000000,, 1);
    MoveToPosCmd = none;
    Outer.PawnLookAtActor(EnemyForStrike);
    Outer.bEnableReactiveAttack = true;
    Outer.TimeStampTaunt = Outer.WorldInfo.TimeSeconds;
    TauntCommand = Outer.CmdSpecialMove(Class'LPSM_StalkerTaunt', true, 0.0000000, 6.0000000,,, false);
    TauntCommand = none;
    Outer.PopCommand(self);
    stop;        
}

state StrikingFailed
{
    ignores BeginState;

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.AbortCommand(MoveToPosCmd);
        MoveToPosCmd = none;
        //return;        
    }
Begin:

    Outer.CmdSpecialMove(Class'LPSM_StalkerStrikeBullFailed', true, 0.0000000, 6.0000000);
    FindMoveBackLocation();
    MoveToPosCmd = Outer.CmdMoveToPosition(BullStrikeFirstMoveToGoal, EnemyForStrike, 10.0000000,, 1);
    MoveToPosCmd = none;
    Outer.PawnLookAtActor(EnemyForStrike);
    Outer.bEnableReactiveAttack = true;
    Outer.TimeStampTaunt = Outer.WorldInfo.TimeSeconds;
    TauntCommand = Outer.CmdSpecialMove(Class'LPSM_StalkerTaunt', true, 0.0000000, 6.0000000,,, false);
    TauntCommand = none;
    Outer.PopCommand(self);
    stop;            
}
