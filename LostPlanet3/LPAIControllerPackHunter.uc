class LPAIControllerPackHunter extends LPAIControllerAkridMedium
    config(AI)
    hidecategories(AnimDependency,Navigation);

enum ePackHunterStrikeType
{
    ePackHunterStrike_None,         // 0
    ePackHunterStrike_FlyingRightClaw,// 1
    ePackHunterStrike_FlyingLeftClaw,// 2
    ePackHunterStrike_ShortBiteForward,// 3
    ePackHunterStrike_ShortBiteLeft,// 4
    ePackHunterStrike_ShortBiteRight,// 5
    ePackHunterStrike_FarBiteForward,// 6
    ePackHunterStrike_NoTurnClawLeft,// 7
    ePackHunterStrike_NoTurnClawRight,// 8
    ePackHunterStrike_LargeTurnClawLeft,// 9
    ePackHunterStrike_LargeTurnClawRight,// 10
    ePackHunterStrike_180TailWhipLeft,// 11
    ePackHunterStrike_180TailWhipRight,// 12
    ePackHunterStrike_ShortClawLungeForward,// 13
    ePackHunterStrike_FarClawLungeForward,// 14
    ePackHunterStrike_MAX           // 15
};

enum ePackHunterHitReactionPart
{
    ePackHunterHitReactionPart_Default,// 0
    ePackHunterHitReactionPart_Head,// 1
    ePackHunterHitReactionPart_LeftShoulder,// 2
    ePackHunterHitReactionPart_RightShoulder,// 3
    ePackHunterHitReactionPart_BackHips,// 4
    ePackHunterHitReactionPart_MAX  // 5
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PHPawn[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL CmdStatus_PackHunterAttack[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL CmdStatus_PackHunterRunningAttack[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentCombatMgrAccess;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentCombatMgrResourceRef;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUseAIResourceForEngagement[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDoOnlyForcedDirectAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bStruckTargetDuringDash[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bStruckBlockingObjectDuringDash[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDidSlideStop[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool PHUseDefaultHitReaction[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool PHUseDefaultGrenadeHitReaction[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIndoorBehavior[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FrontBiteMaxAngularRangeInRads;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TurnHeadAndBiteMaxAngularRangeInRads;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FarTurnNonMovingStrikeMaxAngularRangeInRads;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastJumpBackTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinTimeBetweenConsecutiveJumpBacks[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentMeleeCommand[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PHCSAHitReactionActiveTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float NextPHCSAHitReactionUseTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MovingHitReactionSpeedThreshold[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastDashAttackTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FrontBiteStrikeZoneDebugColor[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SideBiteStrikeZoneDebugColor[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LongClawTurnStrikeZoneDebugColor[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TailWhipStrikeZoneDebugColor[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MedLungeStrikeZoneDebugColor[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FarLungeStrikeZoneDebugColor[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DamAssToCloseZoneDebugColor[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DamAssToFarZoneDebugColor[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PercentOfRangeToShowZoneName[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStampFallDown[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastWaitBetweenStrikeCommands[536870913];

// Export ULPAIControllerPackHunter::execWantsToDoStruggleMode(FFrame&, void* const)
native function WantsToDoStruggleMode()
{
    local /*0x97E50000-0x00000000*/ private @NULL TargetOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

event Possess()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVehicleTransition[8388609];
    local /*0x97E50000-0x00000000*/ private float HalfRad;

    CurrentMeleeCommand = none;
    super.Possess(inPawn, bVehicleTransition);
    PHPawn = LPAIPawnPackHunter(inPawn);
    HalfRad = (3.1415930 / float(180)) * 0.5000000;
    FrontBiteMaxAngularRangeInRads = PHPawn.TuneDataPackHunter.FrontBiteMaxAngularRangeInDegrees * HalfRad;
    TurnHeadAndBiteMaxAngularRangeInRads = PHPawn.TuneDataPackHunter.TurnHeadBiteMaxAngularRangeInDegrees * HalfRad;
    FarTurnNonMovingStrikeMaxAngularRangeInRads = PHPawn.TuneDataPackHunter.FarTurnNonMovingStrikeMaxAngularRangeInDegrees * HalfRad;
    StartStrikeAccessEmissiveStatusTimer();
    // End:0x159
    if(bIndoorBehavior)
    {
        InitIndoorMode();
    }
    //return;    
}

event UnPossess()
{
    // End:0x19
    if(CurrentCombatMgrResourceRef != none)
    {
        ReleaseEngagementAccess();
    }
    StopStrikeAccessEmissiveStatusTimer();
    super(LPAIController).UnPossess();
    //return;    
}

event Destroyed()
{
    StopStrikeAccessEmissiveStatusTimer();
    // End:0x23
    if(CurrentCombatMgrResourceRef != none)
    {
        ReleaseEngagementAccess();
    }
    super(LPAIController).Destroyed();
    //return;    
}

function InitIndoorMode()
{
    bDoOnlyForcedDirectAttack = true;
    //return;    
}

function SetAttackResourceNames()
{
    MeleeResourceName = 'PackHunterFormation';
    StrikeResourceName = 'strike';
    FeintResourceName = 'Feint';
    StruggleResourceName = 'Struggle';
    //return;    
}

function GetStrikeRevokeRatingModificationFactor()
{
    local /*0x97E50000-0x00000000*/ private float Scale[25165825], Constant, attackScaler;

    attackScaler = 0.0000000;
    // End:0x98
    if(MyLPEnemy != none)
    {
        attackScaler = GetEnemysFactorInArc(MyLPEnemy, 45.0000000);
        // End:0x76
        if((attackScaler > float(0)) && attackScaler < float(1))
        {
            Constant = -10.0000000;            
        }
        else
        {
            Constant = 10.0000000;
        }
        Scale = attackScaler;
    }
    return;
    //return;    
}

function HaveEngagementAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (CanBeMyEnemy(InEnemy)) && IsCurrentCombatMgrAccessForThisEnemy(InEnemy);
    //return ReturnValue;    
}

function ReleaseEngagementAccess()
{
    // End:0x73
    if(CurrentCombatMgrAccess != none)
    {
        // End:0x3E
        if(CurrentCombatMgrResourceRef != none)
        {
            CurrentCombatMgrResourceRef.RetractAllOptionsForThisPublisher(self);
        }
        CurrentCombatMgrAccess.Destroy();
        CurrentCombatMgrAccess = none;
        CurrentCombatMgrResourceRef = none;
    }
    //return;    
}

function IsCurrentCombatMgrAccessForThisEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(!bUseAIResourceForEngagement)
    {
        return true;
    }
    // End:0xAB
    if(CurrentCombatMgrAccess != none)
    {
        // End:0x76
        if(CurrentCombatMgrAccess.GetOuterActor() == InEnemy)
        {
            // End:0x73
            if(!CurrentCombatMgrAccess.IsDestroyed())
            {
                return true;
            }            
        }
        else
        {
            CurrentCombatMgrAccess.Destroy();
            CurrentCombatMgrAccess = none;
            CurrentCombatMgrResourceRef = none;
        }
    }
    return false;
    //return ReturnValue;    
}

function GetEngagementAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];

    // End:0x11
    if(InEnemy == none)
    {
        return;
    }
    // End:0xDD
    if(bUseAIResourceForEngagement && !HaveEngagementAccess(InEnemy))
    {
        CurrentCombatMgrAccess = InEnemy.AIResourceManager.GetAccess('PackHunterCombatManager', myAIPawn);
        // End:0xDD
        if(CurrentCombatMgrAccess != none)
        {
            CurrentCombatMgrResourceRef = LPAIResPackHunterCombatManager(CurrentCombatMgrAccess.GetResource());
            // End:0xDD
            if(CurrentCombatMgrResourceRef == none)
            {                
            }
        }
    }
    //return;    
}

function NotifyCombatManagerOfAttackCompleted()
{
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool bFailedToStart[8388609], bAllreadyAssumedCurrentAttackIsDone, bCleanOutAllAttackOptions;

    false
    false
    // End:0xB1
    if(CurrentCombatMgrResourceRef != none)
    {
        // End:0x52
        if(bFailedToStart)
        {
            CurrentCombatMgrResourceRef.NotifyOfAttackFailedToStart(self, TypeOfAttack);            
        }
        else
        {
            CurrentCombatMgrResourceRef.NotifyOfAttackCompleted(self, TypeOfAttack, bAllreadyAssumedCurrentAttackIsDone);
        }
        // End:0xB1
        if(bCleanOutAllAttackOptions)
        {
            CurrentCombatMgrResourceRef.CleanOutAllAttackOptions();
        }
    }
    //return;    
}

function NotifyCombatManagerOfStrikeCompleted()
{
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];

    // End:0x38
    if(CurrentCombatMgrResourceRef != none)
    {
        CurrentCombatMgrResourceRef.NotifyOfStrikeActionCompleted(self, TypeOfAttack);
    }
    //return;    
}

function ReleaseStrikeAccessForNeedingToReattemptMoveInToStrike()
{
    //return;    
}

function OnConsoleCommand()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    super(LPAIController).OnConsoleCommand(inAction);
    //return;    
}

function ForceStruggleModeNow()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyForStruggleMode[8388609];
    local /*0x97E50000-0x00000000*/ private class StruggleModeClass[9437185];

    none
    CmdPackHunterStrugglePofStrike(EnemyForStruggleMode,, 0, StruggleModeClass);
    //return;    
}

function NotifyPlayerStartMelee()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL PlayerToPH;
    local /*0x97E50000-0x00000000*/ private float Distance, dotProduct;

    // End:0x25
    if(PHPawn.HasDamageImmunityWithEffects())
    {
        return true;
    }
    PlayerToPH = PHPawn.Location - PlayerPawn.Location;
    Distance = VSize(PlayerToPH);
    // End:0xC5
    if(Distance > PHPawn.TuneDataPackHunter.JumpBackDistanceToPlayer)
    {
        return true;
    }
    dotProduct = Normal(PlayerToPH) Dot Vector(PlayerPawn.Rotation);
    // End:0x13F
    if(dotProduct < PHPawn.TuneDataPackHunter.JumpBackDotProductToPlayer)
    {
        return true;
    }
    // End:0x17F
    if(CommandList != none)
    {
        LPAICommand(CommandList).NotifyPlayerStartMelee(PlayerPawn);
    }
    return false;
    //return ReturnValue;    
}

function NotifyPlayerMeleeHit()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn[8388609], ImpactLocation;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x4A
    if(CommandList != none)
    {
        return LPAICommand(CommandList).NotifyPlayerMeleeHit(PlayerPawn, ImpactLocation);
    }
    return false;
    //return ReturnValue;    
}

function GetDistanceAwayFromEnemyForDash()
{
    local /*0x97E50000-0x00000000*/ private @NULL TargetOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], enemyRadius;

    enemyRadius = Class'LPAIUtils'.static.KynapseAdjustedRadius(TargetOfAttack);
    return (PHPawn.TuneDataPackHunter.DashClawStrikeStartDistance + enemyRadius) + MyKynapseRadius;
    //return ReturnValue;    
}

function CanPossiblyDashAttackThisTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL TargetOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL displacementToEnemy;
    local /*0x97E50000-0x00000000*/ private float distanceToEnemy, minDistanceToDash;

    // End:0x4B
    if(bDoOnlyForcedDirectAttack || PHPawn.TuneDataPackHunter.bDoOnlyForcedDirectAttack)
    {
        return false;        
    }
    else
    {
        // End:0x66
        if(WantsToDoStruggleMode(TargetOfAttack))
        {
            return false;            
        }
        else
        {
            // End:0x8A
            if(TargetOfAttack.IsInCover())
            {
                return false;
            }
        }
    }
    // End:0x116
    if((LastDashAttackTime > float(0)) && (WorldInfo.TimeSeconds - LastDashAttackTime) < PHPawn.TuneDataPackHunter.MinTimeBetweenDashAttacks.GetValue())
    {
        return false;
    }
    minDistanceToDash = GetDistanceAwayFromEnemyForDash(TargetOfAttack);
    displacementToEnemy = TargetOfAttack.Location - PHPawn.Location;
    distanceToEnemy = VSize2D(displacementToEnemy);
    return distanceToEnemy > minDistanceToDash;
    //return ReturnValue;    
}

function GetDistanceAwayFromEnemyForRunInAndFastSwipe()
{
    local /*0x97E50000-0x00000000*/ private @NULL TargetOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], enemyRadius;

    enemyRadius = Class'LPAIUtils'.static.KynapseAdjustedRadius(TargetOfAttack);
    return (PHPawn.TuneDataPackHunter.DistanceStopAndStrike + enemyRadius) + MyKynapseRadius;
    //return ReturnValue;    
}

function CanPossiblyRunInAndFastSwipeAttackThisTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL TargetOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x39
    if(PHPawn.TuneDataPackHunter.bDoOnlyForcedDashAttack)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function CanPossiblyTurnAndFastSwipeAttackThisTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL TargetOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL displacementToEnemy;
    local /*0x97E50000-0x00000000*/ private float distanceToEnemy, minDistanceToSwipe;

    // End:0x39
    if(PHPawn.TuneDataPackHunter.bDoOnlyForcedDashAttack)
    {
        return false;
    }
    minDistanceToSwipe = PHPawn.TuneDataPackHunter.MaxDistanceAwayForTurnAndClawSwipeAttack;
    displacementToEnemy = TargetOfAttack.Location - PHPawn.Location;
    distanceToEnemy = VSize2D(displacementToEnemy);
    return distanceToEnemy > minDistanceToSwipe;
    //return ReturnValue;    
}

function IsPawnInDirectStrikeZone()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnToTest[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float rangeToEnemy2D;

    rangeToEnemy2D = RangeToPawn2D(PawnToTest);
    // End:0x63
    if(rangeToEnemy2D < PHPawn.TuneDataPackHunter.MaxRangeToTargetForFarClawLungeStrike)
    {
        return true;        
    }
    return false;
    //return ReturnValue;    
}

function DrawAttackArcs()
{
    //return;    
}

function DrawStrikeZone()
{
    local /*0x97E50000-0x00000000*/ private @NULL OrginOfStrikeZone[8388609], RotOrginOfZone;
    local /*0x97E50000-0x00000000*/ private editfixedsize string ZoneName[8388609];
    local /*0x97E50000-0x00000000*/ private float StartAngleInRads[8388609], EndAngleInRads, RangeOfZone;
    local /*0x97E50000-0x00000000*/ private @NULL ZoneColor[8388609];

    //return;    
}

function IsInAngularRange()
{
    local /*0x97E50000-0x00000000*/ private float AngularRangeToCheck[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PointToTestAgainst[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Displacement, Horiz, Forward;
    local /*0x97E50000-0x00000000*/ private float dotOfHeadingToForward, arcCosineOfDot;

    Displacement = PointToTestAgainst - PHPawn.Location;
    Horiz = Displacement;
    Horiz.Z = 0.0000000;
    Horiz = Normal(Horiz);
    Forward = Vector(PHPawn.Rotation);
    dotOfHeadingToForward = Horiz Dot Forward;
    arcCosineOfDot = Acos(dotOfHeadingToForward);
    // End:0xFB
    if(arcCosineOfDot < AngularRangeToCheck)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function GetNoMovementStikeToAttemptOnThisTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnToTest[8388609];
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private bool benemyToRight;

    // End:0x43
    if(Class'SPEngine.SPUtil'.static.IsToRight(PHPawn, PawnToTest))
    {
        benemyToRight = true;        
    }
    else
    {
        benemyToRight = false;
    }
    // End:0x89
    if(IsInAngularRange(FrontBiteMaxAngularRangeInRads, PawnToTest.Location))
    {
        return 3;        
    }
    else
    {
        // End:0xD6
        if(IsInAngularRange(TurnHeadAndBiteMaxAngularRangeInRads, PawnToTest.Location))
        {
            // End:0xD0
            if(benemyToRight)
            {
                return 5;                
            }
            else
            {
                return 4;
            }            
        }
        else
        {
            // End:0x123
            if(IsInAngularRange(FarTurnNonMovingStrikeMaxAngularRangeInRads, PawnToTest.Location))
            {
                // End:0x11D
                if(benemyToRight)
                {
                    return 10;                    
                }
                else
                {
                    return 9;
                }                
            }
            else
            {
                // End:0x136
                if(benemyToRight)
                {
                    return 12;                    
                }
                else
                {
                    return 11;
                }
            }
        }
    }
    //return ReturnValue;    
}

function CalcPotentialDashStrikeToPoint()
{
    local /*0x97E50000-0x00000000*/ private bool bRightOfTarget[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PositionToUseAsStartPoint[8388609], EnemyToStrike;
    local /*0x97E50000-0x00000000*/ private float ErrorRangeForFirstMovement[8388609], DashStrikeDistancePastTheTargetToAimFor;
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], strikeTargetPoint, targetTempPoint, targetTempPointNorm, offsetPoint, displacementToEnemy,
	    offsetTempPoint, proposedLaunchPoint, packHunLoc;

    local /*0x97E50000-0x00000000*/ private float distToTarget, distToLaunchPoint;

    packHunLoc = PositionToUseAsStartPoint;
    displacementToEnemy = EnemyToStrike.Location - packHunLoc;
    distToTarget = VSize2D(packHunLoc - EnemyToStrike.Location);
    distToLaunchPoint = distToTarget - (PHPawn.TuneDataPackHunter.DashClawStrikeStartDistance + ErrorRangeForFirstMovement);
    offsetTempPoint = Normal(displacementToEnemy);
    proposedLaunchPoint = offsetTempPoint * distToLaunchPoint;
    proposedLaunchPoint = proposedLaunchPoint + packHunLoc;
    offsetPoint.X = offsetTempPoint.Y;
    offsetPoint.Y = -offsetTempPoint.X;
    offsetPoint.Z = offsetTempPoint.Z;
    // End:0x22C
    if(bRightOfTarget)
    {
        offsetPoint = offsetPoint * PHPawn.TuneDataPackHunter.DashStrikeDistanceToTheSideOfTargetToAimFor;        
    }
    else
    {
        offsetPoint = (offsetPoint * -1.0000000) * PHPawn.TuneDataPackHunter.DashStrikeDistanceToTheSideOfTargetToAimFor;
    }
    offsetTempPoint = offsetPoint + EnemyToStrike.Location;
    targetTempPoint = offsetTempPoint - proposedLaunchPoint;
    targetTempPointNorm = Normal(targetTempPoint);
    strikeTargetPoint = targetTempPointNorm * (distToTarget + DashStrikeDistancePastTheTargetToAimFor);
    strikeTargetPoint = strikeTargetPoint + proposedLaunchPoint;
    strikeTargetPoint.Z = proposedLaunchPoint.Z;
    return strikeTargetPoint;
    //return ReturnValue;    
}

function ReleaseStrikeAccessAtTheEndOfStrikesBeforeDamageAssessment()
{
    //return;    
}

function OnEngagementAttackOptionApproved()
{
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x38
    if(CurrentMeleeCommand != none)
    {
        return CurrentMeleeCommand.OnEngagementAttackOptionApproved(TypeOfAttack);
    }
    return false;
    //return ReturnValue;    
}

function GetCurrentAttackDesirabilityScaler()
{
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL TargetOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL possibleEnemy;
    local /*0x97E50000-0x00000000*/ private float attackScaler;

    possibleEnemy = LPPawn(TargetOfAttack);
    attackScaler = 1.0000000;
    // End:0x177
    if(possibleEnemy != none)
    {
        // End:0xA6
        if(IsEnemyInAttackArc(possibleEnemy))
        {
            attackScaler = PHPawn.TuneDataPackHunter.InAttackArcDesirabilityOfAttackScaler.GetValue();            
        }
        else
        {
            // End:0x110
            if(int(TypeOfAttack) == int(16))
            {
                attackScaler = PHPawn.TuneDataPackHunter.DashAttackNotInAttackArcDesirabilityOfAttackScaler.GetValue();                
            }
            else
            {
                // End:0x177
                if(int(TypeOfAttack) == int(18))
                {
                    attackScaler = PHPawn.TuneDataPackHunter.DirectAttackNotInAttackArcDesirabilityOfAttackScaler.GetValue();
                }
            }
        }
    }
    return attackScaler;
    //return ReturnValue;    
}

event NotifyOfCoreHit()
{
    local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL curCommand;
    local /*0x97E50000-0x00000000*/ private bool bCommandWantsToOverridePawnsBasicHitReation;

    bCommandWantsToOverridePawnsBasicHitReation = false;
    curCommand = LPAICommand(CommandList);
    // End:0x385
    if(!StartGrenadeHitReaction() || TypeOfDamage == Class'LPDamageTypeGrenadeActual')
    {
        J0x50:

        // End:0xDC [Loop If]
        if(curCommand != none)
        {
            // End:0xA8
            if(curCommand.NotifyOfCoreHit(HitCoreIndex, AmountOfDamage, TypeOfDamage))
            {
                bCommandWantsToOverridePawnsBasicHitReation = true;
            }
            curCommand = LPAICommand(curCommand.ChildCommand);
            // [Loop Continue]
            goto J0x50;
        }
        // End:0x385
        if(!bCommandWantsToOverridePawnsBasicHitReation && HitCoreIndex >= 0)
        {
            // End:0x227
            if(TypeOfDamage == Class'LPDamageTypeGrenadeActual')
            {
                PHPawn.GetMovementInteruptionEffectBasedOnCurrentVelocityAndFacing(PHPawn.LastMovementInteruptionEffectDirection, PHPawn.LastMovementInteruptionEffectSpeedFactor, false);
                // End:0x214
                if((int(PHPawn.LastMovementInteruptionEffectDirection) == int(1)) && int(PHPawn.LastMovementInteruptionEffectSpeedFactor) > int(1))
                {
                    // End:0x200
                    if(int(PHPawn.LastMovementInteruptionEffectSpeedFactor) == int(5))
                    {
                        CmdPackHunterPlowIn(none, true, true, false,, 0);                        
                    }
                    else
                    {
                        CmdPackHunterPlowIn(none, true, false, false,, 0);
                    }                    
                }
                else
                {
                    CmdPackHunterPlowIn(none, true, false, true,, 0);
                }
                return;
            }
            // End:0x2D4
            if(((false && PHPawn.MyCoreData[HitCoreIndex].CoreID == 0) && !ShouldUseMovingHitReaction()) && !PHPawn.InStruggleMode)
            {
                PHPawn.DoSpecialMove(Class'LPSM_PackHunterHitMouthCoreReaction', true);                
            }
            else
            {
                // End:0x36B
                if((PHPawn.MyCoreData[HitCoreIndex].CoreID == 1) || PHPawn.MyCoreData[HitCoreIndex].CoreID == 2)
                {
                    StartAdditiveTailCoreHitAnimation(1.0000000);                    
                }
                else
                {
                    StartAdditiveCoreHitAnimation(1.0000000);
                }
            }
            EnablePHCSAHitReaction(true);
        }
    }
    //return;    
}

event NotifyOfSpecialMoveAnimtionComplete()
{
    local /*0x97E50000-0x00000000*/ private class SM_TypeAnimDoneFor[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL curCommand;

    curCommand = LPAICommand(CommandList);
    J0x1C:

    // End:0x91 [Loop If]
    if(curCommand != none)
    {
        curCommand.NotifyOfSpecialMoveAnimtionComplete(SM_TypeAnimDoneFor, bInterrupted);
        curCommand = LPAICommand(curCommand.ChildCommand);
        // [Loop Continue]
        goto J0x1C;
    }
    //return;    
}

simulated function StartAdditiveTailCoreHitAnimation()
{
    local /*0x97E50000-0x00000000*/ private float RateOfAnimation[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL AnimSeqTemplate;

    AnimSeqTemplate = PHPawn.AnimTemplateLogic_TailCoreHit.GetBestSequenceTemplate(self);
    PHPawn.ReplicatePlayAdditiveAnimationSequence(AnimSeqTemplate, None, 0, RateOfAnimation, 0.0000000, 0.0000000, false, false);
    //return;    
}

event NotifyOfNonCoreHit()
{
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];

    super(LPAIController).NotifyOfNonCoreHit(AmountOfDamage, TypeOfDamage);
    // End:0x3A
    if(!StartGrenadeHitReaction())
    {
        StartAdditiveHitAnimation(1.0000000);
    }
    EnablePHCSAHitReaction(false);
    //return;    
}

function StartGrenadeHitReaction()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL tdp, GrenadeLocation;
    local /*0x97E50000-0x00000000*/ private bool bTesting;

    bTesting = false;
    // End:0x194
    if(CanDoGrenadeHitReaction())
    {
        // End:0x7B
        if(bTesting)
        {
            GrenadeLocation = tdp.InstigatedByPawn.Location;
            CmdPackHunterGrenadeReaction(GrenadeLocation);
            return true;            
        }
        else
        {
            tdp = myAIPawn.TakeDamageParams;
            // End:0x191
            if(class<LPDamageType>(tdp.DamageType).default.bCausesExplosiveReactions)
            {
                // End:0x191
                if(ClassIsChildOf(tdp.DamageCauser.Class, Class'LPExplosionActor'))
                {
                    GrenadeLocation = LPExplosionActor(tdp.DamageCauser).TheWeaponThatSpawnedMe.Location;
                    CmdPackHunterGrenadeReaction(GrenadeLocation);
                    return true;
                }
            }
        }        
    }
    else
    {
        return IsDoingGrenadeHitReaction();
    }
    return false;
    //return ReturnValue;    
}

function IsDoingGrenadeHitReaction()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return SPPawn(Pawn).IsDoingSpecialMove_OF_Class(Class'LPSM_PackHunterGrenadeHit');
    //return ReturnValue;    
}

function CanDoGrenadeHitReaction()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return ((((PHUseDefaultGrenadeHitReaction && !IsDoingGrenadeHitReaction()) && !Pawn.IsPendingKill()) && Pawn.Health > 0) && !PHPawn.HasDamageImmunityWithEffects()) && !PHPawn.InStruggleMode;
    //return ReturnValue;    
}

function NotifyStartOfAnimatedPathCmd()
{
    local /*0x97E50000-0x00000000*/ private @NULL grenadeGlueTag;

    super(LPAIController).NotifyStartOfAnimatedPathCmd();
    grenadeGlueTag = PHPawn.FindPhysMatPropTag_GrenadeGlueFromCoreID(0);
    // End:0x64
    if(grenadeGlueTag != none)
    {
        grenadeGlueTag.bCurrentlyValidForStick = false;
    }
    //return;    
}

function NotifyEndOfAnimatedPathCmd()
{
    local /*0x97E50000-0x00000000*/ private @NULL grenadeGlueTag;

    super(LPAIController).NotifyEndOfAnimatedPathCmd();
    grenadeGlueTag = PHPawn.FindPhysMatPropTag_GrenadeGlueFromCoreID(0);
    // End:0x64
    if(grenadeGlueTag != none)
    {
        grenadeGlueTag.bCurrentlyValidForStick = true;
    }
    //return;    
}

function EnableAnnounceEffects()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    // End:0x60
    if(!bBeSuperAggressive || !PHPawn.TuneDataPackHunter.bUseSoloAggressivePulse)
    {
        EnableAnnounceHeadGlow(true);
        EnableAnnounceTailGlow(true);
    }
    //return;    
}

function CmdPerformDashAttackPof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609];
    local /*0x97E50000-0x00000000*/ private int MinNumOfStrikeAttempts[8388609], MaxNumOfStrikeAttempts;
    local /*0x97E50000-0x00000000*/ private float MinAmountOfDamageToStopAttack[8388609], MaxAmountOfDamageToStopAttack;
    local /*0x97E50000-0x00000000*/ private @NULL ResourceForFormation[8388609], CmdStatus, PreCalcedDashToPoint;
    local /*0x97E50000-0x00000000*/ private bool bForceDashStrikeToTheRightOfTheTarget[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_PackHunterAttack
    vect(0.0000000, 0.0000000, 0.0000000)
    false
    0
    // End:0x51
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_PackHunterDashAttack'.static.InitCommand(self);
    myCommand = LPAICmd_PackHunterDashAttack(GetActiveCommand());
    // End:0x232
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Attack);
        myCommand.SetMinNumberOfStrikesToAttemptPerAttack(MinNumOfStrikeAttempts);
        myCommand.SetMaxNumberOfStrikesToAttemptPerAttack(MaxNumOfStrikeAttempts);
        myCommand.SetMinAmountOfDamageRequiredToStopAttack(int(MinAmountOfDamageToStopAttack));
        myCommand.SetMaxAmountOfDamageRequiredToStopAttack(int(MaxAmountOfDamageToStopAttack));
        myCommand.SetResSurroundMultiLocation(ResourceForFormation);
        myCommand.SetPreCalcedDashToPoint(PreCalcedDashToPoint);
        myCommand.SetForceDashStrikeToTheRightOfTheTarget(bForceDashStrikeToTheRightOfTheTarget);
        LastDashAttackTime = WorldInfo.TimeSeconds;
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdPackHunterDashStrikePof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609];
    local /*0x97E50000-0x00000000*/ private float ValAmountOfDamageReceivedThisDash[25165825], AmountOfDamageToCausePlowInThisDash;
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185], PreCalcedDashToPoint;
    local /*0x97E50000-0x00000000*/ private bool bForceDashStrikeToTheRightOfTheTarget[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_PackHunterRunningAttack
    vect(0.0000000, 0.0000000, 0.0000000)
    false
    0
    // End:0x51
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_PackHunterDashStrike'.static.InitCommand(self);
    myCommand = LPAICmd_PackHunterDashStrike(GetActiveCommand());
    // End:0x18E
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
        myCommand.SetPreCalcedDashToPoint(PreCalcedDashToPoint);
        myCommand.SetForceDashStrikeToTheRightOfTheTarget(bForceDashStrikeToTheRightOfTheTarget);
        myCommand.SetOutValAmountOfDamageReceivedThisDash(ValAmountOfDamageReceivedThisDash);
        myCommand.SetAmountOfDamageToCausePlowInThisDash(AmountOfDamageToCausePlowInThisDash);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdPerformSwipeAttackPof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_PackHunterAttack
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_PackHunterSwipeAttack'.static.InitCommand(self);
    myCommand = LPAICmd_PackHunterSwipeAttack(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdPerformDirectAttackPof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609];
    local /*0x97E50000-0x00000000*/ private int MinNumOfStrikeAttempts[8388609], MaxNumOfStrikeAttempts;
    local /*0x97E50000-0x00000000*/ private float MinAmountOfDamageToStopAttack[8388609], MaxAmountOfDamageToStopAttack;
    local /*0x97E50000-0x00000000*/ private @NULL ResourceForFormation[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_PackHunterAttack
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_PackHunterDirectAttack'.static.InitCommand(self);
    myCommand = LPAICmd_PackHunterDirectAttack(GetActiveCommand());
    // End:0x1A3
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Attack);
        myCommand.SetMinNumberOfStrikesToAttemptPerAttack(MinNumOfStrikeAttempts);
        myCommand.SetMaxNumberOfStrikesToAttemptPerAttack(MaxNumOfStrikeAttempts);
        myCommand.SetMinAmountOfDamageRequiredToStopAttack(int(MinAmountOfDamageToStopAttack));
        myCommand.SetMaxAmountOfDamageRequiredToStopAttack(int(MaxAmountOfDamageToStopAttack));
        myCommand.SetResSurroundMultiLocation(ResourceForFormation);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdTacticalWait()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewLocationToWaitAt[8388609], LookAtThingy;
    local /*0x97E50000-0x00000000*/ private float HowCloseEnemiesGetBeforeAttacking[8388609], GreandeHowCloseRange, HowCloseToLocToTryAndStay, HowMuchDamage;
    local /*0x97E50000-0x00000000*/ private bool bRandomize[8388609], bUseIndicator;
    local /*0x97E50000-0x00000000*/ private editfixedsize array NewMovesToPlay[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_PackHunterAttack
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_PackHunterTacticalWait'.static.InitCommand(self);
    myCommand = LPAICmd_PackHunterTacticalWait(GetActiveCommand());
    // End:0x219
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetLocationToWaitAt(NewLocationToWaitAt);
        myCommand.SetThingToFocusOnWhenNoEnemy(LookAtThingy);
        myCommand.SetHowCloseToLetEnemiesGetBeforeAttacking(HowCloseEnemiesGetBeforeAttacking);
        myCommand.SetHowCloseToLocationToTryAndStay(HowCloseToLocToTryAndStay);
        myCommand.SetDamageThresholdBeforeEndingCommand(HowMuchDamage);
        myCommand.SetHowCloseToLetGrenadesGetBeforeAttacking(GreandeHowCloseRange);
        myCommand.SetIfShouldRandomizeWhichMovesToPlay(bRandomize);
        myCommand.SetIfShouldUseAggressiveIndicat(bUseIndicator);
        myCommand.SetMovesToPlay(NewMovesToPlay);
    }
    return myCommand;
    //return ReturnValue;    
}

function CreateDefendCmd()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    Class'LPAICmd_PackHunterDefend'.static.InitCommand(self);
    myCommand = LPAICmd_PackHunterDefend(GetActiveCommand());
    return myCommand;
    //return ReturnValue;    
}

function CmdPackHunterSwipeStrikePof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_PackHunterSwipeStrike'.static.InitCommand(self);
    myCommand = LPAICmd_PackHunterSwipeStrike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdPackHunterShortDistanceBiteStrikePof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609];
    local /*0x97E50000-0x00000000*/ private byte DirectionToStrike[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_PackHunterBiteStrike'.static.InitCommand(self);
    myCommand = LPAICmd_PackHunterBiteStrike(GetActiveCommand());
    // End:0xFF
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
        myCommand.SetStrikeDirection(DirectionToStrike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdPackHunter180TailWhipStrikePof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609];
    local /*0x97E50000-0x00000000*/ private byte DirectionToStrike[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_PackHunter180TailWhipStrike'.static.InitCommand(self);
    myCommand = LPAICmd_PackHunter180TailWhipStrike(GetActiveCommand());
    // End:0xFF
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
        myCommand.SetStrikeDirection(DirectionToStrike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdPackHunterFarBiteStrikePof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_PackHunterFarBiteStrike'.static.InitCommand(self);
    myCommand = LPAICmd_PackHunterFarBiteStrike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdPackHunterLargeTurnClawStrikePof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609];
    local /*0x97E50000-0x00000000*/ private byte DirectionToStrike[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_PackHunterLargeTurnClawStrike'.static.InitCommand(self);
    myCommand = LPAICmd_PackHunterLargeTurnClawStrike(GetActiveCommand());
    // End:0xFF
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
        myCommand.SetStrikeDirection(DirectionToStrike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdPackHunterMediumClawLungeStrikePof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_PackHunterLungeMedClawStrike'.static.InitCommand(self);
    myCommand = LPAICmd_PackHunterLungeMedClawStrike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdPackHunterFarClawLungeStrikePof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_PackHunterLungeFarClawStrike'.static.InitCommand(self);
    myCommand = LPAICmd_PackHunterLungeFarClawStrike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdDamageAssessment()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Ass[8388609];
    local /*0x97E50000-0x00000000*/ private float InMinTimeOfThisDamageAssessment[8388609], InMaxTimeOfThisDamageAssessment;
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_PackHunterDamageAssessment'.static.InitCommand(self);
    myCommand = LPAICmd_PackHunterDamageAssessment(GetActiveCommand());
    // End:0x127
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetActorToCareAboutWhileAssessing(Enemy2Ass);
        myCommand.SetMinTimeOfThisDamageAssessment(InMinTimeOfThisDamageAssessment);
        myCommand.SetMaxTimeOfThisDamageAssessment(InMaxTimeOfThisDamageAssessment);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdPackHunterPlowIn()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyThatCausedPlowIn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bGrenadeInMouth[8388609], bMovingFastEnoughForPlowInAfterFall, bMovingSoSlowGettingKnockedBack;
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_PackHunterPlowIn'.static.InitCommand(self);
    myCommand = LPAICmd_PackHunterPlowIn(GetActiveCommand());
    // End:0x152
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(EnemyThatCausedPlowIn);
        myCommand.SetIfPlowingInBecauseOfGrenadeInMouth(bGrenadeInMouth);
        myCommand.SetIfMovingFastEnoughForPlowInAfterFall(bMovingFastEnoughForPlowInAfterFall);
        myCommand.SetIfMovingMovingSoSlowGettingKnockedBack(bMovingSoSlowGettingKnockedBack);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdJumpBack()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyJumpingAwayFrom[8388609];
    local /*0x97E50000-0x00000000*/ private bool bGrenadeInMouth[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_PackHunterJumpBack'.static.InitCommand(self);
    myCommand = LPAICmd_PackHunterJumpBack(GetActiveCommand());
    // End:0x100
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(EnemyJumpingAwayFrom);
        myCommand.SetIfJumpingBackBecauseOfGrenadeInMouth(bGrenadeInMouth);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdPackHunterGrenadeReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrenadePosition[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_PackHunterGrenadeHitReaction'.static.InitCommand(self);
    myCommand = LPAICmd_PackHunterGrenadeHitReaction(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetGrenadeLocation(GrenadePosition);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdPackHunterStrugglePofStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private class StruggleModeClass[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    none
    // End:0x40
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_PackHunterStrugglePofStrike'.static.InitCommand(self);
    myCommand = LPAICmd_PackHunterStrugglePofStrike(GetActiveCommand());
    // End:0x104
    if(myCommand != none)
    {
        myCommand.SetStruggleModeClass(StruggleModeClass);
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdWander()
{
    local /*0x97E50000-0x00000000*/ private float Duration[9437185];
    local /*0x97E50000-0x00000000*/ private bool bWanderFast[9437185];
    local /*0x97E50000-0x00000000*/ private float minTimeSleepBeforeWander[9437185], maxTimeSleepBeforeWander;
    local /*0x97E50000-0x00000000*/ private @NULL InObjective[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL myCommand, NewConstraint, EnemyCandidate;
    local /*0x97E50000-0x00000000*/ private float AvoidanceRadius, AvoidanceHeight;

    10.0000000
    false
    1.0000000
    2.0000000
    none
    0
    myCommand = super(LPAIController).CmdWander(Duration, bWanderFast, minTimeSleepBeforeWander, maxTimeSleepBeforeWander, InObjective, CmdOption);
    // End:0x1D7
    if(myCommand != none)
    {
        // End:0x1D7
        if(TargetList.Length > 0)
        {
            I = 0;
            J0xA0:

            // End:0x1D7 [Loop If]
            if(I < TargetList.Length)
            {
                EnemyCandidate = TargetList[I].Actor;
                // End:0x1C9
                if((EnemyCandidate != none) && CanBeMyEnemy(EnemyCandidate))
                {
                    NewConstraint = SPKyConstraintActors(Class'SPAIKynapse.SPKyConstraintActors'.static.InitConstraint(self));
                    GetAvoidanceRadiusAndHeightForEnemy(EnemyCandidate, AvoidanceRadius, AvoidanceHeight);
                    NewConstraint.SetActor(EnemyCandidate, AvoidanceRadius, AvoidanceHeight);
                    myCommand.AddConstraint(NewConstraint);
                }
                ++I;
                // [Loop Continue]
                goto J0xA0;
            }
        }
    }
    return myCommand;
    //return ReturnValue;    
}

function GetAvoidanceRadiusAndHeightForEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private float OutRadius[25165825], OutHeight;
    local /*0x97E50000-0x00000000*/ private @NULL inPawn;

    inPawn = LPPawn(InEnemy);
    // End:0xB5
    if(inPawn != none)
    {
        OutHeight = inPawn.GetCollisionHeight();
        OutRadius = GetFormationRadiusForEnemy(inPawn);
        // End:0xB2
        if(OutRadius <= float(0))
        {
            OutRadius = inPawn.GetCollisionRadius() * 2.0000000;
        }        
    }
    else
    {
        // End:0x108
        if(InEnemy != none)
        {
            InEnemy.GetBoundingCylinder(OutRadius, OutHeight);
            OutRadius *= 2.0000000;            
        }
        else
        {
            OutRadius = 0.0000000;
            OutHeight = 0.0000000;
        }
    }
    //return;    
}

function EnableAnnounceHeadGlow()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    // End:0x38
    if(PHPawn != none)
    {
        PHPawn.EnableAnnounceHeadGlow(bEnable);
    }
    //return;    
}

function EnableAnnounceTailGlow()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    // End:0x38
    if(PHPawn != none)
    {
        PHPawn.EnableAnnounceTailGlow(bEnable);
    }
    //return;    
}

function EnableStrikeAccessHeadGlow()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    // End:0x38
    if(PHPawn != none)
    {
        PHPawn.EnableStrikeAccessHeadGlow(bEnable);
    }
    //return;    
}

function EnableStrikeAccessTailGlow()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    // End:0x38
    if(PHPawn != none)
    {
        PHPawn.EnableStrikeAccessTailGlow(bEnable);
    }
    //return;    
}

final function StartStrikeAccessEmissiveStatusTimer()
{
    // End:0x33
    if(!bDisableAI && !IsStrikeAccessEmissiveStatusTimerActive())
    {
        SetTimer(1.0000000, true, 'StrikeAccessEmissiveStatusTimer', self);
    }
    //return;    
}

final function StopStrikeAccessEmissiveStatusTimer()
{
    ClearTimer('StrikeAccessEmissiveStatusTimer', self);
    //return;    
}

function PauseStrikeAccessEmissiveStatusTimer()
{
    local /*0x97E50000-0x00000000*/ private bool bPause[8388609];

    // End:0x1A
    if(bPause)
    {
        StopStrikeAccessEmissiveStatusTimer();        
    }
    else
    {
        StartStrikeAccessEmissiveStatusTimer();
    }
    //return;    
}

final function IsStrikeAccessEmissiveStatusTimerActive()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return IsTimerActive('StrikeAccessEmissiveStatusTimer', self);
    //return ReturnValue;    
}

private final function StrikeAccessEmissiveStatusTimer()
{
    StrikeAccessEmissiveStatus();
    //return;    
}

function StrikeAccessEmissiveStatus()
{
    // End:0x2BA
    if(PHPawn != none)
    {
        // End:0x1E8
        if(PHPawn.bUseEmissiveLightingToShowWhoHasTheStrikeAccess)
        {
            // End:0x113
            if(HaveStrikeAccess())
            {
                // End:0xA7
                if((PHPawn.GetHeadGlowFactor() + 1.0000000) < PHPawn.TuneDataPackHunter.HeadGlowFactorAnnounceTaunt)
                {
                    EnableStrikeAccessHeadGlow(true);
                }
                // End:0x110
                if((PHPawn.GetTailGlowFactor() + 1.0000000) < PHPawn.TuneDataPackHunter.TailGlowFactorAnnounceTaunt)
                {
                    EnableStrikeAccessTailGlow(true);
                }                
            }
            else
            {
                // End:0x17C
                if((PHPawn.GetHeadGlowFactor() + 1.0000000) < PHPawn.TuneDataPackHunter.HeadGlowFactorAnnounceTaunt)
                {
                    EnableStrikeAccessHeadGlow(false);
                }
                // End:0x1E5
                if((PHPawn.GetTailGlowFactor() + 1.0000000) < PHPawn.TuneDataPackHunter.TailGlowFactorAnnounceTaunt)
                {
                    EnableStrikeAccessTailGlow(false);
                }
            }            
        }
        else
        {
            // End:0x251
            if((PHPawn.GetHeadGlowFactor() + 1.0000000) < PHPawn.TuneDataPackHunter.HeadGlowFactorAnnounceTaunt)
            {
                EnableAnnounceHeadGlow(false);
            }
            // End:0x2BA
            if((PHPawn.GetTailGlowFactor() + 1.0000000) < PHPawn.TuneDataPackHunter.TailGlowFactorAnnounceTaunt)
            {
                EnableAnnounceTailGlow(false);
            }
        }
    }
    //return;    
}

simulated function EnablePHDefaultHitReaction()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    PHUseDefaultHitReaction = bEnable;
    PHUseDefaultGrenadeHitReaction = bEnable;
    // End:0x43
    if(!bEnable)
    {
        DisablePHCSAHitReaction();
    }
    //return;    
}

simulated function IsUsingPHCSAHitReactionCore()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return PHPawn.ContextSensitiveAnimInfo.CurrentCSA == PHPawn.MovingCoreHitReactionAnimations;
    //return ReturnValue;    
}

simulated function IsUsingPHCSAHitReactionNonCore()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return PHPawn.ContextSensitiveAnimInfo.CurrentCSA == PHPawn.MovingHitReactionAnimations;
    //return ReturnValue;    
}

simulated function IsUsingPHCSAHitReaction()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (IsUsingPHCSAHitReactionCore()) || IsUsingPHCSAHitReactionNonCore();
    //return ReturnValue;    
}

simulated function IsTooCloseForMovingHitReaction()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy;
    local /*0x97E50000-0x00000000*/ private float DistSqToEnemy;

    TheEnemy = none;
    DistSqToEnemy = float(2147483647);
    // End:0xDE
    if((HaveStrikeAccess()) && StrikeAccess != none)
    {
        TheEnemy = StrikeAccess.GetOuterActor();
        // End:0xDE
        if(TheEnemy != none)
        {
            DistSqToEnemy = VSizeSq2D(TheEnemy.Location - PHPawn.Location);
            return DistSqToEnemy < float(600 * 600);
        }
    }
    return false;
    //return ReturnValue;    
}

simulated function ShouldUseMovingHitReaction()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2D
    if(myAIPawn.IsDoingSpecialMove_OF_Class(Class'SPAIKynapse.SPKySM_AnimatedPath'))
    {
        return true;
    }
    return (VSize2D(PHPawn.Velocity) > MovingHitReactionSpeedThreshold) && !IsTooCloseForMovingHitReaction();
    //return ReturnValue;    
}

simulated function SetPHCSAHitReactionTimer()
{
    local /*0x97E50000-0x00000000*/ private float ActiveTime[9437185];

    -1.0000000
    ClearPHCSAHitReactionTimer();
    // End:0x37
    if(ActiveTime < float(0))
    {
        ActiveTime = PHCSAHitReactionActiveTime;
    }
    SetTimer(ActiveTime, false, 'DisablePHCSAHitReaction', self);
    SetTimer(0.1000000, true, 'MonitorPHCSAHitReaction', self);
    //return;    
}

simulated function ClearPHCSAHitReactionTimer()
{
    ClearTimer('DisablePHCSAHitReaction');
    ClearTimer('MonitorPHCSAHitReaction');
    //return;    
}

simulated function EnablePHCSAHitReaction()
{
    local /*0x97E50000-0x00000000*/ private bool IsCoreHit[8388609];

    // End:0x134
    if((PHUseDefaultHitReaction && NextPHCSAHitReactionUseTime < PHPawn.WorldInfo.TimeSeconds) && ShouldUseMovingHitReaction())
    {
        // End:0xD8
        if(IsCoreHit)
        {
            // End:0xD5
            if(!IsUsingPHCSAHitReactionCore())
            {
                PHPawn.UseContextSensitiveAnimObject(PHPawn.MovingCoreHitReactionAnimations, -1.0000000);
                SetPHCSAHitReactionTimer(PHCSAHitReactionActiveTime + float(1));
            }            
        }
        else
        {
            // End:0x134
            if(!IsUsingPHCSAHitReaction())
            {
                PHPawn.UseContextSensitiveAnimObject(PHPawn.MovingHitReactionAnimations, -1.0000000);
                SetPHCSAHitReactionTimer();
            }
        }
    }
    //return;    
}

simulated function MonitorPHCSAHitReaction()
{
    // End:0x17
    if(IsTooCloseForMovingHitReaction())
    {
        DisablePHCSAHitReaction();
    }
    //return;    
}

simulated function DisablePHCSAHitReaction()
{
    // End:0x32
    if(IsUsingPHCSAHitReaction())
    {
        PHPawn.UseContextSensitiveAnimObject(none, -1.0000000);
    }
    NextPHCSAHitReactionUseTime = PHPawn.WorldInfo.TimeSeconds + RandRange(0.2500000, 0.5000000);
    ClearPHCSAHitReactionTimer();
    //return;    
}

simulated function StartAdditiveCoreHitAnimation()
{
    local /*0x97E50000-0x00000000*/ private float RateOfAnimation[8388609];

    StartAdditiveHitAnimation(RateOfAnimation);
    //return;    
}

simulated function HitReactionSelection()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Hi;

    Hi = PHPawn.TakeDamageParams.HitInfo;
    // End:0x24C
    if(Hi.BoneName != 'None')
    {
        // End:0xC7
        if(PHPawn.Mesh.BoneIsChildOf(Hi.BoneName, 'JO_L_Clavicle'))
        {
            return 2;            
        }
        else
        {
            // End:0x129
            if(PHPawn.Mesh.BoneIsChildOf(Hi.BoneName, 'JO_R_Clavicle'))
            {
                return 3;                
            }
            else
            {
                // End:0x18B
                if(PHPawn.Mesh.BoneIsChildOf(Hi.BoneName, 'JO_Neck_B'))
                {
                    return 1;                    
                }
                else
                {
                    // End:0x1ED
                    if(PHPawn.Mesh.BoneIsChildOf(Hi.BoneName, 'JO_R_RearKnee_A'))
                    {
                        return 4;                        
                    }
                    else
                    {
                        // End:0x24C
                        if(PHPawn.Mesh.BoneIsChildOf(Hi.BoneName, 'JO_L_RearKnee_A'))
                        {
                            return 4;
                        }
                    }
                }
            }
        }
    }
    return 0;
    //return ReturnValue;    
}

simulated function StartAdditiveHitAnimation()
{
    local /*0x97E50000-0x00000000*/ private float RateOfAnimation[8388609];
    local /*0x97E50000-0x00000000*/ private byte eReaction;

    // End:0xAC
    if(!ShouldUseMovingHitReaction())
    {
        eReaction = HitReactionSelection();
        switch(eReaction)
        {
            // End:0x4D
            case 1:
                StartAdditiveHitAnimationHead(1.0000000);
                // End:0xAC
                break;
            // End:0x64
            case 2:
                StartAdditiveHitAnimationLeftShoulder(1.0000000);
                // End:0xAC
                break;
            // End:0x7B
            case 3:
                StartAdditiveHitAnimationRightShoulder(1.0000000);
                // End:0xAC
                break;
            // End:0x92
            case 4:
                StartAdditiveHitAnimationBackHips(1.0000000);
                // End:0xAC
                break;
            // End:0xA9
            case 0:
                StartAdditiveHitAnimationDefault(1.0000000);
                // End:0xAC
                break;
            // End:0xFFFF
            default:
                break;
        }
    }
    else
    {
        //return;        
    }
}

simulated function StartAdditiveHitAnimationDefault()
{
    local /*0x97E50000-0x00000000*/ private float RateOfAnimation[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL AnimSeqTemplate;

    AnimSeqTemplate = PHPawn.AnimTemplateLogic_CoreHit.GetBestSequenceTemplate(self);
    PHPawn.ReplicatePlayAdditiveAnimationSequence(AnimSeqTemplate, None, 0, RateOfAnimation, 0.0000000, 0.0000000, false, false);
    //return;    
}

simulated function StartAdditiveHitAnimationLeftShoulder()
{
    local /*0x97E50000-0x00000000*/ private float RateOfAnimation[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL AnimSeqTemplate;

    AnimSeqTemplate = PHPawn.AnimTemplateLogic_LeftShoulderHit.GetBestSequenceTemplate(self);
    PHPawn.ReplicatePlayAdditiveAnimationSequence(AnimSeqTemplate, None, 0, RateOfAnimation, 0.0000000, 0.0000000, false, false);
    //return;    
}

simulated function StartAdditiveHitAnimationRightShoulder()
{
    local /*0x97E50000-0x00000000*/ private float RateOfAnimation[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL AnimSeqTemplate;

    AnimSeqTemplate = PHPawn.AnimTemplateLogic_RightShoulderHit.GetBestSequenceTemplate(self);
    PHPawn.ReplicatePlayAdditiveAnimationSequence(AnimSeqTemplate, None, 0, RateOfAnimation, 0.0000000, 0.0000000, false, false);
    //return;    
}

simulated function StartAdditiveHitAnimationHead()
{
    local /*0x97E50000-0x00000000*/ private float RateOfAnimation[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL AnimSeqTemplate;

    AnimSeqTemplate = PHPawn.AnimTemplateLogic_HeadHit.GetBestSequenceTemplate(self);
    PHPawn.ReplicatePlayAdditiveAnimationSequence(AnimSeqTemplate, None, 0, RateOfAnimation, 0.0000000, 0.0000000, false, false);
    //return;    
}

simulated function StartAdditiveHitAnimationBackHips()
{
    local /*0x97E50000-0x00000000*/ private float RateOfAnimation[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL AnimSeqTemplate;

    AnimSeqTemplate = PHPawn.AnimTemplateLogic_BackHipsHit.GetBestSequenceTemplate(self);
    PHPawn.ReplicatePlayAdditiveAnimationSequence(AnimSeqTemplate, None, 0, RateOfAnimation, 0.0000000, 0.0000000, false, false);
    //return;    
}

function SearchTargetListForMostHatedPawnForSoloAttack()
{
    local /*0x97E50000-0x00000000*/ private float OffNavMeshPenalty[9437185], EnemyDamagingMeBonus, CloserPackHunterPenality;
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int iter;
    local /*0x97E50000-0x00000000*/ private @NULL EnemyCandidate;
    local /*0x97E50000-0x00000000*/ private float howMuchIWantToKillEnemyCandidate;
    local /*0x97E50000-0x00000000*/ private @NULL mostHatedEnemy;
    local /*0x97E50000-0x00000000*/ private float howMuchIWantToKillMostHatedEnemy;

    100.0000000
    100.0000000
    100.0000000
    howMuchIWantToKillEnemyCandidate = -1.0000000;
    mostHatedEnemy = none;
    iter = 0;
    J0x40:

    // End:0x13B [Loop If]
    if(iter < TargetList.Length)
    {
        EnemyCandidate = LPPawn(TargetList[iter].Actor);
        // End:0x12D
        if((EnemyCandidate != none) && CanBeMyEnemy(EnemyCandidate))
        {
            howMuchIWantToKillEnemyCandidate = RateEnemyForSoloAttack(EnemyCandidate, OffNavMeshPenalty, EnemyDamagingMeBonus, CloserPackHunterPenality);
            // End:0x12D
            if(howMuchIWantToKillEnemyCandidate > howMuchIWantToKillMostHatedEnemy)
            {
                mostHatedEnemy = EnemyCandidate;
                howMuchIWantToKillMostHatedEnemy = howMuchIWantToKillEnemyCandidate;
            }
        }
        ++iter;
        // [Loop Continue]
        goto J0x40;
    }
    return mostHatedEnemy;
    //return ReturnValue;    
}

function @NULL RateEnemyForSoloAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL PotentialEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private float OffNavMeshPenalty[9437185], EnemyDamagingMeBonus, CloserPackHunterPenality, ReturnValue, enemyRating;

    local /*0x97E50000-0x00000400*/ private @NULL kyBotHandle;
    local /*0x97E50000-0x00000000*/ private int I;

    100.0000000
    100.0000000
    100.0000000
    enemyRating = 0.0000000;
    // End:0x206
    if(PHPawn != none)
    {
        kyBotHandle = SPKynapseBotHandle(PHPawn.myKynapseHandle);
        // End:0xF4
        if(!kyBotHandle.PathFinder_IsLocationInNavMesh(PotentialEnemy.Location))
        {
            enemyRating = (enemyRating * 0.1000000) - OffNavMeshPenalty;
            // End:0xF1
            if(enemyRating < float(1))
            {
                enemyRating = 1.0000000;
            }            
        }
        else
        {
            I = 0;
            J0xFF:

            // End:0x1CC [Loop If]
            if(I < TargetList.Length)
            {
                // End:0x1BE
                if(TargetList[I].Actor == PotentialEnemy)
                {
                    // End:0x1BE
                    if(TargetList[I].LastDamageTime > float(0))
                    {
                        enemyRating += EnemyDamagingMeBonus;
                        enemyRating += TargetList[I].RecentDamageDone;
                    }
                }
                ++I;
                // [Loop Continue]
                goto J0xFF;
            }
            // End:0x1F6
            if(CloserPackHunterIsTargeting(PotentialEnemy))
            {
                enemyRating -= CloserPackHunterPenality;
            }
        }
        enemyRating += 1492.0000000;
    }
    return enemyRating;
    //return ReturnValue;    
}

function CloserPackHunterIsTargeting()
{
    local /*0x97E50000-0x00000000*/ private @NULL PotentialEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float myDistance, theirDistance;
    local /*0x97E50000-0x00000000*/ private @NULL otherHunterCtrl;

    myDistance = VSizeSq2D(PotentialEnemy.Location - Pawn.Location);
    // End:0x146
    foreach WorldInfo.AllControllers(Class'LPAIControllerPackHunter', otherHunterCtrl)
    {
        // End:0x145
        if((otherHunterCtrl != self) && otherHunterCtrl.GetEnemy() == PotentialEnemy)
        {
            theirDistance = VSizeSq2D(PotentialEnemy.Location - otherHunterCtrl.Pawn.Location);
            // End:0x145
            if(theirDistance < myDistance)
            {                
                return true;
            }
        }        
    }    
    return false;
    //return ReturnValue;    
}

function CheckForMultiEnemyAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyForAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function CanPerformAnnounce()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyForAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2B
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: LPAICmdStatus_Attack'Default__LPAIControllerPackHunter.LPAICmdStatus_Attack0'
    begin object name=LPAICmdStatus_Attack0
    end object
    CmdStatus_PackHunterAttack=LPAICmdStatus_Attack0
    // Reference: LPAICmdStatus_PackHunterRunningAttack'Default__LPAIControllerPackHunter.CmdStatus_PackHunterRunningAttackD0'
    begin object name=CmdStatus_PackHunterRunningAttackD0 class=Class'LPAICmdStatus_PackHunterRunningAttack'
    end object
    CmdStatus_PackHunterRunningAttack=CmdStatus_PackHunterRunningAttackD0
    PHUseDefaultHitReaction=true
    PHUseDefaultGrenadeHitReaction=true
    MinTimeBetweenConsecutiveJumpBacks=10.0000000
    PHCSAHitReactionActiveTime=3.0000000
    MovingHitReactionSpeedThreshold=400.0000000
    FrontBiteStrikeZoneDebugColor=(R=255,G=0,B=0,A=255)
    SideBiteStrikeZoneDebugColor=(R=255,G=0,B=255,A=255)
    LongClawTurnStrikeZoneDebugColor=(R=100,G=0,B=200,A=255)
    TailWhipStrikeZoneDebugColor=(R=0,G=0,B=255,A=255)
    MedLungeStrikeZoneDebugColor=(R=255,G=255,B=0,A=255)
    FarLungeStrikeZoneDebugColor=(R=0,G=150,B=0,A=255)
    DamAssToCloseZoneDebugColor=(R=0,G=0,B=0,A=255)
    DamAssToFarZoneDebugColor=(R=255,G=255,B=255,A=255)
    PercentOfRangeToShowZoneName=0.8000000
    // Reference: LPAICmdStatus_MoveToPosition'Default__LPAIControllerPackHunter.LPAICmdStatus_MoveToPosition0'
    begin object name=LPAICmdStatus_MoveToPosition0
    end object
    CmdStatus_MoveToPosition=LPAICmdStatus_MoveToPosition0
    // Reference: LPAICmdStatus_MoveToActor'Default__LPAIControllerPackHunter.LPAICmdStatus_MoveToActor0'
    begin object name=LPAICmdStatus_MoveToActor0
    end object
    CmdStatus_MoveToActor=LPAICmdStatus_MoveToActor0
    // Reference: LPAICmdStatus_Stunned'Default__LPAIControllerPackHunter.LPAICmdStatus_Stunned0'
    begin object name=LPAICmdStatus_Stunned0
    end object
    CmdStatus_Stunned=LPAICmdStatus_Stunned0
    // Reference: LPAICmdStatus_Strike'Default__LPAIControllerPackHunter.LPAICmdStatus_Strike0'
    begin object name=LPAICmdStatus_Strike0
    end object
    CmdStatus_Strike=LPAICmdStatus_Strike0
    CmdStatus_Attack=LPAICmdStatus_Attack0
    bStrikeCanBeRevoked=true
    bLookForAttackOpportunityWhileMovingToNonAttackLocations=true
    // Reference: LPAdHocSquadMemberData'Default__LPAIControllerPackHunter.LPAdHocSquadMemberDataD0'
    begin object name=LPAdHocSquadMemberDataD0
    end object
    MyAdHocSquadMemberData=LPAdHocSquadMemberDataD0
    // Reference: SPAIReactionManager'Default__LPAIControllerPackHunter.ReactionManager0'
    begin object name=ReactionManager0
    end object
    ReactionManager=ReactionManager0
    // Reference: LPAIObjectiveManager'Default__LPAIControllerPackHunter.LPAIObjectiveManager0'
    begin object name=LPAIObjectiveManager0
    end object
    AIObjectiveManager=LPAIObjectiveManager0
    Components[0]=LPAIObjectiveManager0
}