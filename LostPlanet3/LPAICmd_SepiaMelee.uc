class LPAICmd_SepiaMelee extends LPAICmd_Melee within LPAIControllerSepia;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FormationMeleeAccess;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStartedFlee;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurDamageAssessmentCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinRangeCalcedForLastAttack[536870913];

function Pushed()
{
    super.Pushed();
    TimeStartedFlee = -1.0000000;
    MinRangeCalcedForLastAttack = 200.0000000;
    // End:0xAE
    if(Outer.SepiaPawn.TuneDataSepia.bTurnOnAttackMouthGlowAtStartCombat.GetValue() != float(0))
    {
        Outer.EnableSepiaHeadGlowEffects(true);
    }
    // End:0x16C
    if(Outer.SepiaPawn.TuneDataSepia.bAllowedToPerformBolSepiaLobFireAttack.GetValue() != float(0))
    {
        // End:0x16C
        if(Outer.myAIPawn.TuneDataAIPawn.ForceAllLobAttacksFromThisZone < 0)
        {
            StartCanFireLobShotTimer();
        }
    }
    //return;    
}

function Popped()
{
    StopCanFireLobShotTimer();
    // End:0x90
    if(Outer.SepiaPawn.TuneDataSepia.bTurnOnAttackMouthGlowAtStartCombat.GetValue() != float(0))
    {
        Outer.EnableSepiaHeadGlowEffects(false);
    }
    super.Popped();
    Outer.ReleaseAttackAccess();
    Outer.ClearTimer('ReactToStartMelee', self);
    //return;    
}

event SPAborted()
{
    super.SPAborted();
    Outer.ReleaseAttackAccess();
    StopCanFireLobShotTimer();
    //return;    
}

function Paused()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewCommand[8388609];

    super(LPAICommand).Paused(NewCommand);
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    // End:0xF7
    if((Outer.SepiaPawn != none) && Outer.SepiaPawn.TuneDataSepia.bAllowedToPerformBolSepiaLobFireAttack.GetValue() != float(0))
    {
        // End:0xF7
        if(Outer.myAIPawn.TuneDataAIPawn.ForceAllLobAttacksFromThisZone < 0)
        {
            StartCanFireLobShotTimer();
        }
    }
    //return;    
}

function SetDesiredEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];

    super(LPAICmd_Attack).SetDesiredEnemy(InEnemy);
    Outer.GetSepiaMassRetreatMgrAccess(InEnemy);
    //return;    
}

function CanStrike()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xB3
    if(int(Outer.SepiaPawn.Physics) == int(1))
    {
        // End:0xB0
        if(IsAnimationStateValidForAttacking())
        {
            // End:0xAD
            if(super.CanStrike() && !Outer.SepiaPawn.TuneDataSepia.bToggleOnlyLobStrike)
            {
                return true;                
            }            
        }        
    }
    return false;
    //return ReturnValue;    
}

function IsAnimationStateValidForAttacking()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL curNodeTesting, curFallNodeTesting;

    curNodeTesting = Outer.SepiaPawn.Mesh.FindAnimNode(Outer.SepiaPawn.TuneDataSepia.AnimNodeNameToCheckForFallingState);
    // End:0x100
    if(curNodeTesting != none)
    {
        curFallNodeTesting = LPAnimNodeBlendByFall(curNodeTesting);
        // End:0x100
        if(curFallNodeTesting != none)
        {
            // End:0x100
            if(int(curFallNodeTesting.FallState) != int(7))
            {
                return false;
            }
        }
    }
    return true;
    //return ReturnValue;    
}

