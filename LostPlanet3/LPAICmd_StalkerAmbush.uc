class LPAICmd_StalkerAmbush extends LPAICmd_Attack within LPAIControllerStalker;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToCoverCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MeleeAttackCommand[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TauntCommand[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FleeCommand[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DamageReceivedInCover[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CheckForStuckPos[536870913];

function Pushed()
{
    super.Pushed();
    Outer.SetTimer(0.1000000, true, 'TimerCheckValidCoverGoal', self);
    //return;    
}

function Popped()
{
    GotoState('None');
    Outer.ClearTimer('TimerCheckValidCoverGoal', self);
    SPKynapseBotHandle(Outer.myAIPawn.myKynapseHandle).PathFinder_DisableCanPathToQuery();
    Outer.ClearTimer('CheckForStuck', self);
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

function HasBetterCover()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL PotentialBestCover;

    // End:0x77
    if(Outer.CoverExplorer.GetAmbushCover(PotentialBestCover) && PotentialBestCover != Outer.CoverGoal)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function WantsToMeleeInsteadOfChangingCover()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL CoverAction, MyCover;

    // End:0x2F
    if(!Outer.AICanMelee(EnemyForAttack))
    {
        return false;
    }
    // End:0xBA
    if(Outer.CoverIsIn())
    {
        MyCover = Outer.CoverGetCurrent();
        // End:0xBA
        if(Outer.CoverActionForEnemy(MyCover, EnemyForAttack, CoverAction))
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function TimerCheckValidCoverGoal()
{
    local /*0x97E50000-0x00000000*/ private byte InvalidReason, RatingFactor;
    local /*0x97E50000-0x00000000*/ private bool bNeedToChangeCover;

    // End:0x9C
    if((Outer.CoverGoal.Link != none) && !Outer.IsCoverSafe(Outer.CoverGoal, InvalidReason, RatingFactor))
    {
        bNeedToChangeCover = true;        
    }
    else
    {
        InvalidReason = Outer.CoverExplorer.CoverTraversal.IsValidCurrentCover(Outer.CoverGoal);
        // End:0x189
        if(int(InvalidReason) != int(12))
        {
            Outer.CoverExplorer.InvalidCover(Outer.CoverGoal, InvalidReason);
            bNeedToChangeCover = true;
        }
    }
    // End:0x2F7
    if(bNeedToChangeCover)
    {
        // End:0x260
        if(((int(InvalidReason) == int(6)) && (EnemySeperation2D()) < Outer.StalkerPawn.TuneDataStalker.DistanceTooCloseToMainEnemy) && Outer.AIWantsToMeleeWhenEnemyTooClose(EnemyForAttack))
        {
            Outer.AIClearCoverGoal();
            GotoState('MeleeAttack');            
        }
        else
        {
            // End:0x29D
            if(HasBetterCover())
            {
                Outer.AIClearCoverGoal();
                GotoState('MovingToAmbushCover',, true);                
            }
            else
            {
                // End:0x2F5
                if(Outer.AIWantsToMeleeWhenNoCover(EnemyForAttack))
                {
                    Outer.AIClearCoverGoal();
                    GotoState('MeleeAttack');
                }
            }
        }
        return;
    }
    //return;    
}

function CheckForStuck()
{
    //return;    
}

state StateCmdActive
{Begin:

    Outer.SetAttackResourceNames();
    SPKynapseBotHandle(Outer.myAIPawn.myKynapseHandle).PathFinder_EnableCanPathToQuery(EnemyForAttack);
    GotoState('MovingToAmbushCover');
    stop;                
}

state MovingToAmbushCover
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
        Outer.ClearTimer('CheckForStuck', self);
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function CheckForStuck()
    {
        // End:0xBB
        if(VSize(CheckForStuckPos - Outer.Pawn.Location) < float(1))
        {
            Outer.AIClearCoverGoal();
            // End:0xAA
            if(MoveToCoverCmd != none)
            {
                Outer.AbortCommand(MoveToCoverCmd);
                MoveToCoverCmd = none;
            }
            GotoState('MeleeAttack');            
        }
        else
        {
            CheckForStuckPos = Outer.Pawn.Location;
            Outer.SetTimer(0.5000000, false, 'CheckForStuck', self);
        }
        //return;        
    }

    function StopMoving()
    {
        Outer.AbortCommand(MoveToCoverCmd);
        MoveToCoverCmd = none;
        //return;        
    }
Begin:

    // End:0x1B
    if(WantsToMeleeInsteadOfChangingCover())
    {
        GotoState('MeleeAttack');
    }
    J0x1B:

    // End:0x74 [Loop If]
    if(!Outer.CoverExplorer.bFirstTraversalFinished)
    {
        Outer.Sleep(0.0000000);
        // [Loop Continue]
        goto J0x1B;
    }
    // End:0x247
    if(Outer.CoverGoal.Link == none)
    {
        Outer.PotentialCoverGoal.Link = none;
        J0xDE:

        // End:0x247 [Loop If]
        if(Outer.PotentialCoverGoal.Link == none)
        {
            // End:0x1EB
            if(Outer.AIWantsToAttackFromCover())
            {
                CheckForStuckPos = Outer.Pawn.Location;
                Outer.SetTimer(1.0000000, false, 'CheckForStuck', self);
                MoveToCoverCmd = Outer.CmdMoveToCover(Outer.PotentialCoverGoal);                
            }
            else
            {
                // End:0x227
                if(Outer.AIWantsToMeleeWhenNoCover(EnemyForAttack))
                {
                    GotoState('MeleeAttack');                    
                }
                else
                {
                    Outer.Sleep(0.1000000);
                }
            }
            // [Loop Continue]
            goto J0xDE;
        }
    }
    J0x247:

    // End:0x300 [Loop If]
    if(!Outer.CoverIsIn())
    {
        Outer.Sleep(0.1000000);
        // End:0x2FD
        if(!MyPawn.IsDoingASpecialMove())
        {
            // End:0x2FD
            if(!Outer.CoverIsIn())
            {
                Outer.AIClearCoverGoal();
                GotoState('MeleeAttack');
            }
        }
        // [Loop Continue]
        goto J0x247;
    }
    GotoState('InCover');
    stop;        
}

state InCover
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        DamageReceivedInCover = 0.0000000;
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function TooLongSameCover()
    {
        Outer.CoverExplorer.CoverTraversal.SetRatingOverTime(Outer.CoverGoal, 5, Outer.StalkerPawn.TuneDataStalker.SameCoverRating, Outer.StalkerPawn.TuneDataStalker.SameCoverRatingTime);
        //return;        
    }

    event NotifyReceivedDamage()
    {
        local /*0x97E50000-0x00000000*/ private int Damage[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DamageInstigator[8388609];

        super(SPAICommand).NotifyReceivedDamage(Damage, DamageInstigator);
        DamageReceivedInCover += float(Damage);
        // End:0x21E
        if(DamageReceivedInCover > Outer.StalkerPawn.TuneDataStalker.AmbushDamageChangeCover)
        {
            Outer.CoverExplorer.CoverTraversal.SetRatingOverTime(Outer.CoverGoal, 4, Outer.StalkerPawn.TuneDataStalker.DamagedNegativeRating, Outer.StalkerPawn.TuneDataStalker.DamagedNegativeRatingTime, Outer.StalkerPawn.TuneDataStalker.DamagedNegativeRatingSpreadDistance);
            Outer.CoverExplorer.InvalidCover(Outer.CoverGoal, 7);
        }
        //return;        
    }

    function WantsToChangeCover()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private float distanceToEnemy;

        // End:0x11
        if(!HasBetterCover())
        {
            return false;
        }
        distanceToEnemy = VSize(Outer.MainEnemy.Location - Outer.myAIPawn.Location);
        // End:0xDD
        if(distanceToEnemy > Outer.StalkerPawn.TuneDataStalker.AmbushDistancePlayerTooFar)
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }

    function WantsToMelee()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private float separation;

        // End:0x2F
        if(!Outer.AICanMelee(EnemyForAttack))
        {
            return false;
        }
        // End:0x65
        if(Outer.HasStrikeTimerExpired(EnemyForAttack, 'StalkerMaxTimeHaveToAttack'))
        {
            return true;
        }
        separation = EnemySeperation();
        // End:0xD1
        if(separation < Outer.StalkerPawn.TuneDataStalker.MeleeMinPlayerDistance)
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }
    J0x00:
    // End:0x44 [Loop If]
    if(!Outer.CoverIsIn())
    {
        Outer.Sleep(0.1000000);
        // [Loop Continue]
        goto J0x00;
    }
    Outer.SetTimer(Outer.StalkerPawn.TuneDataStalker.AmbushTimeChangeCover, false, 'TooLongSameCover', self);
    J0xAF:

    // End:0xFE [Loop If]
    if(true)
    {
        // End:0xCE
        if(WantsToMelee())
        {
            GotoState('MeleeAttack');
        }
        // End:0xDE
        if(WantsToChangeCover())
        {
            // [Explicit Break]
            goto J0xFE;
        }
        Outer.Sleep(0.2500000);
        // [Loop Continue]
        goto J0xAF;
    }
    J0xFE:

    Outer.AIClearCoverGoal();
    GotoState('MovingToAmbushCover');
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

        StopMelee();
        //return;        
    }

    function StopMelee()
    {
        Outer.AbortCommand(MeleeAttackCommand);
        MeleeAttackCommand = none;
        Outer.ReleaseStrikeAccess();
        Outer.ResetStrikeTimer(EnemyForAttack, 'StalkerMinTimeNoAttack', Outer.StalkerPawn.TuneDataStalker.TimeNoMeleeAttackMin, Outer.StalkerPawn.TuneDataStalker.TimeNoMeleeAttackMax);
        Outer.ResetStrikeTimer(EnemyForAttack, 'StalkerMaxTimeHaveToAttack', Outer.StalkerPawn.TuneDataStalker.TimeHaveToMeleeAttackMin, Outer.StalkerPawn.TuneDataStalker.TimeHaveToMeleeAttackMax);
        //return;        
    }

    event NotifyAIResourceAccessLost()
    {
        local /*0x97E50000-0x00000000*/ private @NULL ResourceAccess[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x47
        if((ResourceAccess == Outer.StrikeAccess) && MeleeAttackCommand != none)
        {
            StopMelee();
        }
        return false;
        //return ReturnValue;        
    }
Begin:

    MeleeAttackCommand = Outer.CmdCoverAIMelee(EnemyForAttack);
    StopMelee();
    // End:0x90
    if(Outer.AIWantsToAttackFromCover())
    {
        Outer.AIClearCoverGoal();
        GotoState('MovingToAmbushCover');        
    }
    else
    {
        GotoState('FleeAfterMelee');
    }
    stop;        
}

state FleeAfterMelee
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

        super(SPStateObject).EndState(NextStateName);
        StopFlee();
        //return;        
    }

    function StopFlee()
    {
        Outer.AbortCommand(FleeCommand);
        FleeCommand = none;
        //return;        
    }

    function StartFlee()
    {
        local /*0x97E50000-0x00000000*/ private editfixedsize array FleeFrom;
        local /*0x97E50000-0x00000000*/ private float FleeDistance;

        Outer.PawnLookAtActor(EnemyForAttack);
        FleeDistance = Outer.StalkerPawn.TuneDataStalker.FleeDistanceAfterMelee;
        FleeFrom.AddItem(EnemyForAttack);        
        FleeCommand = Outer.CmdFlee(5.0000000, FleeDistance * 2.0000000, FleeDistance, FleeFrom, 1, true);
        //return;        
    }
Begin:

    StartFlee();
    FleeCommand = none;
    // End:0x67
    if(Outer.AIWantsToAttackFromCover())
    {
        Outer.AIClearCoverGoal();
        GotoState('MovingToAmbushCover');        
    }
    else
    {
        Outer.ClearStrikeTimer(EnemyForAttack, 'StalkerMinTimeNoAttack');
        GotoState('Taunt');
    }
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
        //return;        
    }
Begin:

    Outer.PawnLookAtActor(EnemyForAttack);
    Outer.PawnZeroVelocity();
    Outer.TimeStampTaunt = Outer.WorldInfo.TimeSeconds;
    TauntCommand = Outer.CmdSpecialMove(Class'LPSM_StalkerTaunt', true, 0.0000000, 4.0000000,,, false);
    TauntCommand = none;
    GotoState('MovingToAmbushCover');
    stop;        
}
