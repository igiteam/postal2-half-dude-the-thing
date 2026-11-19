class LPAICmd_PackHunterMeleePof extends LPAICmd_PackHunterMelee within LPAIControllerPackHunter;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CircleCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeCircleBehaviorStarted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SqDistanceCirclingDoSwipe[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentSubAttackCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float WaitTimeForStaticStalk[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float WaitTimeForStalkExit[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool StaticStalkStarted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAllowedToRespondToNextAttackOptionApprovialRequardlessOfState[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMovingToWaypointOnWayToSlot[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bStaticFormationDashGoingRight[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumOfAttemptsToFindDashToPointThisAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StaticFormationDashToPoint[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StaticFormationDashStrikeDistancePastTheTargetToAimFor[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StaticFormationDashCalcSideOffset[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CirclingRadius[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StalkFastTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTimeCheckedForStrikeOpportunityWhileStockingOrMovingToMeleeSlotAndTakingHits[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxChargeReachTime[536870913];

function Pushed()
{
    local /*0x97E50000-0x00000000*/ private float DistanceCirclingDoSwipe;

    super.Pushed();
    TimeCircleBehaviorStarted = 0.0000000;
    StaticFormationDashCalcSideOffset = vect(0.0000000, 0.0000000, 0.0000000);
    bMovingToWaypointOnWayToSlot = false;
    NumOfAttemptsToFindDashToPointThisAttack = 0;
    bAllowedToRespondToNextAttackOptionApprovialRequardlessOfState = false;
    LastTimeCheckedForStrikeOpportunityWhileStockingOrMovingToMeleeSlotAndTakingHits = 0.0000000;
    DistanceCirclingDoSwipe = Outer.PHPawn.TuneDataPackHunter.DistanceCirclingDoSwipe.GetValue();
    SqDistanceCirclingDoSwipe = DistanceCirclingDoSwipe * DistanceCirclingDoSwipe;
    Outer.CurrentMeleeCommand = self;
    CurrentSubAttackCmd = none;
    //return;    
}

function Popped()
{
    // End:0x4A
    if(StaticStalkStarted)
    {
        Outer.PHPawn.EndSpecialMove(Class'LPSM_PackHunterStalkAtMeleePoint');
    }
    Outer.ResetRotationRate();
    Outer.CurrentMeleeCommand = none;
    super.Popped();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    bAllowedToRespondToNextAttackOptionApprovialRequardlessOfState = false;
    super.Resumed(OldCommandName);
    //return;    
}

event NotifyAIResourceAccessLost()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResourceAccess[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x8D
    if((ResourceAccess == Outer.MeleeAccess) && SPAIResourceAccess(ResourceAccess).GetResourceName() == 'PackHunterCircle')
    {
        Outer.AbortCommand(CircleCmd);
    }
    return super(LPAICmd_Melee).NotifyAIResourceAccessLost(ResourceAccess);
    //return ReturnValue;    
}

function CanStrike()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x0F
    if(super(LPAICmd_Melee).CanStrike())
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function StartStandOffAnimation()
{
    Outer.PHPawn.DoSpecialMove(Class'LPSM_PackHunterStandOffTaunt', true, false);
    //return;    
}

function EndStandOffAnimation()
{
    Outer.PHPawn.EndSpecialMove(Class'LPSM_PackHunterStandOffTaunt');
    //return;    
}

function HasAITimerPackHunterTimeInPaternBeforeFirstAttackTimerExpired()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x73
    if((EnemyForAttack != none) && EnemyForAttack.AIResourceManager != none)
    {
        return EnemyForAttack.AIResourceManager.HasTimerExpired('PackHunterTimeInPaternBeforeFirstAttackTimer');
    }
    //return ReturnValue;    
}

function ResetAITimerPackHunterTimeInPaternBeforeFirstAttackTimer()
{
    local /*0x97E50000-0x00000000*/ private float MinTime[9437185], MaxTime;

    -1.0000000
    -1.0000000
    // End:0x96
    if((EnemyForAttack != none) && EnemyForAttack.AIResourceManager != none)
    {
        EnemyForAttack.AIResourceManager.ResetTimerRange('PackHunterTimeInPaternBeforeFirstAttackTimer', MinTime, MaxTime);
    }
    //return;    
}

function DrawMeleeAttackArcs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Arc2BeIn[8388609];

    //return;    
}

function ShouldTryDirectAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bTryDirectAttack;

    // End:0x30
    if(Outer.WantsToDoStruggleMode(EnemyForAttack))
    {
        return true;        
    }
    else
    {
        // End:0xA5
        if(Outer.bDoOnlyForcedDirectAttack || Outer.PHPawn.TuneDataPackHunter.bDoOnlyForcedDirectAttack)
        {
            return true;            
        }
        else
        {
            // End:0xF3
            if(Outer.PHPawn.TuneDataPackHunter.bDoOnlyForcedDashAttack)
            {
                return false;
            }
        }
    }
    bTryDirectAttack = false;
    // End:0x1BB
    if(IsInState('Circling'))
    {
        // End:0x1AC
        if(VSizeSq(Outer.PHPawn.Location - EnemyForAttack.Location) < SqDistanceCirclingDoSwipe)
        {
            // End:0x1A9
            if(Outer.CanPossiblyRunInAndFastSwipeAttackThisTarget(EnemyForAttack))
            {
                bTryDirectAttack = true;
            }            
        }
        else
        {
            bTryDirectAttack = false;
        }        
    }
    else
    {
        // End:0x1F5
        if(Outer.CanPossiblyRunInAndFastSwipeAttackThisTarget(EnemyForAttack))
        {
            bTryDirectAttack = true;            
        }
    }
    return bTryDirectAttack;
    //return ReturnValue;    
}

function ShouldTurnAndClawSwipeAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float distToTarget;

    // End:0x4E
    if(Outer.PHPawn.TuneDataPackHunter.bDoOnlyForcedDashAttack)
    {
        return false;
    }
    distToTarget = VSize(Outer.PHPawn.Location - EnemyForAttack.Location);
    // End:0x105
    if(distToTarget < Outer.PHPawn.TuneDataPackHunter.MaxDistanceAwayForTurnAndClawSwipeAttack)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function ShouldTryReactionClawSwipe()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function ShouldTryFeintAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function HandlePassingToCloseToEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL Access[8388609], ResourceLocation;

    // End:0x65
    if((Access != none) && Access.IsValid())
    {
        ResourceLocation = SPAIResLocation(Access.GetResource());
    }
    // End:0x22C
    if((ResourceLocation != none) && !Outer.DoesTheDestenationPassMeToCloseToMyEnemy(EnemyForAttack, ResourceLocation.GetWorldPosition(), Outer.PHPawn.TuneDataPackHunter.DistanceLessThenThatIsToCloseToHuntersPathToMeleePoint))
    {
        // End:0x143
        if(!Outer.HaveStrikeAccess())
        {
            GetStrikeAccess(EnemyForAttack);
        }
        // End:0x22C
        if(Outer.HaveStrikeAccess())
        {
            // End:0x1CC
            if(Outer.CanPossiblyDashAttackThisTarget(EnemyForAttack))
            {
                StaticFormationDashToPoint = vect(0.0000000, 0.0000000, 0.0000000);
                StaticFormationDashStrikeDistancePastTheTargetToAimFor = -1.0000000;
                GotoStateWithEnemyCheck('DashAttack');                
            }
            else
            {
                // End:0x20D
                if(Outer.CanPossiblyTurnAndFastSwipeAttackThisTarget(EnemyForAttack))
                {
                    GotoStateWithEnemyCheck('RunInAndPerformDirectAttack');                    
                }
                else
                {
                    Outer.ReleaseStrikeAccess();
                }
            }
        }
    }
    //return;    
}

function OnEngagementAttackOptionApproved()
{
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x75
    if((IsInState('Stalk') || IsInState('WaitForClearence')) || bAllowedToRespondToNextAttackOptionApprovialRequardlessOfState)
    {
        // End:0x53
        if(int(TypeOfAttack) == int(16))
        {
            return OnDashAttackEngagementAttackOptionApproved();            
        }
        else
        {
            // End:0x72
            if(int(TypeOfAttack) == int(18))
            {
                return OnDirectAttackEngagementAttackOptionApproved();
            }
        }        
    }
    else
    {
        // End:0xB0
        if(CurrentSubAttackCmd != none)
        {
            return CurrentSubAttackCmd.OnEngagementAttackOptionApproved(TypeOfAttack);            
        }
    }
    return false;
    //return ReturnValue;    
}

function PrepForToldToPerformNewAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x41
    if(!Outer.HaveStrikeAccess())
    {
        GetStrikeAccess(EnemyForAttack, MaxChargeReachTime);
    }
    // End:0xF7
    if(Outer.HaveStrikeAccess())
    {
        // End:0xA6
        if(MoveToPositionCmd != none)
        {
            Outer.AbortCommand(MoveToPositionCmd);
            MoveToPositionCmd = none;
        }
        // End:0xE9
        if(MoveToActorCmd != none)
        {
            Outer.AbortCommand(MoveToActorCmd);
            MoveToActorCmd = none;
        }
        bAllowedToRespondToNextAttackOptionApprovialRequardlessOfState = false;
        return true;
    }
    return false;
    //return ReturnValue;    
}

function OnDashAttackEngagementAttackOptionApproved()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x22
    if(PrepForToldToPerformNewAttack())
    {
        GotoStateWithEnemyCheck('StaticFormationDashAttack');
        return true;
    }
    return false;
    //return ReturnValue;    
}

function OnDirectAttackEngagementAttackOptionApproved()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x22
    if(PrepForToldToPerformNewAttack())
    {
        GotoStateWithEnemyCheck('RunInAndPerformDirectAttack');
        return true;
    }
    return false;
    //return ReturnValue;    
}

function LookForAttackOpportunityWhileMoving()
{
    local /*0x97E50000-0x00000000*/ private float atAttackCalcTimeAttackUtilityValueScaler;
    local /*0x97E50000-0x00000000*/ private bool bshoudldDashAttackImmediately, bshoudldDirectAttackImmediately;

    bshoudldDashAttackImmediately = false;
    bshoudldDirectAttackImmediately = false;
    atAttackCalcTimeAttackUtilityValueScaler = 1.0000000;
    // End:0x252
    if((TimeStartedMoveTimer < float(0)) || (Outer.WorldInfo.TimeSeconds - TimeStartedMoveTimer) > Outer.PHPawn.TuneDataPackHunter.DelayDuringFormationMovementsBeforeAllowedToProximityAttack.GetValue())
    {
        // End:0xFB
        if(TimeStartedMoveTimer > float(0))
        {
            TimeStartedMoveTimer = -1.0000000;
        }
        // End:0x11F
        if(Outer.CurrentCombatMgrResourceRef == none)
        {
        }
        // End:0x1B4
        if(ShouldTryDashAttack())
        {
            bAllowedToRespondToNextAttackOptionApprovialRequardlessOfState = true;
            bshoudldDashAttackImmediately = Outer.CurrentCombatMgrResourceRef.PublishNewAttackOption(Outer, 16, atAttackCalcTimeAttackUtilityValueScaler, true);
            // End:0x1B1
            if(bshoudldDashAttackImmediately)
            {
                bAllowedToRespondToNextAttackOptionApprovialRequardlessOfState = false;
                StopLookForAttackOpportunityWhileMovingTimer();
                return;
            }            
        }
        else
        {
            // End:0x246
            if(ShouldTryDirectAttack())
            {
                bAllowedToRespondToNextAttackOptionApprovialRequardlessOfState = true;
                bshoudldDirectAttackImmediately = Outer.CurrentCombatMgrResourceRef.PublishNewAttackOption(Outer, 18, atAttackCalcTimeAttackUtilityValueScaler, true);
                // End:0x246
                if(bshoudldDirectAttackImmediately)
                {
                    bAllowedToRespondToNextAttackOptionApprovialRequardlessOfState = false;
                    StopLookForAttackOpportunityWhileMovingTimer();
                    return;
                }
            }
        }
        bAllowedToRespondToNextAttackOptionApprovialRequardlessOfState = false;
    }
    //return;    
}

function LookForAttackOpportunityWhileStockingOrMovingToMeleeSlotAndTakingHits()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float timePassedSinceLastValidCheck, chanceToCheckThisTime, atAttackCalcTimeAttackUtilityValueScaler;
    local /*0x97E50000-0x00000000*/ private bool bshoudldDashAttackImmediately, bshoudldDirectAttackImmediately;

    // End:0x7E
    if(((CurrentSubAttackCmd != none) && CurrentSubAttackCmd.CurMoveToActorCmd != none) && LPAICmd_AnimatedPath(CurrentSubAttackCmd.CurMoveToActorCmd.ChildCommand) != none)
    {
        return false;        
    }
    else
    {
        // End:0xF9
        if(((CurrentSubAttackCmd != none) && CurrentSubAttackCmd.MoveToPositionCmd != none) && LPAICmd_AnimatedPath(CurrentSubAttackCmd.MoveToPositionCmd.ChildCommand) != none)
        {
            return false;
        }
    }
    atAttackCalcTimeAttackUtilityValueScaler = 3.0000000;
    bshoudldDashAttackImmediately = false;
    bshoudldDirectAttackImmediately = false;
    timePassedSinceLastValidCheck = Outer.WorldInfo.TimeSeconds - LastTimeCheckedForStrikeOpportunityWhileStockingOrMovingToMeleeSlotAndTakingHits;
    // End:0x456
    if(timePassedSinceLastValidCheck >= Outer.PHPawn.TuneDataPackHunter.WaitTimeBetweenChecksForStrikeOpportunityWhileStockingOrMovingToMeleeSlotAndTakingHits)
    {
        LastTimeCheckedForStrikeOpportunityWhileStockingOrMovingToMeleeSlotAndTakingHits = Outer.WorldInfo.TimeSeconds;
        chanceToCheckThisTime = RandRange(0.0000000, 1.0000000);
        // End:0x456
        if(chanceToCheckThisTime <= Outer.PHPawn.TuneDataPackHunter.ChanceToStopAndStikeWhileStockingOrMovingToMeleeSlotAndTakingHits.GetValue())
        {
            // End:0x2C6
            if(!Outer.HaveStrikeAccess())
            {
                GetStrikeAccess(EnemyForAttack, MaxChargeReachTime);
            }
            // End:0x456
            if(Outer.HaveStrikeAccess())
            {
                NumOfAttemptsToFindDashToPointThisAttack = 0;
                bAllowedToRespondToNextAttackOptionApprovialRequardlessOfState = true;
                // End:0x37E
                if(ShouldTryDashAttack())
                {
                    bshoudldDashAttackImmediately = Outer.CurrentCombatMgrResourceRef.PublishNewAttackOption(Outer, 16, atAttackCalcTimeAttackUtilityValueScaler, true);
                    // End:0x37B
                    if(bshoudldDashAttackImmediately)
                    {
                        bAllowedToRespondToNextAttackOptionApprovialRequardlessOfState = false;
                        return true;
                    }                    
                }
                else
                {
                    // End:0x44A
                    if((ShouldTryDirectAttack()) && !Outer.PHPawn.TuneDataPackHunter.bDoOnlyForcedDashAttack)
                    {
                        bshoudldDirectAttackImmediately = Outer.CurrentCombatMgrResourceRef.PublishNewAttackOption(Outer, 18, atAttackCalcTimeAttackUtilityValueScaler, true);
                        // End:0x44A
                        if(bshoudldDirectAttackImmediately)
                        {
                            bAllowedToRespondToNextAttackOptionApprovialRequardlessOfState = false;
                            return true;
                        }
                    }
                }
                bAllowedToRespondToNextAttackOptionApprovialRequardlessOfState = false;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function ShouldTryDashAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL sideOffset;
    local /*0x97E50000-0x00000000*/ private int ScaleFactor;
    local /*0x97E50000-0x00000000*/ private bool shiftLeft;
    local /*0x97E50000-0x00000000*/ private float ammountToScale;
    local /*0x97E50000-0x00000000*/ private int goingRight;
    local /*0x97E50000-0x00000000*/ private float rangeToEnemy, rangeBetweenEnemyAndVs;

    // End:0x51
    if(Outer.PHPawn.TuneDataPackHunter.bDoOnlyForcedDashAttack)
    {
        return true;        
    }
    else
    {
        // End:0xC6
        if(Outer.bDoOnlyForcedDirectAttack || Outer.PHPawn.TuneDataPackHunter.bDoOnlyForcedDirectAttack)
        {
            return false;            
        }
        else
        {
            // End:0xF6
            if(Outer.WantsToDoStruggleMode(EnemyForAttack))
            {
                return false;                
            }
            else
            {
                // End:0x11A
                if(EnemyForAttack.IsInCover())
                {
                    return false;
                }
            }
        }
    }
    rangeToEnemy = EnemyRange2D();
    // End:0x186
    if(rangeToEnemy <= Outer.PHPawn.TuneDataPackHunter.MinDistanceAwayFromTheHunterForEnemyToBeBeforeTryingDashSttack)
    {
        return false;
    }
    rangeBetweenEnemyAndVs = Outer.RangeBetweenPawnAndClosestVsToPawn(Outer.MyLPEnemy);
    // End:0x225
    if(rangeBetweenEnemyAndVs <= Outer.PHPawn.TuneDataPackHunter.MinDistanceAwayFromTheVsForEnemyToBeBeforeTryingDashSttack)
    {
        return false;
    }
    // End:0x288
    if(float(NumOfAttemptsToFindDashToPointThisAttack) > Outer.PHPawn.TuneDataPackHunter.NumOfDashStartPositionShiftsPerStaticFormationRoundOfChecks)
    {
        NumOfAttemptsToFindDashToPointThisAttack = 0;
    }
    sideOffset = EnemyForAttack.Location - Outer.PHPawn.Location;
    sideOffset = Normal(sideOffset);
    StaticFormationDashCalcSideOffset.X = sideOffset.Y;
    StaticFormationDashCalcSideOffset.Y = -sideOffset.X;
    StaticFormationDashCalcSideOffset.Z = sideOffset.Z;
    sideOffset = StaticFormationDashCalcSideOffset;
    shiftLeft = false;
    // End:0x3E5
    if((NumOfAttemptsToFindDashToPointThisAttack % 2) == 0)
    {
        shiftLeft = true;
    }
    ScaleFactor = (NumOfAttemptsToFindDashToPointThisAttack + 1) / 2;
    ammountToScale = float(ScaleFactor) * Outer.PHPawn.TuneDataPackHunter.ShiftDistancePerStaticFormationAttemptToFindDashStartPostion;
    ammountToScale = ((shiftLeft) ? ammountToScale : -ammountToScale);
    // End:0x4BA
    if(ammountToScale != float(0))
    {
        StaticFormationDashCalcSideOffset = StaticFormationDashCalcSideOffset * ammountToScale;
    }
    NumOfAttemptsToFindDashToPointThisAttack++;
    // End:0x54B
    if(CaclPossibilityOfDashAtackWithThisOffSet(StaticFormationDashCalcSideOffset, StaticFormationDashToPoint, goingRight))
    {
        bStaticFormationDashGoingRight = ((goingRight != 0) ? true : false);
        StaticFormationDashCalcSideOffset = StaticFormationDashCalcSideOffset + (sideOffset * Outer.MyKynapseRadius);
        return true;
    }
    return false;
    //return ReturnValue;    
}

function CaclPossibilityOfDashAtackWithThisOffSet()
{
    local /*0x97E50000-0x00000000*/ private @NULL OffSetToStartFrom[8388609], PointToDashTo;
    local /*0x97E50000-0x00000000*/ private int bGoingRight[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL jumpoffPoint;

    jumpoffPoint = Outer.PHPawn.Location + OffSetToStartFrom;
    bGoingRight = 1;
    // End:0x2A7
    if(Outer.IsDestinationInsideAiMesh(jumpoffPoint))
    {
        PointToDashTo = Outer.CalcPotentialDashStrikeToPoint(true, Outer.PHPawn.Location + OffSetToStartFrom, EnemyForAttack, Outer.MyKynapseRadius + MyEnemyRadius, Outer.PHPawn.TuneDataPackHunter.DashStrikeDistancePastTheTargetToAimFor);
        // End:0x18D
        if(Outer.IsDestinationInsideAiMesh(PointToDashTo))
        {
            return true;
        }
        bGoingRight = 0;
        PointToDashTo = Outer.CalcPotentialDashStrikeToPoint(false, Outer.PHPawn.Location + OffSetToStartFrom, EnemyForAttack, Outer.MyKynapseRadius + MyEnemyRadius, Outer.PHPawn.TuneDataPackHunter.DashStrikeDistancePastTheTargetToAimFor);
        // End:0x2A7
        if(Outer.IsDestinationInsideAiMesh(PointToDashTo))
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function StartCommandForDashAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResSurroundLocation;
    local /*0x97E50000-0x00000000*/ private float minDmg, maxDmg;

    minDmg = PackHunterPawn.TuneDataPackHunter.MinAmountOfDamageRequiredToStopAttack.GetValue();
    maxDmg = PackHunterPawn.TuneDataPackHunter.MaxAmountOfDamageRequiredToStopAttack.GetValue();
    ResSurroundLocation = none;
    // End:0x11A
    if(Outer.HaveMeleeAccess())
    {
        ResSurroundLocation = LPAIResMultiLocation(Outer.MeleeAccess.GetResource());
    }
    CurrentSubAttackCmd = Outer.CmdPerformDashAttackPof(EnemyForAttack, 1, 1, minDmg, maxDmg, ResSurroundLocation, Outer.CmdStatus_PackHunterAttack, StaticFormationDashToPoint, bStaticFormationDashGoingRight, 1);
    //return;    
}

function WouldMovingStrightToLocaitonMoveMeThroughFormationCenter()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyToCheckAgainst[8388609], PointMovingTo;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL vecNpcToDest, vecDestToNpc, vecNpcToEnemy, vecDestToEnemy;

    vecNpcToDest = PointMovingTo - Outer.myAIPawn.Location;
    vecDestToNpc = Outer.myAIPawn.Location - PointMovingTo;
    vecNpcToEnemy = EnemyToCheckAgainst.Location - Outer.myAIPawn.Location;
    vecDestToEnemy = EnemyToCheckAgainst.Location - PointMovingTo;
    // End:0x15A
    if((vecNpcToDest Dot vecNpcToEnemy) > float(0))
    {
        // End:0x15A
        if((vecDestToNpc Dot vecDestToEnemy) > float(0))
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function GetWaypointToSlot()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyToCheckAgainst[8388609], PointMovingTo, ResourceForFormation, Waypoint;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL rightVec, midPointOnPath;
    local /*0x97E50000-0x00000000*/ private bool bGoingRight;
    local /*0x97E50000-0x00000000*/ private float distanceOffPathToLookForWaypoint;
    local /*0x97E50000-0x00000000*/ private bool bwaypointFound;
    local /*0x97E50000-0x00000000*/ private float FormationRadius, distanceOfPathFromEnemy;

    bGoingRight = Class'SPEngine.SPUtil'.static.IsToRightOfPathAndGetRightVec(Outer.PHPawn.Location, PointMovingTo, EnemyToCheckAgainst.Location, rightVec);
    midPointOnPath = (PointMovingTo - Outer.PHPawn.Location) * 0.5000000;
    midPointOnPath = midPointOnPath + Outer.PHPawn.Location;
    // End:0x182
    if(Outer.AreWeShowingAttackArtifacts())
    {
        Outer.DrawDebugBox(midPointOnPath, vect(100.0000000, 100.0000000, 100.0000000), 0, 255, 0, true);
    }
    FormationRadius = ResourceForFormation.GetFormationRadius();
    distanceOfPathFromEnemy = DistanceOfPathFromFormationCenter(EnemyToCheckAgainst, PointMovingTo);
    distanceOffPathToLookForWaypoint = FormationRadius - distanceOfPathFromEnemy;
    distanceOffPathToLookForWaypoint = distanceOffPathToLookForWaypoint + Outer.PHPawn.TuneDataPackHunter.DistanceOffPathToMeleeSlotToStartLookingForWaypoint;
    Waypoint = midPointOnPath + (((bGoingRight) ? float(-1) * rightVec : rightVec) * distanceOffPathToLookForWaypoint);
    bwaypointFound = Outer.IsDestinationInsideAiMesh(Waypoint);
    J0x2C9:

    // End:0x3BE [Loop If]
    if(!bwaypointFound)
    {
        distanceOffPathToLookForWaypoint -= Outer.PHPawn.TuneDataPackHunter.DecrementDistanceForLookingForWaypointOffSlotPath;
        // End:0x33E
        if(distanceOffPathToLookForWaypoint < float(0))
        {
            return false;
        }
        Waypoint = midPointOnPath + (((bGoingRight) ? float(-1) * rightVec : rightVec) * distanceOffPathToLookForWaypoint);
        bwaypointFound = Outer.IsDestinationInsideAiMesh(Waypoint);
        // [Loop Continue]
        goto J0x2C9;
    }
    return true;
    //return ReturnValue;    
}

function DistanceOfPathFromFormationCenter()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyToCheckAgainst[8388609], PathEnd;
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], distanceFromPathLine;

    distanceFromPathLine = Class'SPEngine.SPUtil'.static.SPDistanceToLine(Outer.PHPawn.Location, PathEnd, EnemyToCheckAgainst.Location);
    return distanceFromPathLine;
    //return ReturnValue;    
}

function ShouldAttackInsteadOfMovingToMeleeSlot()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL displacementFromSlotToEnemy, displacementFromMeToEnemy;
    local /*0x97E50000-0x00000000*/ private float distanceFromSlotToEnmeySQ, distanceFromMeToEnemySQ;
    local /*0x97E50000-0x00000000*/ private bool bshouldAttack;

    bshouldAttack = false;
    // End:0x144
    if((EnemyForAttack != none) && !Outer.AreWeForcedToNotLookForAttacksWhileStalking())
    {
        displacementFromSlotToEnemy = EnemyForAttack.Location - MeleeSlotPosition;
        displacementFromMeToEnemy = EnemyForAttack.Location - Outer.PHPawn.Location;
        distanceFromSlotToEnmeySQ = VSizeSq(displacementFromSlotToEnemy);
        distanceFromMeToEnemySQ = VSizeSq(displacementFromMeToEnemy);
        // End:0x144
        if(distanceFromMeToEnemySQ <= distanceFromSlotToEnmeySQ)
        {
            bAllowedToRespondToNextAttackOptionApprovialRequardlessOfState = true;
            // End:0x138
            if(ProcessLookForAttackOpportunity(true))
            {
                bshouldAttack = true;
            }
            bAllowedToRespondToNextAttackOptionApprovialRequardlessOfState = false;
        }
    }
    return bshouldAttack;
    //return ReturnValue;    
}

function ProcessLookForAttackOpportunity()
{
    local /*0x97E50000-0x00000000*/ private bool bForce[9437185], ReturnValue;
    local /*0x97E50000-0x00000000*/ private float atAttackCalcTimeAttackUtilityValueScaler;
    local /*0x97E50000-0x00000000*/ private bool bshoudldDashAttackImmediately, bshoudldDirectAttackImmediately;

    false
    atAttackCalcTimeAttackUtilityValueScaler = 1.0000000;
    bshoudldDashAttackImmediately = false;
    bshoudldDirectAttackImmediately = false;
    // End:0xCA
    if(ShouldTryDashAttack())
    {
        // End:0xC7
        if(Outer.CurrentCombatMgrResourceRef != none)
        {
            bshoudldDashAttackImmediately = Outer.CurrentCombatMgrResourceRef.PublishNewAttackOption(Outer, 16, atAttackCalcTimeAttackUtilityValueScaler, bForce);
            // End:0xC7
            if(bshoudldDashAttackImmediately)
            {
            }
        }        
    }
    // End:0x168
    if(ShouldTryDirectAttack())
    {
        // End:0x165
        if(Outer.CurrentCombatMgrResourceRef != none)
        {
            bshoudldDirectAttackImmediately = Outer.CurrentCombatMgrResourceRef.PublishNewAttackOption(Outer, 18, atAttackCalcTimeAttackUtilityValueScaler, bForce);
            // End:0x165
            if(bshoudldDirectAttackImmediately)
            {
            }
        }        
    }
    return bshoudldDashAttackImmediately || bshoudldDirectAttackImmediately;
    //return ReturnValue;    
}

function DoSlideStop()
{
    Outer.bDidSlideStop = false;
    Outer.PawnZeroVelocity();
    //return;    
}

final function StartPocessLookForAttackOpportunityTimer()
{
    // End:0x6D
    if(!Outer.bDisableAI && !IsPocessLookForAttackOpportunityTimerActive())
    {
        // End:0x6D
        if(!ProcessLookForAttackOpportunity())
        {
            Outer.SetTimer(0.0100000, true, 'PocessLookForAttackOpportunityTimer', self);
        }
    }
    //return;    
}

final function StopPocessLookForAttackOpportunityTimer()
{
    Outer.ClearTimer('PocessLookForAttackOpportunityTimer', self);
    //return;    
}

function PausePocessLookForAttackOpportunityTimer()
{
    local /*0x97E50000-0x00000000*/ private bool bPause[8388609];

    // End:0x1A
    if(bPause)
    {
        StopPocessLookForAttackOpportunityTimer();        
    }
    else
    {
        StartPocessLookForAttackOpportunityTimer();
    }
    //return;    
}

final function IsPocessLookForAttackOpportunityTimerActive()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.IsTimerActive('PocessLookForAttackOpportunityTimer', self);
    //return ReturnValue;    
}

private final function PocessLookForAttackOpportunityTimer()
{
    ProcessLookForAttackOpportunity();
    //return;    
}

function SetDesiredEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private float FormationRadius;

    FormationRadius = Outer.GetFormationRadiusForEnemy(InEnemy);
    // End:0xD2
    if((FormationRadius > float(0)) && Outer.myAIPawn.GroundSpeed > float(0))
    {
        MaxChargeReachTime = (FormationRadius / Outer.myAIPawn.GroundSpeed) + 1.0000000;        
    }
    else
    {
        MaxChargeReachTime = -1.0000000;
    }
    super.SetDesiredEnemy(InEnemy);
    //return;    
}

state MoveCloserToEnemy
{
    event NotifyOfNonCoreHit()
    {
        local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
        local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return super(LPAICommand).NotifyOfNonCoreHit(AmountOfDamage, TypeOfDamage);
        //return ReturnValue;        
    }

    event NotifyOfCoreHit()
    {
        local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
        local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
        local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return super(LPAICommand).NotifyOfCoreHit(HitCoreIndex, AmountOfDamage, TypeOfDamage);
        //return ReturnValue;        
    }
    stop;    
}

state MoveToMeleeSlot
{
    event NotifyOfNonCoreHit()
    {
        local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
        local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        LookForAttackOpportunityWhileStockingOrMovingToMeleeSlotAndTakingHits();
        return super(LPAICommand).NotifyOfNonCoreHit(AmountOfDamage, TypeOfDamage);
        //return ReturnValue;        
    }

    event NotifyOfCoreHit()
    {
        local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
        local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
        local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        LookForAttackOpportunityWhileStockingOrMovingToMeleeSlotAndTakingHits();
        return super(LPAICommand).NotifyOfCoreHit(HitCoreIndex, AmountOfDamage, TypeOfDamage);
        //return ReturnValue;        
    }

    function AttemptStrikeAccess()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    function DoneWithManeuverToSlot()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x0F
        if(bMovingToWaypointOnWayToSlot)
        {
            return false;
        }
        return true;
        //return ReturnValue;        
    }
    stop;    
}

state Stalk
{
    ignores PreMove;

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super.EndState(NextStateName);
        StopPocessLookForAttackOpportunityTimer();
        // End:0x67
        if(StaticStalkStarted)
        {
            Outer.PHPawn.EndSpecialMove(Class'LPSM_PackHunterStalkAtMeleePoint');
        }
        Outer.AbortCommand(MoveToPositionCmd);
        MoveToPositionCmd = none;
        // End:0xFC
        if(Outer.CurrentCombatMgrResourceRef != none)
        {
            Outer.CurrentCombatMgrResourceRef.RetractAllOptionsForThisPublisher(Outer);
        }
        Outer.myAIPawn.SetMaxSpeedScale(PackHunterPawn.TuneDataPackHunter.GetNormalMaxSpeedScale(Outer.myAIPawn));
        Outer.PawnZeroVelocity();
        //return;        
    }

    event PoppedState()
    {
        super.PoppedState();
        StopPocessLookForAttackOpportunityTimer();
        // End:0x5E
        if(StaticStalkStarted)
        {
            Outer.PHPawn.EndSpecialMove(Class'LPSM_PackHunterStalkAtMeleePoint');
        }
        Outer.AbortCommand(MoveToPositionCmd);
        MoveToPositionCmd = none;
        // End:0xF3
        if(Outer.CurrentCombatMgrResourceRef != none)
        {
            Outer.CurrentCombatMgrResourceRef.RetractAllOptionsForThisPublisher(Outer);
        }
        Outer.myAIPawn.SetMaxSpeedScale(PackHunterPawn.TuneDataPackHunter.GetNormalMaxSpeedScale(Outer.myAIPawn));
        Outer.PawnZeroVelocity();
        //return;        
    }

    event NotifyOfNonCoreHit()
    {
        local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
        local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x19
        if(!LookForAttackOpportunityWhileStockingOrMovingToMeleeSlotAndTakingHits())
        {
            ResetStalkOnHit();
        }
        return super(LPAICommand).NotifyOfNonCoreHit(AmountOfDamage, TypeOfDamage);
        //return ReturnValue;        
    }

    event NotifyOfCoreHit()
    {
        local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
        local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
        local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x19
        if(!LookForAttackOpportunityWhileStockingOrMovingToMeleeSlotAndTakingHits())
        {
            ResetStalkOnHit();
        }
        return super(LPAICommand).NotifyOfCoreHit(HitCoreIndex, AmountOfDamage, TypeOfDamage);
        //return ReturnValue;        
    }

    function ResetStalkOnHit()
    {
        // End:0xE2
        if(StalkFastTime < Outer.myAIPawn.WorldInfo.TimeSeconds)
        {
            Outer.AbortCommand(MoveToPositionCmd);
            MoveToPositionCmd = none;
            StalkFastTime = Outer.myAIPawn.WorldInfo.TimeSeconds + float(10);
        }
        //return;        
    }

    function OnStartStalk()
    {
        Outer.Focus = EnemyForAttack;
        NumOfAttemptsToFindDashToPointThisAttack = 0;
        StaticFormationDashCalcSideOffset = vect(0.0000000, 0.0000000, 0.0000000);
        WaitTimeForStaticStalk = Outer.myAIPawn.WorldInfo.TimeSeconds + RandRange(1.0000000, 1.5000000);
        StaticStalkStarted = false;
        // End:0xEC
        if(!Outer.AreWeForcedToNotLookForAttacksWhileStalking())
        {
            StartPocessLookForAttackOpportunityTimer();
        }
        //return;        
    }

    function OnStopStalk()
    {
        StopPocessLookForAttackOpportunityTimer();
        WaitTimeForStalkExit = Outer.myAIPawn.WorldInfo.TimeSeconds + RandRange(0.0000000, 0.2000000);
        //return;        
    }

    function ShouldDoProceeduralStalk()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x24
        if(Outer.bIndoorBehavior)
        {
            return false;
        }
        return super.ShouldDoProceeduralStalk();
        //return ReturnValue;        
    }

    function ShouldWaitBeforeExitState()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return WaitTimeForStalkExit > Outer.myAIPawn.WorldInfo.TimeSeconds;
        //return ReturnValue;        
    }

    function GotoPostStalkState()
    {
        GotoStateWithEnemyCheck('GetMeleeFormationClearenceOnFormationChange');
        //return;        
    }

    function StaticStalk_ShouldWait()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return WaitTimeForStaticStalk > Outer.myAIPawn.WorldInfo.TimeSeconds;
        //return ReturnValue;        
    }

    function StaticStalk_Start()
    {
        OnStartStalk();
        // End:0x76
        if(!StaticStalkStarted)
        {
            Outer.PHPawn.DoSpecialMove(Class'LPSM_PackHunterStalkAtMeleePoint', true, false, None, none);
            StaticStalkStarted = true;
        }
        //return;        
    }

    function StaticStalk_Stop()
    {
        OnStopStalk();
        // End:0x60
        if(StaticStalkStarted)
        {
            Outer.PHPawn.EndSpecialMove(Class'LPSM_PackHunterStalkAtMeleePoint');
            StaticStalkStarted = false;
        }
        //return;        
    }

    function ProceeduralStalk_Start()
    {
        OnStartStalk();
        Outer.myAIPawn.SetMaxSpeedScale(PackHunterPawn.TuneDataPackHunter.GetNormalMaxSpeedScale(Outer.myAIPawn));
        //return;        
    }

    function ProceeduralStalk_Stop()
    {
        OnStopStalk();
        //return;        
    }
    stop;    
}

