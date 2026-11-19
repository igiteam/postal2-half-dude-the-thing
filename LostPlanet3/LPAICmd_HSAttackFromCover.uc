class LPAICmd_HSAttackFromCover extends LPAICmd_Attack within LPAIControllerHumanSoldier;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToCoverCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FireFromCoverCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PeekFromCoverCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int DamageReceivedAfterLastShooting;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHasEnemyAndCoverAction[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTooLongInTheSameCover[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTooLongNoCoverAction[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bChangingDirection[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDamagedWhilePeeking[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAttackingPlayer[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStampNoCoverAction[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL VelocityChangingDirection[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FiringCooldownTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimePeeking[536870913];

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
    // End:0xE4
    if(((Outer.FireTarget != none) && Outer.MainEnemy != none) && Outer.FireTarget != Outer.MainEnemy)
    {
        Outer.AISetFireTarget(none);
    }
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

function GetPctgBestCover()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.CoverExplorer.GetPctgBestCover(Outer.CoverGoal);
    //return ReturnValue;    
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
    // End:0x200
    if((bNeedToChangeCover && !Outer.CoverExplorer.DoesItNeedImmediateReaction(InvalidReason)) && Outer.WeaponIsFiring())
    {
        return;
    }
    // End:0x2FD
    if(bNeedToChangeCover)
    {
        // End:0x25E
        if(int(InvalidReason) == int(3))
        {
            Outer.MyLPSquad.PlayGrenadeWarningSound(Outer);
        }
        // End:0x29B
        if(HasBetterCover())
        {
            Outer.AIClearCoverGoal();
            GotoState('MovingToBestCover',, true);            
        }
        else
        {
            // End:0x2FB
            if(Outer.CoverExplorer.DoesItNeedImmediateReaction(InvalidReason))
            {
                Outer.PopCommand(self);
            }
        }
        return;
    }
    //return;    
}

state StateCmdActive
{Begin:

    Outer.SetAttackResourceNames();
    bAttackingPlayer = LPPlayerPawn(EnemyForAttack) != none;
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

        bChangingDirection = NextStateName == 'MovingToBestCover';
        // End:0x69
        if(bChangingDirection)
        {
            VelocityChangingDirection = Outer.myAIPawn.Velocity;
        }
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
        MoveToCoverCmd = Outer.CmdMoveToCover(Outer.PotentialCoverGoal,,, true);
        MoveToCoverCmd.AddActorConstraint(EnemyForAttack, Outer.HumanSoldierPawn.TuneDataHumanSoldier.KeepDistanceFromEnemy);
        // End:0xF2
        if(bChangingDirection)
        {
            MoveToCoverCmd.SetStartVelocity(VelocityChangingDirection);
        }
        //return;        
    }
    J0x00:
    // End:0x59 [Loop If]
    if(!Outer.CoverExplorer.bFirstTraversalFinished)
    {
        Outer.Sleep(0.0000000);
        // [Loop Continue]
        goto J0x00;
    }
    // End:0x16F
    if((Outer.CoverGoal.Link == none) || !Outer.CoverIsIn())
    {
        Outer.PotentialCoverGoal.Link = none;
        J0xE9:

        // End:0x16F [Loop If]
        if(Outer.PotentialCoverGoal.Link == none)
        {
            // End:0x14F
            if(Outer.AIWantsToAttackFromCover())
            {
                MoveToCover();                
            }
            else
            {
                Outer.Sleep(0.1000000);
            }
            // [Loop Continue]
            goto J0xE9;
        }
    }
    J0x16F:

    // End:0x1F7 [Loop If]
    if(!Outer.CoverIsIn())
    {
        // End:0x1D7
        if(!MyPawn.IsDoingASpecialMove())
        {
            Outer.PopCommand(self);
        }
        Outer.Sleep(0.1000000);
        // [Loop Continue]
        goto J0x16F;
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
        Outer.ClearTimer('CheckWantToStopPeeking', self);
        Outer.ClearTimer('StopPeeking', self);
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
        Outer.AbortCommand(PeekFromCoverCmd);
        PeekFromCoverCmd = none;
        //return;        
    }

    event @NULL Bump()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal;

        // End:0xE5
        if(SPPawn(Other) != none)
        {
            Outer.CoverExplorer.CoverTraversal.SetRatingOverTime(Outer.CoverGoal, 8, -100.0000000, 10.0000000, 300.0000000);
            Outer.CoverExplorer.InvalidCover(Outer.CoverGoal, 4);
        }
        //return;        
    }

    private final function SelectEnemyAndCoverAction()
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
                if(!Outer.CoverActionForEnemy(Outer.CoverGoal, LPEnemy, CoverAction))
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
        if(Outer.WeaponIsFiring() && DamageReceivedAfterLastShooting > Outer.HumanSoldierPawn.TuneDataHumanSoldier.DamageToStopShootingInCover)
        {
            Outer.WeaponStopFiringWhenBurstFinish();
        }
        // End:0x14F
        if(PeekFromCoverCmd != none)
        {
            bDamagedWhilePeeking = true;
            Outer.SetTimer(Outer.HumanSoldierPawn.TuneDataHumanSoldier.ReactionTimeGettingShotWhilePeeking, false, 'StopPeeking', self);
        }
        //return;        
    }

    function TooLongSameCover()
    {
        // End:0x168
        if(Outer.RecentDamageDoneInCover < Outer.HumanSoldierPawn.TuneDataHumanSoldier.MinDamageExtraTimeSameCover)
        {
            // End:0xFB
            if(Outer.bFlankingGuy)
            {
                Outer.SetTimer(Outer.HumanSoldierPawn.TuneDataHumanSoldier.FlankingGuyExtraTimeSameCoverWhenLittleDamage, false, 'TooLongSameCoverExtraTime', self);                
            }
            else
            {
                Outer.SetTimer(Outer.HumanSoldierPawn.TuneDataHumanSoldier.ExtraTimeSameCoverWhenLittleDamage, false, 'TooLongSameCoverExtraTime', self);
            }
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
        if(!EnemyForAttack.IsInCover() && EnemyForAttack.TimeSinceCover() < Outer.HumanSoldierPawn.TuneDataHumanSoldier.TimeWaitEnemyChooseCover)
        {
            return true;
        }
        // End:0x226
        if((((Outer.MyLPSquad.SquadMembers.Length > 1) && EnemyForAttack.AIResourceManager != none) && EnemyForAttack.AIResourceManager.GetAUser(Outer.FireResourceName) == none) && (Outer.WorldInfo.TimeSeconds - EnemyForAttack.AIResourceManager.GetLastHadUserTime(Outer.FireResourceName)) < Outer.HumanSoldierPawn.TuneDataHumanSoldier.TimeWaitForAllySuppressionFire)
        {
            return true;
        }
        // End:0x2E3
        if((float(Outer.MyLPSquad.GetNumMembersInCover()) / float(Outer.MyLPSquad.GetNumMembersUsingCover())) < Outer.HumanSoldierPawn.TuneDataHumanSoldier.MinPctgPeopleInCover)
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }

    function WantsToChangeCover()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private float distanceToEnemy, MinPctg;

        // End:0x212
        if(Outer.RecentDamageDoneInCover > Outer.HumanSoldierPawn.TuneDataHumanSoldier.DamageToReactMoving)
        {
            // End:0x212
            if(!ShouldIWaitToChangeCover())
            {
                Outer.CoverExplorer.CoverTraversal.SetRatingOverTime(Outer.CoverGoal, 4, Outer.HumanSoldierPawn.TuneDataHumanSoldier.DamagedNegativeRating, Outer.HumanSoldierPawn.TuneDataHumanSoldier.DamagedNegativeRatingTime, Outer.HumanSoldierPawn.TuneDataHumanSoldier.DamagedNegativeRatingSpreadDistance);
                Outer.CoverExplorer.InvalidCover(Outer.CoverGoal, 7);
                return true;
            }
        }
        // End:0x4B3
        if((!bHasEnemyAndCoverAction && Outer.RecentDamageDoneInCover > Outer.HumanSoldierPawn.TuneDataHumanSoldier.NoCoverActionDamageToReactMoving) && (Outer.WorldInfo.TimeSeconds - TimeStampNoCoverAction) > Outer.HumanSoldierPawn.TuneDataHumanSoldier.NoCoverActionTimeReactWhenDamaged)
        {
            Outer.CoverExplorer.CoverTraversal.SetRatingOverTime(Outer.CoverGoal, 9, Outer.HumanSoldierPawn.TuneDataHumanSoldier.DamagedNegativeRating, Outer.HumanSoldierPawn.TuneDataHumanSoldier.DamagedNegativeRatingTime, Outer.HumanSoldierPawn.TuneDataHumanSoldier.DamagedNegativeRatingSpreadDistance);
            Outer.CoverExplorer.InvalidCover(Outer.CoverGoal, 11);
            return true;
        }
        // End:0x589
        if(!Outer.HasDefendZones())
        {
            distanceToEnemy = VSize(EnemyForAttack.Location - Outer.myAIPawn.Location);
            // End:0x589
            if(distanceToEnemy > Outer.HumanSoldierPawn.GetWeaponLongRange())
            {
                // End:0x589
                if(!ShouldIWaitToChangeCover())
                {
                    return true;
                }
            }
        }
        // End:0x7A4
        if(bTooLongInTheSameCover)
        {
            // End:0x60D
            if(Outer.bFlankingGuy)
            {
                MinPctg = Outer.HumanSoldierPawn.TuneDataHumanSoldier.FlankingGuyMinPctgBetterToChangeWhenTooLongSameCover;                
            }
            else
            {
                MinPctg = Outer.HumanSoldierPawn.TuneDataHumanSoldier.MinPctgBetterToChangeWhenTooLongSameCover;
            }
            // End:0x7A4
            if((GetPctgBestCover()) > MinPctg)
            {
                // End:0x7A1
                if(!ShouldIWaitToChangeCover())
                {
                    Outer.CoverExplorer.CoverTraversal.SetRatingOverTime(Outer.CoverGoal, 5, Outer.HumanSoldierPawn.TuneDataHumanSoldier.SameCoverRating, Outer.HumanSoldierPawn.TuneDataHumanSoldier.SameCoverRatingTime);
                    Outer.WeaponStopFiringWhenBurstFinish();
                    return true;
                }                
            }
        }
        // End:0x8BC
        if(bTooLongNoCoverAction)
        {
            // End:0x8BC
            if(!ShouldIWaitToChangeCover())
            {
                Outer.CoverExplorer.CoverTraversal.SetRatingOverTime(Outer.CoverGoal, 5, Outer.HumanSoldierPawn.TuneDataHumanSoldier.NoCoverActionRating, Outer.HumanSoldierPawn.TuneDataHumanSoldier.NoCoverActionRatingTime);
                return true;
            }
        }
        return false;
        //return ReturnValue;        
    }

    function WantsToThrowGrenade()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private int EnemyIdx;
        local /*0x97E50000-0x00000000*/ private @NULL GrenadeWeapon;

        // End:0x26
        if(!Outer.bCanThrowGrenades)
        {
            return false;
        }
        // End:0x40
        if(LPPlayerPawn(EnemyForAttack) == none)
        {
            return false;
        }
        EnemyIdx = Outer.MyLPSquad.GetEnemyIndex(EnemyForAttack);
        // End:0x9C
        if(EnemyIdx == -1)
        {
            return false;
        }
        // End:0x170
        if((Outer.WorldInfo.TimeSeconds - Outer.MyLPSquad.EnemyList[EnemyIdx].TimeStampThrownGrenade) < Outer.HumanSoldierPawn.TuneDataHumanSoldier.MinTimeBetweenGrenades)
        {
            return false;
        }
        // End:0x196
        if(!EnemyForAttack.IsInCover())
        {
            return false;
        }
        // End:0x26A
        if((Outer.WorldInfo.TimeSeconds - Outer.MyLPSquad.EnemyList[EnemyIdx].TimeStampDetectedInThisCover) < Outer.HumanSoldierPawn.TuneDataHumanSoldier.MinTimeSameCoverThrowGrenade)
        {
            return false;
        }
        GrenadeWeapon = Outer.HumanSoldierPawn.GetGrenade();
        // End:0x2DF
        if((GrenadeWeapon == none) || !GrenadeWeapon.HasGrenades())
        {
            return false;
        }
        return true;
        //return ReturnValue;        
    }

    function WantsToShoot()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL PawnFireTarget, PlayerPawnFireTarget, FriendShooting;

        // End:0x63
        if(Outer.HumanSoldierPawn.MyWeapon.MyGFTuneDataWeapon.bCloseRangeWeapon)
        {
            return false;
        }
        // End:0x89
        if(!Outer.WantsToStartFiring())
        {
            return false;
        }
        // End:0xE3
        if(float(DamageReceivedAfterLastShooting) > Outer.HumanSoldierPawn.TuneDataHumanSoldier.DamageReactShootingBack)
        {
            return true;
        }
        PawnFireTarget = LPPawn(Outer.FireTarget);
        // End:0x125
        if(PawnFireTarget == none)
        {
            return true;
        }
        // End:0x27A
        if((PawnFireTarget != none) && PawnFireTarget.AIResourceManager != none)
        {
            // End:0x27A
            if(PawnFireTarget.AIResourceManager.HasLeechAround(Outer.HumanSoldierPawn.TuneDataHumanSoldier.MinDistanceLeechAround))
            {
                // End:0x27A
                if(PawnFireTarget.AIResourceManager.GetTimeSinceLastUsed(Outer.FireResourceName) < Outer.HumanSoldierPawn.TuneDataHumanSoldier.MinTimeNoFiringWhenLeechAround)
                {
                    return false;
                }
            }
        }
        // End:0x477
        if(Outer.IsThereFireAccess(PawnFireTarget) && !Outer.CanHaveFireAccess(PawnFireTarget))
        {
            PlayerPawnFireTarget = LPPlayerPawn(PawnFireTarget);
            // End:0x475
            if(PlayerPawnFireTarget != none)
            {
                // End:0x475
                if(Outer.IsInPlayerLookingDirection(Outer.HumanSoldierPawn, PlayerPawnFireTarget, Outer.HumanSoldierPawn.TuneDataHumanSoldier.DegreesOutOfViewStartShooting))
                {
                    FriendShooting = LPPawn(PawnFireTarget.AIResourceManager.GetAUser(Outer.FireResourceName));
                    // End:0x475
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

    function CheckWantToStopPeeking()
    {
        // End:0xD1
        if((WantsToShoot()) && Outer.IsEnemyVisible(EnemyForAttack))
        {
            Outer.SetTimer(Outer.HumanSoldierPawn.TuneDataHumanSoldier.ReactionTimePlayerExposedWhilePeeking, false, 'StopPeeking', self);
            Outer.ClearTimer('CheckWantToStopPeeking', self);            
        }
        else
        {
            // End:0xEB
            if(WantsToThrowGrenade())
            {
                StopPeeking();                
            }
            else
            {
                // End:0x10F
                if(WantsToChangeCover())
                {
                    // End:0x10F
                    if(HasBetterCover())
                    {
                        StopPeeking();
                    }
                }
            }
        }
        //return;        
    }

    function WantsToCharge()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL EnemyPlayer;

        // End:0x65
        if(!Outer.HumanSoldierPawn.MyWeapon.MyGFTuneDataWeapon.bCloseRangeWeapon)
        {
            return false;
        }
        // End:0x74
        if(HasBetterCover())
        {
            return false;
        }
        // End:0xF7
        if(Outer.HumanSoldierPawn.TimeSinceCover() < Outer.HumanSoldierPawn.TuneDataHumanSoldier.ChargeMinTimeInCover)
        {
            return false;
        }
        EnemyPlayer = LPPlayerPawn(EnemyForAttack);
        // End:0x124
        if(EnemyPlayer == none)
        {
            return true;
        }
        // End:0x1D9
        if((Outer.WorldInfo.TimeSeconds - EnemyPlayer.CombatLineOfFire.TimeStamp) > Outer.HumanSoldierPawn.TuneDataHumanSoldier.ChargeMaxTimePlayerNotFiring)
        {
            return true;
        }
        // End:0x27A
        if(EnemyPlayer.GetDegreesToLineOfFire(Outer.HumanSoldierPawn.Location) < Outer.HumanSoldierPawn.TuneDataHumanSoldier.ChargeMinDegreesToLineOfFire)
        {
            return false;
        }
        // End:0x29E
        if(EnemyPlayer.IsFiring())
        {
            return true;
        }
        // End:0x35A
        if(((Outer.MyLPSquad.SquadMembers.Length > 1) && EnemyForAttack.AIResourceManager != none) && EnemyForAttack.AIResourceManager.GetAUser(Outer.FireResourceName) != none)
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }

    function WantsQuickPeek()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return Outer.HumanSoldierPawn.TuneDataHumanSoldier.ShouldQuickPeek();
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
    Outer.Sleep(Outer.HumanSoldierPawn.TuneDataHumanSoldier.DelayEnterCoverAndStartShooting);
    // End:0x134
    if(Outer.bFlankingGuy)
    {
        Outer.SetTimer(Outer.HumanSoldierPawn.TuneDataHumanSoldier.FlankingGuyMaxTimeShootingFromTheSameCover, false, 'TooLongSameCover', self);        
    }
    else
    {
        Outer.SetTimer(Outer.HumanSoldierPawn.TuneDataHumanSoldier.MaxTimeShootingFromTheSameCover, false, 'TooLongSameCover', self);
    }
    J0x19F:

    FiringCooldownTime = Outer.WeaponFiringCooldownTime(EnemyForAttack);
    J0x1D1:

    // End:0x2AB [Loop If]
    if((Outer.WorldInfo.TimeSeconds - Outer.TimeStampLastTimeFiring) < FiringCooldownTime)
    {
        Outer.Sleep(FiringCooldownTime - (Outer.WorldInfo.TimeSeconds - Outer.TimeStampLastTimeFiring));
        // [Loop Continue]
        goto J0x1D1;
    }
    bHasEnemyAndCoverAction = false;
    TimeStampNoCoverAction = Outer.WorldInfo.TimeSeconds;
    J0x2F4:

    // End:0x645 [Loop If]
    if(!bHasEnemyAndCoverAction)
    {
        bHasEnemyAndCoverAction = SelectEnemyAndCoverAction();
        // End:0x642
        if(!bHasEnemyAndCoverAction)
        {
            // End:0x378
            if(!Outer.CoverIsIn())
            {
                Outer.AIClearCoverGoal();
                GotoState('MovingToBestCover');
            }
            // End:0x3B9
            if(Outer.CoverActionIsDoing())
            {
                Outer.CoverResetAction();
            }
            // End:0x553
            if((Outer.WorldInfo.TimeSeconds - TimeStampNoCoverAction) > Outer.HumanSoldierPawn.TuneDataHumanSoldier.MaxTimeNoCoverAction)
            {
                // End:0x4C9
                if(Outer.bFlankingGuy && (GetPctgBestCover()) > Outer.HumanSoldierPawn.TuneDataHumanSoldier.FlankingGuyMinPctgBetterToChangeWhenNoCoverAction)
                {
                    TooLongNoCoverAction();
                }
                // End:0x553
                if(!Outer.bFlankingGuy && (GetPctgBestCover()) > Outer.HumanSoldierPawn.TuneDataHumanSoldier.MinPctgBetterToChangeWhenNoCoverAction)
                {
                    TooLongNoCoverAction();                    
                }
            }
            // End:0x5D7
            if(WantsToChangeCover())
            {
                // End:0x5D7
                if(HasBetterCover())
                {
                    Outer.MyLPSquad.PlayMoveForwardSound(Outer);
                    Outer.AIClearCoverGoal();
                    GotoState('MovingToBestCover');
                }
            }
            // End:0x625
            if(WantsToCharge())
            {
                Outer.bScriptedCanUseCover = false;
                Outer.PopCommand(self);
            }
            Outer.Sleep(0.2500000);
        }
        // [Loop Continue]
        goto J0x2F4;
    }
FireFromCover:


    // End:0x78D
    if(WantsToThrowGrenade())
    {
        Outer.MyLPSquad.ThrowingGrenadeToEnemy(EnemyForAttack);
        Outer.PullOutGrenade();
        Outer.Sleep(Outer.HumanSoldierPawn.TuneDataHumanSoldier.TimeHoldGrenadeBeforeThrowing);
        Outer.ThrowGrenade();
        Outer.Sleep(Outer.HumanSoldierPawn.TuneDataHumanSoldier.TimeCooldownAfterGrenadeThrow);
    }
    // End:0x835
    if(WantsQuickPeek())
    {
        PeekFromCoverCmd = Outer.CmdPeekFromCover(,,, Outer.HumanSoldierPawn.TuneDataHumanSoldier.GetQuickPeekTime());
        StopPeeking();
        Outer.Sleep(0.5000000);
    }
    // End:0x8EB
    if(!WantsToShoot())
    {
        TimePeeking = RandRange(Outer.HumanSoldierPawn.TuneDataHumanSoldier.MinTimePeekBeforeFiring, Outer.HumanSoldierPawn.TuneDataHumanSoldier.MaxTimePeekBeforeFiring);        
    }
    else
    {
        // End:0x99F
        if(bAttackingPlayer)
        {
            TimePeeking = RandRange(Outer.HumanSoldierPawn.TuneDataHumanSoldier.MinTimePeekWhileWaiting, Outer.HumanSoldierPawn.TuneDataHumanSoldier.MaxTimePeekWhileWaiting);            
        }
        else
        {
            TimePeeking = 0.0000000;
        }
    }
    bDamagedWhilePeeking = false;
    // End:0xA29
    if(TimePeeking > 0.0000000)
    {
        Outer.SetTimer(0.1000000, true, 'CheckWantToStopPeeking', self);
        PeekFromCoverCmd = Outer.CmdPeekFromCover(,,, TimePeeking);
    }
    // End:0xA98
    if(WantsToShoot())
    {
        Outer.GetFireAccess(EnemyForAttack, true);
        FireFromCoverCmd = Outer.CmdFireFromCover();
        StopFiring();        
    }
    else
    {
        Outer.Sleep(RandRange(Outer.HumanSoldierPawn.TuneDataHumanSoldier.MinTimeBetweenPeeks, Outer.HumanSoldierPawn.TuneDataHumanSoldier.MaxTimeBetweenPeeks));
    }
    // End:0xBCE
    if(WantsToChangeCover())
    {
        // End:0xBCE
        if(HasBetterCover())
        {
            Outer.MyLPSquad.PlayMoveForwardSound(Outer);
            Outer.AIClearCoverGoal();
            GotoState('MovingToBestCover');
        }
    }
    // End:0xC1C
    if(WantsToCharge())
    {
        Outer.bScriptedCanUseCover = false;
        Outer.PopCommand(self);
    }
    goto 'FindCoverAction';
    stop;        
}
