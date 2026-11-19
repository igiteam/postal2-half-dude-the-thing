class LPAICmd_BurrowerMeleeVS extends LPAICmd_Attack within LPAIControllerBurrower;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL EnemyVS;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackSlot[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToActorCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToPositionCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveCircleCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int DamageReceivedSinceUnderground;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStampStartSM;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DamageStopBurrowing;

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    GotoState('None');
    Outer.ReleaseMeleeAccess();
    super.Popped();
    //return;    
}

function SetDesiredEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];

    super.SetDesiredEnemy(InEnemy);
    EnemyVS = LPVSPlayerPawn(InEnemy);
    //return;    
}

function ResetDamageStopBurrowing()
{
    DamageReceivedSinceUnderground = 0;
    DamageStopBurrowing = RandRange(Outer.BurrowerPawn.TuneDataBurrower.MinDamageStopBurrowing, Outer.BurrowerPawn.TuneDataBurrower.MaxDamageStopBurrowing);
    //return;    
}

event NotifyReceivedDamage()
{
    local /*0x97E50000-0x00000000*/ private int Damage[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL DamageInstigator[8388609];

    super(SPAICommand).NotifyReceivedDamage(Damage, DamageInstigator);
    // End:0x42
    if(!Outer.PawnIsUnderground())
    {
        return;
    }
    DamageReceivedSinceUnderground += Damage;
    // End:0x7D
    if(float(DamageReceivedSinceUnderground) > DamageStopBurrowing)
    {
        GotoState('Damaged');
    }
    //return;    
}

state StateCmdActive
{Begin:

    ResetDamageStopBurrowing();
    Outer.SetAttackVSResourceNames();
    GotoState('MovingToEnemy');
    stop;                    
}

state Damaged
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        Outer.PawnUnderground(false);
        ResetDamageStopBurrowing();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.AbortCommand(ChildCommand);
        Outer.PawnUnderground(true);
        //return;        
    }
Begin:

    Outer.PawnLookAtActor(EnemyForAttack);
    Outer.PawnZeroVelocity();
    Outer.CmdSpecialMove(Class'LPSM_BurrowerWalkOut', true, 0.0000000, 4.0000000);
    Outer.CmdSpecialMove(Class'LPSM_BurrowerTauntIn', true, 0.0000000, 4.0000000);
    Outer.CmdSpecialMove(Class'LPSM_BurrowerTauntLoop', true, 0.0000000, Outer.BurrowerPawn.TuneDataBurrower.TimeSurfaceAfterDamaged);
    Outer.CmdSpecialMove(Class'LPSM_BurrowerTauntOut', true, 0.0000000, 4.0000000);
    Outer.CmdSpecialMove(Class'LPSM_BurrowerWalkIn', true, 0.0000000, 4.0000000);
    GotoState('MovingToEnemy');
    stop;        
}

state MovingToEnemy
{
    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.AbortCommand(MoveToActorCmd);
        MoveToActorCmd = none;
        //return;        
    }

    function IsAtMovingToFormationDistance()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return VSize(EnemyForAttack.Location - Outer.Pawn.Location) < Outer.BurrowerPawn.TuneDataBurrower.DistanceStartMovingToFormation;
        //return ReturnValue;        
    }
Begin:

    // End:0xBB
    if(!IsAtMovingToFormationDistance())
    {
        MoveToActorCmd = Outer.CmdMoveToActor(EnemyForAttack, none, Outer.BurrowerPawn.TuneDataBurrower.DistanceStartMovingToFormation, Outer.CmdStatus_MoveToActor, 1, 1);
        MoveToActorCmd = none;
    }
    Outer.PawnZeroVelocity();
    GotoState('MovingToFormation');
    stop;                
}

state MovingToFormation
{
    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.ClearTimer('TimerTransitionToStrike', self);
        Outer.AbortCommand(MoveCircleCmd);
        MoveCircleCmd = none;
        //return;        
    }

    function TimerTransitionToStrike()
    {
        local /*0x97E50000-0x00000000*/ private int AttackSlotIdx;

        AttackSlotIdx = EnemyVS.AIResBurrowerVS.GetFreeAttackSlot(Outer.BurrowerPawn);
        // End:0xC5
        if(AttackSlotIdx != -1)
        {
            AttackSlot = EnemyVS.AIResBurrowerVS.AttackSlots[AttackSlotIdx];
            GotoState('MovingToStrike');
        }
        //return;        
    }
Begin:

    Outer.SetTimer(0.4000000, true, 'TimerTransitionToStrike', self);
    MoveCircleCmd = Outer.CmdCircleActor(EnemyForAttack, 400.0000000, 800.0000000,, 1);
    stop;                    
}

state MovingToStrike
{
    ignores BeginState;

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.ClearTimer('TimerUpdateDestination', self);
        EnemyVS.AIResBurrowerVS.ReleaseSlot(Outer.BurrowerPawn);
        //return;        
    }

    function ManeuverToSlot()
    {
        local /*0x97E50000-0x00000000*/ private float ReachDistance;
        local /*0x97E50000-0x00000000*/ private @NULL SocketLocation, SocketRotation;

        EnemyForAttack.Mesh.GetSocketWorldLocationAndRotation(AttackSlot.Sockets.StartSocketName, SocketLocation, SocketRotation);
        Outer.SetTimer(0.4000000, true, 'TimerUpdateDestination', self);
        ReachDistance = 100.0000000;
        MoveToPositionCmd = Outer.CmdMoveToPosition(SocketLocation, EnemyForAttack, ReachDistance, Outer.CmdStatus_MoveToPosition, 1, 1);
        MoveToPositionCmd.bZeroVelocityOnFinish = true;
        //return;        
    }

    function TimerUpdateDestination()
    {
        local /*0x97E50000-0x00000000*/ private @NULL SocketLocation, SocketRotation;

        EnemyForAttack.Mesh.GetSocketWorldLocationAndRotation(AttackSlot.Sockets.StartSocketName, SocketLocation, SocketRotation);
        MoveToPositionCmd.SetDesiredDestination(SocketLocation);
        //return;        
    }
Begin:

    ManeuverToSlot();
    MoveToPositionCmd = none;
    Outer.ClearTimer('TimerUpdateDestination', self);
    SetInterruptible(false);
    Outer.PawnZeroVelocity();
    Outer.PawnUnderground(false);
    Outer.BurrowerPawn.AttackSlotSocketIdx = AttackSlot.TuneDataSocketsIdx;
    Outer.CmdSpecialMove(Class'LPSM_BurrowerVSJumpTo', true, 0.0000000, -1.0000000, 1, EnemyForAttack);
    Outer.CmdSpecialMove(Class'LPSM_BurrowerVSSucking', true, 0.0000000, -1.0000000);
    stop;        
}