state DashAttack
{
    ignores BeginState, PushedState;

    event PoppedState()
    {
        Outer.ReleaseStrikeAccess();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.ReleaseStrikeAccess();
        //return;        
    }
Begin:

    Outer.myAIPawn.SetMaxSpeedScale(PackHunterPawn.TuneDataPackHunter.GetNormalMaxSpeedScale(Outer.myAIPawn));
    StartCommandForDashAttack();
    Outer.ReleaseStrikeAccess();
    ResetAttackWaitTimer();
    CurrentSubAttackCmd = none;
    GotoStateWithEnemyCheck('StateCmdActive');
    stop;            
}

state StaticFormationDashAttack
{
    ignores BeginState, PushedState;

    event PoppedState()
    {
        Outer.ReleaseStrikeAccess();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.ReleaseStrikeAccess();
        //return;        
    }
Begin:

    Outer.myAIPawn.SetMaxSpeedScale(PackHunterPawn.TuneDataPackHunter.GetNormalMaxSpeedScale(Outer.myAIPawn));
    // End:0xD0
    if(StaticStalkStarted)
    {
        Outer.PHPawn.EndSpecialMove(Class'LPSM_PackHunterStalkAtMeleePoint');
    }
    Outer.ReleaseMeleeAccess();
    StartCommandForDashAttack();
    Outer.ReleaseStrikeAccess();
    ResetAttackWaitTimer();
    GotoStateWithEnemyCheck('StateCmdActive');
    stop;                    
}