function GetMinAttackRange()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], MinRange, MaxRange;

    // End:0x415
    if(Outer.SepiaPawn != none)
    {
        MinRange = Outer.SepiaPawn.TuneDataSepia.LowEndOfRandomDesriedRangeFromTargetForDirectAttack.GetValue();
        MaxRange = Outer.SepiaPawn.TuneDataSepia.HighEndOfRandomDesriedRangeFromTargetForDirectAttack.GetValue() - float(50);
        // End:0x1B7
        if(Outer.SepiaPawn.TuneDataSepia.bToggleOnlySuicideStrike)
        {
            MinRange = Outer.SepiaPawn.TuneDataSepia.HighEndOfRandomDesriedRangeFromTargetForDirectAttack.GetValue() - float(50);            
        }
        else
        {
            // End:0x26E
            if(Outer.SepiaPawn.TuneDataSepia.bToggleOnlyCloseRangeBitStrike)
            {
                MinRange = Outer.SepiaPawn.TuneDataSepia.LowEndOfRandomDesriedRangeFromTargetForDirectAttack.GetValue();                
            }
            else
            {
                // End:0x32B
                if(Outer.SepiaPawn.TuneDataSepia.bToggleOnlyFastJumpBiteStrike)
                {
                    MinRange = Outer.SepiaPawn.TuneDataSepia.MaxRangeToTargetForJumpBiteStrike.GetValue() - float(75);                    
                }
                else
                {
                    // End:0x3E5
                    if(Outer.SepiaPawn.TuneDataSepia.bToggleOnlyJumpBiteWithTellStrike)
                    {
                        MinRange = Outer.SepiaPawn.TuneDataSepia.MaxRangeToTargetForJumpBiteStrike.GetValue() - float(75);
                    }
                }
            }
        }
        MinRangeCalcedForLastAttack = RandRange(MinRange, MaxRange);
        return MinRangeCalcedForLastAttack;
    }
    return GetDefaultAttackRange();
    //return ReturnValue;    
}

function GetMaxAttackRange()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.SepiaPawn.TuneDataSepia.HighEndOfRandomDesriedRangeFromTargetForDirectAttack.GetValue();
    //return ReturnValue;    
}

function GetMinSeperationToRequireMoveBeforeStrike()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], MinRange, MaxRange, rangeToTryFor;

    // End:0x1E2
    if(Outer.SepiaPawn != none)
    {
        MinRange = Outer.SepiaPawn.TuneDataSepia.LowEndOfRandomDesriedRangeFromTargetForDirectAttack.GetValue();
        MaxRange = Outer.SepiaPawn.TuneDataSepia.HighEndOfRandomDesriedRangeFromTargetForDirectAttack.GetValue();
        // End:0x1A8
        if(Outer.SepiaPawn.TuneDataSepia.bToggleOnlySuicideStrike)
        {
            MinRange = Outer.SepiaPawn.TuneDataSepia.HighEndOfRandomDesriedRangeFromTargetForDirectAttack.GetValue();
        }
        rangeToTryFor = RandRange(MinRange, MaxRange);
        return ConvertRangeToSeperation2D(rangeToTryFor);
    }
    return 200.0000000;
    //return ReturnValue;    
}

function GetDefaultAttackRange()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.SepiaPawn.TuneDataSepia.MaxRangeToTargetForBiteStrike.GetValue() * 1.5000000;
    //return ReturnValue;    
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

function ShouldAbortFlee()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float timeFleeing;

    timeFleeing = Outer.WorldInfo.TimeSeconds - TimeStartedFlee;
    // End:0xB6
    if(timeFleeing > Outer.SepiaPawn.TuneDataSepia.MinFleeTime.GetValue())
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function NotifyPlayerStartMelee()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bHandled;

    bHandled = super(LPAICommand).NotifyPlayerStartMelee(PlayerPawn);
    // End:0x59
    if(!bHandled)
    {
        Outer.SetTimer(FRand() * 0.2000000, false, 'ReactToStartMelee', self);
    }
    return true;
    //return ReturnValue;    
}

function ReactToStartMelee()
{
    GotoState('ReactToMelee');
    //return;    
}

final function StartCanFireLobShotTimer()
{
    // End:0x77
    if(!Outer.bDisableAI && !IsCanFireLobShotTimerActive())
    {
        Outer.SetTimer(Outer.GetUpdateRateForCanFireLobShotTimer(), true, 'CanFireLobShotTimer', self);
    }
    //return;    
}

final function StopCanFireLobShotTimer()
{
    Outer.ClearTimer('CanFireLobShotTimer', self);
    //return;    
}

