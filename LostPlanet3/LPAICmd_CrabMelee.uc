class LPAICmd_CrabMelee extends LPAICmd_Melee within LPAIControllerBaseSnowCrab;

enum CrabStrikeType
{
    CrabStrike_None,                // 0
    CrabStrike_Claw,                // 1
    CrabStrike_Pincer,              // 2
    CrabStrike_MAX                  // 3
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte PossibleStrike[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte NextCombatBehaviorDesired[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeForNextClawStrike[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeToStopStriking[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CurTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL WithdrawForChargePoint[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL AICMDFleeParams;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSavedDoOnlyForcedDirectAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIgnoreOtherWaitingAttackers[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name StrikeTimerName[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name WithdrawChargeTimerName[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeOfBreakingAttackForWaitingBuddy[536870913];

function Pushed()
{
    super.Pushed();
    TimeForNextClawStrike = 0.0000000;
    NextCombatBehaviorDesired = 0;
    bSavedDoOnlyForcedDirectAttack = Outer.bDoOnlyForcedDirectAttack;
    Outer.ResetTimeOfFirstAttackOnEnemy();
    //return;    
}

function Popped()
{
    Outer.bDoOnlyForcedDirectAttack = bSavedDoOnlyForcedDirectAttack;
    Outer.CrabPawn.SetMaxSpeedScale(Outer.CrabPawn.TuneDataIceCrab.GetNormalMaxSpeedScale(Outer.CrabPawn));
    super.Popped();
    AICMDFleeParams.FleeDangerousBots.Length = 0;
    Outer.bIgnoreStunCommands = false;
    Outer.ResetTimeOfFirstAttackOnEnemy();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    Outer.SetAttackResourceNames();
    //return;    
}

function SetForcedDirectAttack()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];

    Outer.bDoOnlyForcedDirectAttack = bForced;
    //return;    
}

function AreOtherCrabsWaitingToStrike()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL ResGroup, ResGroupMultiLocation, StrikeUser;

    // End:0x0F
    if(bIgnoreOtherWaitingAttackers)
    {
        return false;
    }
    StrikeUser = Outer.GetStrikeResourceHolder(EnemyForAttack);
    // End:0x80
    if((StrikeUser != none) && StrikeUser != Outer.myAIPawn)
    {
        return true;
    }
    // End:0x228
    if((EnemyForAttack != none) && EnemyForAttack.AIResourceManager != none)
    {
        ResGroup = SPAIResGroupLocation(EnemyForAttack.AIResourceManager.GetResourceGroup(Outer.MeleeResourceName));
        // End:0x170
        if((ResGroup != none) && ResGroup.AreOtherUsersInStrikePosition(Outer.myAIPawn))
        {
            return true;            
        }
        else
        {
            ResGroupMultiLocation = SPAIResGroupMultiLocation(EnemyForAttack.AIResourceManager.GetResourceGroup(Outer.MeleeResourceName));
            // End:0x228
            if((ResGroupMultiLocation != none) && ResGroupMultiLocation.AreOtherUsersInStrikePosition(Outer.myAIPawn))
            {
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function HasAttackWaitTimerExpired()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x76
    if((EnemyForAttack != none) && EnemyForAttack.AIResourceManager != none)
    {
        return EnemyForAttack.AIResourceManager.HasTimerExpired(StrikeTimerName);        
    }
    else
    {
        return super.HasAttackWaitTimerExpired();
    }
    //return ReturnValue;    
}

function ResetAttackWaitTimer()
{
    local /*0x97E50000-0x00000000*/ private float MinTime[9437185], MaxTime;

    -1.0000000
    -1.0000000
    // End:0x99
    if((EnemyForAttack != none) && EnemyForAttack.AIResourceManager != none)
    {
        EnemyForAttack.AIResourceManager.ResetTimerRange(StrikeTimerName, MinTime, MaxTime);        
    }
    else
    {
        super.ResetAttackWaitTimer(MinTime, MaxTime);
    }
    //return;    
}

event NotifyAIResourceChanged()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResAccess[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL ResourceAccess;

    ResourceAccess = SPAIResourceAccess(ResAccess);
    // End:0x7A
    if((ResourceAccess != none) && ResourceAccess == Outer.MeleeAccess)
    {
        Outer.bMeleePointMoved = true;
    }
    return false;
    //return ReturnValue;    
}

function SetMeleeExtents()
{
    // End:0x89
    if(Outer.ShouldUseMeleeResource())
    {
        EnemyForAttack.AIResourceManager.GetResourceLocationExtents(Outer.MeleeResourceName, MeleePatternCenter, MeleePatternRadius);        
    }
    else
    {
        super.SetMeleeExtents();
    }
    //return;    
}

function GetStrikeAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private float RevokeTolerance[9437185];
    local /*0x97E50000-0x00000000*/ private bool bForced[9437185];

    -1.0000000
    false
    super(LPAICommand).GetStrikeAccess(TheEnemy, RevokeTolerance, bForced);
    Outer.LockStrikeAccess(false);
    //return;    
}

function GetMinTimeBetweenClawAttacks()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.CrabPawn.TuneDataIceCrab.MinTimeBetweenAttacks.GetValue();
    //return ReturnValue;    
}

function GetMaxTimeBetweenClawAttacks()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.CrabPawn.TuneDataIceCrab.MaxTimeBetweenAttacks.GetValue();
    //return ReturnValue;    
}

function SetTimeForNextClawStrike()
{
    local /*0x97E50000-0x00000000*/ private float minWait, MaxWait, blockedAddedDelayTime;

    // End:0x8D
    if(Outer.bStruckVsWithClawWhileVsWasBlocking)
    {
        blockedAddedDelayTime = Outer.CrabPawn.TuneDataIceCrab.AdditionalDelayTimeWhenStruckBlockedVsWithClawStrike.GetValue();        
    }
    else
    {
        blockedAddedDelayTime = 0.0000000;
    }
    minWait = (GetMinTimeBetweenClawAttacks()) + blockedAddedDelayTime;
    MaxWait = (GetMaxTimeBetweenClawAttacks()) + blockedAddedDelayTime;
    // End:0x14F
    if(minWait < MaxWait)
    {
        TimeForNextClawStrike = Outer.WorldInfo.TimeSeconds + RandRange(minWait, MaxWait);        
    }
    else
    {
        TimeForNextClawStrike = Outer.WorldInfo.TimeSeconds + RandRange(MaxWait, minWait);
    }
    //return;    
}

function IsTimeForClawStrike()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x39
    if(Outer.CrabPawn.AreClawsBothDismembered())
    {
        return false;
    }
    return TimeForNextClawStrike < Outer.WorldInfo.TimeSeconds;
    //return ReturnValue;    
}

function ResetTimeForClawStrike()
{
    TimeForNextClawStrike = 0.0000000;
    //return;    
}

function ResetTimeForStrike()
{
    ResetTimeForClawStrike();
    Outer.ResetTimeForNextPincerBash();
    Outer.ResetTimeForNextHastyPincerBash();
    ResetTimeToStopStriking();
    ResetAttackWaitTimer(0.0000000, 0.0000000);
    //return;    
}

function ShouldChargeEnemy()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float Seperation, MinSeperation;

    // End:0xC0
    if(IsMyEnemyAlive())
    {
        Seperation = EnemySeperation2D();
        MinSeperation = GetMinDistanceAwayToTryChargeAttack();
        // End:0xBD
        if(Seperation > MinSeperation)
        {
            // End:0xBA
            if(!Outer.IsOffNavMesh(Outer.CrabPawn.Location, EnemyForAttack, MyEnemyRadius))
            {
                return true;                
            }            
        }        
    }
    return false;
    //return ReturnValue;    
}

function GetMinDistanceAwayToTryChargeAttack()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 3000.0000000;
    //return ReturnValue;    
}

function ShouldFlee()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.CrabPawn.AreClawsBothDismembered();
    //return ReturnValue;    
}

function StartCommandForChargeAttack()
{
    //return;    
}

function GetTimeToFlee()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 5.0000000;
    //return ReturnValue;    
}

function ManeuverForAttack()
{
    local /*0x97E50000-0x00000000*/ private float AttackSeperationMin[8388609], AttackSeperationMax;
    local /*0x97E50000-0x00000000*/ private @NULL FocusActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool CheckForStrikeAccess[9437185];
    local /*0x97E50000-0x00000000*/ private float Seperation;

    false
    // End:0xC3
    if(!Outer.CrabPawn.AreClawsBothDismembered())
    {
        super.ManeuverForAttack(AttackSeperationMin, AttackSeperationMax, FocusActor, CheckForStrikeAccess);
        // End:0xC1
        if(MoveToActorCmd != none)
        {
            MoveToActorCmd.__MoveAvoidanceDelegate__Delegate = Outer.DelegateCrabMovingToEngageEnemyAvoidance;
        }
        return;
    }
    Outer.CmdStatus_MoveToActor.Cmd_Move_Error = 0;
    Outer.CmdStatus_MoveToActor.Cmd_Error = 0;
    MovingToActor = true;
    // End:0x303
    if(IsMyEnemyAlive())
    {
        Seperation = EnemySeperation2DTight();
        // End:0x303
        if(Seperation > AttackSeperationMin)
        {
            MoveToActorCmd = Outer.CmdMoveToActorTight(EnemyForAttack, EnemyForAttack, AttackSeperationMin, Outer.CmdStatus_MoveToActor, 1, Outer.myAIPawn.TuneDataAIPawn.StopTypeForEndOfTightManeuverForAttack, false);
            // End:0x261
            if(CheckForStrikeAccess)
            {
                MoveToActorCmd.__MoveAbortDelegate__Delegate = MoveStrikeAbortCondition;                
            }
            else
            {
                MoveToActorCmd.__MoveAbortDelegate__Delegate = MoveAbortCondition;
            }
            MoveToActorCmd.bZeroVelocityOnFinish = false;
            IsManeuvering = true;
            MoveToActorCmd.__MoveAvoidanceDelegate__Delegate = Outer.DelegateCrabMovingToEngageEnemyAvoidance;
        }
    }
    IsManeuvering = false;
    //return;    
}

function ShouldFaceEnemyWhileMovingToSlot()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float InPatternRadius;

