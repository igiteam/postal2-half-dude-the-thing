class LPAICmd_VSISSRangedAttack extends LPAICmd_Attack within LPAIControllerVSISS;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToPositionCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToActorCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FireFromOpenCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL fleeCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SpecialMoveCmd;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FormationSlotPosition[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStampStartedMoving[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWaitingForAnim[536870913];

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    OnExit();
    super.Popped();
    //return;    
}

event SPAborted()
{
    super.SPAborted();
    //return;    
}

function OnExit()
{
    GotoState('None');
    Outer.ReleaseRangedAccess();
    Outer.AISetFireTarget(none);
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

function RightShoulderUpAnimFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    //return;    
}

function LeftShoulderUpAnimFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    //return;    
}

function CanFireFromOpen()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2F
    if(!Outer.IsEnemyVisible(EnemyForAttack))
    {
        return false;
    }
    // End:0x63
    if(Outer.GetEnemyVisibleDuration(EnemyForAttack) < 1.0000000)
    {
        return false;
    }
    // End:0xCA
    if(!Outer.AIHaveLineOfFire(EnemyForAttack, Outer.Pawn.GetWeaponStartTraceLocation()))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

state StateCmdActive
{Begin:

    // End:0x38
    if(!Outer.HaveRangedAccess())
    {
        GetRangedAccess(EnemyForAttack);
    }
    Outer.AISetFireTarget(EnemyForAttack);
    // End:0xC8
    if((EnemySeperation2D()) > Outer.vsPawn.TuneDataVsISS.MaxDistanceToEnemy)
    {
        GotoState('MovingToEnemy');        
    }
    else
    {
        // End:0xE8
        if(!CanFireFromOpen())
        {
            GotoState('MovingToEnemy');            
        }
        else
        {
            GotoState('FireFromOpen');
        }
    }
    stop;        
}

state MovingToEnemy
{
    ignores BeginState;

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.AbortCommand(MoveToActorCmd);
        MoveToActorCmd = none;
        //return;        
    }

    function ManeuverToEnemy()
    {
        TimeStampStartedMoving = Outer.WorldInfo.TimeSeconds;
        MoveToActorCmd = Outer.CmdMoveToActor(EnemyForAttack, EnemyForAttack, 0.0000000, Outer.CmdStatus_MoveToPosition, 1,, false);
        MoveToActorCmd.__MoveAbortDelegate__Delegate = MoveToActorAbortDelegate;
        //return;        
    }

    function WantsToStopWhenPlayerInCover()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL PlayerEnemy;

        PlayerEnemy = LPPlayerPawn(EnemyForAttack);
        // End:0x2D
        if(PlayerEnemy == none)
        {
            return false;
        }
        // End:0x86
        if((EnemySeperation2D()) > Outer.vsPawn.TuneDataVsISS.MinDistanceUseRailgunForTentacle)
        {
            return false;
        }
        // End:0xAA
        if(EnemyForAttack.IsInCover())
        {
            return true;
        }
        // End:0x14D
        if(((PlayerEnemy != none) && PlayerEnemy.bInsideTentacleArea) && PlayerEnemy.TimeInTentacleArea() > Outer.vsPawn.TuneDataVsISS.TimeInTentacleAreaUseRailgun)
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }

    function MoveToActorAbortDelegate()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x0F
        if(WantsToStopWhenPlayerInCover())
        {
            return true;
        }
        // End:0x9C
        if((Outer.WorldInfo.TimeSeconds - TimeStampStartedMoving) < Outer.vsPawn.TuneDataVsISS.MinTimeDontInterruptMove)
        {
            return false;
        }
        // End:0xF5
        if((EnemySeperation2D()) > Outer.vsPawn.TuneDataVsISS.MinDistanceToEnemy)
        {
            return false;
        }
        // End:0x106
        if(!CanFireFromOpen())
        {
            return false;
        }
        // End:0x12A
        if(Outer.WeaponIsFiring())
        {
            return false;
        }
        return true;
        //return ReturnValue;        
    }
Begin:

    ManeuverToEnemy();
    MoveToActorCmd = none;
    Outer.PawnZeroVelocity();
    GotoState('FireFromOpen');
    stop;        
}

