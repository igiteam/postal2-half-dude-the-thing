class LPAIControllerSepia extends LPAIControllerAkridSmall
    config(AI)
    hidecategories(AnimDependency,Navigation);

enum eSepiaStrikeType
{
    eSepiaStrike_None,              // 0
    eSepiaStrike_Bite,              // 1
    eSepiaStrike_JumpBite,          // 2
    eSepiaStrike_Spit,              // 3
    eSepiaStrike_MAX                // 4
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SepiaPawn[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL CmdStatus_SepiaAttack[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StrikeDensityAccess;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name StrikeDensityResourceName[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LobStrikeDensityAccess;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name LobStrikeDensityResourceName[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackAccess;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name AttackResourceName[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPerformingAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTimeLaunchedMedRangeStrike[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTimeCheckedForMedRangeStrike[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeAllowedNextMedRangeStrike[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int TotalNumberOfPossibileLobFireLocationsPerEvolution[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentSepiaMassRetreatMgrAccess[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentSepiaMassRetreatMgrRef[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ShortBiteStrikeZoneDebugColor[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL JumpBiteStrikeZoneDebugColor[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SuicideJumpStrikeZoneDebugColor[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LowEndOfRandomDesriedRangeFromTargetForDirectAttackDebugColor[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL HighEndOfRandomDesriedRangeFromTargetForDirectAttackDebugColor[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PercentOfRangeToShowZoneName[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HeightOfDebugStrikeZoneArea[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumOfSegmentsOfDebugStrikeZoneArea[1073741825];

event NumberOfAttackersFor()
{
    local /*0x97E50000-0x00000000*/ private @NULL PotentialEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    // End:0x82
    if(PotentialEnemy != none)
    {
        // End:0x82
        if((PotentialEnemy != none) && PotentialEnemy.AIResourceManager != none)
        {
            return PotentialEnemy.AIResourceManager.NumUsers(AttackResourceName);
        }
    }
    return 0;
    //return ReturnValue;    
}

function SetAttackResourceNames()
{
    StrikeResourceName = 'SepiaStrike';
    AttackResourceName = 'SepiaAttack';
    StrikeDensityResourceName = 'SepiaStrike';
    //return;    
}

event Possess()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVehicleTransition[8388609];
    local /*0x97E50000-0x00000000*/ private int iter;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL newLocData;
    local /*0x97E50000-0x00000000*/ private int maxNumberOfAltArcs;

    super(LPAIControllerAkrid).Possess(inPawn, bVehicleTransition);
    SepiaPawn = LPAIPawnSepia(inPawn);
    bPerformingAttack = false;
    LastTimeLaunchedMedRangeStrike = -1.0000000;
    LastTimeCheckedForMedRangeStrike = -1.0000000;
    TimeAllowedNextMedRangeStrike = -1.0000000;
    TotalNumberOfPossibileLobFireLocationsPerEvolution = int(SepiaPawn.TuneDataSepia.NumOfLobStrikeLocationsToLookForAtEachRange * float(SepiaPawn.TuneDataSepia.RangedLobStrikeInfoByTier.Length));
    iter = 0;
    J0xF4:

    // End:0x144 [Loop If]
    if(iter < TotalNumberOfPossibileLobFireLocationsPerEvolution)
    {
        SepiaPawn.LobStrikeLocValidationInfoList.AddItem(newLocData);        
        ++iter;
        // [Loop Continue]
        goto J0xF4;
    }
    maxNumberOfAltArcs = 0;
    iter = 0;
    J0x15A:

    // End:0x264 [Loop If]
    if(iter < SepiaPawn.TuneDataSepia.RangedLobStrikeInfoByZone.Length)
    {
        // End:0x256
        if(maxNumberOfAltArcs < SepiaPawn.TuneDataSepia.RangedLobStrikeInfoByZone[iter].AltDesiredZPercentOfLobList.Length)
        {
            maxNumberOfAltArcs = SepiaPawn.TuneDataSepia.RangedLobStrikeInfoByZone[iter].AltDesiredZPercentOfLobList.Length;
        }
        ++iter;
        // [Loop Continue]
        goto J0x15A;
    }
    iter = 0;
    J0x26F:

    // End:0x2BF [Loop If]
    if(iter < maxNumberOfAltArcs)
    {
        SepiaPawn.LobStrikeLocValidationInfoList.AddItem(newLocData);        
        ++iter;
        // [Loop Continue]
        goto J0x26F;
    }
    //return;    
}

event UnPossess()
{
    HandleNotifingCombatManagerKilledByOwner();
    super(LPAIController).UnPossess();
    //return;    
}

event Destroyed()
{
    HandleNotifingCombatManagerKilledByOwner();
    super(LPAIController).Destroyed();
    //return;    
}

function ForceStruggleModeNow()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyForStruggleMode[8388609];
    local /*0x97E50000-0x00000000*/ private class StruggleModeClass[9437185];

    none
    CmdSepiaStrugglePofStrike(EnemyForStruggleMode,, 0, StruggleModeClass);
    //return;    
}

function HandleNotifingCombatManagerKilledByOwner()
{
    local /*0x97E50000-0x00000000*/ private @NULL ownerOfCurrentThingSepiaAttacking;

    // End:0xA1
    if(CurrentSepiaMassRetreatMgrRef != none)
    {
        ownerOfCurrentThingSepiaAttacking = CurrentSepiaMassRetreatMgrRef.GetResourceOwner();
        // End:0x96
        if(SepiaPawn.TakeDamageParams.InstigatedByPawn == ownerOfCurrentThingSepiaAttacking)
        {
            CurrentSepiaMassRetreatMgrRef.NotifyCombatManagerKilledByOwner();
        }
        CurrentSepiaMassRetreatMgrRef = none;
    }
    //return;    
}

function EnableAnnounceEffects()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    //return;    
}

function EnableSepiaHeadGlowEffects()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    // End:0x38
    if(SepiaPawn != none)
    {
        SepiaPawn.EnableAnnounceHeadGlow(bEnable);
    }
    //return;    
}

function ReleaseStrikeAccessForFailedAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL strikeDensityRes;

    // End:0x78
    if(StrikeDensityAccess != none)
    {
        strikeDensityRes = LPAIResSepiaStrike(StrikeDensityAccess.GetResource());
        // End:0x78
        if(strikeDensityRes != none)
        {
            strikeDensityRes.NotifyOfFailedStrike(SepiaPawn);
        }
    }
    ReleaseStrikeAccess();
    //return;    
}

function ReleaseRangedStrikeAccessForFailedAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL strikeDensityRes;

    // End:0x78
    if(LobStrikeDensityAccess != none)
    {
        strikeDensityRes = LPAIResSepiaStrike(LobStrikeDensityAccess.GetResource());
        // End:0x78
        if(strikeDensityRes != none)
        {
            strikeDensityRes.NotifyOfFailedStrike(SepiaPawn);
        }
    }
    //return;    
}

function ReleaseStrikeAccessForNeedingToReattemptMoveInToStrike()
{
    ReleaseStrikeAccessForFailedAttack();
    //return;    
}

function ReleaseRangedStrikeAccessForNeedingToReattemptMoveInToStrike()
{
    ReleaseRangedStrikeAccessForFailedAttack();
    //return;    
}

function ReleaseRangedStrikeAccessAtTheEndOfStrikesBeforeDamageAssessment()
{
    ReleaseLobStrikeAccess();
    //return;    
}

function DoesSepiaHaveAccessToStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    GetStrikeDensityAccess(TheEnemy);
    // End:0x23
    if(HaveStrikeDensityAccess())
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function DoesSepiaHaveAccessToLobStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    GetLobStrikeDensityAccess(TheEnemy);
    // End:0x23
    if(HaveLobStrikeDensityAccess())
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function HaveStrikeDensityAccess()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return IsValidResourceAccessForEnemy(StrikeDensityAccess);
    //return ReturnValue;    
}

function HaveLobStrikeDensityAccess()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return IsValidResourceAccessForEnemy(LobStrikeDensityAccess);
    //return ReturnValue;    
}

function GetStrikeAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private float RevokeTolerance[9437185];

    -1.0000000
    // End:0xB8
    if((((ShouldUseStrikeResource()) && !HaveStrikeAccess()) && TheEnemy != none) && TheEnemy.AIResourceManager != none)
    {
        StrikeAccess = TheEnemy.AIResourceManager.GetAccess(StrikeResourceName, myAIPawn, RevokeTolerance);
    }
    //return;    
}

function ReleaseStrikeAccess()
{
    ReleaseStrikeDensityAccess();
    //return;    
}

function ReleaseLobStrikeAccess()
{
    ReleaseLobStrikeDensityAccess();
    //return;    
}

function ReleaseStrikeDensityAccess()
{
    // End:0x39
    if(StrikeDensityAccess != none)
    {
        StrikeDensityAccess.Destroy();
        StrikeDensityAccess = none;
    }
    //return;    
}

function ReleaseLobStrikeDensityAccess()
{
    // End:0x39
    if(LobStrikeDensityAccess != none)
    {
        LobStrikeDensityAccess.Destroy();
        LobStrikeDensityAccess = none;
    }
    //return;    
}

function GetStrikeDensityAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private float RevokeTolerance[9437185];

    -1.0000000
    // End:0xA9
    if((!HaveStrikeDensityAccess() && TheEnemy != none) && TheEnemy.AIResourceManager != none)
    {
        StrikeDensityAccess = TheEnemy.AIResourceManager.GetAccess(StrikeDensityResourceName, myAIPawn, RevokeTolerance);
    }
    //return;    
}

function GetLobStrikeDensityAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private float RevokeTolerance[9437185];

    -1.0000000
    // End:0xA9
    if((!HaveLobStrikeDensityAccess() && TheEnemy != none) && TheEnemy.AIResourceManager != none)
    {
        LobStrikeDensityAccess = TheEnemy.AIResourceManager.GetAccess(LobStrikeDensityResourceName, myAIPawn, RevokeTolerance);
    }
    //return;    
}

function ReleaseAttackAccess()
{
    // End:0x39
    if(AttackAccess != none)
    {
        AttackAccess.Destroy();
        AttackAccess = none;
    }
    //return;    
}

function GetAttackAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private float RevokeTolerance[9437185];

    -1.0000000
    // End:0xA9
    if((!HaveAttackAccess() && TheEnemy != none) && TheEnemy.AIResourceManager != none)
    {
        AttackAccess = TheEnemy.AIResourceManager.GetAccess(AttackResourceName, myAIPawn, RevokeTolerance);
    }
    //return;    
}

function HaveAttackAccess()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return IsValidResourceAccessForEnemy(AttackAccess);
    //return ReturnValue;    
}

function HasSepiaMassRetreatMgrAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (CanBeMyEnemy(InEnemy)) && IsCurrentSepiaMassRetreatMgrAccessForThisEnemy(InEnemy);
    //return ReturnValue;    
}

function GetSepiaMassRetreatMgrAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];

    // End:0xAB
    if(!HasSepiaMassRetreatMgrAccess(InEnemy))
    {
        CurrentSepiaMassRetreatMgrAccess = InEnemy.AIResourceManager.GetAccess('SepiaMassRetreatMgr', myAIPawn);
        // End:0xAB
        if(CurrentSepiaMassRetreatMgrAccess != none)
        {
            CurrentSepiaMassRetreatMgrRef = LPAIResSepiaMassRetreatMgr(CurrentSepiaMassRetreatMgrAccess.GetResource());
        }
    }
    //return;    
}

function ReleaseSepiaMassRetreatMgrAccess()
{
    // End:0x44
    if(CurrentSepiaMassRetreatMgrAccess != none)
    {
        CurrentSepiaMassRetreatMgrAccess.Destroy();
        CurrentSepiaMassRetreatMgrAccess = none;
        CurrentSepiaMassRetreatMgrRef = none;
    }
    //return;    
}

function IsCurrentSepiaMassRetreatMgrAccessForThisEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x9A
    if(CurrentSepiaMassRetreatMgrAccess != none)
    {
        // End:0x65
        if(CurrentSepiaMassRetreatMgrAccess.GetOuterActor() == InEnemy)
        {
            // End:0x62
            if(!CurrentSepiaMassRetreatMgrAccess.IsDestroyed())
            {
                return true;
            }            
        }
        else
        {
            CurrentSepiaMassRetreatMgrAccess.Destroy();
            CurrentSepiaMassRetreatMgrAccess = none;
            CurrentSepiaMassRetreatMgrRef = none;
        }
    }
    return false;
    //return ReturnValue;    
}

function NotifyKnockedOutOfAttackByTakingToMuchDamage()
{
    //return;    
}

function IsMeleeAttackFinished()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function IsPawnInDirectStrikeZone()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnToTest[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float seperationToEnemy;

    seperationToEnemy = SeperationToPawn(PawnToTest);
    // End:0x79
    if(seperationToEnemy < SepiaPawn.TuneDataSepia.MaxRangeToTargetForLongRangeJumpBiteStrike.GetValue())
    {
        return true;        
    }
    return false;
    //return ReturnValue;    
}

function NotifyPlayerMeleeHit()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn[8388609], ImpactLocation;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x40
    if(SepiaPawn != none)
    {
        SepiaPawn.ServerKnockBackMelee(PlayerPawn, ImpactLocation);
    }
    return false;
    //return ReturnValue;    
}

function HasStruggleModeWaitTimerExpired()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyPawnToCheck[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x76
    if((EnemyPawnToCheck != none) && EnemyPawnToCheck.AIResourceManager != none)
    {
        return EnemyPawnToCheck.AIResourceManager.HasTimerExpired('SepiaStruggleModeTimer');        
    }
    else
    {
        // End:0x8A
        if(EnemyPawnToCheck == none)
        {
            return false;            
        }
        else
        {
            return true;
        }
    }
    return true;
    //return ReturnValue;    
}

function ResetStruggleModeWaitTimer()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyPawnToCheck[8388609];
    local /*0x97E50000-0x00000000*/ private float MinTime[9437185], MaxTime;