    // End:0x27
    if(IsInState('MoveToMeleeSlotOnFormationChange') || IsInState('MoveToMeleeSlotOnRetreat'))
    {
        return true;        
    }
    else
    {
        SetMeleeExtents();
        InPatternRadius = MeleePatternRadius * 1.1000000;
        // End:0xA6
        if(VSizeSq(MeleePatternCenter - Outer.myAIPawn.Location) < (InPatternRadius * InPatternRadius))
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function IsCloseEnoughToGoToStrike()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float seperationFromEnemy, curAttacksMaxStrikeRange;

    seperationFromEnemy = EnemySeperation2D();
    curAttacksMaxStrikeRange = GetMaxAttackRange();
    // End:0x41
    if(seperationFromEnemy < curAttacksMaxStrikeRange)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function GetTimeForClawAttackPhase()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return RandRange(Outer.CrabPawn.TuneDataIceCrab.MinTimeForClawAttackPhase.GetValue(), Outer.CrabPawn.TuneDataIceCrab.MaxTimeForClawAttackPhase.GetValue());
    //return ReturnValue;    
}

function ResetTimeToStopStriking()
{
    CurTime = Outer.myAIPawn.WorldInfo.TimeSeconds;
    TimeToStopStriking = CurTime + (GetTimeForClawAttackPhase());
    //return;    
}

function HandleCanNotStrikeButInStrikeState()
{
    // End:0xF9
    if(IsMyEnemyAlive())
    {
        // End:0xF6
        if(HasAccessToStartAttack())
        {
            // End:0xF3
            if(Outer.IsTurnToFaceTargetCommandNeeded(EnemyForAttack, Outer.CrabPawn.TuneDataIceCrab.MinAngleInDegreesNeededForTurnToFaceCommandWhileInStrikeState.GetValue()))
            {
                Outer.Focus = EnemyForAttack;
                Outer.CmdTurnToFaceFocus(1,, 1);                
            }            
        }        
    }
    //return;    
}

function ShouldBlitzAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x37
    if(int(Outer.LastCombatBehaviorAttempted) != int(2))
    {
        return ShouldChargeEnemy();        
    }
    return false;
    //return ReturnValue;    
}

