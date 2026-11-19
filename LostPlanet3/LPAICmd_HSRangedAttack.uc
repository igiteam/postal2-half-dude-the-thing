class LPAICmd_HSRangedAttack extends LPAICmd_Attack within LPAIControllerHumanSoldier;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToActorCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackFromCoverCommand[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackFromOpenCommand[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackFromDefendNodeCommand[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MeleeAttackCommand[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToCoverCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FireFromOpen[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SpecialMoveCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StartMovingToFormation;

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    GotoState('None');
    Outer.AISetFireTarget(none);
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

function WantsToMelee()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float separation;

    // End:0x26
    if(!Outer.bScriptedCanDoMelee)
    {
        return false;
    }
    // End:0x76
    if(!Outer.myAIPawn.TuneDataAIPawn.bCanMelee)
    {
        return false;
    }
    // End:0x9D
    if(!EnemyForAttack.IsHumanControlled())
    {
        return false;
    }
    // End:0x13F
    if((Outer.WorldInfo.TimeSeconds - Outer.TimeStampMelee) < Outer.HumanSoldierPawn.TuneDataHumanSoldier.MinTimeBetweenMelees)
    {
        return false;
    }
    separation = EnemySeperation2D();
    // End:0x1AB
    if(separation < Outer.HumanSoldierPawn.TuneDataHumanSoldier.MeleeMinPlayerDistance)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function WantsToAttackFromDefendNode()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x51
    if(Outer.CoverExplorer.CoverTraversal.FindBestDefendNode() != none)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

state StateCmdActive
{Begin:

    Outer.SetAttackResourceNames();
    GotoState('MovingToEnemy');
    stop;            
}

state MovingToEnemy
{
    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        StopMoving();
        StopFiring();
        StopSpecialMove();
        //return;        
    }

    function StopMoving()
    {
        Outer.AbortCommand(MoveToActorCmd);
        MoveToActorCmd = none;
        //return;        
    }

    function StopFiring()
    {
        Outer.AbortCommand(FireFromOpen);
        FireFromOpen = none;
        Outer.ReleaseFireAccess();
        //return;        
    }

    function StopSpecialMove()
    {
        Outer.AbortCommand(SpecialMoveCmd);
        SpecialMoveCmd = none;
        //return;        
    }

    function IsAtMovingToFormationDistance()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return VSize(EnemyForAttack.Location - Outer.Pawn.Location) < StartMovingToFormation;
        //return ReturnValue;        
    }

    function ManueverToEnemy()
    {
        MoveToActorCmd = Outer.CmdMoveToActor(EnemyForAttack, none,, Outer.CmdStatus_MoveToActor, 1, 1);
        MoveToActorCmd.__MoveAbortDelegate__Delegate = MoveToActorAbortDelegate;
        //return;        
    }

    function MoveToActorAbortDelegate()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x48
        if((IsAtMovingToFormationDistance()) && Outer.CoverExplorer.bFirstTraversalFinished)
        {
            return true;
        }
        // End:0xD1
        if(!Outer.CoverExplorer.bFirstTraversalFinished && Outer.CoverExplorer.CoverTraversal.WasAborted())
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }

    function WantsToShoot()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL PawnFireTarget, PlayerPawnFireTarget, FriendShooting;
        local /*0x97E50000-0x00000000*/ private float DistanceToTarget;

        // End:0xDF
        if((Outer.FireTarget != none) && VSize(Outer.FireTarget.Location - Outer.myAIPawn.Location) < Outer.HumanSoldierPawn.TuneDataHumanSoldier.DistanceTooCloseToMainEnemy)
        {
            return true;
        }
        // End:0x105
        if(!Outer.WantsToStartFiring())
        {
            return false;
        }
        // End:0x232
        if(Outer.HumanSoldierPawn.MyWeapon.MyGFTuneDataWeapon.bCloseRangeWeapon)
        {
            DistanceToTarget = VSize(Outer.FireTarget.Location - Outer.HumanSoldierPawn.Location);
            // End:0x232
            if(DistanceToTarget > Outer.HumanSoldierPawn.TuneDataHumanSoldier.ADSDistanceToTargetMax)
            {
                return false;
            }
        }
        PawnFireTarget = LPPawn(Outer.FireTarget);
        // End:0x460
        if(Outer.IsThereFireAccess(PawnFireTarget) && !Outer.CanHaveFireAccess(PawnFireTarget))
        {
            PlayerPawnFireTarget = LPPlayerPawn(PawnFireTarget);
            // End:0x45E
            if(PlayerPawnFireTarget != none)
            {
                // End:0x45E
                if(Outer.IsInPlayerLookingDirection(Outer.HumanSoldierPawn, PlayerPawnFireTarget, Outer.HumanSoldierPawn.TuneDataHumanSoldier.DegreesOutOfViewStartShooting))
                {
                    FriendShooting = LPPawn(PawnFireTarget.AIResourceManager.GetAUser(Outer.FireResourceName));
                    // End:0x45E
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

    // End:0x69
    if(!Outer.CoverExplorer.CoverTraversal.HasDefendZones() && !IsAtMovingToFormationDistance())
    {
        ManueverToEnemy();
    }
    Outer.PawnZeroVelocity();
    J0x88:

    // End:0x259 [Loop If]
    if(!Outer.CoverExplorer.bFirstTraversalFinished)
    {
        Outer.Sleep(0.0000000);
        // End:0x158
        if(Outer.CoverExplorer.CoverTraversal.WasAborted())
        {
            Outer.CmdStaticRangedAttack(EnemyForAttack,, 1);            
        }
        else
        {
            Outer.AISetFireTarget(EnemyForAttack);
            // End:0x20F
            if(WantsToShoot())
            {
                Outer.GetFireAccess(EnemyForAttack, true);
                FireFromOpen = Outer.CmdFireFromOpen();
                FireFromOpen = none;
                Outer.ReleaseFireAccess();                
            }
            else
            {
                SpecialMoveCmd = Outer.CmdSpecialMove(Class'LPSM_HSWaitingForCover', false,, 1.5000000,,, false);
                SpecialMoveCmd = none;
            }
        }
        // [Loop Continue]
        goto J0x88;
    }
    // End:0x277
    if(WantsToMelee())
    {
        GotoState('MeleeAttack');        
    }
    else
    {
        // End:0x2AA
        if(Outer.AIWantsToAttackFromCover())
        {
            GotoState('AttackFromCover');            
        }
        else
        {
            // End:0x2C8
            if(WantsToAttackFromDefendNode())
            {
                GotoState('AttackFromDefendNode');                
            }
            else
            {
                GotoState('AttackFromOpen');
            }
        }
    }
    stop;        
}

state MeleeAttack
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        GetStrikeAccess(EnemyForAttack);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.TimeStampMelee = Outer.WorldInfo.TimeSeconds;
        StopMoving();
        StopMelee();
        //return;        
    }

    function StopMoving()
    {
        Outer.AbortCommand(MoveToCoverCmd);
        MoveToCoverCmd = none;
        //return;        
    }

    function StopMelee()
    {
        Outer.AbortCommand(MeleeAttackCommand);
        MeleeAttackCommand = none;
        Outer.ReleaseStrikeAccess();
        //return;        
    }
Begin:

    MeleeAttackCommand = Outer.CmdCoverAIMelee(EnemyForAttack);
    StopMelee();
    GotoState('AttackFromCover');
    stop;                
}

state AttackFromDefendNode
{
    ignores BeginState;

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.ClearTimer('TimerTransitions', self);
        Outer.AbortCommand(AttackFromDefendNodeCommand);
        AttackFromDefendNodeCommand = none;
        //return;        
    }

    function TimerTransitions()
    {
        // End:0x1E
        if(WantsToMelee())
        {
            GotoState('MeleeAttack');            
        }
        else
        {
            // End:0x4E
            if(Outer.AIWantsToAttackFromCover())
            {
                GotoState('AttackFromCover');
            }
        }
        //return;        
    }
Begin:

    // End:0x7F
    if(Outer.WeaponHasAmmo())
    {
        Outer.SetTimer(0.4000000, true, 'TimerTransitions', self);
        AttackFromDefendNodeCommand = Outer.CmdAttackFromDefendNode(EnemyForAttack,, 1);
    }
    Outer.PopCommand(self);
    stop;                    
}

state AttackFromOpen
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        // End:0x82
        if(Outer.HumanSoldierPawn.MyWeapon.MyGFTuneDataWeapon.bCloseRangeWeapon)
        {
            Outer.bScriptedCanUseCover = false;
        }
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.ClearTimer('TimerTransitionToAttackFromCover', self);
        Outer.ClearTimer('StartTimerTransitions', self);
        Outer.AbortCommand(AttackFromOpenCommand);
        AttackFromOpenCommand = none;
        StopMoving();
        //return;        
    }

    function TimerTransitionToAttackFromCover()
    {
        // End:0x1E
        if(WantsToMelee())
        {
            GotoState('MeleeAttack');            
        }
        else
        {
            // End:0x72
            if(Outer.AIWantsToAttackFromCover())
            {
                // End:0x72
                if(!Outer.WeaponIsFiring())
                {
                    GotoState('AttackFromCover');
                }
            }
        }
        //return;        
    }

    function StartTimerTransitions()
    {
        Outer.SetTimer(0.4000000, true, 'TimerTransitionToAttackFromCover', self);
        //return;        
    }

    function StopMoving()
    {
        Outer.AbortCommand(MoveToActorCmd);
        MoveToActorCmd = none;
        //return;        
    }

    function ManueverToEnemy()
    {
        MoveToActorCmd = Outer.CmdMoveToActor(EnemyForAttack, none, Outer.HumanSoldierPawn.TuneDataHumanSoldier.ADSDistanceToTargetMax, Outer.CmdStatus_MoveToActor, 1);
        //return;        
    }
Begin:

    // End:0x1E3
    if(Outer.WeaponHasAmmo())
    {
        // End:0x139
        if(Outer.HumanSoldierPawn.MyWeapon.MyGFTuneDataWeapon.bCloseRangeWeapon && VSize2D(Outer.myAIPawn.Location - EnemyForAttack.Location) > Outer.HumanSoldierPawn.TuneDataHumanSoldier.ADSDistanceToTargetMax)
        {
            ManueverToEnemy();
        }
        Outer.SetTimer(Outer.HumanSoldierPawn.TuneDataHumanSoldier.MinTimeAttackFromOpen, false, 'StartTimerTransitions', self);
        AttackFromOpenCommand = Outer.CmdAttackFromOpen(EnemyForAttack);
        AttackFromOpenCommand = none;
    }
    Outer.PopCommand(self);
    stop;                    
}