    -1.0000000
    -1.0000000
    // End:0x99
    if((EnemyPawnToCheck != none) && EnemyPawnToCheck.AIResourceManager != none)
    {
        EnemyPawnToCheck.AIResourceManager.ResetTimerRange('SepiaStruggleModeTimer', MinTime, MaxTime);        
    }
    else
    {
        // End:0xAB
        if(EnemyPawnToCheck == none)
        {            
        }
    }
    //return;    
}

event NotifyOfCoreHit()
{
    local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL curCommand;

    curCommand = LPAICommand(CommandList);
    // End:0xB0
    if(TypeOfDamage == Class'LPDamageTypeGrenadeActual')
    {
        J0x33:

        // End:0xB0 [Loop If]
        if(curCommand != none)
        {
            curCommand.NotifyOfCoreHit(HitCoreIndex, AmountOfDamage, TypeOfDamage);
            curCommand = LPAICommand(curCommand.ChildCommand);
            // [Loop Continue]
            goto J0x33;
        }
    }
    //return;    
}

event NotifyToMassRetreat()
{
    local /*0x97E50000-0x00000000*/ private @NULL ThingToRetreatFrom[8388609], curCommand;
    local /*0x97E50000-0x00000000*/ private bool bcommandHandling;

    curCommand = LPAICommand(CommandList);
    bcommandHandling = false;
    J0x28:

    // End:0xA2 [Loop If]
    if(curCommand != none)
    {
        // End:0x6E
        if(curCommand.NotifyToMassRetreat(ThingToRetreatFrom))
        {
            bcommandHandling = true;
        }
        curCommand = LPAICommand(curCommand.ChildCommand);
        // [Loop Continue]
        goto J0x28;
    }
    // End:0xC4
    if(!bcommandHandling)
    {
        ActorToldToFleeFrom = ThingToRetreatFrom;
    }
    //return;    
}

