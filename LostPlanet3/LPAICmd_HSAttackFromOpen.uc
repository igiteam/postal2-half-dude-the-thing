class LPAICmd_HSAttackFromOpen extends LPAICmd_AttackFromOpen within LPAIControllerHumanSoldier;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FormationSlotPosition[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToPositionCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToActorCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DamageReceivedInThisPosition[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FireFromOpen[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTooLongSamePosition[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PositionWhenStartedMoving[536870913];

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

    // End:0x3E
    if(bUsingRangedCoverAIsFormation && Outer.HasDefendZones())
    {
        StopUsingRangedCoverAIsFormation();        
    }
    else
    {
        // End:0x7D
        if(!bUsingRangedCoverAIsFormation && !Outer.HasDefendZones())
        {
            StartUsingRangedCoverAIsFormation();
        }
    }
    // End:0xF7
    if((!Outer.HasDefendZones() && IsThereRangedAccess(EnemyForAttack)) && Outer.CanHaveRangedAccess(EnemyForAttack))
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
        MoveToPositionCmd = Outer.CmdMoveToPosition(FormationSlotPosition, EnemyForAttack, ReachDistance, Outer.CmdStatus_MoveToPosition, 1, 1, true);
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
        PositionWhenStartedMoving = Outer.HumanSoldierPawn.Location;
        MoveToPositionCmd = Outer.CmdMoveToPosition(Outer.CoverExplorer.CoverTraversal.GoodOpenPosition, EnemyForAttack,, Outer.CmdStatus_MoveToPosition, 1, 1, true);
        MoveToPositionCmd.__MoveAbortDelegate__Delegate = MoveToPositionAbortDelegate;
        //return;        
    }

    function ManeuverToEnemy()
    {
        Outer.PawnLookAtActor(EnemyForAttack);
        PositionWhenStartedMoving = Outer.HumanSoldierPawn.Location;
        /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
            
        */

        /*@Error*/;
    }

    function StopMoving()
    {
        Outer.AbortCommand(MoveToPositionCmd);
        MoveToPositionCmd = none;
        Outer.AbortCommand(MoveToActorCmd);
        MoveToActorCmd = none;
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
        if(VSize2D(Outer.myAIPawn.Location - PositionWhenStartedMoving) < Outer.HumanSoldierPawn.TuneDataHumanSoldier.MinDistanceLosPositionFromMe)
        {
            return false;
        }
        // End:0x2C7
        if(Outer.IsEnemyVisible(EnemyForAttack) && Outer.GetEnemyVisibleDuration(EnemyForAttack) > Outer.HumanSoldierPawn.TuneDataHumanSoldier.MinTimeEnemyVisibleStopMoving)
        {
            // End:0x2C7
            if(!Outer.HumanSoldierPawn.MyWeapon.MyGFTuneDataWeapon.bCloseRangeWeapon && VSize2D(Outer.myAIPawn.Location - EnemyForAttack.Location) > Outer.HumanSoldierPawn.TuneDataHumanSoldier.ADSDistanceToTargetMax)
            {
                return true;
            }
        }
        // End:0x332
        if((MoveToActorCmd != none) && Outer.CoverExplorer.CoverTraversal.bOpenPositionFound)
        {
            GotoState('MovingToFirePosition',, true);
        }
        return false;
        //return ReturnValue;        
    }
    J0x00:
    // End:0xB8 [Loop If]
    if(!Outer.CoverExplorer.CoverTraversal.bFirstLookForOpenPositionFinished)
    {
        Outer.CoverExplorer.CoverTraversal.SetLookForOpenPosition(true);
        Outer.Sleep(0.1000000);
        // [Loop Continue]
        goto J0x00;
    }
    // End:0x18F
    if(!Outer.CoverExplorer.CoverTraversal.bOpenPositionFound)
    {
        // End:0x137
        if(!Outer.HasDefendZones())
        {
            ManeuverToEnemy();            
        }
        else
        {
            // End:0x181
            if(Outer.IsInDefendZone(EnemyForAttack.Location))
            {
                ManeuverToEnemy();
            }
        }
        GotoState('FiringFromPosition');
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
        // End:0x7E
        if(DamageReceivedInThisPosition > Outer.HumanSoldierPawn.TuneDataHumanSoldier.DamageReactShootingBack)
        {
            return true;
        }
        PawnFireTarget = LPPawn(Outer.FireTarget);
        // End:0xC0
        if(PawnFireTarget == none)
        {
            return true;
        }
        // End:0x215
        if((PawnFireTarget != none) && PawnFireTarget.AIResourceManager != none)
        {
            // End:0x215
            if(PawnFireTarget.AIResourceManager.HasLeechAround(Outer.HumanSoldierPawn.TuneDataHumanSoldier.MinDistanceLeechAround))
            {
                // End:0x215
                if(PawnFireTarget.AIResourceManager.GetTimeSinceLastUsed(Outer.FireResourceName) < Outer.HumanSoldierPawn.TuneDataHumanSoldier.MinTimeNoFiringWhenLeechAround)
                {
                    return false;
                }
            }
        }
        // End:0x4B6
        if(Outer.IsThereFireAccess(PawnFireTarget) && !Outer.CanHaveFireAccess(PawnFireTarget))
        {
            PlayerPawnFireTarget = LPPlayerPawn(PawnFireTarget);
            // End:0x4B4
            if(PlayerPawnFireTarget != none)
            {
                // End:0x33E
                if(VSize(PlayerPawnFireTarget.Location - Outer.myAIPawn.Location) < Outer.HumanSoldierPawn.TuneDataHumanSoldier.DistanceTooCloseToMainEnemy)
                {
                    return true;
                }
                // End:0x4B4
                if(Outer.IsInPlayerLookingDirection(Outer.HumanSoldierPawn, PlayerPawnFireTarget, Outer.HumanSoldierPawn.TuneDataHumanSoldier.DegreesOutOfViewStartShooting))
                {
                    FriendShooting = LPPawn(PawnFireTarget.AIResourceManager.GetAUser(Outer.FireResourceName));
                    // End:0x4B4
                    if(!Outer.IsInPlayerLookingDirection(FriendShooting, PlayerPawnFireTarget, Outer.HumanSoldierPawn.TuneDataHumanSoldier.DegreesOutOfViewStartShooting))
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

    // End:0x12E
    if(Outer.CoverIsIn())
    {
        // End:0x89
        if(Outer.CoverActionIsDoing() && !Outer.CanExitCoverFromCoverAction())
        {
            Outer.CoverResetAction();
        }
        J0x89:

        // End:0xCB [Loop If]
        if(Outer.IsTransitioning())
        {
            Outer.Sleep(0.0000000);
            // [Loop Continue]
            goto J0x89;
        }
        Outer.CoverExit();
        J0xEC:

        // End:0x12E [Loop If]
        if(Outer.IsDoingSpecialUninteruptibleMovement())
        {
            Outer.Sleep(0.0000000);
            // [Loop Continue]
            goto J0xEC;
        }
    }
    Outer.PawnZeroVelocity();
    Outer.SetTimer(Outer.HumanSoldierPawn.TuneDataHumanSoldier.MaxTimeChangePosition, false, 'TooLongSamePosition', self);
Firing:


    Outer.AISetFireTarget(EnemyForAttack);
    J0x1E0:

    // End:0x306 [Loop If]
    if(!WantsToShoot())
    {
        // End:0x20A
        if(bTooLongSamePosition)
        {
            GotoState('AttackFromOpen');
        }
        // End:0x26E
        if(DamageReceivedInThisPosition > Outer.HumanSoldierPawn.TuneDataHumanSoldier.DamageChangePosition)
        {
            GotoState('AttackFromOpen');
        }
        // End:0x2E6
        if(Outer.HumanSoldierPawn.IsGrenadeClose(Outer.HumanSoldierPawn.Location))
        {
            GotoState('AttackFromOpen');
        }
        Outer.Sleep(0.1000000);
        // [Loop Continue]
        goto J0x1E0;
    }
    Outer.GetFireAccess(EnemyForAttack, true);
    FireFromOpen = Outer.CmdFireFromOpen();
    FireFromOpen = none;
    Outer.ReleaseFireAccess();
    GotoState('AttackFromOpen');
    stop;                    
}