state AttackFromCover
{
    ignores BeginState;

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.ClearTimer('TimerTransitionToAttackFromOpen', self);
        Outer.AbortCommand(AttackFromCoverCommand);
        AttackFromCoverCommand = none;
        //return;        
    }

    function TimerTransitionToAttackFromOpen()
    {
        // End:0x1E
        if(WantsToMelee())
        {
            GotoState('MeleeAttack');            
        }
        else
        {
            // End:0x92
            if(!Outer.AIWantsToAttackFromCover())
            {
                // End:0x92
                if(!Outer.WeaponIsFiring())
                {
                    // End:0x84
                    if(WantsToAttackFromDefendNode())
                    {
                        GotoState('AttackFromDefendNode');                        
                    }
                    else
                    {
                        GotoState('AttackFromOpen');
                    }
                }
            }
        }
        //return;        
    }
Begin:

    // End:0x7E
    if(Outer.WeaponHasAmmo())
    {
        Outer.SetTimer(0.4000000, true, 'TimerTransitionToAttackFromOpen', self);
        AttackFromCoverCommand = Outer.CmdAttackFromCover(EnemyForAttack);
    }
    Outer.PopCommand(self);
    stop;        
}

state FleeFromEnemy
{
    function FleeFromEnemy()
    {
        local /*0x97E50000-0x00000000*/ private editfixedsize array FleeFrom;
        local /*0x97E50000-0x00000000*/ private float FleeDistance;
        local /*0x97E50000-0x00000000*/ private int Idx;

        FleeDistance = 1500.0000000;
        Idx = 0;
        J0x1A:

        // End:0x9D [Loop If]
        if(Idx < Outer.LocalEnemyList.Length)
        {
            FleeFrom.AddItem(Outer.LocalEnemyList[Idx].Pawn);            
            ++Idx;
            // [Loop Continue]
            goto J0x1A;
        }
        Outer.CmdFlee(10000000.0000000, FleeDistance * float(5), FleeDistance, FleeFrom, 1);
        //return;        
    }
    J0x00:
    // End:0x11 [Loop If]
    if(true)
    {
        FleeFromEnemy();
        // [Loop Continue]
        goto J0x00;
    }
    stop;            
}

defaultproperties
{
    StartMovingToFormation=5000.0000000
}