state FireFromOpen
{
    ignores BeginState, TimerTransitions;

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.ClearTimer('TimerTransitions', self);
        StopFiring();
        //return;        
    }

    function StopFiring()
    {
        // End:0x43
        if(FireFromOpenCmd != none)
        {
            Outer.AbortCommand(FireFromOpenCmd);
            FireFromOpenCmd = none;
        }
        //return;        
    }

    event NotifyReceivedDamage()
    {
        local /*0x97E50000-0x00000000*/ private int Damage[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DamageInstigator[8388609];

        super(SPAICommand).NotifyReceivedDamage(Damage, DamageInstigator);
        // End:0xB2
        if(((LPPlayerPawn(EnemyForAttack) == none) && LPPlayerPawn(DamageInstigator) != none) && Outer.WeaponIsFiring())
        {
            Outer.WeaponQuickFinish();
            Outer.bPickPlayerNext = true;
        }
        //return;        
    }

    function WantsCloseRangeStrike()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x39
        if(Outer.vsPawn.bForcedWeapon)
        {
            return false;
        }
        // End:0x72
        if(Outer.vsPawn.bForcedCloseRangeStrike)
        {
            return true;
        }
        // End:0xD7
        if((Outer.bPickPlayerNext && LPPlayerPawn(EnemyForAttack) == none) && Outer.GetNumAkridAlive() > 0)
        {
            return true;
        }
        // End:0x130
        if((EnemySeperation2D()) > Outer.vsPawn.TuneDataVsISS.DistanceDoCloseRangeStrike)
        {
            return false;
        }
        // End:0x1D2
        if((Outer.WorldInfo.TimeSeconds - Outer.TimeStampCloseRangeStrike) < Outer.vsPawn.TuneDataVsISS.MinTimeBetweenCloseRangeStrikes)
        {
            return false;
        }
        return true;
        //return ReturnValue;        
    }

    function WantsToUseRailgunAgainstCover()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL PlayerEnemy;

        PlayerEnemy = LPPlayerPawn(EnemyForAttack);
        // End:0x2D
        if(PlayerEnemy == none)
        {
            return false;
        }
        // End:0xA9
        if((int(Outer.vsPawn.GetActiveWeaponID()) == int(1)) || Outer.vsPawn.NumTimesFiredWeapon < 1)
        {
            return false;
        }
        // End:0xCD
        if(EnemyForAttack.IsInCover())
        {
            return true;
        }
        // End:0x15F
        if(PlayerEnemy.bInsideTentacleArea && PlayerEnemy.TimeInTentacleArea() > Outer.vsPawn.TuneDataVsISS.TimeInTentacleAreaUseRailgun)
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }
    J0x00:
    // End:0x6C [Loop If]
    if(Outer.MySPPawn.TransitionComponent.IsDoingTransition())
    {
        Outer.Sleep(0.0000000);
        // [Loop Continue]
        goto J0x00;
    }
    Outer.SetTimer(0.2500000, true, 'TimerTransitions', self);
    Outer.AISetFireTarget(EnemyForAttack);
    J0xBC:

    // End:0x1FE [Loop If]
    if(true)
    {
        // End:0xDB
        if(WantsCloseRangeStrike())
        {
            GotoState('CloseRangeStrike');
        }
        // End:0x11F
        if(WantsToUseRailgunAgainstCover())
        {
            Outer.vsPawn.SetActiveVSWeapon(1);
        }
        FireFromOpenCmd = Outer.CmdFireFromOpen();
        FireFromOpenCmd = none;
        // End:0x1BB
        if((EnemySeperation2D()) > Outer.vsPawn.TuneDataVsISS.MaxDistanceToEnemy)
        {
            GotoState('MovingToEnemy');
        }
        // End:0x1FB
        if(Outer.TimeSinceLastSeenEnemy(EnemyForAttack) > 2.0000000)
        {
            GotoState('MovingToEnemy');
        }
        // [Loop Continue]
        goto J0xBC;
    }
    stop;        
}

state CloseRangeStrike
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        Outer.TimeStampCloseRangeStrike = Outer.WorldInfo.TimeSeconds;
        SetInterruptible(false);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.vsPawn.StopCloseRangeCharge();
        StopSpecialMove();
        SetInterruptible(true);
        //return;        
    }

    function StopSpecialMove()
    {
        // End:0x43
        if(SpecialMoveCmd != none)
        {
            Outer.AbortCommand(SpecialMoveCmd);
            SpecialMoveCmd = none;
        }
        //return;        
    }
    J0x00:
    // End:0x6C [Loop If]
    if(Outer.MySPPawn.TransitionComponent.IsDoingTransition())
    {
        Outer.Sleep(0.0000000);
        // [Loop Continue]
        goto J0x00;
    }
    Outer.PawnLookAtActor(EnemyForAttack);
    // End:0x156
    if((LPAIPawnAkrid(EnemyForAttack) != none) && FRand() < Outer.vsPawn.TuneDataVsISS.ProbabilityPlaySwatAnimation)
    {
        SpecialMoveCmd = Outer.CmdSpecialMove(Class'LPSM_VSISSSwat', true, 0.0000000, 2.0000000);
        SpecialMoveCmd = none;
        GotoState('StateCmdActive');
    }
    Outer.vsPawn.StarCloseRangeCharge();
    SpecialMoveCmd = Outer.CmdSpecialMove(Class'LPSM_VSISSChargeLoop', true, 0.0000000, Outer.vsPawn.TuneDataVsISS.MaxTimeCharginEffect);
    SpecialMoveCmd = none;
    // End:0x283
    if(Outer.vsPawn.bPlayingCloseRangeCharge)
    {
        Outer.vsPawn.CloseRangeFire();
    }
    GotoState('StateCmdActive');
    stop;            
}

state FleeFromEnemy
{
    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.AbortCommand(fleeCmd);
        fleeCmd = none;
        //return;        
    }

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
        fleeCmd = Outer.CmdFlee(10000000.0000000, FleeDistance * float(5), FleeDistance, FleeFrom, 1);
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