function ShouldCloseQuatersBattle()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function GetMinSeperationFromEnemyToTryWithdraw()
{
    local /*0x97E50000-0x00000000*/ private bool Dismembered[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 1000.0000000;
    //return ReturnValue;    
}

function GetChanceToTryWithdrawAndCharge()
{
    local /*0x97E50000-0x00000000*/ private bool Dismembered[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 1.0000000;
    //return ReturnValue;    
}

function GetChanceToTauntAttack()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 0.0000000;
    //return ReturnValue;    
}

function ShouldWithdrawForMassiveAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float minSeperationFromEnemyToTryWithdraw, seperationFromEnemy, chanceToWithDraw, randChoice;

    // End:0x51
    if(Outer.CrabPawn.TuneDataIceCrab.bOnlyWithdrawAndCharge)
    {
        return true;        
    }
    else
    {
        // End:0xED
        if(Outer.CrabPawn.TuneDataIceCrab.bOnlyCQBAttack || Outer.CrabPawn.TuneDataIceCrab.bOnlyTauntAttack)
        {
            return false;
        }
    }
    // End:0x299
    if(int(Outer.LastCombatBehaviorAttempted) != int(3))
    {
        // End:0x1F4
        if(!Outer.CrabPawn.AreClawsBothDismembered())
        {
            // End:0x1F1
            if(HasWithdrawChargeWaitTimerExpired())
            {
                minSeperationFromEnemyToTryWithdraw = GetMinSeperationFromEnemyToTryWithdraw(false);
                seperationFromEnemy = EnemySeperation2D();
                // End:0x1EE
                if(seperationFromEnemy >= minSeperationFromEnemyToTryWithdraw)
                {
                    chanceToWithDraw = GetChanceToTryWithdrawAndCharge(false);
                    randChoice = RandRange(0.0000000, 1.0000000);
                    // End:0x1EB
                    if(randChoice <= chanceToWithDraw)
                    {
                        return true;                        
                    }                    
                }                
            }            
        }
        else
        {
            // End:0x296
            if(HasDismemberedWithdrawChargeWaitTimerExpired())
            {
                minSeperationFromEnemyToTryWithdraw = GetMinSeperationFromEnemyToTryWithdraw(true);
                seperationFromEnemy = EnemySeperation2D();
                // End:0x293
                if(seperationFromEnemy >= minSeperationFromEnemyToTryWithdraw)
                {
                    chanceToWithDraw = GetChanceToTryWithdrawAndCharge(true);
                    randChoice = RandRange(0.0000000, 1.0000000);
                    // End:0x290
                    if(randChoice <= chanceToWithDraw)
                    {
                        return true;                        
                    }                    
                }                
            }
        }        
    }
    return false;
    //return ReturnValue;    
}

function ShouldSwipeAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL ClosestActor;
    local /*0x97E50000-0x00000000*/ private float chanceToAttack, randChoice;

    // End:0x4A
    if(!Outer.CrabPawn.bEnableClawSwipe || IsFightingVS())
    {
        return false;
    }
    // End:0x75
    if(int(Outer.LastCombatBehaviorAttempted) == int(7))
    {
        return false;
    }
    // End:0xAE
    if(Outer.CrabPawn.AreClawsBothDismembered())
    {
        return false;
    }
    // End:0xD4
    if(!Outer.HasSwipeAttackWaitTimerExpired())
    {
        return false;
    }
    // End:0x1E3
    if(float(Outer.GetNumEnemiesWithinRangeAndAngle(Outer.CrabPawn.TuneDataIceCrab.MaxDistToEnemiesForSwipeAttack.GetValue(), Outer.SwipeAttackACosHorizAngRange, ClosestActor)) < Outer.CrabPawn.TuneDataIceCrab.MinEnemiesToSwipeAttack.GetValue())
    {
        return false;
    }
    chanceToAttack = Outer.CrabPawn.TuneDataIceCrab.ChanceToSwipeAttack.GetValue();
    // End:0x26D
    if(chanceToAttack > 1.0100000)
    {
        chanceToAttack /= float(100);
    }
    randChoice = RandRange(0.0000000, 1.0000000);
    // End:0x2A4
    if(randChoice > chanceToAttack)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function ShouldGroundPound()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float chanceToAttack, randChoice;
    local /*0x97E50000-0x00000000*/ private int numEnemiesRequired;
    local /*0x97E50000-0x00000000*/ private @NULL ClosestActor;

    // End:0x4A
    if(!Outer.CrabPawn.bEnableGroundPound || IsFightingVS())
    {
        return false;
    }
    // End:0x75
    if(int(Outer.LastCombatBehaviorAttempted) == int(6))
    {
        return false;
    }
    // End:0x9B
    if(!Outer.HasGroundPoundWaitTimerExpired())
    {
        return false;
    }
    // End:0x148
    if(Outer.CrabPawn.AreClawsBothDismembered())
    {
        numEnemiesRequired = 1;
        chanceToAttack = Outer.CrabPawn.TuneDataIceCrab.ChanceToGroundPoundWithNoClaws.GetValue();        
    }
    else
    {
        numEnemiesRequired = int(Outer.CrabPawn.TuneDataIceCrab.MinEnemiesToGroundPound.GetValue());
        chanceToAttack = Outer.CrabPawn.TuneDataIceCrab.ChanceToGroundPound.GetValue();
    }
    // End:0x2D2
    if(Outer.GetNumEnemiesWithinRangeAndAngle(Outer.CrabPawn.TuneDataIceCrab.MaxDistToEnemiesForGroundPound.GetValue(), Outer.GroundPoundACosHorizAngRange, ClosestActor) < numEnemiesRequired)
    {
        return false;
    }
    // End:0x2F4
    if(chanceToAttack > 1.1000000)
    {
        chanceToAttack /= float(100);
    }
    randChoice = RandRange(0.0000000, 1.0000000);
    // End:0x32B
    if(randChoice > chanceToAttack)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function IsFightingVS()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function ShouldTauntAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float chanceToAttack, randChoice;

    // End:0x51
    if(Outer.CrabPawn.TuneDataIceCrab.bOnlyTauntAttack)
    {
        return true;        
    }
    else
    {
        // End:0xED
        if(Outer.CrabPawn.TuneDataIceCrab.bOnlyCQBAttack || Outer.CrabPawn.TuneDataIceCrab.bOnlyWithdrawAndCharge)
        {
            return false;
        }
    }
    // End:0x137
    if(!IsFightingVS() && Outer.CrabPawn.bEnableGroundPound)
    {
        return false;
    }
    // End:0x24C
    if(int(Outer.LastCombatBehaviorAttempted) != int(4))
    {
        // End:0x249
        if(Outer.CrabPawn.AreClawsBothDismembered() || Outer.DesireNonDismemberedTaunt())
        {
            // End:0x246
            if(HasTauntAttackWaitTimerExpired())
            {
                chanceToAttack = GetChanceToTauntAttack();
                randChoice = RandRange(0.0000000, 1.0000000);
                // End:0x227
                if(chanceToAttack > 1.1000000)
                {
                    chanceToAttack = chanceToAttack / 100.0000000;
                }
                // End:0x243
                if(randChoice <= chanceToAttack)
                {
                    return true;                    
                }                
            }            
        }        
    }
    return false;
    //return ReturnValue;    
}

function ShouldFrenzyAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function ShouldRetreatToMeleePoint()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x3B
    if(AreOtherCrabsWaitingToStrike())
    {
        // End:0x3B
        if(Outer.HaveBeenAttackingForTime(GetTimeForClawAttackPhase()))
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function ConsiderStartingNewCombatBehavior()
{
    NextCombatBehaviorDesired = 1;
    // End:0x5A
    if(Outer.CrabPawn.TuneDataIceCrab.bOnlyCQBAttack)
    {
        return;
    }
    // End:0x76
    if(ShouldRetreatToMeleePoint())
    {
        NextCombatBehaviorDesired = 8;        
    }
    else
    {
        // End:0x92
        if(ShouldSwipeAttack())
        {
            NextCombatBehaviorDesired = 7;            
        }
        else
        {
            // End:0xAE
            if(ShouldGroundPound())
            {
                NextCombatBehaviorDesired = 6;                
            }
            else
            {
                // End:0xCA
                if(ShouldTauntAttack())
                {
                    NextCombatBehaviorDesired = 4;                    
                }
                else
                {
                    // End:0xE6
                    if(ShouldBlitzAttack())
                    {
                        NextCombatBehaviorDesired = 2;                        
                    }
                    else
                    {
                        // End:0x102
                        if(ShouldWithdrawForMassiveAttack())
                        {
                            NextCombatBehaviorDesired = 3;                            
                        }
                        else
                        {
                            // End:0x11E
                            if(ShouldFrenzyAttack())
                            {
                                NextCombatBehaviorDesired = 5;                                
                            }
                            else
                            {
                                NextCombatBehaviorDesired = 1;
                            }
                        }
                    }
                }
            }
        }
    }
    //return;    
}

function StartNewCombatBehavior()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xDF
    if(int(NextCombatBehaviorDesired) == int(8))
    {
        Outer.ReleaseStrikeAccess();
        Outer.ResetTimeOfFirstAttackOnEnemy();
        // End:0xC7
        if(AreOtherCrabsWaitingToStrike())
        {
            GotoStateWithEnemyCheck('GetMeleeFormationClearenceOnRetreat');
            TimeOfBreakingAttackForWaitingBuddy = Outer.myAIPawn.WorldInfo.TimeSeconds;            
        }
        else
        {
            GotoStateWithEnemyCheck('GetMeleeFormationClearence');
        }
        return false;        
    }
    else
    {
        // End:0x18B
        if(int(NextCombatBehaviorDesired) == int(2))
        {
            // End:0x12C
            if(!Outer.HaveStrikeAccess())
            {
                GetStrikeAccess(EnemyForAttack);
            }
            // End:0x186
            if(Outer.HaveStrikeAccess())
            {
                Outer.LockStrikeAccess(true);
                GotoCombatStateWithEnemyCheck('ChargeEnemy');
                return true;                
            }
            else
            {
                return false;
            }            
        }
        else
        {
            // End:0x214
            if(int(NextCombatBehaviorDesired) == int(3))
            {
                // End:0x1D8
                if(!Outer.HaveStrikeAccess())
                {
                    GetStrikeAccess(EnemyForAttack);
                }
                // End:0x20F
                if(Outer.HaveStrikeAccess())
                {
                    GotoCombatStateWithEnemyCheck('WithdrawForChargeAtEnemy');
                    return true;
                }
                return false;                
            }
            else
            {
                // End:0x29D
                if(int(NextCombatBehaviorDesired) == int(4))
                {
                    // End:0x261
                    if(!Outer.HaveStrikeAccess())
                    {
                        GetStrikeAccess(EnemyForAttack);
                    }
                    // End:0x298
                    if(Outer.HaveStrikeAccess())
                    {
                        GotoCombatStateWithEnemyCheck('TauntAttack');
                        return true;
                    }
                    return false;                    
                }
                else
                {
                    // End:0x326
                    if(int(NextCombatBehaviorDesired) == int(6))
                    {
                        // End:0x2EA
                        if(!Outer.HaveStrikeAccess())
                        {
                            GetStrikeAccess(EnemyForAttack);
                        }
                        // End:0x321
                        if(Outer.HaveStrikeAccess())
                        {
                            GotoCombatStateWithEnemyCheck('GroundPoundAttack');
                            return true;
                        }
                        return false;                        
                    }
                    else
                    {
                        // End:0x3AF
                        if(int(NextCombatBehaviorDesired) == int(7))
                        {
                            // End:0x373
                            if(!Outer.HaveStrikeAccess())
                            {
                                GetStrikeAccess(EnemyForAttack);
                            }
                            // End:0x3AA
                            if(Outer.HaveStrikeAccess())
                            {
                                GotoCombatStateWithEnemyCheck('ClawSwipeAttack');
                                return true;
                            }
                            return false;                            
                        }
                        else
                        {
                            // End:0x438
                            if(int(NextCombatBehaviorDesired) == int(5))
                            {
                                // End:0x3FC
                                if(!Outer.HaveStrikeAccess())
                                {
                                    GetStrikeAccess(EnemyForAttack);
                                }
                                // End:0x433
                                if(Outer.HaveStrikeAccess())
                                {
                                    GotoCombatStateWithEnemyCheck('FrenzyAttack');
                                    return true;
                                }
                                return false;                                
                            }
                            else
                            {
                                // End:0x48B
                                if(int(NextCombatBehaviorDesired) == int(1))
                                {
                                    // End:0x486
                                    if(Outer.HaveStrikeAccess())
                                    {
                                        GotoCombatStateWithEnemyCheck('MoveCloserToEnemy');
                                        return true;                                        
                                    }
                                    else
                                    {
                                        return false;
                                    }                                    
                                }
                                else
                                {
                                    Outer.ResetTimeOfFirstAttackOnEnemy();
                                    GotoStateWithEnemyCheck('StateCmdActive');
                                    return false;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    //return ReturnValue;    
}

function GotoCombatStateWithEnemyCheck()
{
    local /*0x97E50000-0x00000000*/ private name StateName[8388609];

    Outer.CurrentCombatBehaviorAttempting = NextCombatBehaviorDesired;
    GotoStateWithEnemyCheck(StateName);
    //return;    
}

function SetCurrentCombatBehaviorAttemptingWithOutGoingToNewState()
{
    Outer.CurrentCombatBehaviorAttempting = NextCombatBehaviorDesired;
    //return;    
}

function SetLastCombatBehaviorAttempted()
{
    Outer.LastCombatBehaviorAttempted = Outer.CurrentCombatBehaviorAttempting;
    //return;    
}

function SetLastCombatBehaviorFinshedWithOutGoingToNewState()
{
    Outer.LastCombatBehaviorFinished = Outer.CurrentCombatBehaviorAttempting;
    //return;    
}

function GotoStateAfterFinishingCombatBehaviorWithEnemyCheck()
{
    local /*0x97E50000-0x00000000*/ private name StateName[8388609];

    Outer.LastCombatBehaviorFinished = Outer.CurrentCombatBehaviorAttempting;
    GotoStateWithEnemyCheck(StateName);
    //return;    
}

function DetermineIfNewNonCQBCombatBehaviorNeedsStart()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x1E
    if(int(NextCombatBehaviorDesired) == int(0))
    {
        ConsiderStartingNewCombatBehavior();
    }
    // End:0x53
    if((int(NextCombatBehaviorDesired) != int(1)) && int(NextCombatBehaviorDesired) != int(0))
    {
        return StartNewCombatBehavior();
    }
    return false;
    //return ReturnValue;    
}

function HasWithdrawChargeWaitTimerExpired()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x76
    if((EnemyForAttack != none) && EnemyForAttack.AIResourceManager != none)
    {
        return EnemyForAttack.AIResourceManager.HasTimerExpired(WithdrawChargeTimerName);        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

function ResetWithdrawAndChargeWaitTimer()
{
    local /*0x97E50000-0x00000000*/ private float MinTime[9437185], MaxTime;

    -1.0000000
    -1.0000000
    // End:0x96
    if((EnemyForAttack != none) && EnemyForAttack.AIResourceManager != none)
    {
        EnemyForAttack.AIResourceManager.ResetTimerRange(WithdrawChargeTimerName, MinTime, MaxTime);
    }
    //return;    
}

function HasDismemberedWithdrawChargeWaitTimerExpired()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x76
    if((EnemyForAttack != none) && EnemyForAttack.AIResourceManager != none)
    {
        return EnemyForAttack.AIResourceManager.HasTimerExpired('IceCrabDismemberedWithdrawChargeTimer');        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

function ResetDismemberedWithdrawAndChargeWaitTimer()
{
    local /*0x97E50000-0x00000000*/ private float MinTime[9437185], MaxTime;

    -1.0000000
    -1.0000000
    // End:0x96
    if((EnemyForAttack != none) && EnemyForAttack.AIResourceManager != none)
    {
        EnemyForAttack.AIResourceManager.ResetTimerRange('IceCrabDismemberedWithdrawChargeTimer', MinTime, MaxTime);
    }
    //return;    
}

function HasTauntAttackWaitTimerExpired()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x76
    if((EnemyForAttack != none) && EnemyForAttack.AIResourceManager != none)
    {
        return EnemyForAttack.AIResourceManager.HasTimerExpired('IceCrabTauntAttackTimer');        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

function ResetTauntAttackWaitTimer()
{
    local /*0x97E50000-0x00000000*/ private float MinTime[9437185], MaxTime;

    -1.0000000
    -1.0000000
    // End:0x96
    if((EnemyForAttack != none) && EnemyForAttack.AIResourceManager != none)
    {
        EnemyForAttack.AIResourceManager.ResetTimerRange('IceCrabTauntAttackTimer', MinTime, MaxTime);
    }
    //return;    
}

function HasFrenzyAttackWaitTimerExpired()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x76
    if((EnemyForAttack != none) && EnemyForAttack.AIResourceManager != none)
    {
        return EnemyForAttack.AIResourceManager.HasTimerExpired('DongoFrenzyAttackAttackTimer');        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

function ResetFrenzyAttackWaitTimer()
{
    local /*0x97E50000-0x00000000*/ private float MinTime[9437185], MaxTime;

    -1.0000000
    -1.0000000
    // End:0x96
    if((EnemyForAttack != none) && EnemyForAttack.AIResourceManager != none)
    {
        EnemyForAttack.AIResourceManager.ResetTimerRange('DongoFrenzyAttackAttackTimer', MinTime, MaxTime);
    }
    //return;    
}

function @NULL DrawDebug()
{
    local /*0x97E50000-0x00000000*/ private @NULL InHUD[8388609];
    local /*0x97E50000-0x00000400*/ private editfixedsize array ComponentArray;
    local /*0x97E50000-0x00000400*/ private @NULL DebugComponent, ToolTip;

    super(LPAICmd_Attack).DrawDebug(InHUD);
    // End:0x184
    if((Outer.myAIPawn.WorldInfo.TimeSeconds - TimeOfBreakingAttackForWaitingBuddy) < 1.5000000)
    {
        Outer.CrabPawn.GetComponentsOfClass(Class'SPEngine.SPDebugComponentPawn', ComponentArray);
        // End:0xE4
        if(ComponentArray.Length > 0)
        {
            DebugComponent = SPDebugComponentPawn(ComponentArray[0]);
        }
        // End:0x184
        if(DebugComponent != none)
        {
            ToolTip = DebugComponent.GetTooltip(InHUD);
            ToolTip.Draw2DTextLn("Allowing others to attacks",, ToolTip.YellowColor);
        }
    }
    //return;    
}

function ShouldPostSwipeTaunt()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x79
    if(RandRange(0.0000000, 100.0000000) < Outer.CrabPawn.TuneDataIceCrab.ChanceOfTauntAfterSwipe.GetValue())
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

state MoveCloserToEnemy
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        // End:0x35
        if(bCanStrikeBeforeReachingMeleeSlot)
        {
            ConsiderStartingNewCombatBehavior();
            // End:0x35
            if(int(NextCombatBehaviorDesired) != int(1))
            {
                StartNewCombatBehavior();
            }
        }
        //return;        
    }

    event PushedState()
    {
        // End:0x35
        if(bCanStrikeBeforeReachingMeleeSlot)
        {
            ConsiderStartingNewCombatBehavior();
            // End:0x35
            if(int(NextCombatBehaviorDesired) != int(1))
            {
                StartNewCombatBehavior();
            }
        }
        //return;        
    }
    stop;    
}

state GetMeleeFormationClearence
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        DetermineIfNewNonCQBCombatBehaviorNeedsStart();
        //return;        
    }

    event PushedState()
    {
        super(SPStateObject).PushedState();
        DetermineIfNewNonCQBCombatBehaviorNeedsStart();
        //return;        
    }
    stop;    
}

state MoveToAttackRangeWithClearence
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        SetCurrentCombatBehaviorAttemptingWithOutGoingToNewState();
        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    event PushedState()
    {
        SetCurrentCombatBehaviorAttemptingWithOutGoingToNewState();
        super(SPStateObject).PushedState();
        //return;        
    }
    stop;    
}

state StartAttackFromMeleeSlot
{
    function StartStikeBehavior()
    {
        // End:0x21
        if(int(NextCombatBehaviorDesired) != int(1))
        {
            StartNewCombatBehavior();            
        }
        else
        {
            super.StartStikeBehavior();
        }
        //return;        
    }
    stop;    
}

state BeginStrike
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        SetLastCombatBehaviorAttempted();
        super(SPStateObject).BeginState(PreviousStateName);
        ResetTimeToStopStriking();
        //return;        
    }
    stop;    
}

state ContinueStrike
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        SetLastCombatBehaviorAttempted();
        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }
    stop;    
}

state StrikeWithClearence
{
    function ShouldContinueToStrike()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        ConsiderStartingNewCombatBehavior();
        // End:0x23
        if(int(NextCombatBehaviorDesired) != int(1))
        {
            return false;            
        }
        else
        {
            CurTime = Outer.myAIPawn.WorldInfo.TimeSeconds;
            // End:0x91
            if(TimeToStopStriking > CurTime)
            {
                return true;                
            }
            else
            {
                return !AreOtherCrabsWaitingToStrike();
            }
        }
        return false;
        //return ReturnValue;        
    }

    function RetreatToMeleeSlot()
    {
        // End:0x4D
        if(int(NextCombatBehaviorDesired) == int(8))
        {
            // End:0x37
            if(AreOtherCrabsWaitingToStrike())
            {
                GotoStateWithEnemyCheck('GetMeleeFormationClearenceOnRetreat');                
            }
            else
            {
                GotoStateWithEnemyCheck('GetMeleeFormationClearence');
            }            
        }
        else
        {
            super.RetreatToMeleeSlot();
        }
        //return;        
    }

    event PoppedState()
    {
        SetLastCombatBehaviorFinshedWithOutGoingToNewState();
        super(SPStateObject).PoppedState();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        SetLastCombatBehaviorFinshedWithOutGoingToNewState();
        super.EndState(NextStateName);
        //return;        
    }
    stop;    
}

state ChargeEnemy
{
    ignores BeginState, PushedState;

    event PoppedState()
    {
        Outer.LockStrikeAccess(false);
        Outer.ReleaseStrikeAccess();
        SetLastCombatBehaviorAttempted();
        ResetWithdrawAndChargeWaitTimer();
        ResetDismemberedWithdrawAndChargeWaitTimer();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.LockStrikeAccess(false);
        SetLastCombatBehaviorAttempted();
        ResetWithdrawAndChargeWaitTimer();
        ResetDismemberedWithdrawAndChargeWaitTimer();
        //return;        
    }
Begin:

    StartCommandForChargeAttack();
    // End:0xFA
    if(!Outer.CmdStatus_ChargeAttack.IsPerformingUberClawStrike())
    {
        Outer.LockStrikeAccess(false);
        // End:0xC5
        if(Outer.HaveStrikeAccess())
        {
            // End:0xB2
            if(IsCloseEnoughToGoToStrike())
            {
                ResetTimeToStopStriking();
                GotoStateAfterFinishingCombatBehaviorWithEnemyCheck('StrikeWithClearence');                
            }
            else
            {
                GotoStateAfterFinishingCombatBehaviorWithEnemyCheck('BeginStrike');
            }
        }
        Outer.ReleaseStrikeAccess();
        GotoStateAfterFinishingCombatBehaviorWithEnemyCheck('StateCmdActive');        
    }
    else
    {
        // End:0x15C
        if(Outer.HaveStrikeAccess())
        {
            // End:0x149
            if(IsCloseEnoughToGoToStrike())
            {
                ResetTimeToStopStriking();
                GotoStateAfterFinishingCombatBehaviorWithEnemyCheck('StrikeWithClearence');                
            }
            else
            {
                GotoStateAfterFinishingCombatBehaviorWithEnemyCheck('BeginStrike');
            }
        }
        Outer.ReleaseStrikeAccess();
        GotoStateAfterFinishingCombatBehaviorWithEnemyCheck('StateCmdActive');
    }
    stop;        
}

state WithdrawForChargeAtEnemy
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    event PushedState()
    {
        super(SPStateObject).PushedState();
        //return;        
    }

    event PoppedState()
    {
        Outer.LockStrikeAccess(false);
        Outer.ReleaseStrikeAccess();
        SetLastCombatBehaviorAttempted();
        Outer.CrabPawn.SetMaxSpeedScale(Outer.CrabPawn.TuneDataIceCrab.GetNormalMaxSpeedScale(Outer.CrabPawn));
        ResetWithdrawAndChargeWaitTimer();
        ResetDismemberedWithdrawAndChargeWaitTimer();
        super(SPStateObject).PoppedState();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.LockStrikeAccess(false);
        SetLastCombatBehaviorAttempted();
        Outer.CrabPawn.SetMaxSpeedScale(Outer.CrabPawn.TuneDataIceCrab.GetNormalMaxSpeedScale(Outer.CrabPawn));
        ResetWithdrawAndChargeWaitTimer();
        ResetDismemberedWithdrawAndChargeWaitTimer();
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function DelegateMovingToChargePointAvoidance()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Obstacle[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x61
        if(((Obstacle == EnemyForAttack) || Obstacle == Outer.myAIPawn) || LPBaseVSPlayerPawn(Obstacle) != none)
        {
            return false;
        }
        return true;
        //return ReturnValue;        
    }

    function StartCommandForMovingToChargePoint()
    {
        Outer.CmdStatus_MoveToPosition.Cmd_Move_Error = 0;
        Outer.CmdStatus_MoveToPosition.Cmd_Error = 0;
        MovingToActor = false;
        // End:0x2D8
        if(IsMyEnemyAlive())
        {
            Outer.Focus = EnemyForAttack;
            MoveToPositionCmd = Outer.CmdMoveToPosition(WithdrawForChargePoint,, -1.0000000, Outer.CmdStatus_MoveToPosition, 1, Outer.myAIPawn.TuneDataAIPawn.StopTypeForEndOfMoveToChargePoint);
            MoveToPositionCmd.__MoveAvoidanceDelegate__Delegate = DelegateMovingToChargePointAvoidance;
            MoveToPositionCmd.SetMovementMonitorParameters(true, Outer.CrabPawn.TuneDataIceCrab.DurationBetweenMovementDeltaDuringWithdrawForCharge_Tunable.GetValue(), Outer.CrabPawn.TuneDataIceCrab.MinMovementDeltaDuringWithdrawForCharge_Tunable.GetValue(), Outer.CrabPawn.TuneDataIceCrab.DelayAfterStartOfWithdrawForChargeBeforeMonitorStarts_Tunable.GetValue(), NotifyOfFailedMovementToChargePoint);
            IsManeuvering = true;
        }
        //return;        
    }

    function NotifyOfFailedMovementToChargePoint()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x38
        if(MoveToPositionCmd != none)
        {
            Outer.AbortCommand(MoveToPositionCmd);
        }
        return true;
        //return ReturnValue;        
    }

    function TryFindingWithDrawPoint()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL sideOffset;
        local /*0x97E50000-0x00000000*/ private int ScaleFactor;
        local /*0x97E50000-0x00000000*/ private bool shiftLeft;
        local /*0x97E50000-0x00000000*/ private float ammountToScale;

        shiftLeft = false;
        // End:0x2B
        if((NumOfAttemptsToFindWithDrawPointThisAttack % 2) == 0)
        {
            shiftLeft = true;
        }
        ScaleFactor = (NumOfAttemptsToFindWithDrawPointThisAttack + 1) / 2;
        ammountToScale = float(ScaleFactor) * Outer.CrabPawn.TuneDataIceCrab.DistanceBetweenWithdrawPointsToCheck_Tunable.GetValue();
        ammountToScale = ((shiftLeft) ? ammountToScale : -ammountToScale);
        // End:0x15D
        if(ammountToScale != float(0))
        {
            sideOffset = Class'SPEngine.SPUtil'.static.GetRightVector(Outer.CrabPawn);
            sideOffset = sideOffset * ammountToScale;
        }
        NumOfAttemptsToFindWithDrawPointThisAttack++;
        return CalculateWithDrawPoint(sideOffset);
        //return ReturnValue;        
    }

    function CalculateWithDrawPoint()
    {
        local /*0x97E50000-0x00000000*/ private @NULL sideOffset[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL displacementToWithDrawPoint;
        local /*0x97E50000-0x00000000*/ private float distanceAwayTheWithdrawPointShouldBe;
        local /*0x97E50000-0x00000000*/ private editfixedsize array LosIgnoreActor;
        local /*0x97E50000-0x00000000*/ private @NULL LosHitActor;

        displacementToWithDrawPoint = Outer.CrabPawn.Location - EnemyForAttack.Location;
        displacementToWithDrawPoint = Normal(displacementToWithDrawPoint);
        displacementToWithDrawPoint.Z = 0.0000000;
        distanceAwayTheWithdrawPointShouldBe = Outer.GetMinDistanceAwayToStartChargingStrike(EnemyForAttack);
        distanceAwayTheWithdrawPointShouldBe += (((Outer.MyKynapseRadius * float(2)) + (MyEnemyRadius * float(2))) + Outer.CrabPawn.TuneDataIceCrab.ExtraBufferToAddToTheWithdrawDistance_Tunable.GetValue());
        displacementToWithDrawPoint = displacementToWithDrawPoint * distanceAwayTheWithdrawPointShouldBe;
        WithdrawForChargePoint = displacementToWithDrawPoint + EnemyForAttack.Location;
        WithdrawForChargePoint = WithdrawForChargePoint + sideOffset;
        // End:0x2D6
        if(Outer.IsDestinationInsideAiMesh(WithdrawForChargePoint))
        {
            LosIgnoreActor.AddItem(Outer.myAIPawn);            
            LosIgnoreActor.AddItem(EnemyForAttack);            
            LosHitActor = LosTestForPawn(Outer.myAIPawn.Location, WithdrawForChargePoint, Outer.MyKynapseRadius * 0.2500000, LosIgnoreActor);
            // End:0x2D4
            if(LosHitActor == none)
            {
                return true;                
            }
            else
            {
                return false;
            }
        }
        return false;
        //return ReturnValue;        
    }

    function CanRestartBehavioursAfterWithdarAndCharge()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }
Begin:

    NumOfAttemptsToFindWithDrawPointThisAttack = 0;
    // End:0x4C
    if(Outer.ShouldShowChargeAndWithDrawPointArtifacts())
    {
        Outer.FlushPersistentDebugLines();
    }
    J0x4C:

    // End:0x411 [Loop If]
    if(float(NumOfAttemptsToFindWithDrawPointThisAttack) < Outer.CrabPawn.TuneDataIceCrab.NumOfTimesToLookForDifferentWithdrawPointsDuringWithdrawAttempt_Tunable.GetValue())
    {
        // End:0x3F1
        if(TryFindingWithDrawPoint())
        {
            Outer.LockStrikeAccess(true);
            Outer.CrabPawn.SetMaxSpeedScale(Outer.CrabPawn.TuneDataIceCrab.WithdrawForChargeMaxSpeedScale_Tunable.GetValue());
            StartCommandForMovingToChargePoint();
            IsManeuvering = false;
            // End:0x3C1
            if(Outer.HaveStrikeAccess())
            {
                StartCommandForChargeAttack();
                Outer.CrabPawn.SetMaxSpeedScale(Outer.CrabPawn.TuneDataIceCrab.GetNormalMaxSpeedScale(Outer.CrabPawn));
                // End:0x2F3
                if(!Outer.CmdStatus_ChargeAttack.IsPerformingUberClawStrike() && CanRestartBehavioursAfterWithdarAndCharge())
                {
                    Outer.LockStrikeAccess(false);
                    Outer.ReleaseStrikeAccess();
                    GotoStateAfterFinishingCombatBehaviorWithEnemyCheck('StateCmdActive');                    
                }
                else
                {
                    Outer.CmdStatus_MoveToActor.Cmd_Error = 0;
                    Outer.CmdStatus_MoveToActor.Cmd_Move_Error = 2;
                    // End:0x3C1
                    if(Outer.HaveStrikeAccess())
                    {
                        // End:0x3AE
                        if(IsCloseEnoughToGoToStrike())
                        {
                            ResetTimeToStopStriking();
                            GotoStateAfterFinishingCombatBehaviorWithEnemyCheck('StrikeWithClearence');                            
                        }
                        else
                        {
                            GotoStateAfterFinishingCombatBehaviorWithEnemyCheck('BeginStrike');
                        }
                    }
                }
            }
            Outer.Sleep(0.0100000);
            GotoStateWithEnemyCheck('StateCmdActive');
        }
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x4C;
    }
    Outer.Sleep(0.0100000);
    GotoStateWithEnemyCheck('StateCmdActive');
    stop;            
}

