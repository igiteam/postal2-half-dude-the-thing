class LPAICmd_Defend extends LPAICmd_Attack within LPAIController;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LocationToWaitAt[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LastLocationToWaitAt[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ThingToFocusOnWhenNoEnemy[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HowCloseToLetEnemiesGetBeforeAttacking[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HowCloseToLetEnemiesGetBeforeAttackingSq[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HowCloseToLocationToTryAndStay[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HowCloseToLocationToTryAndStaySq[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HowCloseToLetGrenadesGetBeforeAttacking[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HowCloseToLetGrenadesGetBeforeAttackingSq[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRandomizeWhichMovesToPlay[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPerformingAggressiveDisplaySpecialMove[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIgnoreEnemiesUnlessInDefendVolume;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIgnoreEnemiesNotOnNAVMesh;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurMoveCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurTurnToFaceCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStartedAggressiveDisplay[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DamageThresholdBeforeEndingCommand[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AmountOfDamageReceivedDurringThisCommand[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentMoveIndex[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int LastMoveIndex[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array MovesToPlay[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinTimeToWaitAtNode[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxTimeToWaitAtNode[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float NextTimeToMove;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DefendVolume;

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
    CurMoveCmd = none;
    CurTurnToFaceCmd = none;
    bPerformingAggressiveDisplaySpecialMove = false;
    DamageThresholdBeforeEndingCommand = 1.0000000;
    AmountOfDamageReceivedDurringThisCommand = 0.0000000;
    CurrentMoveIndex = -1;
    LastMoveIndex = -1;
    NextTimeToMove = 0.0000000;
    //return;    
}

function Popped()
{
    StopProcessEnemyEncroachmentMonitorTimer();
    DisableGrenadeAssist();
    ReleaseResources();
    AbortAnyRunningChildCommand();
    MyPawn.EndCurrentSpecialMove();
    super.Popped();
    //return;    
}

function DisableGrenadeAssist()
{
    //return;    
}

function EnableGrenadeAssist()
{
    //return;    
}

function SetWantsToAttackEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL WantsToAttack[8388609], DefendObj;

    DefendObj = LPAIObjectiveKismetDefend(Outer.CurrentObjective);
    // End:0x68
    if(DefendObj != none)
    {
        DefendObj.OnWantsToAttackEnemy(WantsToAttack);
    }
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

    super(LPAICommand).Paused(NewCommand);
    //return;    
}

function ReleaseResources()
{
    // End:0x40
    if(LPAIDefendNode(LocationToWaitAt) != none)
    {
        LPAIDefendNode(LocationToWaitAt).ClearAccess();
    }
    //return;    
}

function SetLocationToWaitAt()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewLocationToWaitAt[8388609];

    LocationToWaitAt = NewLocationToWaitAt;
    //return;    
}

function SetDefendVolume()
{
    local /*0x97E50000-0x00000000*/ private @NULL DefendVol[8388609];

    DefendVolume = DefendVol;
    //return;    
}

function InDefendVolume()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(DefendVolume == none)
    {
        return true;
    }
    // End:0x53
    if(DefendVolume.Encompasses(Outer.Pawn))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
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
    local /*0x97E50000-0x00000000*/ private int I;

    MovesToPlay = NewMovesToPlay;
    I = MovesToPlay.Length - 1;
    J0x2A:

    // End:0xC8 [Loop If]
    if(I >= 0)
    {
        // End:0xBA
        if((class<LPSM_PackHunterSwipeRightStrike>(MovesToPlay[I].SpecialMoveToPlay) != none) || class<LPSM_PackHunterSwipeLeftStrike>(MovesToPlay[I].SpecialMoveToPlay) != none)
        {
            MovesToPlay.Remove(I, 1);            
        }
        I--;
        // [Loop Continue]
        goto J0x2A;
    }
    //return;    
}

private final function AbortAnyRunningChildCommand()
{
    // End:0x38
    if(CurMoveCmd != none)
    {
        Outer.AbortCommand(CurMoveCmd);
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
    local /*0x97E50000-0x00000000*/ private float separation;
    local /*0x97E50000-0x00000000*/ private @NULL CoverSlotMarkerActor;

    CoverSlotMarkerActor = SPGFCoverSlotMarker(LocationToWaitAt);
    // End:0x1F1
    if(CoverSlotMarkerActor != none)
    {
        // End:0x1EE
        if(Outer.CoverGoal != CoverSlotMarkerActor.OwningSlot)
        {
            Outer.Focus = none;
            CurMoveCmd = Outer.CmdMoveToCover(CoverSlotMarkerActor.OwningSlot,,, Outer.ShouldAllowFiringWhileMoving());
            CurMoveCmd.SetNotifyOfCoreHitWhileMovingDelegate(NotifyOfCoreHit);
            CurMoveCmd.SetNotifyOfNonCoreHitWhileMovingDelegate(NotifyOfNonCoreHit);
            CurMoveCmd.__MoveAbortDelegate__Delegate = None;
            CurMoveCmd.bZeroVelocityOnFinish = false;
            CurMoveCmd.SetMovementMonitorParameters(true, 1.0000000, 50.0000000, 2.0000000, NotifyOfFailedMovementToDefendPoint);
        }        
    }
    else
    {
        separation = VSizeSq2D(Outer.myAIPawn.Location - LocationToWaitAt.Location);
        // End:0x3E2
        if(separation > HowCloseToLocationToTryAndStaySq)
        {
            Outer.Focus = none;
            CurMoveCmd = Outer.CmdMoveToActor(LocationToWaitAt, none, HowCloseToLocationToTryAndStay, Outer.CmdStatus_MoveToActor, 1, 0);
            CurMoveCmd.SetNotifyOfCoreHitWhileMovingDelegate(NotifyOfCoreHit);
            CurMoveCmd.SetNotifyOfNonCoreHitWhileMovingDelegate(NotifyOfNonCoreHit);
            CurMoveCmd.__MoveAbortDelegate__Delegate = None;
            CurMoveCmd.bZeroVelocityOnFinish = false;
            CurMoveCmd.SetMovementMonitorParameters(true, 1.0000000, 50.0000000, 2.0000000, NotifyOfFailedMovementToDefendPoint);
        }
    }
    //return;    
}

function NotifyOfFailedMovementToDefendPoint()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x38
    if(CurMoveCmd != none)
    {
        Outer.AbortCommand(CurMoveCmd);
    }
    return true;
    //return ReturnValue;    
}

function StopCurrentDisplayTypePerforming()
{
    // End:0x67
    if(CurrentMoveIndex >= 0)
    {
        MyPawn.EndSpecialMove(MovesToPlay[CurrentMoveIndex].SpecialMoveToPlay);
        LastMoveIndex = CurrentMoveIndex;
    }
    //return;    
}

function DetermineSpecialMoveToPlay()
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

    // End:0x20
    if(bIgnoreEnemiesUnlessInDefendVolume && !InDefendVolume())
    {
        return false;
    }
    // End:0xE9
    if(AmountOfDamageReceivedDurringThisCommand >= DamageThresholdBeforeEndingCommand)
    {
        StopCurrentDisplayTypePerforming();
        StopProcessEnemyEncroachmentMonitorTimer();
        // End:0xBF
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
    // End:0x5D
    if(!Outer.bDisableAI && !IsProcessEnemyEncroachmentMonitorTimerActive())
    {
        Outer.SetTimer(0.5000000, true, 'ProcessEnemyEncroachmentMonitorTimer', self);
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
    local /*0x97E50000-0x00000000*/ private float separationSq, separationToCurrentEnemysq;
    local /*0x97E50000-0x00000000*/ private @NULL PawnCandidate;

    // End:0x0F
    if(IsAnotherNonInterruptibleCommandActive())
    {
        return;
    }
    // End:0x2F
    if(bIgnoreEnemiesUnlessInDefendVolume && !InDefendVolume())
    {
        return;
    }
    // End:0xB5
    if(Outer.MyLPEnemy != none)
    {
        separationToCurrentEnemysq = VSizeSq(MyPawn.Location - Outer.MyLPEnemy.Location);        
    }
    else
    {
        separationToCurrentEnemysq = float(2147483647);
    }
    iter = 0;
    J0xD1:

    // End:0x45C [Loop If]
    if(iter < Outer.TargetList.Length)
    {
        EnemyCandidate = Outer.TargetList[iter].Actor;
        // End:0x44E
        if((EnemyCandidate != none) && Outer.CanBeMyEnemy(EnemyCandidate))
        {
            PawnCandidate = LPPawn(EnemyCandidate);
            // End:0x1FF
            if(PawnCandidate != none)
            {
                // End:0x1D1
                if(!PawnCandidate.IsAliveAndWell())
                {
                    // [Explicit Continue]
                    goto J0x44E;
                }
                // End:0x1FF
                if(Outer.IsTooLongSinceEnemySeen(PawnCandidate))
                {
                    // [Explicit Continue]
                    goto J0x44E;
                }
            }
            // End:0x265
            if((Outer.MyLPEnemy == none) && PawnCandidate != none)
            {
                Outer.MyLPEnemy = LPPawn(EnemyCandidate);
            }
            separationSq = VSizeSq(MyPawn.Location - EnemyCandidate.Location);
            // End:0x406
            if(separationSq < HowCloseToLetEnemiesGetBeforeAttackingSq)
            {
                // End:0x31A
                if(bIgnoreEnemiesNotOnNAVMesh && !Outer.IsOnNavMesh(EnemyCandidate.Location))
                {
                    // [Explicit Continue]
                    goto J0x44E;
                }
                Outer.MyLPEnemy = LPPawn(EnemyCandidate);
                StopCurrentDisplayTypePerforming();
                // End:0x3C4
                if(Outer.AreWeShowingAttackArtifacts())
                {
                    DrawSensingData(true, false, Outer.MyLPEnemy.Location, false, vect(0.0000000, 0.0000000, 0.0000000));
                }
                AbortAnyRunningChildCommand();
                SetWantsToAttackEnemy(PawnCandidate);
                Outer.PopCommand(self);
                return;                
            }
            else
            {
                // End:0x44E
                if(separationSq < separationToCurrentEnemysq)
                {
                    Outer.MyLPEnemy = LPPawn(EnemyCandidate);
                }
            }
        }
        J0x44E:

        ++iter;
        // [Loop Continue]
        goto J0xD1;
    }
    // End:0x769
    foreach Outer.DynamicActors(Class'LPProj_Grenade', possibleGrenade)
    {
        separationSq = VSizeSq(MyPawn.Location - possibleGrenade.Location);
        // End:0x768
        if(separationSq < HowCloseToLetGrenadesGetBeforeAttackingSq)
        {
            // End:0x689
            if(LPPlayerController(possibleGrenade.InstigatorController) != none)
            {
                Outer.MyLPEnemy = LPPawn(LPPlayerController(possibleGrenade.InstigatorController).Pawn);
                // End:0x689
                if(Outer.MyLPEnemy != none)
                {
                    // End:0x61F
                    if(!Outer.MyLPEnemy.IsAliveAndWell() || Outer.IsTooLongSinceEnemySeen(Outer.MyLPEnemy))
                    {
                        continue;                        
                    }
                    // End:0x689
                    if(bIgnoreEnemiesNotOnNAVMesh && !Outer.IsOnNavMesh(Outer.MyLPEnemy.Location))
                    {
                        continue;                        
                    }
                }
            }
            StopCurrentDisplayTypePerforming();
            // End:0x713
            if(Outer.AreWeShowingAttackArtifacts())
            {
                DrawSensingData(true, false, Outer.MyLPEnemy.Location, true, possibleGrenade.Location);
            }
            AbortAnyRunningChildCommand();
            SetWantsToAttackEnemy(Outer.MyLPEnemy);
            Outer.PopCommand(self);            
            return;
        }        
    }    
    // End:0x7B3
    if(Outer.AreWeShowingAttackArtifacts())
    {
        DrawSensingData(false, false, vect(0.0000000, 0.0000000, 0.0000000), false, vect(0.0000000, 0.0000000, 0.0000000));
    }
    // End:0x84E
    if(CurMoveCmd == none)
    {
        // End:0x826
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

function SetDefendNode()
{
    local /*0x97E50000-0x00000000*/ private @NULL DefendNode[8388609];

    MinTimeToWaitAtNode = DefendVolume.MinTimeToWaitAtNode;
    MaxTimeToWaitAtNode = DefendVolume.MaxTimeToWaitAtNode;
    ThingToFocusOnWhenNoEnemy = DefendVolume.ThingToFocusOnWhenNoEnemy;
    SetHowCloseToLetEnemiesGetBeforeAttacking(DefendVolume.HowCloseToLetEnemiesGetBeforeAttacking);
    SetHowCloseToLocationToTryAndStay(DefendVolume.HowCloseToLocationToTryAndStay);
    SetHowCloseToLetGrenadesGetBeforeAttacking(DefendVolume.HowCloseToLetGrenadesGetBeforeAttacking);
    bRandomizeWhichMovesToPlay = DefendVolume.bRandomizeWhichMovesToPlay;
    // End:0x352
    if(DefendNode != none)
    {
        // End:0x177
        if(DefendNode.MinTimeToWaitAtNode >= float(0))
        {
            MinTimeToWaitAtNode = DefendNode.MinTimeToWaitAtNode;
        }
        // End:0x1C5
        if(DefendNode.MaxTimeToWaitAtNode >= float(0))
        {
            MaxTimeToWaitAtNode = DefendNode.MaxTimeToWaitAtNode;
        }
        // End:0x211
        if(DefendNode.ThingToFocusOnWhenNoEnemy != none)
        {
            ThingToFocusOnWhenNoEnemy = DefendNode.ThingToFocusOnWhenNoEnemy;
        }
        // End:0x25F
        if(DefendNode.HowCloseToLetEnemiesGetBeforeAttacking > float(0))
        {
            SetHowCloseToLetEnemiesGetBeforeAttacking(DefendNode.HowCloseToLetEnemiesGetBeforeAttacking);
        }
        // End:0x2AD
        if(DefendNode.HowCloseToLocationToTryAndStay > float(0))
        {
            SetHowCloseToLocationToTryAndStay(DefendNode.HowCloseToLocationToTryAndStay);
        }
        // End:0x2FB
        if(DefendNode.HowCloseToLetGrenadesGetBeforeAttacking > float(0))
        {
            SetHowCloseToLetGrenadesGetBeforeAttacking(DefendNode.HowCloseToLetGrenadesGetBeforeAttacking);
        }
        bRandomizeWhichMovesToPlay = DefendNode.bRandomizeMovesToPlay;
        // End:0x352
        if(DefendNode.bUseNodeRotation)
        {
            ThingToFocusOnWhenNoEnemy = none;
        }
    }
    //return;    
}

function SetMinMaxTimeToWait()
{
    local /*0x97E50000-0x00000000*/ private float Min[8388609], Max;

    MinTimeToWaitAtNode = Min;
    MaxTimeToWaitAtNode = Max;
    //return;    
}

function FindNextNode()
{
    //return;    
}

state StateCmdActive
{
    ignores EnableGrenadeAssist;

    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        NextTimeToMove = 0.0000000;
        super.BeginState(PreviousStateName);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        ReleaseResources();
        //return;        
    }

    event NotifyOfCoreHit()
    {
        local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
        local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
        local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x64
        if(MyPawn != none)
        {
            AmountOfDamageReceivedDurringThisCommand += AmountOfDamage;
            // End:0x64
            if(HandlePossibilityTookEnoughDamageToCauseBehaviorChange(TypeOfDamage == Class'LPDamageTypeGrenadeActual', MyPawn.Location))
            {
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
        return HandlePossibilityTookEnoughDamageToCauseBehaviorChange(TypeOfDamage == Class'LPDamageTypeGrenadeActual', MyPawn.Location);
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

    function FindNextNode()
    {
        local /*0x97E50000-0x00000000*/ private @NULL DefendNode, AIDefendNode, AICoverSlot;

        // End:0x11
        if(DefendVolume == none)
        {
            return;
        }
        DefendNode = DefendVolume.GetBestDefendPositionActor(Outer.myAIPawn, LocationToWaitAt);
        AIDefendNode = LPAIDefendNode(DefendNode);
        // End:0x101
        if(AIDefendNode != none)
        {
            // End:0xDB
            if(LocationToWaitAt != none)
            {
                // End:0xDB
                if(LPAIDefendNode(LocationToWaitAt) != none)
                {
                    LPAIDefendNode(LocationToWaitAt).ClearAccess();
                }
            }
            LocationToWaitAt = AIDefendNode;
            SetDefendNode(AIDefendNode);
        }
        AICoverSlot = SPGFCoverSlotMarker(DefendNode);
        // End:0x14A
        if(AICoverSlot != none)
        {
            LocationToWaitAt = AICoverSlot;
            SetDefendNode(none);
        }
        //return;        
    }

    function CheckFaceNodeDir()
    {
        local /*0x97E50000-0x00000000*/ private @NULL FacePos;

        // End:0x10C
        if(LPAIDefendNode(LocationToWaitAt) != none)
        {
            // End:0x10C
            if(LPAIDefendNode(LocationToWaitAt).bUseNodeRotation)
            {
                FacePos = LocationToWaitAt.Location + (Vector(LocationToWaitAt.Rotation) * float(1000));
                Outer.Focus = none;
                Outer.CmdTurnToFacePosition(0, FacePos);
                Outer.SetFocalPoint(FacePos, false);
            }
        }
        //return;        
    }
Begin:

    StartProcessEnemyEncroachmentMonitorTimer();
PerformSpecialMove:


    // End:0x3E
    if(LocationToWaitAt != LastLocationToWaitAt)
    {
        LastLocationToWaitAt = LocationToWaitAt;
        MoveToLocationToWaitAt();
    }
    // End:0xA2
    if(Outer.MyLPEnemy != none)
    {
        Outer.Focus = Outer.MyLPEnemy;        
    }
    else
    {
        Outer.Focus = ThingToFocusOnWhenNoEnemy;
    }
    EnableGrenadeAssist();
    // End:0x134
    if(Outer.Focus != none)
    {
        CurTurnToFaceCmd = Outer.CmdTurnToFaceFocus(0);
        CurTurnToFaceCmd = none;        
    }
    else
    {
        CheckFaceNodeDir();
    }
    // End:0x1BD
    if((NextTimeToMove == float(0)) && MaxTimeToWaitAtNode > float(0))
    {
        NextTimeToMove = Outer.WorldInfo.TimeSeconds + RandRange(MinTimeToWaitAtNode, MaxTimeToWaitAtNode);
    }
    // End:0x393
    if(!Outer.CoverIsIn())
    {
        DetermineSpecialMoveToPlay();
        // End:0x323
        if(CurrentMoveIndex >= 0)
        {
            TimeStartedAggressiveDisplay = Outer.WorldInfo.TimeSeconds;
            bPerformingAggressiveDisplaySpecialMove = true;
            MyPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
            MyPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
            MyPawn.DoSpecialMove(MovesToPlay[CurrentMoveIndex].SpecialMoveToPlay, true, true, On_LPSM_DisplaySpecialMove_Finished);
            J0x2F4:

            // End:0x323 [Loop If]
            if(!IsDonePerformingAggressiveDisplaySpecialMove())
            {
                Outer.Sleep(0.0100000);
                // [Loop Continue]
                goto J0x2F4;
            }
        }
        // End:0x390
        if((NextTimeToMove > float(0)) && Outer.WorldInfo.TimeSeconds > NextTimeToMove)
        {
            NextTimeToMove = 0.0000000;
            FindNextNode();
        }        
    }
    else
    {
        Outer.Sleep(NextTimeToMove - Outer.WorldInfo.TimeSeconds);
        NextTimeToMove = 0.0000000;
        FindNextNode();
    }
    goto 'PerformSpecialMove';
EndCommand:


    Outer.PopCommand(self);
    stop;                
}
