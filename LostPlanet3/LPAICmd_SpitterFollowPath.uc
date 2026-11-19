class LPAICmd_SpitterFollowPath extends LPAICmd_FollowPath within LPAIController;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SpitterFollowPathData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DelayUntilNextBurstAttack;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxAngleToEnemyToFireAt;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeToSwitchEnemies;

function SetFollowPathData()
{
    local /*0x97E50000-0x00000000*/ private @NULL Data[8388609];

    super.SetFollowPathData(Data);
    SpitterFollowPathData = LPAIOD_SpitterFollowPath(Data);
    MaxAngleToEnemyToFireAt = Cos(SpitterFollowPathData.MaxAngleToEnemyToFireAt * 0.0174533);
    //return;    
}

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
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
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super.EndState(NextStateName);
        //return;        
    }

    function GetEnemyToShootAt()
    {
        local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private int numEnemies;
        local /*0x97E50000-0x00000000*/ private @NULL ClosestEnemy;

        numEnemies = Outer.GetNumEnemiesWithinRangeAndAngle(SpitterFollowPathData.MaxDistToEnemyToFireAt, MaxAngleToEnemyToFireAt, ClosestEnemy, none, true);
        // End:0x6E
        if(numEnemies == 0)
        {
            return none;
        }
        // End:0x191
        if(ClosestEnemy == EnemyForAttack)
        {
            // End:0x12B
            if(Outer.WorldInfo.TimeSeconds > TimeToSwitchEnemies)
            {
                numEnemies = Outer.GetNumEnemiesWithinRangeAndAngle(SpitterFollowPathData.MaxDistToEnemyToFireAt, MaxAngleToEnemyToFireAt, ClosestEnemy, EnemyForAttack, true);
            }
            // End:0x191
            if(numEnemies == 0)
            {
                ClosestEnemy = EnemyForAttack;
                TimeToSwitchEnemies = Outer.WorldInfo.TimeSeconds + 0.2500000;
            }
        }
        return ClosestEnemy;
        //return ReturnValue;        
    }

    function SetNewEnemy()
    {
        local /*0x97E50000-0x00000000*/ private @NULL NewEnemy[8388609];

        // End:0x2F
        if((EnemyForAttack == none) && NewEnemy != none)
        {
            DelayUntilNextBurstAttack = 0.0100000;
        }
        EnemyForAttack = NewEnemy;
        // End:0x5E
        if(EnemyForAttack == none)
        {
            ResumeFollowPath();            
        }
        else
        {
            TimeToSwitchEnemies = Outer.WorldInfo.TimeSeconds + RandRange(SpitterFollowPathData.MinTimeToStayOnOneTarget, SpitterFollowPathData.MaxTimeToStayOnOneTarget);
            PauseFollowPath();
        }
        //return;        
    }

    function TickTargetCheck()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL MySpitter, EnemyToShootAt;

        MySpitter = LPAIPawnSpitter(MyPawn);
        // End:0x40
        if(MySpitter.bPerformingBurstFire)
        {
            return;
        }
        EnemyToShootAt = GetEnemyToShootAt();
        // End:0x87
        if(EnemyToShootAt != EnemyForAttack)
        {
            SetNewEnemy(LPPawn(EnemyToShootAt));
        }
        Outer.Focus = EnemyToShootAt;
        //return;        
    }

    function TickAttack()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL MySpitter;

        // End:0x11
        if(EnemyForAttack == none)
        {
            return;
        }
        MySpitter = LPAIPawnSpitter(MyPawn);
        // End:0x51
        if(MySpitter.bPerformingBurstFire)
        {
            return;
        }
        // End:0x8A
        if(DelayUntilNextBurstAttack <= float(0))
        {
            DelayUntilNextBurstAttack = SpitterFollowPathData.MinTimeBetweenProjectileAttacks;
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
        local /*0x97E50000-0x00000000*/ private @NULL MySpitter;

        // End:0x11
        if(EnemyForAttack == none)
        {
            return;
        }
        MySpitter = LPAIPawnSpitter(MyPawn);
        MySpitter.SetAimInfoForBurstFireStrike(EnemyForAttack.Location, EnemyForAttack);
        MySpitter.StartOfRangedBurstFire();
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
    stop;    
}
