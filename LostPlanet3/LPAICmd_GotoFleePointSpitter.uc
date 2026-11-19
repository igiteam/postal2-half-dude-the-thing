class LPAICmd_GotoFleePointSpitter extends LPAICmd_GotoFleePoint within LPAIControllerSpitter;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL EnemyToAvoid;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL EnemyEncountered;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float NextEnemyAttackTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeBetweenEnemyAttacks;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWantToAttack;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCalledAttackCommand;

function Pushed()
{
    super.Pushed();
    bPlowThroughActorsHitOnWayToFleePoint = true;
    Outer.SpitterPawn.SetWinchPointEnabledByIndex(0, true);
    //return;    
}

function Popped()
{
    Outer.SpitterPawn.SetWinchPointEnabledByIndex(0, false);
    super.Popped();
    //return;    
}

function Paused()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewCommand[8388609];

    // End:0x3E
    if((LPAICmd_Attack(NewCommand) != none) || LPAICmd_Strike(NewCommand) != none)
    {
        bCalledAttackCommand = true;
    }
    super(LPAICommand).Paused(NewCommand);
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super(LPAICommand).Resumed(OldCommandName);
    // End:0x89
    if(bCalledAttackCommand)
    {
        NextEnemyAttackTime = Outer.myAIPawn.WorldInfo.TimeSeconds + TimeBetweenEnemyAttacks;
        bCalledAttackCommand = false;
    }
    //return;    
}

event LPCommandTick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super.LPCommandTick(DeltaTime);
    //return;    
}

function InitFlee()
{
    super.InitFlee();
    bWantToAttack = false;
    EnemyToAvoid = LPPawn(ActorToAvoidWhileMoving);
    // End:0xA9
    if(EnemyToAvoid != none)
    {
        // End:0xA9
        if(!Outer.CanBeMyEnemy(EnemyToAvoid) || Class'LPAIObjectiveAttackSpitter'.static.FindAttackCommandFor(EnemyToAvoid) == none)
        {
            EnemyToAvoid = none;
        }
    }
    //return;    
}

function AttackEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyDirection, MyFacing;

    EnemyDirection = EnemyEncountered.Location - Outer.myAIPawn.Location;
    EnemyDirection.Z = 0.0000000;
    EnemyDirection = Normal(EnemyDirection);
    MyFacing = Vector(Outer.myAIPawn.Rotation);
    // End:0x142
    if(((MyFacing Dot EnemyDirection) < -0.5000000) && Outer.IsTailIntact())
    {
        Outer.CmdTailSwingStrike(EnemyEncountered);        
    }
    else
    {
        // End:0x18D
        if(LPBaseVSPlayerPawn(EnemyEncountered) != none)
        {
            Outer.CmdTailStingVS(EnemyEncountered, 0.0000000, true);            
        }
        else
        {
            Outer.CmdTalonStrike(EnemyEncountered,, 1);
        }
    }
    //return;    
}

function MoveToFleePoint()
{
    Outer.EnableRotation(true);
    super.MoveToFleePoint();
    //return;    
}

state MoveToFleeTarget
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        bWantToAttack = false;
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super.EndState(NextStateName);
        bWantToAttack = false;
        //return;        
    }

    event @NULL Touch()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

        // End:0xED
        if(bPlowThroughActorsHitOnWayToFleePoint && Outer.SpitterPawn.TuneDataSpitter.bAllowMovementHitOnTouch.GetValue() != float(0))
        {
            Outer.RanIntoActorWhileMoving(Other, OtherComp, vect(0.0000000, 0.0000000, 0.0000000), HitNormal);
            super(LPAICommand).Touch(Other, OtherComp, HitLocation, HitNormal);            
        }
        else
        {
            super(LPAICommand).Touch(Other, OtherComp, HitLocation, HitNormal);
        }
        //return;        
    }

    event @NULL Bump()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal;

        // End:0xE4
        if(bPlowThroughActorsHitOnWayToFleePoint && Outer.SpitterPawn.TuneDataSpitter.bAllowMovementHitOnBump.GetValue() != float(0))
        {
            Outer.RanIntoActorWhileMoving(Other, OtherComp, vect(0.0000000, 0.0000000, 0.0000000), HitNormal);
            super(LPAICommand).Bump(Other, OtherComp, HitNormal);            
        }
        else
        {
            WantToAttackEnemy(LPPawn(Other));
        }
        //return;        
    }

    event NotifyOfCoreHit()
    {
        local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
        local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
        local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        TookDamage(AmountOfDamage, TypeOfDamage);
        return false;
        //return ReturnValue;        
    }

    event NotifyOfNonCoreHit()
    {
        local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
        local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        TookDamage(AmountOfDamage, TypeOfDamage);
        return false;
        //return ReturnValue;        
    }

    function TookDamage()
    {
        local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
        local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL PawnThatHitMe;

        PawnThatHitMe = LPPawn(Outer.myAIPawn.TakeDamageParams.InstigatedByPawn);
        // End:0xF0
        if((PawnThatHitMe != none) && Outer.Seperation2D(PawnThatHitMe) < Outer.SpitterPawn.AttackSeperation_TalonAttackPof.Max)
        {
            WantToAttackEnemy(PawnThatHitMe);
        }
        //return;        
    }

    function WantToAttackEnemy()
    {
        local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];

        // End:0xEC
        if(InEnemy != none)
        {
            // End:0xEC
            if(Class'LPAIObjectiveAttackSpitter'.static.FindAttackCommandFor(InEnemy) != none)
            {
                // End:0xEC
                if((NextEnemyAttackTime < Outer.myAIPawn.WorldInfo.TimeSeconds) && !bCalledAttackCommand)
                {
                    EnemyEncountered = InEnemy;
                    Outer.AbortCommand(MoveToActorCmd);
                    bWantToAttack = true;
                }
            }
        }
        //return;        
    }

    function GotoPostMoveState()
    {
        Outer.EnableRotation(false);
        // End:0x3E
        if(bWantToAttack)
        {
            GotoState('AttackWhileFleeing');            
        }
        else
        {
            super.GotoPostMoveState();
        }
        //return;        
    }
    stop;    
}

state RotateToFacing
{
    function PreRotateTowardsFleePoint()
    {
        Outer.EnableRotation(true);
        //return;        
    }

    function PostRotateTowardsFleePoint()
    {
        Outer.EnableRotation(false);
        //return;        
    }
    stop;    
}

state AttackWhileFleeing
{Begin:

    AttackEnemy();
    Outer.Sleep(0.0000000);
    GotoState('MoveToFleeTarget');
    stop;            
}

state FailedToFindFleePoint
{Begin:

    // End:0x8D
    if(CurAttempt < MaxAttempts)
    {
        ResetAttempted();
        NextEnemyAttackTime = 0.0000000;
        Outer.CmdShortFlee(EnemyEncountered, 10.0000000, 1);
        Outer.Sleep(0.0000000);
        GotoState('StateCmdActive');        
    }
    else
    {
        PopCommandWithFaliure();
    }
    stop;                    
}

defaultproperties
{
    TimeBetweenEnemyAttacks=5.0000000
    MaxAttempts=10
}