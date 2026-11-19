class LPAICmd_StalkerAttackFromOpen extends LPAICmd_AttackFromOpen within LPAIControllerStalker;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FormationSlotPosition[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToPositionCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DamageReceivedInThisPosition[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FireFromOpen[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTooLongSamePosition[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShouldTaunt[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PositionWhenStartedMoving[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TauntCommand[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TraversalSearchTime[536870913];

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    GotoState('None');
    Outer.ReleaseRangedAccess();
    super.Popped();
    //return;    
}

event SPAborted()
{
    super.SPAborted();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

state AttackFromOpen
{Begin:

    // End:0x40
    if(bUsingRangedCoverAIsFormation && !Outer.ShouldUseFormations())
    {
        StopUsingRangedCoverAIsFormation();        
    }
    else
    {
        // End:0x7D
        if(!bUsingRangedCoverAIsFormation && Outer.ShouldUseFormations())
        {
            StartUsingRangedCoverAIsFormation();
        }
    }
    // End:0xF5
    if((Outer.ShouldUseFormations() && IsThereRangedAccess(EnemyForAttack)) && Outer.CanHaveRangedAccess(EnemyForAttack))
    {
        GotoState('MovingToFormation');        
    }
    else
    {
        GotoState('MovingToFirePosition');
    }
    stop;                    
}

state MovingToFormation
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        StopMoving();
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function StopMoving()
    {
        Outer.AbortCommand(MoveToPositionCmd);
        MoveToPositionCmd = none;
        //return;        
    }

    function ManeuverToSlot()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Access[8388609];
        local /*0x97E50000-0x00000000*/ private int SelectedSubPos[9437185];
        local /*0x97E50000-0x00000000*/ private float CurrentDistance, ReachDistance;

        -1
        Outer.GetFormationPosition(Access, FormationSlotPosition, ReachDistance, SelectedSubPos);
        // End:0xAD
        if(Outer.HasDefendZones() && !Outer.IsInDefendZone(FormationSlotPosition))
        {
            GotoState('MovingToFirePosition');
            return;
        }
        CurrentDistance = VSize(FormationSlotPosition - MyPawn.Location);
        // End:0xFB
        if(CurrentDistance <= ReachDistance)
        {
            return;
        }
        Outer.PawnLookAtActor(EnemyForAttack);
        MoveToPositionCmd = Outer.CmdMoveToPosition(FormationSlotPosition, EnemyForAttack, ReachDistance, Outer.CmdStatus_MoveToPosition, 1, 1, false);
        //return;        
    }

    event NotifyAIResourceAccessLost()
    {
        local /*0x97E50000-0x00000000*/ private @NULL ResourceAccess[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x3A
        if(ResourceAccess == Outer.RangedAccess)
        {
            GotoState('AttackFromOpen');
        }
        return false;
        //return ReturnValue;        
    }
Begin:

    // End:0x3B
    if(!Outer.CanHaveRangedAccess(EnemyForAttack))
    {
        GotoState('FiringFromPosition');
    }
    GetRangedAccess(EnemyForAttack);
    ManeuverToSlot(Outer.RangedAccess);
    GotoState('FiringFromPosition');
    stop;        
}

state MovingToFirePosition
{
    ignores BeginState;

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        StopMoving();
        //return;        
    }

    function ManeuverToFirePosition()
    {
        Outer.PawnLookAtActor(EnemyForAttack);
        PositionWhenStartedMoving = Outer.StalkerPawn.Location;
        MoveToPositionCmd = Outer.CmdMoveToPosition(Outer.CoverExplorer.CoverTraversal.GoodOpenPosition, EnemyForAttack,, Outer.CmdStatus_MoveToPosition, 1, 1, false);
        MoveToPositionCmd.__MoveAbortDelegate__Delegate = MoveToPositionAbortDelegate;
        //return;        
    }

    function StopMoving()
    {
        Outer.AbortCommand(MoveToPositionCmd);
        MoveToPositionCmd = none;
        //return;        
    }

    function MoveToPositionAbortDelegate()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x7D
        if(Outer.HasDefendZones() && !Outer.IsInDefendZone(Outer.myAIPawn.Location))
        {
            return false;
        }
        // End:0x114
        if(VSize2D(Outer.myAIPawn.Location - PositionWhenStartedMoving) < Outer.StalkerPawn.TuneDataStalker.MinDistanceLosPositionFromMe)
        {
            return false;
        }
        // End:0x1B8
        if(Outer.IsEnemyVisible(EnemyForAttack) && Outer.GetEnemyVisibleDuration(EnemyForAttack) > Outer.StalkerPawn.TuneDataStalker.MinTimeEnemyVisibleStopMoving)
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }
Begin:

    TraversalSearchTime = 0.0000000;
    J0x0F:

    // End:0x137 [Loop If]
    if(!Outer.CoverExplorer.CoverTraversal.bFirstLookForOpenPositionFinished)
    {
        Outer.CoverExplorer.CoverTraversal.SetLookForOpenPosition(true);
        Outer.Sleep(0.1000000);
        TraversalSearchTime += 0.1000000;
        // End:0x134
        if(TraversalSearchTime > float(3))
        {
            Outer.CoverExplorer.CoverTraversal.bOpenPositionFound = false;
            // [Explicit Break]
            goto J0x137;
        }
        // [Loop Continue]
        goto J0x0F;
    }
    J0x137:

    // End:0x2FF
    if(!Outer.CoverExplorer.CoverTraversal.bOpenPositionFound)
    {
        // End:0x2B8
        if(bShouldTaunt && Outer.bMultiplayerMode)
        {
            bShouldTaunt = !bShouldTaunt;
            Outer.TimeStampTaunt = Outer.WorldInfo.TimeSeconds;
            Outer.Focus = Outer.FireTarget;
            TauntCommand = Outer.CmdSpecialMove(Class'LPSM_StalkerTaunt', true, 0.0000000, 3.0000000,,, false);
            TauntCommand = none;
            GotoState('FiringFromPosition');            
        }
        else
        {
            // End:0x2F1
            if(Outer.bMultiplayerMode)
            {
                bShouldTaunt = !bShouldTaunt;
            }
            GotoState('FiringFromPosition');
        }
    }
    ManeuverToFirePosition();
    GotoState('FiringFromPosition');
    stop;                    
}

state FiringFromPosition
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        bTooLongSamePosition = false;
        DamageReceivedInThisPosition = 0.0000000;
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        StopFiring();
        Outer.ClearTimer('TooLongSamePosition', self);
        // End:0xFE
        if((Outer.RangedAccess != none) && Outer.RangedAccess.IsValid())
        {
            Outer.ReleaseRangedAccess();
            Outer.BanFormationPosition(EnemyForAttack, Outer.RangedResourceName, FormationSlotPosition);
        }
        //return;        
    }

    function StopFiring()
    {
        Outer.AbortCommand(FireFromOpen);
        FireFromOpen = none;
        Outer.ReleaseFireAccess();
        //return;        
    }

    event NotifyReceivedDamage()
    {
        local /*0x97E50000-0x00000000*/ private int Damage[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DamageInstigator[8388609];

        super(SPAICommand).NotifyReceivedDamage(Damage, DamageInstigator);
        DamageReceivedInThisPosition += float(Damage);
        //return;        
    }

    function TooLongSamePosition()
    {
        bTooLongSamePosition = true;
        //return;        
    }

    function WantsToShoot()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL PawnFireTarget, PlayerPawnFireTarget, FriendShooting;

        // End:0x26
        if(!Outer.WantsToStartFiring())
        {
            return false;
        }
        // End:0xBD
        if((Outer.WorldInfo.TimeSeconds - Outer.TimeStampLastTimeFiring) < Outer.WeaponFiringCooldownTime(Outer.FireTarget))
        {
            return false;
        }
        // End:0x115
        if(DamageReceivedInThisPosition > Outer.StalkerPawn.TuneDataStalker.DamageReactShootingBack)
        {
            return true;
        }
        PawnFireTarget = LPPawn(Outer.FireTarget);
        // End:0x157
        if(PawnFireTarget == none)
        {
            return true;
        }
        // End:0x2AC
        if((PawnFireTarget != none) && PawnFireTarget.AIResourceManager != none)
        {
            // End:0x2AC
            if(PawnFireTarget.AIResourceManager.HasLeechAround(Outer.StalkerPawn.TuneDataStalker.MinDistanceLeechAround))
            {
                // End:0x2AC
                if(PawnFireTarget.AIResourceManager.GetTimeSinceLastUsed(Outer.FireResourceName) < Outer.StalkerPawn.TuneDataStalker.MinTimeNoFiringWhenLeechAround)
                {
                    return false;
                }
            }
        }
        // End:0x4A9
        if(Outer.IsThereFireAccess(PawnFireTarget) && !Outer.CanHaveFireAccess(PawnFireTarget))
        {
            PlayerPawnFireTarget = LPPlayerPawn(PawnFireTarget);
            // End:0x4A7
            if(PlayerPawnFireTarget != none)
            {
                // End:0x4A7
                if(Outer.IsInPlayerLookingDirection(Outer.StalkerPawn, PlayerPawnFireTarget, Outer.StalkerPawn.TuneDataStalker.DegreesOutOfViewStartShooting))
                {
                    FriendShooting = LPPawn(PawnFireTarget.AIResourceManager.GetAUser(Outer.FireResourceName));
                    // End:0x4A7
                    if(!Outer.IsInPlayerLookingDirection(FriendShooting, PlayerPawnFireTarget, Outer.StalkerPawn.TuneDataStalker.DegreesOutOfViewStartShooting))
                    {
                        return true;
                    }
                }
            }
            return false;
        }
        return true;
        //return ReturnValue;        
    }
Begin:

    // End:0x108
    if(Outer.CoverIsIn())
    {
        // End:0x63
        if(Outer.CoverActionIsDoing())
        {
            Outer.CoverResetAction();
        }
        J0x63:

        // End:0xA5 [Loop If]
        if(Outer.IsTransitioning())
        {
            Outer.Sleep(0.0000000);
            // [Loop Continue]
            goto J0x63;
        }
        Outer.CoverExit();
        J0xC6:

        // End:0x108 [Loop If]
        if(Outer.IsDoingSpecialUninteruptibleMovement())
        {
            Outer.Sleep(0.0000000);
            // [Loop Continue]
            goto J0xC6;
        }
    }
    Outer.PawnZeroVelocity();
    Outer.SetTimer(Outer.StalkerPawn.TuneDataStalker.MaxTimeChangePosition, false, 'TooLongSamePosition', self);
Firing:


    Outer.AISetFireTarget(EnemyForAttack);
    Outer.PawnLookAtActor(Outer.FireTarget);
    J0x1F7:

    // End:0x35A [Loop If]
    if(!WantsToShoot())
    {
        Outer.PawnLookAtActor(Outer.FireTarget);
        // End:0x25E
        if(bTooLongSamePosition)
        {
            GotoState('AttackFromOpen');
        }
        // End:0x2C2
        if(DamageReceivedInThisPosition > Outer.StalkerPawn.TuneDataStalker.DamageChangePosition)
        {
            GotoState('AttackFromOpen');
        }
        // End:0x33A
        if(Outer.StalkerPawn.IsGrenadeClose(Outer.StalkerPawn.Location))
        {
            GotoState('AttackFromOpen');
        }
        Outer.Sleep(0.1000000);
        // [Loop Continue]
        goto J0x1F7;
    }
    Outer.GetFireAccess(EnemyForAttack, true);
    FireFromOpen = Outer.CmdFireFromOpen();
    FireFromOpen = none;
    Outer.ReleaseFireAccess();
    GotoState('AttackFromOpen');
    stop;                    
}

defaultproperties
{
    bShouldTaunt=true
}