class LPAICmd_CrabChargingStrike extends LPAICmd_CrabBaseStrike within LPAIControllerBaseSnowCrab;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL PawnsChargedAndHit[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDonePlayingHit[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurMoveToPositionCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CmdStatus_ChargeAttackUsing[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AngleToSideStepACosAngRange[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LockOnDist[536870913];

function GetDodgeWindowType()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    return 3;
    //return ReturnValue;    
}

function Pushed()
{
    super.Pushed();
    Class'SPEngine.SPUtil'.static.SetHalfCosAngRange(Outer.CrabPawn.TuneDataIceCrab.AngleToSideStepVsDuringCharge_Tunable.GetValue(), AngleToSideStepACosAngRange);
    PawnsChargedAndHit.MaxLifeTimeOfItemInList = Outer.CrabPawn.TuneDataIceCrab.DelayBetweenNewChargeHitsAllowed_Tunable.GetValue();
    PawnsChargedAndHit.MaxLifeTimeOfVsInList = Outer.CrabPawn.TuneDataIceCrab.DelayBetweenNewChargeHitsAgainstVsAllowed_Tunable.GetValue();
    PawnsChargedAndHit.MaxLifeTimeOfShutdownVsInList = Outer.CrabPawn.TuneDataIceCrab.DelayBetweenNewChargeHitsAgainstShutdownVsAllowed_Tunable.GetValue();
    Class'LPAIUtils'.static.EmptyHitList(PawnsChargedAndHit);
    bDonePlayingHit = false;
    TriggerStrikeEvent();
    //return;    
}

function Popped()
{
    StopProcessDodgeWindowTimer();
    StopProcessActiveDefenseWindowTimer();
    Class'LPAIUtils'.static.EmptyHitList(PawnsChargedAndHit);
    super.Popped();
    Outer.ResetRotationRate();
    //return;    
}

event SPAborted()
{
    super.SPAborted();
    Outer.ResetRotationRate();
    //return;    
}

function SetReturnCmdStatus()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnStatus[8388609];

    CmdStatus = ReturnStatus;
    CmdStatus_ChargeAttackUsing = LPAICmdStatus_ChargeAttack(ReturnStatus);
    //return;    
}

event DelegateMovingToChargePointAvoidance()
{
    local /*0x97E50000-0x00000000*/ private @NULL Obstacle[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x19
    if(Obstacle == EnemyForStrike)
    {
        return false;
    }
    // End:0x5C
    if(Outer.IsThisActorTheVsAndInGivenAvoidanceZone(Obstacle, AngleToSideStepACosAngRange, EnemyForStrike))
    {
        return true;        
    }
    else
    {
        // End:0x76
        if(LPPlayerPawn(Obstacle) != none)
        {
            return false;
        }
    }
    return false;
    //return ReturnValue;    
}

function @NULL HandleTouchDuringCharge()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    // End:0xE8
    if(Other.IsA('LPPlayerPawn'))
    {
        // End:0xE5
        if(Outer.CrabPawn.TuneDataIceCrab.bChargeHitsOnTouchAgainstPof)
        {
            // End:0xE5
            if(!RanIntoActor(Other, OtherComp, HitLocation, HitNormal))
            {
                Outer.TouchedOtherActorDuringMoveCmd(Other, OtherComp, HitLocation, HitNormal);
            }
        }        
    }
    else
    {
        // End:0x1D0
        if(Other.IsA('LPBaseVSPlayerPawn'))
        {
            // End:0x1CD
            if(Outer.CrabPawn.TuneDataIceCrab.bChargeHitsOnTouchAgainstVs)
            {
                // End:0x1CD
                if(!RanIntoActor(Other, OtherComp, HitLocation, HitNormal))
                {
                    Outer.TouchedOtherActorDuringMoveCmd(Other, OtherComp, HitLocation, HitNormal);
                }
            }            
        }
        else
        {
            // End:0x246
            if(!RanIntoActor(Other, OtherComp, HitLocation, HitNormal))
            {
                Outer.TouchedOtherActorDuringMoveCmd(Other, OtherComp, HitLocation, HitNormal);
            }
        }
    }
    //return;    
}

event @NULL TouchWhileMoving()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    HandleTouchDuringCharge(Other, OtherComp, HitLocation, HitNormal);
    return true;
    //return ReturnValue;    
}

event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    HandleTouchDuringCharge(Other, OtherComp, HitLocation, HitNormal);
    //return;    
}

function @NULL HandleBumpDuringCharge()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal;

    // End:0x71
    if(!RanIntoActor(Other, OtherComp, vect(0.0000000, 0.0000000, 0.0000000), HitNormal))
    {
        Outer.BumpedOtherActorDuringMoveCmd(Other, OtherComp, HitNormal);
    }
    //return;    
}

event @NULL BumpWhileMoving()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    HandleBumpDuringCharge(Other, OtherComp, HitNormal);
    return true;
    //return ReturnValue;    
}

event @NULL Bump()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal;

    HandleBumpDuringCharge(Other, OtherComp, HitNormal);
    //return;    
}