state RunInClawSwipeAttack
{
    ignores BeginState, PushedState;

    event PoppedState()
    {
        Outer.ReleaseStrikeAccess();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.ReleaseStrikeAccess();
        //return;        
    }

    function StartCommandForRunInSwipeAttack()
    {
        Outer.CmdPerformSwipeAttackPof(EnemyForAttack, Outer.CmdStatus_PackHunterAttack, 1);
        //return;        
    }

    function StartCommandForRunInAndDirectAttack()
    {
        local /*0x97E50000-0x00000000*/ private @NULL ResLoc;

        ResLoc = none;
        // End:0x74
        if(Outer.HaveMeleeAccess())
        {
            ResLoc = LPAIResMultiLocation(Outer.MeleeAccess.GetResource());
        }
        Outer.CmdPerformDirectAttackPof(EnemyForAttack, int(PackHunterPawn.TuneDataPackHunter.MinNumberOfStrikeAttemptsWhenDirectAttackFromStaticFormation.GetValue()), int(PackHunterPawn.TuneDataPackHunter.MaxNumberOfStrikeAttemptsWhenDirectAttackFromStaticFormation.GetValue()), PackHunterPawn.TuneDataPackHunter.MinAmountOfDamageRequiredToStopAttack.GetValue(), PackHunterPawn.TuneDataPackHunter.MaxAmountOfDamageRequiredToStopAttack.GetValue(), ResLoc, Outer.CmdStatus_PackHunterAttack, 1);
        //return;        
    }
Begin:

    Outer.myAIPawn.SetMaxSpeedScale(PackHunterPawn.TuneDataPackHunter.GetNormalMaxSpeedScale(Outer.myAIPawn));
    StartCommandForRunInAndDirectAttack();
    Outer.ReleaseStrikeAccess();
    ResetAttackWaitTimer();
    GotoStateWithEnemyCheck('StateCmdActive');
    stop;        
}

