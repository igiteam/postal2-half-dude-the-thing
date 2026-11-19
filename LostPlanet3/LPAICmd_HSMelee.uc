class LPAICmd_HSMelee extends LPAICmd_CoverAIMelee within LPAIControllerHumanSoldier;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToActorCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StrikeCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMeleeHitEnemy;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStampStartedMovingToStrike;

function Pushed()
{
    super(LPAICmd_Strike).Pushed();
    //return;    
}

function Popped()
{
    GotoState('None');
    super(LPAICmd_Strike).Popped();
    //return;    
}

function SetDesiredEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];

    super(LPAICmd_Strike).SetDesiredEnemy(InEnemy);
    //return;    
}

event MeleeHitSomethingNew()
{
    local /*0x97E50000-0x00000000*/ private @NULL Info[25296897];

    // End:0x103
    if((!bMeleeHitEnemy && EnemyForStrike != none) && LPPawn(Info.Impact.HitActor) != none)
    {
        // End:0x103
        if((Info.Impact.HitActor == EnemyForStrike) && Outer.HumanSoldierPawn != none)
        {
            Outer.HumanSoldierPawn.StopPawnChoreography();
            bMeleeHitEnemy = true;
        }
    }
    //return;    
}

event ImpactCombatTargetHitSomethingNew()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitActor[8388609], ImpactLocation;
    local /*0x97E50000-0x00000000*/ private name ImpactSocketName[8388609];
    local /*0x97E50000-0x00000000*/ private float ImpactRadius[8388609];
    local /*0x97E50000-0x00000000*/ private class DamageTypeToApplied[8388609];

    // End:0xB7
    if((!bMeleeHitEnemy && EnemyForStrike != none) && LPPawn(HitActor) != none)
    {
        // End:0xB7
        if((HitActor == EnemyForStrike) && Outer.HumanSoldierPawn != none)
        {
            Outer.HumanSoldierPawn.StopPawnChoreography();
            bMeleeHitEnemy = true;
        }
    }
    //return;    
}

event NotifyThatSpecialDodgeActorDodged()
{
    local /*0x97E50000-0x00000000*/ private @NULL Dodger[8388609];
    local /*0x97E50000-0x00000000*/ private class DodgePerforming[8388609];

    // End:0x14C
    if(Outer.HumanSoldierPawn != none)
    {
        Outer.HumanSoldierPawn.StopPawnChoreography();
        Outer.Focus = none;
        Outer.SetFocalPoint(Outer.Pawn.Location + (Vector(Outer.Pawn.Rotation) * Outer.HumanSoldierPawn.TuneDataHumanSoldier.DistanceAwayToSetFocalPointAfterMeleeStrike), true);
    }
    //return;    
}

state StateCmdActive
{Begin:

    GotoState('MovingToStrike');
    stop;        
}

state MovingToStrike
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        TimeStampStartedMovingToStrike = Outer.WorldInfo.TimeSeconds;
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

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

    function TimerMovingToEnemyToStrike()
    {
        local /*0x97E50000-0x00000000*/ private float separation;

        // End:0xAB
        if((Outer.WorldInfo.TimeSeconds - TimeStampStartedMovingToStrike) > Outer.HumanSoldierPawn.TuneDataHumanSoldier.MeleeTimeOut)
        {
            Outer.PopCommand(self);
        }
        separation = EnemySeperation2D();
        // End:0x152
        if((separation < Outer.HumanSoldierPawn.TuneDataHumanSoldier.DistanceDoStrike) && !Outer.IsObstacleInTheWay(EnemyForStrike))
        {
            GotoState('Striking');
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

state Striking
{
    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        StopStrike();
        //return;        
    }

    function StopStrike()
    {
        Outer.AbortCommand(StrikeCmd);
        StrikeCmd = none;
        Outer.ClearTimer('StopChoreo', self);
        //return;        
    }

    function StopChoreo()
    {
        Outer.Focus = none;
        Outer.HumanSoldierPawn.StopPawnChoreography();
        Outer.SetFocalPoint(Outer.Pawn.Location + (Vector(Outer.Pawn.Rotation) * Outer.HumanSoldierPawn.TuneDataHumanSoldier.DistanceAwayToSetFocalPointAfterMeleeStrike), true);
        //return;        
    }
Begin:

    Outer.SetTimer(0.6000000, false, 'StopChoreo', self);
    StrikeCmd = Outer.CmdSpecialMove(Class'LPSM_HSMeleeStrike',,,,, EnemyForStrike);
    StrikeCmd = none;
    Outer.PopCommand(self);
    stop;                    
}
