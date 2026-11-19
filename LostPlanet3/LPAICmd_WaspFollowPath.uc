class LPAICmd_WaspFollowPath extends LPAICmd_FollowPath within LPAIControllerFireWasp;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL WaspFollowPathData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DelayUntilNextBurstAttack;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxAngleToEnemyToFireAt;

function SetFollowPathData()
{
    local /*0x97E50000-0x00000000*/ private @NULL Data[8388609];

    super.SetFollowPathData(Data);
    WaspFollowPathData = LPAIOD_WaspFollowPath(Data);
    MaxAngleToEnemyToFireAt = Cos(WaspFollowPathData.MaxAngleToEnemyToFireAt * 0.0174533);
    //return;    
}

function Pushed()
{
    SetInterruptible(true);
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    // End:0x4D
    if(Outer.OrbitAccess != none)
    {
        Outer.ReleaseOrbitAccess();
    }
    Outer.UseAnimationNormal();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

function Paused()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewCommand[8388609];

    super.Paused(NewCommand);
    //return;    
}

state StateCmdActive
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        // End:0x65
        if((WaspFollowPathData != none) && WaspFollowPathData.bUseSwoopFlyAnimation)
        {
            Outer.UseSwoopStingAnimations();
        }
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super.EndState(NextStateName);
        Outer.UseAnimationNormal();
        //return;        
    }

    function GetEnemyToShootAt()
    {
        local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private int numEnemies;
        local /*0x97E50000-0x00000000*/ private @NULL ClosestEnemy;

        numEnemies = Outer.GetNumEnemiesWithinRangeAndAngle(WaspFollowPathData.MaxDistToEnemyToFireAt, MaxAngleToEnemyToFireAt, ClosestEnemy, none, true, WaspFollowPathData.MaxNumOfAttackers, Outer.OrbitResourceName);
        // End:0xA8
        if(numEnemies == 0)
        {
            return none;
        }
        return ClosestEnemy;
        //return ReturnValue;        
    }

    function SetDesiredEnemy()
    {
        local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];

        // End:0x19
        if(InEnemy == EnemyForAttack)
        {
            return;
        }
        // End:0x91
        if((EnemyForAttack != none) && EnemyForAttack.AIResourceManager != none)
        {
            // End:0x91
            if(Outer.OrbitAccess != none)
            {
                Outer.ReleaseOrbitAccess();
            }
        }
        // End:0xED
        if(InEnemy != none)
        {
            Outer.GetOrbitAccess(InEnemy);
            // End:0xED
            if(Outer.OrbitAccess == none)
            {
            }
        }
        global.SetDesiredEnemy(InEnemy);
        //return;        
    }

    function TickTargetCheck()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL EnemyToShootAt, MyAI;

        MyAI = LPAIPawnAkrid(MyPawn);
        EnemyToShootAt = GetEnemyToShootAt();
        // End:0x89
        if(LPPawn(EnemyToShootAt) != none)
        {
            // End:0x89
            if(!Outer.CanHaveOrbitAccess(LPPawn(EnemyToShootAt)))
            {
                EnemyToShootAt = none;
            }
        }
        SetDesiredEnemy(LPPawn(EnemyToShootAt));
        // End:0x11C
        if((Outer.Focus == none) && EnemyToShootAt != none)
        {
            Outer.UseAnimationAggressive();
            Outer.EnableAggressiveGlow(true);            
        }
        else
        {
            // End:0x190
            if((Outer.Focus != none) && EnemyToShootAt == none)
            {
                Outer.UseAnimationNormal();
                Outer.EnableAggressiveGlow(false);
            }
        }
        Outer.Focus = EnemyToShootAt;
        // End:0x21F
        if((Outer.Focus == none) && MyAI.bPerformingBurstFire)
        {
            MyAI.StopRangedBurstFire();
        }
        //return;        
    }

    function TickAttack()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL MyAI;

        // End:0x11
        if(EnemyForAttack == none)
        {
            return;
        }
        MyAI = LPAIPawnAkrid(MyPawn);
        // End:0x51
        if(MyAI.bPerformingBurstFire)
        {
            return;
        }
        // End:0x8A
        if(DelayUntilNextBurstAttack <= float(0))
        {
            DelayUntilNextBurstAttack = WaspFollowPathData.MinTimeBetweenProjectileAttacks;
        }
        DelayUntilNextBurstAttack -= DeltaTime;
        // End:0xB9
        if(DelayUntilNextBurstAttack < float(0))
        {
            FireBurst();
        }
        //return;        
    }

    function FireBurst()
    {
        local /*0x97E50000-0x00000000*/ private @NULL MyFlyer;

        // End:0x11
        if(EnemyForAttack == none)
        {
            return;
        }
        MyFlyer = LPAIPawnMedFlyer(MyPawn);
        MyFlyer.SetAimInfoForBurstFireStrike(EnemyForAttack.Location, EnemyForAttack);
        MyFlyer.StartOfRangedBurstFire();
        //return;        
    }

    function FollowPathTick()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x1A
        if(!super.FollowPathTick(DeltaTime))
        {
            return false;
        }
        TickTargetCheck(DeltaTime);
        TickAttack(DeltaTime);
        return true;
        //return ReturnValue;        
    }

    function CanAbortFollowPathFor()
    {
        local /*0x97E50000-0x00000000*/ private @NULL InPotentialEnemy[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL MyFlyer, EnemyPawn;

        EnemyPawn = LPPawn(InPotentialEnemy);
        // End:0x2D
        if(EnemyPawn == none)
        {
            return false;
        }
        MyFlyer = LPAIPawnFireWasp(MyPawn);
        // End:0xD2
        if((MyFlyer != none) && Outer.TimeSinceLastSeenEnemy(EnemyPawn) > MyFlyer.TuneDataFireWasp.MaxTimeToKeepUnseenEnemy.GetValue())
        {
            return false;
        }
        return super.CanAbortFollowPathFor(InPotentialEnemy);
        //return ReturnValue;        
    }
    stop;    
}
