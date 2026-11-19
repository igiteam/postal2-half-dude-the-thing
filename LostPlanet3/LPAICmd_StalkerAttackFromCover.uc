class LPAICmd_StalkerAttackFromCover extends LPAICmd_Attack within LPAIControllerStalker;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToCoverCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FireFromCoverCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PeekFromCoverCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MeleeAttackCommand[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FleeCommand[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TauntCommand[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int DamageReceivedAfterLastShooting;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHasEnemyAndCoverAction[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTooLongInTheSameCover[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTooLongNoCoverAction[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAllowPeekToBeAbortedByDamage[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMoveToCoverAborted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStampNoCoverAction[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FiringCooldownTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HideBeforePeekTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MovingToBestCoverStartTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DistanceTraveled[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LastPos[536870913];

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
    if(Outer.CoverExplorer.GetBestCover(PotentialBestCover) && PotentialBestCover != Outer.CoverGoal)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function TimerCheckValidCoverGoal()
{
    local /*0x97E50000-0x00000000*/ private byte InvalidReason, RatingFactor;
    local /*0x97E50000-0x00000000*/ private bool bNeedToChangeCover;

    // End:0xC3
    if(((Outer.bMultiplayerMode == false) && Outer.CoverGoal.Link != none) && !Outer.IsCoverSafe(Outer.CoverGoal, InvalidReason, RatingFactor))
    {
        bNeedToChangeCover = true;        
    }
    else
    {
        InvalidReason = Outer.CoverExplorer.CoverTraversal.IsValidCurrentCover(Outer.CoverGoal);
        // End:0x1B0
        if(int(InvalidReason) != int(12))
        {
            Outer.CoverExplorer.InvalidCover(Outer.CoverGoal, InvalidReason);
            bNeedToChangeCover = true;
        }
    }
    // End:0x341
    if(bNeedToChangeCover)
    {
        // End:0x287
        if(((int(InvalidReason) == int(6)) && (EnemySeperation2D()) < Outer.StalkerPawn.TuneDataStalker.DistanceTooCloseToMainEnemy) && Outer.AIWantsToMeleeWhenEnemyTooClose(EnemyForAttack))
        {
            Outer.AIClearCoverGoal();
            GotoState('MeleeAttack');            
        }
        else
        {
            // End:0x2C4
            if(HasBetterCover())
            {
                Outer.AIClearCoverGoal();
                GotoState('MovingToBestCover',, true);                
            }
            else
            {
                // End:0x31F
                if(Outer.AIWantsToMeleeWhenNoCover(EnemyForAttack))
                {
                    Outer.AIClearCoverGoal();
                    GotoState('MeleeAttack');                    
                }
                else
                {
                    Outer.PopCommand(self);
                }
            }
        }
        return;
    }
    //return;    
}

function EnemyZDiff()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Abs(Outer.StalkerPawn.Location.Z - EnemyForAttack.Location.Z);
    //return ReturnValue;    
}

function MoveAbortCondition()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float DeltaTime, EstimatedDistanceShouldHaveTraveled;

    DeltaTime = Outer.WorldInfo.TimeSeconds - MovingToBestCoverStartTime;
    // End:0x5D
    if(DeltaTime < 1.5000000)
    {
        return false;
    }
    EstimatedDistanceShouldHaveTraveled = DeltaTime * Outer.Pawn.GroundSpeed;
    // End:0xD1
    if(DistanceTraveled < (EstimatedDistanceShouldHaveTraveled * 0.2500000))
    {
        bMoveToCoverAborted = true;
        return true;
    }
    return false;
    //return ReturnValue;    
}

state StateCmdActive
{Begin:

    Outer.SetAttackResourceNames();
    SPKynapseBotHandle(Outer.myAIPawn.myKynapseHandle).PathFinder_EnableCanPathToQuery(EnemyForAttack);
    GotoState('MovingToBestCover');
    stop;                
}

state MovingToBestCover
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
        Outer.AbortCommand(MoveToCoverCmd);
        MoveToCoverCmd = none;
        //return;        
    }

    function MoveToCover()
    {
        MovingToBestCoverStartTime = Outer.WorldInfo.TimeSeconds;
        bMoveToCoverAborted = false;
        DistanceTraveled = 0.0000000;
        LastPos = Outer.Pawn.Location;
        MoveToCoverCmd = Outer.CmdMoveToCover(Outer.PotentialCoverGoal,,, false);
        MoveToCoverCmd.__MoveAbortDelegate__Delegate = MoveAbortCondition;
        //return;        
    }

    event LPCommandTick()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

        DistanceTraveled += VSize(LastPos - Outer.Pawn.Location);
        LastPos = Outer.Pawn.Location;
        //return;        
    }
Begin:

    MovingToBestCoverStartTime = Outer.WorldInfo.TimeSeconds;
    J0x3D:

    // End:0x96 [Loop If]
    if(!Outer.CoverExplorer.bFirstTraversalFinished)
    {
        Outer.Sleep(0.0000000);
        // [Loop Continue]
        goto J0x3D;
    }
    // End:0x215
    if((Outer.CoverGoal.Link == none) || !Outer.CoverIsIn())
    {
        Outer.PotentialCoverGoal.Link = none;
        // End:0x215
        if(Outer.PotentialCoverGoal.Link == none)
        {
            // End:0x1B9
            if(Outer.AIWantsToAttackFromCover())
            {
                MoveToCover();
                // End:0x1B6
                if(bMoveToCoverAborted)
                {
                    Outer.PopCommand(self);
                }                
            }
            else
            {
                // End:0x1F5
                if(Outer.AIWantsToMeleeWhenNoCover(EnemyForAttack))
                {
                    GotoState('MeleeAttack');                    
                }
                else
                {
                    Outer.PopCommand(self);
                }
            }
        }
    }
    J0x215:

    // End:0x27D [Loop If]
    if(!Outer.CoverIsIn())
    {
        // End:0x25D
        if(!MyPawn.IsDoingASpecialMove())
        {
        }
        Outer.Sleep(0.1000000);
        // [Loop Continue]
        goto J0x215;
    }
    // End:0x2B0
    if(Outer.bMultiplayerMode)
    {
        GotoState('InCover_MP');        
    }
    else
    {
        GotoState('InCover');
    }
    stop;        
}

state InCover
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        DamageReceivedAfterLastShooting = 0;
        Outer.AIResetMemoryDamage();
        bTooLongInTheSameCover = false;
        bTooLongNoCoverAction = false;
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        StopPeeking();
        StopFiring();
        Outer.ClearTimer('TooLongSameCover', self);
        Outer.ClearTimer('CheckWantToShoot', self);
        Outer.AIClearCoverAction();
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function StopFiring()
    {
        DamageReceivedAfterLastShooting = 0;
        Outer.AbortCommand(FireFromCoverCmd);
        FireFromCoverCmd = none;
        Outer.ReleaseFireAccess();
        //return;        
    }

    function StopPeeking()
    {
        // End:0x43
        if(PeekFromCoverCmd != none)
        {
            Outer.AbortCommand(PeekFromCoverCmd);
            PeekFromCoverCmd = none;
        }
        DamageReceivedAfterLastShooting = 0;
        //return;        
    }

    protected function SelectEnemyAndCoverAction()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private int Idx;
        local /*0x97E50000-0x00000000*/ private float Rating;
        local /*0x97E50000-0x00000000*/ private @NULL LPEnemy;
        local /*0x97E50000-0x00000000*/ private float BestRating;
        local /*0x97E50000-0x00000000*/ private @NULL BestEnemy, BestCoverAction, CoverAction, EnemyLocation;
        local /*0x97E50000-0x00000000*/ private float Distance;
        local /*0x97E50000-0x00000000*/ private @NULL EnemyCover;
        local /*0x97E50000-0x00000000*/ private bool bVisible;

        BestRating = 0.0000000;
        BestEnemy = none;
        Idx = 0;
        J0x25:

        // End:0x455 [Loop If]
        if(Idx < Outer.LocalEnemyList.Length)
        {
            LPEnemy = LPPawn(Outer.LocalEnemyList[Idx].Pawn);
            // End:0xD0
            if(!Outer.CanBeMyEnemy(LPEnemy))
            {                
            }
            else
            {
                // End:0x128
                if(!Outer.CoverActionForEnemy(Outer.CoverGoal, LPEnemy, CoverAction, false))
                {                    
                }
                else
                {
                    EnemyLocation = Outer.GetEnemyLocation(LPEnemy);
                    Distance = VSize(EnemyLocation - Outer.Pawn.Location);
                    Rating = Outer.GetEnemyDistanceRating(Distance);
                    // End:0x20A
                    if(LPEnemy.IsHumanControlled())
                    {
                        Rating *= 1.5000000;
                    }
                    // End:0x26A
                    if((LPEnemy == Outer.FireTarget) && Outer.WeaponIsFiring())
                    {
                        Rating *= 1.5000000;
                    }
                    // End:0x2D0
                    if(Outer.Pawn.LastHitBy == LPEnemy.Controller)
                    {
                        Rating *= 1.5000000;
                    }
                    bVisible = Outer.IsEnemyVisible(LPEnemy);
                    // End:0x322
                    if(!bVisible)
                    {
                        Rating *= 0.5000000;
                    }
                    // End:0x37A
                    if((LPEnemy != none) && !Outer.GetPlayerCover(LPEnemy, EnemyCover, false))
                    {
                        Rating *= 1.5000000;
                    }
                    // End:0x3E2
                    if(Outer.IsTooLongSinceEnemySeen(LPEnemy) || Outer.FailedPathToEnemyRecently(LPEnemy))
                    {
                        Rating *= 0.1000000;
                    }
                    // End:0x447
                    if((Rating >= 0.0000000) && Rating > BestRating)
                    {
                        BestEnemy = LPEnemy;
                        BestRating = Rating;
                        BestCoverAction = CoverAction;
                    }
                }
            }
            ++Idx;
            // [Loop Continue]
            goto J0x25;
        }
        Outer.AISetFireTarget(BestEnemy);
        // End:0x4B4
        if(BestEnemy != none)
        {
            Outer.AISetCoverAction(BestCoverAction);
        }
        return BestEnemy != none;
        //return ReturnValue;        
    }

    private final function SelectAnyCoverAction()
    {
        local /*0x97E50000-0x00000000*/ private @NULL RandomFireLink;
        local /*0x97E50000-0x00000000*/ private byte RandomCoverAction;
        local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Slot;

        Slot = Outer.CoverGoal.Link.Slots[Outer.CoverGoal.SlotIdx];
        // End:0x122
        if(int(Slot.CoverType) == int(1))
        {
            RandomCoverAction = Slot.Actions[0];
            RandomFireLink.SrcAction = RandomCoverAction;
            Outer.AISetCoverAction(RandomFireLink);            
        }
        else
        {
            RandomFireLink.SrcAction = 5;
            Outer.AISetCoverAction(RandomFireLink);
        }
        //return;        
    }

    event NotifyReceivedDamage()
    {
        local /*0x97E50000-0x00000000*/ private int Damage[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DamageInstigator[8388609];

        super(SPAICommand).NotifyReceivedDamage(Damage, DamageInstigator);
        DamageReceivedAfterLastShooting += Damage;
        // End:0xC9
        if(Outer.WeaponIsFiring() && DamageReceivedAfterLastShooting > Outer.StalkerPawn.TuneDataStalker.DamageToStopShootingInCover)
        {
            Outer.WeaponStopFiringWhenBurstFinish();
        }
        // End:0x21E
        if((((PeekFromCoverCmd != none) && bAllowPeekToBeAbortedByDamage) && !PeekFromCoverCmd.bForceEndPeek) && DamageReceivedAfterLastShooting > Outer.StalkerPawn.TuneDataStalker.DamageToStopPeeking)
        {
            PeekFromCoverCmd.ForceEndPeekInXSeconds(RandRange(Outer.StalkerPawn.TuneDataStalker.MinPeekingDamageResponseTime, Outer.StalkerPawn.TuneDataStalker.MaxPeekingDamageResponseTime));
        }
        //return;        
    }

    function TooLongSameCover()
    {
        // End:0xDA
        if(float(Outer.RecentDamageDoneInCover) < Outer.StalkerPawn.TuneDataStalker.MinDamageForExtraTimeSameCover)
        {
            Outer.SetTimer(Outer.StalkerPawn.TuneDataStalker.ExtraTimeSameCoverWhenLittleDamage, false, 'TooLongSameCoverExtraTime', self);
            return;
        }
        bTooLongInTheSameCover = true;
        //return;        
    }

    function TooLongSameCoverExtraTime()
    {
        bTooLongInTheSameCover = true;
        //return;        
    }

    function TooLongNoCoverAction()
    {
        bTooLongNoCoverAction = true;
        //return;        
    }

    function ShouldIWaitToChangeCover()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x94
        if(!EnemyForAttack.IsInCover() && EnemyForAttack.TimeSinceCover() < Outer.StalkerPawn.TuneDataStalker.TimeWaitEnemyChooseCover)
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }

    function WantsToChangeCover()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private float distanceToEnemy;

        // End:0x212
        if(Outer.RecentDamageDoneInCover > Outer.StalkerPawn.TuneDataStalker.DamageReactMoving)
        {
            // End:0x212
            if(!ShouldIWaitToChangeCover())
            {
                Outer.CoverExplorer.CoverTraversal.SetRatingOverTime(Outer.CoverGoal, 4, Outer.StalkerPawn.TuneDataStalker.DamagedNegativeRating, Outer.StalkerPawn.TuneDataStalker.DamagedNegativeRatingTime, Outer.StalkerPawn.TuneDataStalker.DamagedNegativeRatingSpreadDistance);
                Outer.CoverExplorer.InvalidCover(Outer.CoverGoal, 7);
                return true;
            }
        }
        // End:0x2FD
        if(!Outer.HasDefendZones())
        {
            distanceToEnemy = VSize(Outer.MainEnemy.Location - Outer.myAIPawn.Location);
            // End:0x2FD
            if(distanceToEnemy > Outer.StalkerPawn.GetWeaponLongRange())
            {
                // End:0x2FD
                if(!ShouldIWaitToChangeCover())
                {
                    return true;
                }
            }
        }
        // End:0x434
        if(bTooLongInTheSameCover)
        {
            // End:0x434
            if(!ShouldIWaitToChangeCover())
            {
                Outer.CoverExplorer.CoverTraversal.SetRatingOverTime(Outer.CoverGoal, 5, Outer.StalkerPawn.TuneDataStalker.SameCoverRating, Outer.StalkerPawn.TuneDataStalker.SameCoverRatingTime);
                Outer.WeaponStopFiringWhenBurstFinish();
                return true;
            }
        }
        // End:0x54C
        if(bTooLongNoCoverAction)
        {
            // End:0x54C
            if(!ShouldIWaitToChangeCover())
            {
                Outer.CoverExplorer.CoverTraversal.SetRatingOverTime(Outer.CoverGoal, 5, Outer.StalkerPawn.TuneDataStalker.NoCoverActionRating, Outer.StalkerPawn.TuneDataStalker.NoCoverActionRatingTime);
                return true;
            }
        }
        return false;
        //return ReturnValue;        
    }

    function StartCalloutSound()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL OtherStalker;

        // End:0x83
        if(Outer.StalkerPawn.TimeSinceCallout() < Outer.StalkerPawn.TuneDataStalker.MinTimeBetweenCalloutSounds)
        {
            return false;
        }
        // End:0xDA
        if((FRand() * float(100)) > Outer.StalkerPawn.TuneDataStalker.PctgCalloutSoundWhenInCover)
        {
            return false;
        }
        // End:0x20A
        foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnStalker', OtherStalker)
        {
            // End:0x155
            if(OtherStalker == Outer.StalkerPawn)
            {
                continue;                
            }
            // End:0x1C5
            if(OtherStalker.TimeSinceCallout() < Outer.StalkerPawn.TuneDataStalker.MinTimeBetweenCalloutSounds)
            {
                continue;                
            }
            // End:0x209
            if(OtherStalker.IsInCover())
            {
                OtherStalker.PlayCallOutSound();                
                return true;
            }            
        }        
        return false;
        //return ReturnValue;        
    }

    function WantsQuickPeek()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return Outer.StalkerPawn.TuneDataStalker.ShouldQuickPeek();
        //return ReturnValue;        
    }

    function WantsToShoot()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL PawnFireTarget, PlayerPawnFireTarget, FriendShooting;

        // End:0x11
        if(!bHasEnemyAndCoverAction)
        {
            return false;
        }
        // End:0x25
        if((GetFiringCoolDownTimeLeft()) > float(0))
        {
            return false;
        }
        // End:0x4B
        if(!Outer.WantsToStartFiring())
        {
            return false;
        }
        // End:0xA5
        if(float(DamageReceivedAfterLastShooting) > Outer.StalkerPawn.TuneDataStalker.DamageReactShootingBack)
        {
            return true;
        }
        PawnFireTarget = LPPawn(Outer.FireTarget);
        // End:0xE7
        if(PawnFireTarget == none)
        {
            return true;
        }
        // End:0x23C
        if((PawnFireTarget != none) && PawnFireTarget.AIResourceManager != none)
        {
            // End:0x23C
            if(PawnFireTarget.AIResourceManager.HasLeechAround(Outer.StalkerPawn.TuneDataStalker.MinDistanceLeechAround))
            {
                // End:0x23C
                if(PawnFireTarget.AIResourceManager.GetTimeSinceLastUsed(Outer.FireResourceName) < Outer.StalkerPawn.TuneDataStalker.MinTimeNoFiringWhenLeechAround)
                {
                    return false;
                }
            }
        }
        // End:0x439
        if(Outer.IsThereFireAccess(PawnFireTarget) && !Outer.CanHaveFireAccess(PawnFireTarget))
        {
            PlayerPawnFireTarget = LPPlayerPawn(PawnFireTarget);
            // End:0x437
            if(PlayerPawnFireTarget != none)
            {
                // End:0x437
                if(Outer.IsInPlayerLookingDirection(Outer.StalkerPawn, PlayerPawnFireTarget, Outer.StalkerPawn.TuneDataStalker.DegreesOutOfViewStartShooting))
                {
                    FriendShooting = LPPawn(PawnFireTarget.AIResourceManager.GetAUser(Outer.FireResourceName));
                    // End:0x437
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

    function CheckWantToShoot()
    {
        // End:0x1C
        if(WantsToShoot())
        {
            StopPeeking();
            return;            
        }
        else
        {
            // End:0x42
            if(WantsToChangeCover())
            {
                // End:0x42
                if(HasBetterCover())
                {
                    StopPeeking();
                    return;
                }
            }
        }
        Outer.SetTimer(0.1000000, false, 'CheckWantToShoot', self);
        //return;        
    }

    function GetFiringCoolDownTimeLeft()
    {
        local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], FiringCoolDownTimeLeft;

        FiringCoolDownTimeLeft = FiringCooldownTime - (Outer.WorldInfo.TimeSeconds - Outer.TimeStampLastTimeFiring);
        return FiringCoolDownTimeLeft;
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
    Outer.SetTimer(Outer.StalkerPawn.TuneDataStalker.MaxTimeShootingFromTheSameCover, false, 'TooLongSameCover', self);
FindCoverAction:


    FiringCooldownTime = Outer.WeaponFiringCooldownTime(EnemyForAttack);
    J0xE1:

    // End:0x1BB [Loop If]
    if((Outer.WorldInfo.TimeSeconds - Outer.TimeStampLastTimeFiring) < FiringCooldownTime)
    {
        Outer.Sleep(FiringCooldownTime - (Outer.WorldInfo.TimeSeconds - Outer.TimeStampLastTimeFiring));
        // [Loop Continue]
        goto J0xE1;
    }
    bHasEnemyAndCoverAction = false;
    TimeStampNoCoverAction = Outer.WorldInfo.TimeSeconds;
    J0x204:

    // End:0x440 [Loop If]
    if(!bHasEnemyAndCoverAction)
    {
        bHasEnemyAndCoverAction = SelectEnemyAndCoverAction();
        // End:0x43D
        if(!bHasEnemyAndCoverAction)
        {
            // End:0x288
            if(!Outer.CoverIsIn())
            {
                Outer.AIClearCoverGoal();
                GotoState('MovingToBestCover');
            }
            // End:0x31D
            if((Outer.WorldInfo.TimeSeconds - TimeStampNoCoverAction) > Outer.StalkerPawn.TuneDataStalker.MaxTimeNoCoverAction)
            {
                TooLongNoCoverAction();
            }
            // End:0x3C2
            if(WantsToChangeCover())
            {
                // End:0x367
                if(HasBetterCover())
                {
                    Outer.AIClearCoverGoal();
                    GotoState('MovingToBestCover');                    
                }
                else
                {
                    // End:0x3C2
                    if(bTooLongInTheSameCover || bTooLongNoCoverAction)
                    {
                        Outer.AIClearCoverGoal();
                        Outer.PopCommand(self);
                    }
                }
            }
            // End:0x420
            if(StartCalloutSound())
            {
                Outer.Sleep(1.3000000);
                Outer.StalkerPawn.PlayCallOutSound();
            }
            Outer.Sleep(0.2500000);
        }
        // [Loop Continue]
        goto J0x204;
    }
FireFromCover:


    // End:0x4F4
    if(WantsQuickPeek())
    {
        bAllowPeekToBeAbortedByDamage = true;
        PeekFromCoverCmd = Outer.CmdPeekFromCover(,,, Outer.StalkerPawn.TuneDataStalker.GetQuickPeekTime());
        StopPeeking();
        Outer.Sleep(0.5000000);
    }
    // End:0x5B7
    if(WantsToShoot())
    {
        Outer.GetFireAccess(EnemyForAttack, float(DamageReceivedAfterLastShooting) > Outer.StalkerPawn.TuneDataStalker.DamageReactShootingBack);
        FireFromCoverCmd = Outer.CmdFireFromCover();
        StopFiring();        
    }
    else
    {
        Outer.SetTimer(0.1000000, false, 'CheckWantToShoot', self);
        bAllowPeekToBeAbortedByDamage = false;
        PeekFromCoverCmd = Outer.CmdPeekFromCover();
        StopPeeking();
        Outer.ClearTimer('CheckWantToShoot', self);
    }
    // End:0x691
    if(WantsToChangeCover())
    {
        // End:0x691
        if(HasBetterCover())
        {
            Outer.AIClearCoverGoal();
            GotoState('MovingToBestCover');
        }
    }
    goto 'FindCoverAction';
    stop;                    
}

state InCover_MP extends InCover
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

    protected function SelectEnemyAndCoverAction()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL CoverAction;

        // End:0x57
        if(!Outer.CoverActionForEnemy(Outer.CoverGoal, EnemyForAttack, CoverAction, false))
        {
            return false;
        }
        Outer.AISetCoverAction(CoverAction);
        Outer.AISetFireTarget(EnemyForAttack);
        return true;
        //return ReturnValue;        
    }

    function FindCoverAction()
    {
        bHasEnemyAndCoverAction = SelectEnemyAndCoverAction();
        // End:0x1B7
        if(!bHasEnemyAndCoverAction)
        {
            // End:0x77
            if(!Outer.CoverIsIn())
            {
                Outer.AIClearCoverGoal();
                GotoState('MovingToBestCover');
                return;
            }
            // End:0x10E
            if((Outer.WorldInfo.TimeSeconds - TimeStampNoCoverAction) > Outer.StalkerPawn.TuneDataStalker.MaxTimeNoCoverAction)
            {
                TooLongNoCoverAction();
                return;
            }
            // End:0x1B7
            if(WantsToChangeCover())
            {
                // End:0x15A
                if(HasBetterCover())
                {
                    Outer.AIClearCoverGoal();
                    GotoState('MovingToBestCover');
                    return;                    
                }
                else
                {
                    // End:0x1B7
                    if(bTooLongInTheSameCover || bTooLongNoCoverAction)
                    {
                        Outer.AIClearCoverGoal();
                        Outer.PopCommand(self);
                        return;
                    }
                }
            }
        }
        //return;        
    }

    event LPCommandTick()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

        super(LPAICommand).LPCommandTick(DeltaTime);
        // End:0x3B
        if(FireFromCoverCmd == none)
        {
            // End:0x3B
            if(!bHasEnemyAndCoverAction)
            {
                FindCoverAction();
            }
        }
        //return;        
    }

    function GetMinPeekTime()
    {
        local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], CoolDownTimeLeft, MinTime, MaxTime;

        CoolDownTimeLeft = GetFiringCoolDownTimeLeft();
        // End:0x2B
        if(CoolDownTimeLeft <= float(0))
        {
            return 0.2500000;
        }
        MinTime = float(Min(int(CoolDownTimeLeft), int(RandRange(0.7500000, 1.0000000))));
        MaxTime = float(Max(int(CoolDownTimeLeft), int(MinTime + RandRange(1.0000000, 1.5000000))));
        return RandRange(MinTime, MaxTime);
        //return ReturnValue;        
    }

    function ShouldDoQuickPeek()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x16
        if((GetFiringCoolDownTimeLeft()) < 0.5000000)
        {
            return false;
        }
        return Outer.StalkerPawn.TuneDataStalker.ShouldQuickPeek();
        //return ReturnValue;        
    }

    function GetHideBeforePeekTime()
    {
        local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

        // End:0x18
        if((GetFiringCoolDownTimeLeft()) < float(0))
        {
            return 0.0000000;
        }
        return Outer.StalkerPawn.TuneDataStalker.super(InCover_MP).GetHideBeforePeekTime();
        //return ReturnValue;        
    }