function PauseCanFireLobShotTimer()
{
    local /*0x97E50000-0x00000000*/ private bool bPause[8388609];

    // End:0x1A
    if(bPause)
    {
        StopCanFireLobShotTimer();        
    }
    else
    {
        StartCanFireLobShotTimer();
    }
    //return;    
}

final function IsCanFireLobShotTimerActive()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.IsTimerActive('CanFireLobShotTimer', self);
    //return ReturnValue;    
}

private final function CanFireLobShotTimer()
{
    CanFireLobShot();
    //return;    
}

function CanFireLobShot()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int currentZoneIn;

    // End:0x1D6
    if(Outer.DoesSepiaHaveAccessToLobStrike(EnemyForAttack))
    {
        // End:0x1B7
        if(Outer.IsThereAClearLobAttackLaneFromCurrentLocation(EnemyForAttack, 0, currentZoneIn))
        {
            Outer.SepiaPawn.SetAimInfoForRangedLobStrike(EnemyForAttack.Location, EnemyForAttack, -1, currentZoneIn, Outer.SepiaPawn.TuneDataAIPawn.HieghtOffTargetPointForEndOfLobFireArc);
            // End:0x154
            if(MoveToPositionCmd != none)
            {
                Outer.AbortCommand(MoveToPositionCmd);
                MoveToPositionCmd = none;
            }
            // End:0x197
            if(MoveToActorCmd != none)
            {
                Outer.AbortCommand(MoveToActorCmd);
                MoveToActorCmd = none;
            }
            StopCanFireLobShotTimer();
            GotoStateWithEnemyCheck('PerformRangeLobAttack');            
        }
        else
        {
            Outer.ReleaseRangedStrikeAccessForFailedAttack();
        }
    }
    return false;
    //return ReturnValue;    
}

function FleeFromEnemy()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array FleeFrom;
    local /*0x97E50000-0x00000000*/ private @NULL Cmd;
    local /*0x97E50000-0x00000000*/ private float FleeDistance;

    FleeDistance = Outer.SepiaPawn.TuneDataSepia.FleeDistance.GetValue();
    TimeStartedFlee = Outer.WorldInfo.TimeSeconds;
    FleeFrom.AddItem(EnemyForAttack);    
    Cmd = Outer.CmdFlee(Outer.SepiaPawn.TuneDataSepia.MaxFleeTime.GetValue(), FleeDistance * float(10), FleeDistance, FleeFrom, 1);
    Cmd.__FleeAbortDelegate__Delegate = ShouldAbortFlee;
    //return;    
}

function MoveMortarPointForLobStrikeAbortCondition()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function MoveMortarPointForLobStrike()
{
    MoveToPositionCmd = Outer.CmdMoveToPosition(Outer.SepiaPawn.LobStrikeLocValidationInfoList[0].LobFireLastPointToStrikeFrom,, -1.0000000, Outer.CmdStatus_MoveToPosition, 1, Outer.myAIPawn.TuneDataAIPawn.StopTypeForEndOfChargeStrike,, false);
    MoveToPositionCmd.__MoveAbortDelegate__Delegate = MoveMortarPointForLobStrikeAbortCondition;
    MoveToPositionCmd.bZeroVelocityOnFinish = true;
    MoveToPositionCmd.SetMovementMonitorParameters(true, Outer.myAIPawn.TuneDataAIPawn.DurationBetweenMovementDeltaDuringAttackRunInBeforeStrike, Outer.myAIPawn.TuneDataAIPawn.MinMovementDeltaDuringAttackRunInBeforeStrike, Outer.myAIPawn.TuneDataAIPawn.DelayAfterStartOfAttackRunInBeforeStrikeBeforeMonitorStarts, NotifyOfFailedMoveMortarPointForLobStrike);
    //return;    
}

function NotifyOfFailedMoveMortarPointForLobStrike()
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