state RunInAndPerformDirectAttack
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        Outer.PHPawn.RotationRate.Yaw = int(Outer.PHPawn.TuneDataPackHunter.YawTurnRateWhenPlayerTooClose);
        Outer.ReleaseMeleeAccess();
        //return;        
    }

    event PushedState()
    {
        Outer.ReleaseMeleeAccess();
        //return;        
    }

    event PoppedState()
    {
        Outer.ReleaseStrikeAccess();
        Outer.ResetRotationRate();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.ReleaseStrikeAccess();
        Outer.ResetRotationRate();
        //return;        
    }

    function StartCommandForRunInAndDirectAttack()
    {
        local /*0x97E50000-0x00000000*/ private @NULL ResLoc;

        ResLoc = none;
        // End:0x74
        if(Outer.HaveMeleeAccess())
        {
            ResLoc = LPAIResMultiLocation(Outer.MeleeAccess.GetResource());
        }
        CurrentSubAttackCmd = Outer.CmdPerformDirectAttackPof(EnemyForAttack, int(PackHunterPawn.TuneDataPackHunter.MinNumberOfStrikeAttemptsWhenDirectAttackFromStaticFormation.GetValue()), int(PackHunterPawn.TuneDataPackHunter.MaxNumberOfStrikeAttemptsWhenDirectAttackFromStaticFormation.GetValue()), PackHunterPawn.TuneDataPackHunter.MinAmountOfDamageRequiredToStopAttack.GetValue(), PackHunterPawn.TuneDataPackHunter.MaxAmountOfDamageRequiredToStopAttack.GetValue(), ResLoc, Outer.CmdStatus_PackHunterAttack, 1);
        //return;        
    }