state FleeFromEnemy extends MoveToActor
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    event PushedState()
    {
        super(SPStateObject).PushedState();
        //return;        
    }

    event PoppedState()
    {
        Outer.myAIPawn.SetMaxSpeedScale(Outer.myAIPawn.TuneDataAIPawn.GetNormalMaxSpeedScale(Outer.myAIPawn));
        AICMDFleeParams.FleeDangerousBots.Length = 0;
        super(SPStateObject).PoppedState();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.myAIPawn.SetMaxSpeedScale(Outer.myAIPawn.TuneDataAIPawn.GetNormalMaxSpeedScale(Outer.myAIPawn));
        AICMDFleeParams.FleeDangerousBots.Length = 0;
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }
Begin:

    Outer.myAIPawn.SetMaxSpeedScale(Outer.myAIPawn.TuneDataAIPawn.GetFleeingMaxSpeedScale(Outer.myAIPawn));
    AICMDFleeParams.FleeDangerousBots.Length = 0;
    AICMDFleeParams.FleeDangerousBots.AddItem(EnemyForAttack);    
    AICMDFleeParams.explorationRadius = 10000.0000000;
    Outer.Kynapse_LatentFlee(AICMDFleeParams, none, GetTimeToFlee());
    AICMDFleeParams.FleeDangerousBots.Length = 0;
    Outer.myAIPawn.SetMaxSpeedScale(Outer.myAIPawn.TuneDataAIPawn.GetNormalMaxSpeedScale(Outer.myAIPawn));
    GotoStateWithEnemyCheck('StateCmdActive');
    stop;            
}

