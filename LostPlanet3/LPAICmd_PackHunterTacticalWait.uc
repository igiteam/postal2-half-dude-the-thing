class LPAICmd_PackHunterTacticalWait extends LPAICmd_Attack within LPAIControllerPackHunter;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LocationToWaitAt[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ThingToFocusOnWhenNoEnemy[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HowCloseToLetEnemiesGetBeforeAttacking[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HowCloseToLetEnemiesGetBeforeAttackingSq[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HowCloseToLocationToTryAndStay[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HowCloseToLocationToTryAndStaySq[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HowCloseToLetGrenadesGetBeforeAttacking[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HowCloseToLetGrenadesGetBeforeAttackingSq[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRandomizeWhichMovesToPlay[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUseAggressiveIndicator[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPerformingAggressiveDisplaySpecialMove[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurMoveToActorCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurTurnToFaceCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AggressiveIndicatorValue[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStartedAggressiveDisplay[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DamageThresholdBeforeEndingCommand[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AmountOfDamageReceivedDurringThisCommand[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentMoveIndex[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int LastMoveIndex[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array MovesToPlay[536870913];

function Pushed()
{
    super.Pushed();
    LocationToWaitAt = none;
    HowCloseToLetEnemiesGetBeforeAttacking = 1000.0000000;
    HowCloseToLetEnemiesGetBeforeAttackingSq = HowCloseToLetEnemiesGetBeforeAttacking * HowCloseToLetEnemiesGetBeforeAttacking;
    HowCloseToLocationToTryAndStay = 200.0000000;
    HowCloseToLocationToTryAndStaySq = HowCloseToLocationToTryAndStay * HowCloseToLocationToTryAndStay;
    HowCloseToLetGrenadesGetBeforeAttacking = 1000.0000000;
    HowCloseToLetGrenadesGetBeforeAttackingSq = HowCloseToLetGrenadesGetBeforeAttacking * HowCloseToLetGrenadesGetBeforeAttacking;
    bRandomizeWhichMovesToPlay = false;
    bUseAggressiveIndicator = true;
    CurMoveToActorCmd = none;
    CurTurnToFaceCmd = none;
    AggressiveIndicatorValue = 0.0000000;
    bPerformingAggressiveDisplaySpecialMove = false;
    DamageThresholdBeforeEndingCommand = 1.0000000;
    AmountOfDamageReceivedDurringThisCommand = 0.0000000;
    CurrentMoveIndex = -1;
    LastMoveIndex = -1;
    //return;    
}

function Popped()
{
    AggressiveIndicatorValue = 0.0000000;
    StopProcessAggressiveIndicatorTimer();
    StopProcessEnemyEncroachmentMonitorTimer();
    Outer.EnableAnnounceHeadGlow(false);
    Outer.EnableAnnounceTailGlow(false);
    // End:0xBB
    if(Outer.PHPawn != none)
    {
        Outer.PHPawn.SetCurrentlyNotValidTargetForGrenadeAssist();
    }
    AbortAnyRunningChildCommand();
    StopCurrentDisplayTypePerforming();
    super.Popped();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

function SetLocationToWaitAt()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewLocationToWaitAt[8388609];

    LocationToWaitAt = NewLocationToWaitAt;
    //return;    
}

function SetThingToFocusOnWhenNoEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL LookAtThingy[8388609];

    ThingToFocusOnWhenNoEnemy = LookAtThingy;
    //return;    
}

function SetHowCloseToLetEnemiesGetBeforeAttacking()
{
    local /*0x97E50000-0x00000000*/ private float HowCloseRange[8388609];

    HowCloseToLetEnemiesGetBeforeAttacking = HowCloseRange;
    HowCloseToLetEnemiesGetBeforeAttackingSq = HowCloseToLetEnemiesGetBeforeAttacking * HowCloseToLetEnemiesGetBeforeAttacking;
    //return;    
}

function SetHowCloseToLetGrenadesGetBeforeAttacking()
{
    local /*0x97E50000-0x00000000*/ private float HowCloseRange[8388609];

    HowCloseToLetGrenadesGetBeforeAttacking = HowCloseRange;
    HowCloseToLetGrenadesGetBeforeAttackingSq = HowCloseToLetGrenadesGetBeforeAttacking * HowCloseToLetGrenadesGetBeforeAttacking;
    //return;    
}

function SetIfShouldRandomizeWhichMovesToPlay()
{
    local /*0x97E50000-0x00000000*/ private bool bRandomize[8388609];

    bRandomizeWhichMovesToPlay = bRandomize;
    //return;    
}

function SetIfShouldUseAggressiveIndicat()
{
    local /*0x97E50000-0x00000000*/ private bool bUseIndicator[8388609];

    bUseAggressiveIndicator = bUseIndicator;
    //return;    
}

function SetHowCloseToLocationToTryAndStay()
{
    local /*0x97E50000-0x00000000*/ private float HowCloseRange[8388609];

    HowCloseToLocationToTryAndStay = HowCloseRange;
    HowCloseToLocationToTryAndStaySq = HowCloseToLocationToTryAndStay * HowCloseToLocationToTryAndStay;
    //return;    
}

function SetDamageThresholdBeforeEndingCommand()
{
    local /*0x97E50000-0x00000000*/ private float HowMuchDamage[8388609];

    DamageThresholdBeforeEndingCommand = HowMuchDamage;
    //return;    
}

function SetMovesToPlay()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array NewMovesToPlay[8388609];

    MovesToPlay = NewMovesToPlay;
    //return;    
}

private final function AbortAnyRunningChildCommand()
{
    // End:0x38
    if(CurMoveToActorCmd != none)
    {
        Outer.AbortCommand(CurMoveToActorCmd);
    }
    // End:0x70
    if(CurTurnToFaceCmd != none)
    {
        Outer.AbortCommand(CurTurnToFaceCmd);
    }
    //return;    
}

function MoveToLocationToWaitAt()
{
    local /*0x97E50000-0x00000000*/ private float Seperation;

    Seperation = VSizeSq2D(Outer.myAIPawn.Location - LocationToWaitAt.Location);
    // End:0x300
    if(Seperation > HowCloseToLocationToTryAndStaySq)
    {
        Outer.Focus = none;
        CurMoveToActorCmd = Outer.CmdMoveToActor(LocationToWaitAt, none, HowCloseToLocationToTryAndStay, Outer.CmdStatus_MoveToActor, 1, Outer.myAIPawn.TuneDataAIPawn.StopTypeForEndOfMoveToTacWaitPoint);
        CurMoveToActorCmd.SetNotifyOfCoreHitWhileMovingDelegate(NotifyOfCoreHit);
        CurMoveToActorCmd.SetNotifyOfNonCoreHitWhileMovingDelegate(NotifyOfNonCoreHit);
        CurMoveToActorCmd.__MoveAbortDelegate__Delegate = None;
        CurMoveToActorCmd.bZeroVelocityOnFinish = false;
        CurMoveToActorCmd.SetMovementMonitorParameters(true, Outer.PHPawn.TuneDataPackHunter.DurationBetweenMovementDeltaDuringTacWait, Outer.PHPawn.TuneDataPackHunter.MinMovementDeltaDuringTacWait, Outer.PHPawn.TuneDataPackHunter.DelayAfterStartOfTacWaitBeforeMonitorStarts, NotifyOfFailedMovementToTacWaitPoint);
    }
    //return;    
}

function NotifyOfFailedMovementToTacWaitPoint()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x38
    if(CurMoveToActorCmd != none)
    {
        Outer.AbortCommand(CurMoveToActorCmd);
    }
    return true;
    //return ReturnValue;    
}

function DoesHunterStillNeedToMoveCloserToEnemy()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function NeedToPerformDamageAssessment()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function StopCurrentDisplayTypePerforming()
{
    // End:0x8B
    if(CurrentMoveIndex >= 0)
    {
        Outer.PHPawn.EndSpecialMove(MovesToPlay[CurrentMoveIndex].SpecialMoveToPlay);
        LastMoveIndex = CurrentMoveIndex;
        CurrentMoveIndex = -1;
    }
    //return;    
}

function DetermineSpcialMoveToPlay()
{
    local /*0x97E50000-0x00000000*/ private int NumOfMoves;

    NumOfMoves = MovesToPlay.Length;
    // End:0xB4
    if(bRandomizeWhichMovesToPlay)
    {
        CurrentMoveIndex = Rand(NumOfMoves);
        // End:0xB1
        if(CurrentMoveIndex == LastMoveIndex)
        {
            // End:0xB1
            if(!MovesToPlay[CurrentMoveIndex].bAllowedToRepeat)
            {
                CurrentMoveIndex = LastMoveIndex + 1;
                // End:0xB1
                if(CurrentMoveIndex >= NumOfMoves)
                {
                    CurrentMoveIndex = 0;
                }
            }
        }        
    }
    else
    {
        CurrentMoveIndex = LastMoveIndex + 1;
        // End:0xEC
        if(CurrentMoveIndex >= NumOfMoves)
        {
            CurrentMoveIndex = 0;
        }
    }
    //return;    
}

function On_LPSM_DisplaySpecialMove_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bPerformingAggressiveDisplaySpecialMove = false;
    LastMoveIndex = CurrentMoveIndex;
    //return;    
}

function HandlePossibilityTookEnoughDamageToCauseBehaviorChange()
{
    local /*0x97E50000-0x00000000*/ private bool bGrenadeHit[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL GrenLoc[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xC9
    if(AmountOfDamageReceivedDurringThisCommand >= DamageThresholdBeforeEndingCommand)
    {
        StopCurrentDisplayTypePerforming();
        StopProcessEnemyEncroachmentMonitorTimer();
        // End:0x9F
        if(Outer.AreWeShowingAttackArtifacts())
        {
            DrawSensingData(true, true, Outer.MyLPEnemy.Location, bGrenadeHit, GrenLoc);
        }
        AbortAnyRunningChildCommand();
        Outer.PopCommand(self);
    }
    return false;
    //return ReturnValue;    
}

final function DrawSensingData()
{
    local /*0x97E50000-0x00000000*/ private bool bFoundEnemy[8388609], bTookDamage;
    local /*0x97E50000-0x00000000*/ private @NULL EnemyLoc[8388609];
    local /*0x97E50000-0x00000000*/ private bool bFoundGrenade[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL GrenLoc[8388609];

    //return;    
}

final function StartProcessEnemyEncroachmentMonitorTimer()
{
    // End:0xA0
    if(!Outer.bDisableAI && !IsProcessEnemyEncroachmentMonitorTimerActive())
    {
        Outer.SetTimer(Outer.PHPawn.TuneDataPackHunter.TacticalWaitProcessEnemyEncroachmentUpdateTime, true, 'ProcessEnemyEncroachmentMonitorTimer', self);
    }
    //return;    
}

final function StopProcessEnemyEncroachmentMonitorTimer()
{
    Outer.ClearTimer('ProcessEnemyEncroachmentMonitorTimer', self);
    //return;    
}

function PauseProcessEnemyEncroachmentMonitorTimer()
{
    local /*0x97E50000-0x00000000*/ private bool bPause[8388609];

    // End:0x1A
    if(bPause)
    {
        StopProcessEnemyEncroachmentMonitorTimer();        
    }
    else
    {
        StartProcessEnemyEncroachmentMonitorTimer();
    }
    //return;    
}

final function IsProcessEnemyEncroachmentMonitorTimerActive()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.IsTimerActive('ProcessEnemyEncroachmentMonitorTimer', self);
    //return ReturnValue;    
}

private final function ProcessEnemyEncroachmentMonitorTimer()
{
    ProcessEnemyEncroachmentMonitor();
    //return;    
}

final function ProcessEnemyEncroachmentMonitor()
{
    local /*0x97E50000-0x00000000*/ private int iter;
    local /*0x97E50000-0x00000000*/ private @NULL EnemyCandidate, possibleGrenade;
    local /*0x97E50000-0x00000000*/ private float seperationSq, seperationToCurrentEnemysq;

    // End:0x9B
    if(Outer.MyLPEnemy != none)
    {
        seperationToCurrentEnemysq = VSizeSq(Outer.PHPawn.Location - Outer.MyLPEnemy.Location);        
    }
    else
    {
        seperationToCurrentEnemysq = float(2147483647);
    }
    iter = 0;
    J0xB7:

    // End:0x379 [Loop If]
    if(iter < Outer.TargetList.Length)
    {
        EnemyCandidate = Outer.TargetList[iter].Actor;
        // End:0x36B
        if((EnemyCandidate != none) && Outer.CanBeMyEnemy(EnemyCandidate))
        {
            // End:0x1D4
            if((Outer.MyLPEnemy == none) && LPPawn(EnemyCandidate) != none)
            {
                Outer.MyLPEnemy = LPPawn(EnemyCandidate);
            }
            seperationSq = VSizeSq(Outer.PHPawn.Location - EnemyCandidate.Location);
            // End:0x323
            if(seperationSq < HowCloseToLetEnemiesGetBeforeAttackingSq)
            {
                Outer.MyLPEnemy = LPPawn(EnemyCandidate);
                StopCurrentDisplayTypePerforming();
                // End:0x2F4
                if(Outer.AreWeShowingAttackArtifacts())
                {
                    DrawSensingData(true, false, Outer.MyLPEnemy.Location, false, vect(0.0000000, 0.0000000, 0.0000000));
                }
                AbortAnyRunningChildCommand();
                Outer.PopCommand(self);
                return;                
            }
            else
            {
                // End:0x36B
                if(seperationSq < seperationToCurrentEnemysq)
                {
                    Outer.MyLPEnemy = LPPawn(EnemyCandidate);
                }
            }
        }
        ++iter;
        // [Loop Continue]
        goto J0xB7;
    }
    // End:0x566
    foreach Outer.DynamicActors(Class'LPProj_Grenade', possibleGrenade)
    {
        seperationSq = VSizeSq(Outer.PHPawn.Location - possibleGrenade.Location);
        // End:0x565
        if(seperationSq < HowCloseToLetGrenadesGetBeforeAttackingSq)
        {
            // End:0x4AE
            if(LPPlayerController(possibleGrenade.InstigatorController) != none)
            {
                Outer.MyLPEnemy = LPPawn(LPPlayerController(possibleGrenade.InstigatorController).Pawn);
            }
            StopCurrentDisplayTypePerforming();
            // End:0x538
            if(Outer.AreWeShowingAttackArtifacts())
            {
                DrawSensingData(true, false, Outer.MyLPEnemy.Location, true, possibleGrenade.Location);
            }
            AbortAnyRunningChildCommand();
            Outer.PopCommand(self);            
            return;
        }        
    }    
    // End:0x5B0
    if(Outer.AreWeShowingAttackArtifacts())
    {
        DrawSensingData(false, false, vect(0.0000000, 0.0000000, 0.0000000), false, vect(0.0000000, 0.0000000, 0.0000000));
    }
    // End:0x64B
    if(CurMoveToActorCmd == none)
    {
        // End:0x623
        if(Outer.MyLPEnemy != none)
        {
            Outer.Focus = Outer.MyLPEnemy;            
        }
        else
        {
            Outer.Focus = ThingToFocusOnWhenNoEnemy;
        }
    }
    //return;    
}

final function StartProcessAggressiveIndicatorTimer()
{
    // End:0x5D
    if(!Outer.bDisableAI && !IsProcessAggressiveIndicatorTimerActive())
    {
        Outer.SetTimer(0.0100000, true, 'ProcessAggressiveIndicatorTimer', self);
    }
    //return;    
}

final function StopProcessAggressiveIndicatorTimer()
{
    Outer.ClearTimer('ProcessAggressiveIndicatorTimer', self);
    //return;    
}

function PauseProcessAggressiveIndicatorTimer()
{
    local /*0x97E50000-0x00000000*/ private bool bPause[8388609];

    // End:0x1A
    if(bPause)
    {
        StopProcessAggressiveIndicatorTimer();        
    }
    else
    {
        StartProcessAggressiveIndicatorTimer();
    }
    //return;    
}

final function IsProcessAggressiveIndicatorTimerActive()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.IsTimerActive('ProcessAggressiveIndicatorTimer', self);
    //return ReturnValue;    
}

private final function ProcessAggressiveIndicatorTimer()
{
    ProcessAggressiveIndicator();
    //return;    
}

function ProcessAggressiveIndicator()
{
    local /*0x97E50000-0x00000000*/ private float NewValue;

    // End:0x265
    if(Outer.PHPawn != none)
    {
        NewValue = Tan(Outer.PHPawn.TuneDataPackHunter.TacticalWaitAggressivePulseFrequency * AggressiveIndicatorValue) * Outer.PHPawn.TuneDataPackHunter.TacticalWaitAggressivePulseReductionFactor;
        // End:0x178
        if(NewValue > Outer.PHPawn.TuneDataPackHunter.TacticalWaitAggressivePulseMaxOutput)
        {
            NewValue = Outer.PHPawn.TuneDataPackHunter.TacticalWaitAggressivePulseMaxOutput;            
        }
        else
        {
            // End:0x198
            if(NewValue < float(0))
            {
                NewValue = 0.0000000;
            }
        }
        Outer.PHPawn.HeadGlowFactor = NewValue;
        Outer.PHPawn.TailGlowFactor = NewValue;
        AggressiveIndicatorValue += Outer.PHPawn.TuneDataPackHunter.TacticalWaitAggressivePulseRate;
    }
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

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    event NotifyOfCoreHit()
    {
        local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
        local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
        local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private byte coreHit;

        coreHit = 3;
        // End:0x1A8
        if(Outer.PHPawn != none)
        {
            AmountOfDamageReceivedDurringThisCommand += AmountOfDamage;
            // End:0x104
            if(Outer.PHPawn.MyCoreData.Length >= HitCoreIndex)
            {
                // End:0x104
                if(Outer.PHPawn.MyCoreData[HitCoreIndex].CoreID == 0)
                {
                    // End:0x104
                    if(TypeOfDamage == Class'LPDamageTypeGrenadeActual')
                    {
                        AmountOfDamageReceivedDurringThisCommand = float(2147483647);
                    }
                }
            }
            // End:0x1A8
            if(HandlePossibilityTookEnoughDamageToCauseBehaviorChange(TypeOfDamage == Class'LPDamageTypeGrenadeActual', Outer.PHPawn.Location))
            {
                // End:0x1A6
                if((int(coreHit) == int(1)) || int(coreHit) == int(2))
                {
                    Outer.StartAdditiveTailCoreHitAnimation(1.0000000);
                }
                return true;
            }
        }
        return false;
        //return ReturnValue;        
    }

    event NotifyOfNonCoreHit()
    {
        local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
        local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        AmountOfDamageReceivedDurringThisCommand += AmountOfDamage;
        // End:0x3C
        if(TypeOfDamage == Class'LPDamageTypeGrenadeActual')
        {
            AmountOfDamageReceivedDurringThisCommand = float(2147483647);
        }
        return HandlePossibilityTookEnoughDamageToCauseBehaviorChange(TypeOfDamage == Class'LPDamageTypeGrenadeActual', Outer.PHPawn.Location);
        //return ReturnValue;        
    }

    function GetDelayBetweenAggressivePerformances()
    {
        local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

        return RandRange(Outer.PHPawn.TuneDataPackHunter.MinDelayBetweenAggressivePerformances, Outer.PHPawn.TuneDataPackHunter.MaxDelayBetweenAggressivePerformances);
        //return ReturnValue;        
    }

    function IsDonePerformingAggressiveDisplaySpecialMove()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private float durationOfAction;

        // End:0x11
        if(!bPerformingAggressiveDisplaySpecialMove)
        {
            return true;
        }
        durationOfAction = Outer.WorldInfo.TimeSeconds - TimeStartedAggressiveDisplay;
        // End:0x99
        if(durationOfAction > MovesToPlay[CurrentMoveIndex].MaxTimeToPlay)
        {
            StopCurrentDisplayTypePerforming();
            return true;
        }
        return false;
        //return ReturnValue;        
    }
Begin:

    AggressiveIndicatorValue = 0.0000000;
    // End:0x74
    if(Outer.PHPawn.TuneDataPackHunter.bAllowUseTacticalWaitAggressivePulse && bUseAggressiveIndicator)
    {
        StartProcessAggressiveIndicatorTimer();
    }
    StartProcessEnemyEncroachmentMonitorTimer();
PerformSpecialMove:


    MoveToLocationToWaitAt();
    // End:0xEC
    if(Outer.MyLPEnemy != none)
    {
        Outer.Focus = Outer.MyLPEnemy;        
    }
    else
    {
        Outer.Focus = ThingToFocusOnWhenNoEnemy;
    }
    Outer.PHPawn.SetCurrentlyValidTargetForGrenadeAssist();
    // End:0x1A5
    if(Outer.Focus != none)
    {
        CurTurnToFaceCmd = Outer.CmdTurnToFaceFocus(0);
        CurTurnToFaceCmd = none;
    }
    DetermineSpcialMoveToPlay();
    // End:0x2A4
    if(CurrentMoveIndex >= 0)
    {
        TimeStartedAggressiveDisplay = Outer.WorldInfo.TimeSeconds;
        bPerformingAggressiveDisplaySpecialMove = true;
        Outer.PHPawn.DoSpecialMove(MovesToPlay[CurrentMoveIndex].SpecialMoveToPlay, true, true, On_LPSM_DisplaySpecialMove_Finished);
        J0x275:

        // End:0x2A4 [Loop If]
        if(!IsDonePerformingAggressiveDisplaySpecialMove())
        {
            Outer.Sleep(0.0100000);
            // [Loop Continue]
            goto J0x275;
        }
    }
    goto 'PerformSpecialMove';
EndCommand:


    Outer.PopCommand(self);
    stop;        
}