function @NULL RanIntoActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL hitPush, runIntoPawn, HitInfo, HitLoc, HitNorm, StartTrace,
	    EndTrace;

    local /*0x97E50000-0x00000000*/ private float DamageAmount;


    /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
        
    */
    // End:0x710
    /*@Error*/
    runIntoPawn = LPPawn(Other);
    /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
        
    */

    // End:0x710
    /*@Error*/
    /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
        
    */

    // End:0x70E
    /*@Error*/
    /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
        
    */

    // End:0x709
    /*@Error*/
    Class'LPAIUtils'.static.AddPawnHit(runIntoPawn, Outer.PawnsRunIntoWhileMoveing, Outer.WorldInfo.TimeSeconds, true);
    hitPush = GetHitPushDuringCharge(runIntoPawn);
    // End:0x4E7
    if(!HasTheHitPawnSucsufullyDodgedOrBlockedStrike(runIntoPawn))
    {
        StartTrace = Outer.myAIPawn.Location;
        EndTrace = Other.Location;
        /* Statement decompilation error: Object reference not set to an instance of an object.
            
        */

        /*@Error*/
        @NULL
        NotifyStruckPawn(runIntoPawn);
        Outer.AdjustHitPushForUnoccupiedVs(runIntoPawn, hitPush);
        Outer.PlayCorrectEffectsForChargeHit(runIntoPawn);
        DamageAmount = Outer.GetChargeStrikeHitDamageForThisTarget(runIntoPawn);
        // End:0x469
        if(DamageAmount > float(0))
        {
            runIntoPawn.TakeDamage(int(DamageAmount), Outer, Outer.CrabPawn.Location, hitPush, Outer.CrabPawn.DamageTypeChargeHit, HitInfo, Outer.CrabPawn);
            // End:0x4A1
            if(CmdStatus_ChargeAttackUsing.WasTargetSuccessfullyStruck())
            {
            }
            IHitMyTarget(runIntoPawn);
            goto J0x4E4;
            Outer.HandleRunIntoAnimation(runIntoPawn, OtherComp, HitLocation, HitNormal);
        }
        goto J0x709;
        /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
            
        */

        // End:0x709
        /*@Error*/
    }
    StartTrace = Outer.myAIPawn.Location;
    EndTrace = Other.Location;
    /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
        
    */

    // DebugMode: 0
    /*@Error*/;
}

function GetHitPushDuringCharge()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitActor[8388609], ReturnValue, hitPush;

    hitPush = HitActor.Location - Outer.CrabPawn.Location;
    hitPush = Normal(hitPush);
    return hitPush;
    //return ReturnValue;    
}

function OnLPSM_SnowCrabChargingStrikeHitEnd()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bDonePlayingHit = true;
    //return;    
}

function StartChargingStrikeSpecialMove()
{
    //return;    
}

function StartChargingStrike()
{
    StartChargingStrikeSpecialMove();
    StartProcessDodgeWindowTimer();
    StartProcessActiveDefenseWindowTimer();
    //return;    
}

final function StartProcessDodgeWindowTimer()
{
    // End:0x67
    if(!Outer.bDisableAI && !IsProcessDodgeWindowTimerActive())
    {
        ProcessDodgeWindowTimer();
        Outer.SetTimer(0.0100000, true, 'ProcessDodgeWindowTimer', self);
    }
    //return;    
}

final function StartProcessActiveDefenseWindowTimer()
{
    // End:0x67
    if(!Outer.bDisableAI && !IsProcessActiveDefenseWindowTimerActive())
    {
        ProcessActiveDefenseWindowTimer();
        Outer.SetTimer(0.0100000, true, 'ProcessActiveDefenseWindowTimer', self);
    }
    //return;    
}

final function StopProcessDodgeWindowTimer()
{
    // End:0x8A
    if(CmdStatus_ChargeAttackUsing.IsDodgeWindowOpen())
    {
        Outer.CrabPawn.HandleNotifyPlayerDodgeWindow(GetDodgeWindowType(), 1, EnemyForStrike);
        CmdStatus_ChargeAttackUsing.CloseDodgeWindow();
    }
    Outer.ClearTimer('ProcessDodgeWindowTimer', self);
    //return;    
}

final function StopProcessActiveDefenseWindowTimer()
{
    Outer.ClearTimer('ProcessActiveDefenseWindowTimer', self);
    //return;    
}

final function IsProcessDodgeWindowTimerActive()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.IsTimerActive('ProcessDodgeWindowTimer', self);
    //return ReturnValue;    
}

final function IsProcessActiveDefenseWindowTimerActive()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.IsTimerActive('ProcessActiveDefenseWindowTimer', self);
    //return ReturnValue;    
}

private final function ProcessDodgeWindowTimer()
{
    ProcessDodgeWindow();
    //return;    
}

private final function ProcessActiveDefenseWindowTimer()
{
    ProcessActiveDefenseWindow();
    //return;    
}

function ProcessDodgeWindow()
{
    //return;    
}

function ProcessActiveDefenseWindow()
{
    //return;    
}