function DrawAttackArcs()
{
    //return;    
}

function DrawStrikeZone()
{
    local /*0x97E50000-0x00000000*/ private @NULL OrginOfStrikeZone[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ZoneName[8388609];
    local /*0x97E50000-0x00000000*/ private float InnerRangeOfZone[8388609], OuterRangeOfZone;
    local /*0x97E50000-0x00000000*/ private @NULL ZoneColor[8388609];

    //return;    
}

function GetUpdateRateForCanFireLobShotTimer()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return SepiaPawn.TuneDataSepia.UpdateRateForCanFireLobShotTimer.GetValue();
    //return ReturnValue;    
}

function CalculateRangedLobPointToStrikeFrom()
{
    local /*0x97E50000-0x00000000*/ private @NULL outPossibleLobFirePointToStrikeFrom[25165825], LocationToStartAttackFrom, PawnAttacking;
    local /*0x97E50000-0x00000000*/ private float HeightAboveTargetForLobRangedStrikeInUU[8388609], XY_DistanceFromTargetForLobRangedStrikeInUU, RangeToLookForMovementNode;
    local /*0x97E50000-0x00000000*/ private bool bCheckIfCanMoveToThisLocation[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL displacementToStrikePoint;

    displacementToStrikePoint = SepiaPawn.Velocity * 0.5000000;
    outPossibleLobFirePointToStrikeFrom = displacementToStrikePoint + SepiaPawn.Location;
    // End:0x89
    if(bCheckIfCanMoveToThisLocation)
    {
        // End:0x87
        if(IsOnNavMesh(outPossibleLobFirePointToStrikeFrom))
        {
            return true;
        }
        return false;
    }
    return true;
    //return ReturnValue;    
}

function CmdDirectAttackPof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609];
    local /*0x97E50000-0x00000000*/ private int MinNumOfStrikeAttempts[8388609], MaxNumOfStrikeAttempts;
    local /*0x97E50000-0x00000000*/ private float MinAmountOfDamageToStopAttack[8388609], MaxAmountOfDamageToStopAttack;
    local /*0x97E50000-0x00000000*/ private @NULL ResourceForFormation[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_SepiaAttack
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SepiaDirectAttack'.static.InitCommand(self);
    myCommand = LPAICmd_SepiaDirectAttack(GetActiveCommand());
    // End:0x1A3
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Attack);
        myCommand.SetMinNumberOfStrikesToAttemptPerAttack(MinNumOfStrikeAttempts);
        myCommand.SetMaxNumberOfStrikesToAttemptPerAttack(MaxNumOfStrikeAttempts);
        myCommand.SetMinAmountOfDamageRequiredToStopAttack(int(MinAmountOfDamageToStopAttack));
        myCommand.SetMaxAmountOfDamageRequiredToStopAttack(int(MaxAmountOfDamageToStopAttack));
        myCommand.SetResSurroundLocation(ResourceForFormation);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdDirectAttackVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609];
    local /*0x97E50000-0x00000000*/ private int MinNumOfStrikeAttempts[8388609], MaxNumOfStrikeAttempts;
    local /*0x97E50000-0x00000000*/ private float MinAmountOfDamageToStopAttack[8388609], MaxAmountOfDamageToStopAttack;
    local /*0x97E50000-0x00000000*/ private @NULL ResourceForFormation[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_SepiaAttack
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SepiaDirectAttackVs'.static.InitCommand(self);
    myCommand = LPAICmd_SepiaDirectAttackVs(GetActiveCommand());
    // End:0x1A3
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Attack);
        myCommand.SetMinNumberOfStrikesToAttemptPerAttack(MinNumOfStrikeAttempts);
        myCommand.SetMaxNumberOfStrikesToAttemptPerAttack(MaxNumOfStrikeAttempts);
        myCommand.SetMinAmountOfDamageRequiredToStopAttack(int(MinAmountOfDamageToStopAttack));
        myCommand.SetMaxAmountOfDamageRequiredToStopAttack(int(MaxAmountOfDamageToStopAttack));
        myCommand.SetResSurroundLocation(ResourceForFormation);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdContinuousAttackPof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609], ResourceForFormation, CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_SepiaAttack
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SepiaContinuousAttack'.static.InitCommand(self);
    myCommand = LPAICmd_SepiaContinuousAttack(GetActiveCommand());
    // End:0xFF
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Attack);
        myCommand.SetResSurroundLocation(ResourceForFormation);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdMedRangeAttackPof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609];
    local /*0x97E50000-0x00000000*/ private int MinNumOfStrikeAttempts[8388609], MaxNumOfStrikeAttempts;
    local /*0x97E50000-0x00000000*/ private float MinAmountOfDamageToStopAttack[8388609], MaxAmountOfDamageToStopAttack;
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InProcessLookForAnotherAttackOpportunityDel[9437185], InProcessLookForAlternateAttackOpportunityDel, InIsThereClearRangedAttackLaneDelegate;
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    None
    None
    None
    CmdStatus_Strike
    0
    // End:0x7A
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SepiaMedRangeAttack'.static.InitCommand(self);
    myCommand = LPAICmd_SepiaMedRangeAttack(GetActiveCommand());
    // End:0x232
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Attack);
        myCommand.SetMinNumberOfStrikesToAttemptPerAttack(MinNumOfStrikeAttempts);
        myCommand.SetMaxNumberOfStrikesToAttemptPerAttack(MaxNumOfStrikeAttempts);
        myCommand.SetMinAmountOfDamageRequiredToStopAttack(int(MinAmountOfDamageToStopAttack));
        myCommand.SetMaxAmountOfDamageRequiredToStopAttack(int(MaxAmountOfDamageToStopAttack));
        myCommand.SetProcessLookForAnotherAttackOpportunityDelegate(InProcessLookForAnotherAttackOpportunityDel);
        myCommand.SetProcessLookForAlternateAttackOpportunityDelegate(InProcessLookForAlternateAttackOpportunityDel);
        myCommand.SetIsThereClearRangedAttackLaneDelegate(InIsThereClearRangedAttackLaneDelegate);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdMortarAttackPof()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheTarget[8388609], LocationToLaunchFrom, inMortarAttackSetupInfo;
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InProcessLookForAnotherAttackOpportunityDel[9437185], InProcessLookForAlternateAttackOpportunityDel, InIsThereClearRangedAttackLaneDelegate;
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    None
    None
    None
    CmdStatus_Strike
    0
    // End:0x7A
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SepiaMortarAttack'.static.InitCommand(self);
    myCommand = LPAICmd_SepiaMortarAttack(GetActiveCommand());
    // End:0x1DE
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetTheTarget(TheTarget);
        myCommand.SetLocationToLaunchFrom(LocationToLaunchFrom);
        myCommand.SetMortarAttackSetupInfo(inMortarAttackSetupInfo);
        myCommand.SetProcessLookForAnotherAttackOpportunityDelegate(InProcessLookForAnotherAttackOpportunityDel);
        myCommand.SetProcessLookForAlternateAttackOpportunityDelegate(InProcessLookForAlternateAttackOpportunityDel);
        myCommand.SetIsThereClearRangedAttackLaneDelegate(InIsThereClearRangedAttackLaneDelegate);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdSepiaMedRangeSpitStrikePof()
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
    Class'LPAICmd_SepiaMedRangeSpitStrike'.static.InitCommand(self);
    myCommand = LPAICmd_SepiaMedRangeSpitStrike(GetActiveCommand());
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
    Class'LPAICmd_SepiaDamageAssessment'.static.InitCommand(self);
    myCommand = LPAICmd_SepiaDamageAssessment(GetActiveCommand());
    // End:0x14F
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetActorToCareAboutWhileAssessing(Enemy2Ass);
        myCommand.SetMinTimeOfThisDamageAssessment(InMinTimeOfThisDamageAssessment);
        myCommand.SetMaxTimeOfThisDamageAssessment(InMaxTimeOfThisDamageAssessment);
        myCommand.SetAssessmentSpecialMove(Class'LPSM_SepiaDamageAssessment');
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdMortarAttackDamageAssessment()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Ass[8388609];
    local /*0x97E50000-0x00000000*/ private float InMinTimeOfThisDamageAssessment[8388609], InMaxTimeOfThisDamageAssessment, InMinRangeFromActorOfInterestToAllowMortarAttackDamageAssessmentToContinue, InMaxRangeFromActorOfInterestToAllowMortarAttackDamageAssessmentToContinue;
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
    Class'LPAICmd_SepiaMortarAttackDamageAssessment'.static.InitCommand(self);
    myCommand = LPAICmd_SepiaMortarAttackDamageAssessment(GetActiveCommand());
    // End:0x19F
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetActorToCareAboutWhileAssessing(Enemy2Ass);
        myCommand.SetMinTimeOfThisDamageAssessment(InMinTimeOfThisDamageAssessment);
        myCommand.SetMaxTimeOfThisDamageAssessment(InMaxTimeOfThisDamageAssessment);
        myCommand.SetMinRangeFromActorOfInterestToAllowMortarAttackDamageAssessmentToContinue(InMinRangeFromActorOfInterestToAllowMortarAttackDamageAssessmentToContinue);
        myCommand.SetMaxRangeFromActorOfInterestToAllowMortarAttackDamageAssessmentToContinue(InMaxRangeFromActorOfInterestToAllowMortarAttackDamageAssessmentToContinue);
        myCommand.SetAssessmentSpecialMove(Class'LPSM_SepiaDamageAssessment');
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdSepiaBiteStrikePof()
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
    Class'LPAICmd_SepiaBiteStrike'.static.InitCommand(self);
    myCommand = LPAICmd_SepiaBiteStrike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdSepiaJumpBiteStrikePof()
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
    Class'LPAICmd_SepiaJumpBiteStrike'.static.InitCommand(self);
    myCommand = LPAICmd_SepiaJumpBiteStrike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdSepiaJumpBiteStrikeVs()
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
    Class'LPAICmd_SepiaJumpBiteVsStrike'.static.InitCommand(self);
    myCommand = LPAICmd_SepiaJumpBiteVsStrike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdSepiaJumpBiteStrikeFvs()
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
    Class'LPAICmd_SepiaJumpBiteStrikeFvs'.static.InitCommand(self);
    myCommand = LPAICmd_SepiaJumpBiteStrikeFvs(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdSepiaSuicideLongJumpBiteStrikePof()
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
    Class'LPAICmd_SepiaSuicideLongJumpBiteStrike'.static.InitCommand(self);
    myCommand = LPAICmd_SepiaSuicideLongJumpBiteStrike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdSepiaSuicideLongJumpBiteStrikeVs()
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
    Class'LPAICmd_SepiaSuicideLongJumpBiteStrikeVs'.static.InitCommand(self);
    myCommand = LPAICmd_SepiaSuicideLongJumpBiteStrikeVs(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdSepiaStrugglePofStrike()
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
    Class'LPAICmd_SepiaStrugglePofStrike'.static.InitCommand(self);
    myCommand = LPAICmd_SepiaStrugglePofStrike(GetActiveCommand());
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

function CmdFlee()
{
    local /*0x97E50000-0x00000000*/ private float Duration[9437185], MaxFleeDist, DesiredSeperationFromDanger;
    local /*0x97E50000-0x00000000*/ private editfixedsize array FleeFrom[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private bool bFinishWhenSafe[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    10.0000000
    10000.0000000
    200.0000000    
    0
    true
    // End:0x4F
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SepiaFlee'.static.InitCommand(self);
    myCommand = LPAICmd_SepiaFlee(GetActiveCommand());
    // End:0x164
    if(myCommand != none)
    {
        myCommand.Duration = Duration;
        myCommand.SetMaxFleeDistance(MaxFleeDist);
        myCommand.SetDesiredSeperationFromDanger(DesiredSeperationFromDanger);
        myCommand.SetFleeFromActors(FleeFrom);
        myCommand.SetFinishWhenSafe(bFinishWhenSafe);
    }
    return myCommand;
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: LPAICmdStatus_Attack'Default__LPAIControllerSepia.CmdStatus_SepiaAttackD0'
    begin object name=CmdStatus_SepiaAttackD0 class=Class'LPAICmdStatus_Attack'
    end object
    CmdStatus_SepiaAttack=CmdStatus_SepiaAttackD0
    ShortBiteStrikeZoneDebugColor=(R=255,G=0,B=0,A=255)
    JumpBiteStrikeZoneDebugColor=(R=255,G=255,B=0,A=255)
    SuicideJumpStrikeZoneDebugColor=(R=0,G=255,B=0,A=255)
    LowEndOfRandomDesriedRangeFromTargetForDirectAttackDebugColor=(R=100,G=0,B=200,A=255)
    HighEndOfRandomDesriedRangeFromTargetForDirectAttackDebugColor=(R=0,G=0,B=255,A=255)
    PercentOfRangeToShowZoneName=0.8000000
    HeightOfDebugStrikeZoneArea=300.0000000
    NumOfSegmentsOfDebugStrikeZoneArea=8
    // Reference: LPAICmdStatus_MoveToPosition'Default__LPAIControllerSepia.LPAICmdStatus_MoveToPosition0'
    begin object name=LPAICmdStatus_MoveToPosition0
    end object
    CmdStatus_MoveToPosition=LPAICmdStatus_MoveToPosition0
    // Reference: LPAICmdStatus_MoveToActor'Default__LPAIControllerSepia.LPAICmdStatus_MoveToActor0'
    begin object name=LPAICmdStatus_MoveToActor0
    end object
    CmdStatus_MoveToActor=LPAICmdStatus_MoveToActor0
    // Reference: LPAICmdStatus_Stunned'Default__LPAIControllerSepia.LPAICmdStatus_Stunned0'
    begin object name=LPAICmdStatus_Stunned0
    end object
    CmdStatus_Stunned=LPAICmdStatus_Stunned0
    // Reference: LPAICmdStatus_Strike'Default__LPAIControllerSepia.LPAICmdStatus_Strike0'
    begin object name=LPAICmdStatus_Strike0
    end object
    CmdStatus_Strike=LPAICmdStatus_Strike0
    // Reference: LPAICmdStatus_Attack'Default__LPAIControllerSepia.LPAICmdStatus_Attack0'
    begin object name=LPAICmdStatus_Attack0
    end object
    CmdStatus_Attack=LPAICmdStatus_Attack0
    // Reference: LPAdHocSquadMemberData'Default__LPAIControllerSepia.LPAdHocSquadMemberDataD0'
    begin object name=LPAdHocSquadMemberDataD0
    end object
    MyAdHocSquadMemberData=LPAdHocSquadMemberDataD0
    ArrayOfMeleeGroupClassToTurnOffAtTheEndOffAllStrikes=/* Array type was not detected. */
    // Reference: SPAIReactionManager'Default__LPAIControllerSepia.ReactionManager0'
    begin object name=ReactionManager0
    end object
    ReactionManager=ReactionManager0
    // Reference: LPAIObjectiveManager'Default__LPAIControllerSepia.LPAIObjectiveManager0'
    begin object name=LPAIObjectiveManager0
    end object
    AIObjectiveManager=LPAIObjectiveManager0
    bUseVisibilityManagerComplexLOSChecks=true
    Components[0]=LPAIObjectiveManager0
}