state PostSwipeTaunt
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    event PushedState()
    {
        super(SPStateObject).PushedState();
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        ResetTauntAttackWaitTimer();
        Outer.ResetGroundPoundWaitTimer();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        ResetTauntAttackWaitTimer();
        Outer.ResetGroundPoundWaitTimer();
        //return;        
    }
Begin:

    Outer.CmdPerformTaunt(EnemyForAttack, 4, Outer.CrabPawn.TuneDataIceCrab.MinTauntAfterSwipeLoopTime.GetValue(), Outer.CrabPawn.TuneDataIceCrab.MaxTauntAfterSwipeLoopTime.GetValue(), Outer.CrabPawn.TuneDataIceCrab.DamageAmountToCauseEndOfTaunt.GetValue(), Outer.CrabPawn.TuneDataIceCrab.MinDistanceAwayForReactiveTaunt_Tunable.GetValue(),, 1);
    // End:0x261
    if(Outer.bNeedsToPerformGettingGrenadeInTheMouthAction)
    {
        Outer.CmdCrabTakeGrenadeInMouth(Outer.CrabPawn.TuneDataIceCrab.TauntAttackDurationOfStunAfterGettingGrenadeInMouth.GetValue(), Class'LPSM_SnowCrabTauntSwallow', Class'LPSM_SnowCrabTauntGrenadeInMouthToStun', Class'LPSM_SnowCrabGrenadeInMouthStun', 1);
    }
    Outer.Sleep(0.0100000);
    GotoStateWithEnemyCheck('StateCmdActive');
    stop;            
}