function CleanUpEndOfStikeSpecialMove()
{
    //return;    
}

function StartChargingStrikeSucsussfulHit()
{
    //return;    
}

function HasTheHitPawnSucsufullyDodgedOrBlockedStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnRunInto[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function IHitMyTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitPawn[8388609];

    // End:0x43
    if(CurMoveToPositionCmd != none)
    {
        Outer.AbortCommand(CurMoveToPositionCmd);
        CurMoveToPositionCmd = none;
    }
    CleanUpEndOfStikeSpecialMove();
    bDonePlayingHit = false;
    StartChargingStrikeSucsussfulHit();
    //return;    
}

function StopHitOnCharge()
{
    // End:0x43
    if(CurMoveToPositionCmd != none)
    {
        Outer.AbortCommand(CurMoveToPositionCmd);
        CurMoveToPositionCmd = none;
    }
    CleanUpEndOfStikeSpecialMove();
    bDonePlayingHit = false;
    //return;    
}

function MoveCharingStrikeAbortCondition()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function MoveThroughEnemyForStrike()
{
    CurMoveToPositionCmd = Outer.CmdMoveToPosition(CmdStatus_ChargeAttackUsing.EndOfChargePointChosen,, -1.0000000, Outer.CmdStatus_MoveToPosition, 1, Outer.myAIPawn.TuneDataAIPawn.StopTypeForEndOfChargeStrike,, false);
    CurMoveToPositionCmd.__MoveAvoidanceDelegate__Delegate = DelegateMovingToChargePointAvoidance;
    CurMoveToPositionCmd.SetMovementZDiffAllowanceFactor(Outer.CrabPawn.TuneDataIceCrab.DefaultMovementZDiffAllowanceFactor.GetValue());
    CurMoveToPositionCmd.SetNotifyOfTouchWhileMovingDelegate(TouchWhileMoving);
    CurMoveToPositionCmd.SetNotifyOfBumpWhileMovingDelegate(BumpWhileMoving);
    CurMoveToPositionCmd.__MoveAbortDelegate__Delegate = MoveCharingStrikeAbortCondition;
    CurMoveToPositionCmd.bZeroVelocityOnFinish = true;
    CurMoveToPositionCmd.SetMovementMonitorParameters(true, Outer.CrabPawn.TuneDataIceCrab.DurationBetweenMovementDeltaDuringChargeRunIn_Tunable.GetValue(), Outer.CrabPawn.TuneDataIceCrab.MinMovementDeltaDuringChargeRunIn_Tunable.GetValue(), Outer.CrabPawn.TuneDataIceCrab.DelayAfterStartOfChargeRunIneforeMonitorStarts_Tunable.GetValue(), NotifyOfFailedMovementToChargePoint);
    //return;    
}

function NotifyOfFailedMovementToChargePoint()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x38
    if(CurMoveToPositionCmd != none)
    {
        Outer.AbortCommand(CurMoveToPositionCmd);
    }
    return true;
    //return ReturnValue;    
}

state StateCmdActive
{
    event PoppedState()
    {
        Outer.CrabPawn.SetMaxSpeedScale(Outer.CrabPawn.TuneDataIceCrab.GetNormalMaxSpeedScale(Outer.CrabPawn));
        CleanUpEndOfStikeSpecialMove();
        StopProcessDodgeWindowTimer();
        StopProcessActiveDefenseWindowTimer();
        super(SPStateObject).PoppedState();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.CrabPawn.SetMaxSpeedScale(Outer.CrabPawn.TuneDataIceCrab.GetNormalMaxSpeedScale(Outer.CrabPawn));
        CleanUpEndOfStikeSpecialMove();
        StopProcessDodgeWindowTimer();
        StopProcessActiveDefenseWindowTimer();
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    private final function ProcessDodgeWindowTimer()
    {
        ProcessDodgeWindow();
        //return;        
    }
Begin:

    StartChargingStrike();
    Outer.Focus = none;
    MoveThroughEnemyForStrike();
    Outer.Sleep(0.0100000);
    Outer.ZeroRotationRate();
    // End:0x11D
    if(CmdStatus_ChargeAttackUsing.WasTargetSuccessfullyStruck())
    {
        J0x92:

        // End:0xFA [Loop If]
        if(!bDonePlayingHit && Outer.myAIPawn.IsDoingASpecialMove())
        {
            Outer.Sleep(0.0100000);
            // [Loop Continue]
            goto J0x92;
        }
        Outer.PopCommand(self);        
    }
    else
    {
        // End:0x15F
        if(CmdStatus_ChargeAttackUsing.WasBlockingObjectStruck())
        {
            Outer.PopCommand(self);
        }
    }
    CleanUpEndOfStikeSpecialMove();
    Outer.Sleep(0.0100000);
    Outer.PopCommand(self);
    stop;        
}

defaultproperties
{
    PawnsChargedAndHit=(PawnsHit=none,MaxLifeTimeOfItemInList=-1.0000000,MaxLifeTimeOfVsInList=-1.0000000,MaxLifeTimeOfShutdownVsInList=-1.0000000)
    bInterruptible=false
}