Begin:

    DoSlideStop();
    Outer.myAIPawn.SetMaxSpeedScale(PackHunterPawn.TuneDataPackHunter.GetNormalMaxSpeedScale(Outer.myAIPawn));
    StartCommandForRunInAndDirectAttack();
    Outer.ReleaseStrikeAccess();
    ResetAttackWaitTimer();
    CurrentSubAttackCmd = none;
    GotoStateWithEnemyCheck('StateCmdActive');
    stop;                    
}

state FeintAttack
{
    ignores BeginState, PushedState, StartCommandForFeintAttack;

    event PoppedState()
    {
        Outer.ReleaseFeintAccess();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.ReleaseFeintAccess();
        //return;        
    }
Begin:

    StartCommandForFeintAttack();
    Outer.ReleaseFeintAccess();
    GotoStateWithEnemyCheck('StateCmdActive');
    stop;                
}

state BeginStrike
{Begin:

    // End:0x22
    if(!HasAccessToStartAttack())
    {
        GotoStateWithEnemyCheck('GetMeleeFormationClearence');
    }
    Outer.ReleaseMeleeAccess();
    // End:0xA8
    if(Outer.CanPossiblyDashAttackThisTarget(EnemyForAttack))
    {
        StaticFormationDashToPoint = vect(0.0000000, 0.0000000, 0.0000000);
        StaticFormationDashStrikeDistancePastTheTargetToAimFor = -1.0000000;
        GotoStateWithEnemyCheck('DashAttack');        
    }
    else
    {
        GotoStateWithEnemyCheck('RunInAndPerformDirectAttack');
    }
    stop;                    
}

state WaitForClearence
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        StartPocessLookForAttackOpportunityTimer();
        //return;        
    }

    event PushedState()
    {
        StartPocessLookForAttackOpportunityTimer();
        super(SPStateObject).PushedState();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        StopPocessLookForAttackOpportunityTimer();
        super.EndState(NextStateName);
        //return;        
    }

    event PoppedState()
    {
        StopPocessLookForAttackOpportunityTimer();
        super.PoppedState();
        //return;        
    }
    stop;    
}