Begin:

    bHasEnemyAndCoverAction = true;
    J0x0C:

    // End:0x50 [Loop If]
    if(!Outer.CoverIsIn())
    {
        Outer.Sleep(0.1000000);
        // [Loop Continue]
        goto J0x0C;
    }
    Outer.SetTimer(Outer.StalkerPawn.TuneDataStalker.MaxTimeShootingFromTheSameCover, false, 'TooLongSameCover', self);
FindCoverAction:


    FiringCooldownTime = Outer.WeaponFiringCooldownTime(EnemyForAttack);
    HideBeforePeekTime = GetHideBeforePeekTime();
    TimeStampNoCoverAction = Outer.WorldInfo.TimeSeconds;
    // End:0x173
    if((GetFiringCoolDownTimeLeft()) > 0.2500000)
    {
        Outer.Sleep(HideBeforePeekTime);
    }
    // End:0x1A6
    if((GetFiringCoolDownTimeLeft()) > 0.2500000)
    {
        Outer.ReleaseFireAccess();
    }
    // End:0x29E
    if(ShouldDoQuickPeek())
    {
        bAllowPeekToBeAbortedByDamage = true;
        PeekFromCoverCmd = Outer.CmdPeekFromCover(,,, Outer.StalkerPawn.TuneDataStalker.GetQuickPeekTime());
        StopPeeking();
        Outer.Sleep(Outer.StalkerPawn.TuneDataStalker.GetQuickPeekHideTime());
    }
    Outer.SetTimer(Outer.StalkerPawn.TuneDataStalker.GetMinPeekBeforeFireTime(GetFiringCoolDownTimeLeft()), false, 'CheckWantToShoot', self);
    bHasEnemyAndCoverAction = false;
    bAllowPeekToBeAbortedByDamage = false;
    PeekFromCoverCmd = Outer.CmdPeekFromCover(,,, Outer.StalkerPawn.TuneDataStalker.GetPeekTime());
    // End:0x3B9
    if(PeekFromCoverCmd != none)
    {
        StopPeeking();
    }
    Outer.ClearTimer('CheckWantToShoot', self);
    FindCoverAction();
    // End:0x4AF
    if(WantsToShoot())
    {
        Outer.GetFireAccess(EnemyForAttack, float(DamageReceivedAfterLastShooting) > Outer.StalkerPawn.TuneDataStalker.DamageReactShootingBack);
        FireFromCoverCmd = Outer.CmdFireFromCover();
        StopFiring();        
    }
    else
    {
        Outer.ReleaseFireAccess();
    }
    // End:0x515
    if(WantsToChangeCover())
    {
        // End:0x515
        if(HasBetterCover())
        {
            Outer.AIClearCoverGoal();
            GotoState('MovingToBestCover');
        }
    }
    Outer.Sleep(0.1000000);
    goto 'FindCoverAction';
    stop;                
}

state MeleeAttack
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        GetStrikeAccess(EnemyForAttack,, true);
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
        Outer.TimeStampReactiveAttack = Outer.WorldInfo.TimeSeconds;
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
        GotoState('MovingToBestCover');        
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
        GotoState('MovingToBestCover');        
    }
    else
    {
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
    // End:0x136
    if(Outer.AIWantsToAttackFromCover())
    {
        Outer.AIClearCoverGoal();
        GotoState('MovingToBestCover');        
    }
    else
    {
        Outer.PopCommand(self);
    }
    stop;        
}