function FindValidLobStrikeLocation()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL baseLaunchLoc;
    local /*0x97E50000-0x00000000*/ private float distanceFromTarget;

    // End:0x197
    if(Outer.SepiaPawn.TuneDataSepia.ForceAllLobAttacksFromThisZone >= 0)
    {
        distanceFromTarget = Outer.SepiaPawn.GetRangedLobFireMidZoneRangeForThisZone(Outer.SepiaPawn.TuneDataSepia.ForceAllLobAttacksFromThisZone);
        baseLaunchLoc = Outer.SepiaPawn.Location - EnemyForAttack.Location;
        baseLaunchLoc = Normal(baseLaunchLoc);
        baseLaunchLoc = baseLaunchLoc * distanceFromTarget;
        baseLaunchLoc = EnemyForAttack.Location + baseLaunchLoc;
    }
    Outer.SepiaPawn.LobStrikeLocValidationInfoList[0].LobFireLastPointToStrikeFrom = baseLaunchLoc;
    return true;
    //return ReturnValue;    
}

state MoveCloserToEnemy
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PrevStateName[8388609];

        super(SPStateObject).BeginState(PrevStateName);
        // End:0x74
        if(Outer.myAIPawn.TuneDataAIPawn.ForceAllLobAttacksFromThisZone >= 0)
        {
            GotoStateWithEnemyCheck('MortarFromGivenDistance');
        }
        //return;        
    }
    stop;    
}

state StrikeWithClearence
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PrevStateName[8388609];

        super.BeginState(PrevStateName);
        // End:0x70
        if(int(Outer.SepiaPawn.Physics) == int(1))
        {
            Outer.PawnZeroVelocity();
        }
        //return;        
    }
    stop;    
}

state WaitForClearence
{Begin:

    // End:0x5D
    if(int(Outer.SepiaPawn.Physics) == int(1))
    {
        Outer.PawnZeroVelocity();
    }
    J0x5D:

    // End:0xA7 [Loop If]
    if(!HasAccessToStartAttack() || !HasAttackWaitTimerExpired())
    {
        FleeFromEnemy();
        Outer.Sleep(0.0010000);
        // [Loop Continue]
        goto J0x5D;
    }
    GotoStateWithEnemyCheck('BeginStrike');
    stop;        
}

state ReactToMelee
{
    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        // End:0x43
        if(CurDamageAssessmentCmd != none)
        {
            Outer.AbortCommand(CurDamageAssessmentCmd);
            CurDamageAssessmentCmd = none;
        }
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function NotifyPlayerStartMelee()
    {
        local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }
Begin:

    CurDamageAssessmentCmd = Outer.CmdDamageAssessment(EnemyForAttack, 5.0000000, 5.0000000,, 1);
    CurDamageAssessmentCmd = none;
    GotoStateWithEnemyCheck('WaitForClearence');
    stop;            
}

state MortarFromGivenDistance
{
    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        //return;        
    }

    function CanFireLobShot()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private int currentZoneIn;

        // End:0x113
        if(Outer.DoesSepiaHaveAccessToLobStrike(EnemyForAttack))
        {
            // End:0x113
            if(Outer.IsThereAClearLobAttackLaneFromCurrentLocation(EnemyForAttack, 0, currentZoneIn))
            {
                Outer.SepiaPawn.SetAimInfoForRangedLobStrike(EnemyForAttack.Location, EnemyForAttack, -1, currentZoneIn, Outer.SepiaPawn.TuneDataAIPawn.HieghtOffTargetPointForEndOfLobFireArc);
                return true;
            }
        }
        return false;
        //return ReturnValue;        
    }
Begin:

    FindValidLobStrikeLocation();
    MoveMortarPointForLobStrike();
    J0x14:

    // End:0xAF [Loop If]
    if(true)
    {
        // End:0x8F
        if(CanFireLobShot())
        {
            Outer.CmdMedRangeAttackPof(EnemyForAttack, 1, 1, 1000.0000000, 1000.0000000, None, None, None,, 1);
        }
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x14;
    }
    stop;                    
}

state PerformRangeLobAttack
{
    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        //return;        
    }
Begin:

    Outer.CmdMedRangeAttackPof(EnemyForAttack, 1, 1, 1000.0000000, 1000.0000000, None, None, None,, 1);
    GotoStateWithEnemyCheck('WaitForClearence');
    stop;            
}

defaultproperties
{
    bCanStrikeBeforeReachingMeleeSlot=true
    MinAttackRange=100.0000000
    MaxAttackRange=150.0000000
}