state TauntReactive
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    event PushedState()
    {
        super(SPStateObject).PushedState();
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        ResetTauntAttackWaitTimer();
        Outer.ResetGroundPoundWaitTimer();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        ResetTauntAttackWaitTimer();
        Outer.ResetGroundPoundWaitTimer();
        //return;        
    }
Begin:

    Outer.CmdPerformTaunt(EnemyForAttack, Outer.GetReactiveTauntTypeNeeded(), Outer.CrabPawn.TuneDataIceCrab.MinTauntLoopTime.GetValue(), Outer.CrabPawn.TuneDataIceCrab.MaxTauntLoopTime.GetValue(), Outer.CrabPawn.TuneDataIceCrab.DamageAmountToCauseEndOfTaunt.GetValue(), Outer.CrabPawn.TuneDataIceCrab.MinDistanceAwayForReactiveTaunt_Tunable.GetValue(),, 1);
    // End:0x27E
    if(Outer.bNeedsToPerformGettingGrenadeInTheMouthAction)
    {
        Outer.CmdCrabTakeGrenadeInMouth(Outer.CrabPawn.TuneDataIceCrab.TauntAttackDurationOfStunAfterGettingGrenadeInMouth.GetValue(), Class'LPSM_SnowCrabTauntSwallow', Class'LPSM_SnowCrabTauntGrenadeInMouthToStun', Class'LPSM_SnowCrabGrenadeInMouthStun', 1);
    }
    Outer.Sleep(0.0100000);
    GotoStateWithEnemyCheck('StateCmdActive');
    stop;        
}

state FrenzyAttack
{Begin:

    Outer.Sleep(0.0000000);
    GotoCombatStateWithEnemyCheck('MoveCloserToEnemy');
    stop;                
}

state TauntAttack
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    event PushedState()
    {
        super(SPStateObject).PushedState();
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        ResetTauntAttackWaitTimer();
        Outer.myAIPawn.SetMaxSpeedScale(Outer.myAIPawn.TuneDataAIPawn.GetNormalMaxSpeedScale(Outer.myAIPawn));
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        ResetTauntAttackWaitTimer();
        Outer.myAIPawn.SetMaxSpeedScale(Outer.myAIPawn.TuneDataAIPawn.GetNormalMaxSpeedScale(Outer.myAIPawn));
        //return;        
    }
Begin:

    Outer.CmdPerformTaunt(EnemyForAttack, 3, Outer.CrabPawn.TuneDataIceCrab.MinTauntAttackLoopTime.GetValue(), Outer.CrabPawn.TuneDataIceCrab.MaxTauntAttackLoopTime.GetValue(), Outer.CrabPawn.TuneDataIceCrab.TauntAttackDamageAmountToCauseEndOfTaunt.GetValue(), GetMinAttackRange(),, 1);
    // End:0x20D
    if(Outer.bNeedsToPerformGettingGrenadeInTheMouthAction)
    {
        Outer.CmdCrabTakeGrenadeInMouth(Outer.CrabPawn.TuneDataIceCrab.TauntAttackDurationOfStunAfterGettingGrenadeInMouth.GetValue(), Class'LPSM_SnowCrabTauntSwallow', Class'LPSM_SnowCrabTauntGrenadeInMouthToStun', Class'LPSM_SnowCrabGrenadeInMouthStun', 1);
    }
    Outer.Sleep(0.0100000);
    GotoStateWithEnemyCheck('StateCmdActive');
    stop;            
}

state GroundPoundAttack
{
    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        Outer.ResetGroundPoundWaitTimer();
        ResetTauntAttackWaitTimer();
        SetLastCombatBehaviorAttempted();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        Outer.ResetGroundPoundWaitTimer();
        ResetTauntAttackWaitTimer();
        SetLastCombatBehaviorAttempted();
        //return;        
    }
Begin:

    Outer.CmdPerformGroundPound(EnemyForAttack, Outer.CrabPawn.TuneDataIceCrab.MinGroundPoundTauntTime.GetValue(), Outer.CrabPawn.TuneDataIceCrab.MaxGroundPoundTauntTime.GetValue(),, 1);
    Outer.Sleep(0.0100000);
    GotoStateWithEnemyCheck('StateCmdActive');
    stop;                    
}

state ClawSwipeAttack
{
    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        Outer.ResetSwipeAttackWaitTimer();
        SetLastCombatBehaviorAttempted();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        Outer.ResetSwipeAttackWaitTimer();
        SetLastCombatBehaviorAttempted();
        //return;        
    }
Begin:

    Outer.CmdPerformCrabClawSwipe(EnemyForAttack,, 1);
    Outer.Sleep(0.0100000);
    // End:0xBF
    if(int(Outer.WorldInfo.NetMode) == int(NM_Standalone))
    {
        // End:0xA9
        if(ShouldPostSwipeTaunt())
        {
            GotoStateWithEnemyCheck('PostSwipeTaunt');            
        }
        else
        {
            GotoStateWithEnemyCheck('StateCmdActive');
        }        
    }
    else
    {
        GotoStateWithEnemyCheck('StateCmdActive');
    }
    stop;        
}

state Stalk
{
    function ProceeduralStalk_Start()
    {
        Outer.ResetTimeOfFirstAttackOnEnemy();
        super.ProceeduralStalk_Start();
        //return;        
    }

    function StaticStalk_Start()
    {
        Outer.ResetTimeOfFirstAttackOnEnemy();
        ProceeduralStalk_Stop();
        //return;        
    }
    stop;    
}

defaultproperties
{
    AICMDFleeParams=(bStopWhenHidden=true,bFinishWhenSafe=true,DangerRadius=5000.0000000,explorationRadius=5000.0000000,computeDestinationInterval=1.0000000,FleeDangerousNodes=none,FleeDangerousBots=none,FleeSpeed=0.0000000)
    StrikeTimerName="IceCrabStrikeTimer"
    WithdrawChargeTimerName="IceCrabWithdrawChargeTimer"
    bCanStrikeBeforeReachingMeleeSlot=true
    MinAttackRange=200.0000000
    MaxAttackRange=250.0000000
}