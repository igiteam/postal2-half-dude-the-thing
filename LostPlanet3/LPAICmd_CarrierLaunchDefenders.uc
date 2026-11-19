class LPAICmd_CarrierLaunchDefenders extends LPAICmd_Strike within LPAIControllerCarrier;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDoneLaunching[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeLastSpecialMoveStarted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumToTryAndSpawnThisEvolution[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumToLaunchThisEvolution[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumAtteptedToSpawnSoFarThisEvolution[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumLaunchedSoFarThisEvolution[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CellIdxOfCurrentCellForLaunchingThisEvolution[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurTurnToFaceCmd[536870913];

function Pushed()
{
    super.Pushed();
    bDoneLaunching = false;
    CurTurnToFaceCmd = none;
    Outer.CurrentLaunchDefendersState = 0;
    NumToTryAndSpawnThisEvolution = 0;
    NumToLaunchThisEvolution = 0;
    NumLaunchedSoFarThisEvolution = 0;
    CellIdxOfCurrentCellForLaunchingThisEvolution = 0;
    NumAtteptedToSpawnSoFarThisEvolution = 0;
    TimeLastSpecialMoveStarted = -1.0000000;
    Outer.CarrierPawn.EnableWinchPoints(true);
    //return;    
}

function Popped()
{
    // End:0x80
    if(Outer.CarrierPawn.IntendedDefendersWaitingToLaunch.Length != 0)
    {
        // End:0x80
        if(Outer.CarrierPawn.Health > 0)
        {
            PerformEmergancyDefendersLaunch();            
        }
    }
    // End:0x8F
    if(CurTurnToFaceCmd != none)
    {
    }
    Outer.CarrierPawn.TurnOffRoarAudioComponent();
    Outer.CarrierPawn.EnableWinchPoints(false);
    super.Popped();
    Outer.ResetRotationRate();
    //return;    
}

event SPAborted()
{
    Outer.CarrierPawn.TurnOffRoarAudioComponent();
    Outer.CarrierPawn.EnableWinchPoints(false);
    super.SPAborted();
    Outer.ResetRotationRate();
    //return;    
}

function On_RaiseInToLaunchPosition_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    Outer.CurrentLaunchDefendersState = 4;
    //return;    
}

function On_LowerOutOfLaunchPosition_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    Outer.CurrentLaunchDefendersState = 7;
    //return;    
}

function OnAttackOutOfLaunch_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    Outer.CurrentLaunchDefendersState = 9;
    //return;    
}

function FinishLoopingLaunchSpecialMove()
{
    Outer.CarrierPawn.EndSpecialMove(Class'LPSM_CarrierLaunchDefendersLoop');
    Outer.CurrentLaunchDefendersState = 7;
    //return;    
}

function StartRaiseInToLaunchPosition()
{
    TimeLastSpecialMoveStarted = Outer.WorldInfo.TimeSeconds;
    Outer.CarrierPawn.DoSpecialMove(Class'LPSM_CarrierLaunchDefenderRaiseInToPosition', true, true, On_RaiseInToLaunchPosition_Finished);
    //return;    
}

function StartLoopingLaunchSM()
{
    TimeLastSpecialMoveStarted = Outer.WorldInfo.TimeSeconds;
    Outer.CarrierPawn.DoSpecialMove(Class'LPSM_CarrierLaunchDefendersLoop', true, true);
    //return;    
}

function StartLoweringOutOfLaunchPos()
{
    TimeLastSpecialMoveStarted = Outer.WorldInfo.TimeSeconds;
    Outer.bPerformededIntialLaunchOnPrimaryTargetDetection = true;
    Outer.Focus = Outer.MyLPEnemy;
    Outer.CarrierPawn.DoSpecialMove(Class'LPSM_CarrierLaunchDefendersLowerOutOfPosition', true, true, On_LowerOutOfLaunchPosition_Finished);
    //return;    
}

function HandleStartOfCommandFocusSetting()
{
    Outer.Focus = Outer.MyLPEnemy;
    //return;    
}

function HandleStartOfSpawningDefendersFocusSetting()
{
    Outer.Focus = Outer.MyLPEnemy;
    //return;    
}

function IsDoneWithThisLaunchState()
{
    local /*0x97E50000-0x00000000*/ private byte StateToTest[8388609];
    local /*0x97E50000-0x00000000*/ private float MaxDurationOfState[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float durationOfAction;

    // End:0x32
    if(int(Outer.CurrentLaunchDefendersState) != int(StateToTest))
    {
        return true;
    }
    durationOfAction = Outer.WorldInfo.TimeSeconds - TimeLastSpecialMoveStarted;
    // End:0x93
    if(durationOfAction > MaxDurationOfState)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function SpawnDefender()
{
    local /*0x97E50000-0x00000000*/ private int cellForThisDefender;

    cellForThisDefender = Outer.CarrierPawn.FindNextProtectedCellWithoutSpawnedDefenderInItFromThisIndex(NumAtteptedToSpawnSoFarThisEvolution, false);
    Outer.SpawnDefenderAtCell(true, cellForThisDefender);
    ++NumAtteptedToSpawnSoFarThisEvolution;
    //return;    
}

function NotifyAnimReadyToLaunchDefenders()
{
    NumToLaunchThisEvolution = Outer.CarrierPawn.IntendedDefendersWaitingToLaunch.Length;
    J0x3E:

    // End:0x62 [Loop If]
    if(NumLaunchedSoFarThisEvolution < NumToLaunchThisEvolution)
    {
        LaunchDefender();
        // [Loop Continue]
        goto J0x3E;
    }
    Outer.CarrierPawn.IntendedDefendersWaitingToLaunch.Length = 0;
    Outer.NotifyOfDoneLaunchingDefendersForThisEvolution();
    //return;    
}

function PerformEmergancyDefendersLaunch()
{
    NumToLaunchThisEvolution = Outer.CarrierPawn.IntendedDefendersWaitingToLaunch.Length;
    J0x3E:

    // End:0x62 [Loop If]
    if(NumLaunchedSoFarThisEvolution < NumToLaunchThisEvolution)
    {
        LaunchDefender();
        // [Loop Continue]
        goto J0x3E;
    }
    Outer.CarrierPawn.IntendedDefendersWaitingToLaunch.Length = 0;
    Outer.NotifyOfDoneLaunchingDefendersForThisEvolution();
    //return;    
}

function LaunchDefender()
{
    CellIdxOfCurrentCellForLaunchingThisEvolution = Outer.CarrierPawn.IntendedDefendersWaitingToLaunch[NumLaunchedSoFarThisEvolution].CellIdLaunchedFrom;
    // End:0xE2
    if(CellIdxOfCurrentCellForLaunchingThisEvolution >= 0)
    {
        Outer.LaunchDefenderFromCell(true, NumLaunchedSoFarThisEvolution, CellIdxOfCurrentCellForLaunchingThisEvolution, Outer.MinDelayBeforeProtectingCellsAfterNormalDefenderLaunch, Outer.MaxDelayBeforeProtectingCellsAfterNormalDefenderLaunch, EnemyForStrike);
    }
    ++NumLaunchedSoFarThisEvolution;
    //return;    
}

state StateCmdActive
{
    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function AreFacingTarget()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL displacementToEnemy, rotToEnemy;

        displacementToEnemy = Outer.MyLPEnemy.Location - Outer.CarrierPawn.Location;
        rotToEnemy = Rotator(displacementToEnemy);
        rotToEnemy = rotToEnemy - Outer.CarrierPawn.Rotation;
        rotToEnemy.Yaw = rotToEnemy.Yaw & 65535;
        // End:0x159
        if(rotToEnemy.Yaw >= 32768)
        {
            rotToEnemy.Yaw -= 65536;
        }
        // End:0x187
        if(Abs(float(rotToEnemy.Yaw)) < float(300))
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }
Begin:

    Outer.CarrierPawn.PutMainCoreInInvulnerablePosition();
    HandleStartOfCommandFocusSetting();
    // End:0x86
    if(!AreFacingTarget())
    {
        CurTurnToFaceCmd = Outer.CmdTurnToFaceFocus(0);
        CurTurnToFaceCmd = none;
    }
    Outer.Sleep(0.0100000);
    Outer.ZeroRotationRate();
    NumToTryAndSpawnThisEvolution = Outer.CarrierPawn.ClaimAllNonDestroyedAndNonClaimedCellsForIntendedLaunch(Outer.GetMinDelayBeforeUnclaimingCellsAfterNormalDefenderLaunch(), Outer.GetMaxDelayBeforeUnclaimingCellsAfterNormalDefenderLaunch());
RisingIntoLaunchPos:


    Outer.CurrentLaunchDefendersState = 2;
    HandleStartOfSpawningDefendersFocusSetting();
    StartRaiseInToLaunchPosition();
    J0x173:

    // End:0x1CA [Loop If]
    if(!IsDoneWithThisLaunchState(2, 2.0000000))
    {
        // End:0x1AA
        if(NumAtteptedToSpawnSoFarThisEvolution < NumToTryAndSpawnThisEvolution)
        {
            SpawnDefender();
        }
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x173;
    }
    goto 'LoopingLaunch';
LoopingLaunch:


    StartLoopingLaunchSM();
    J0x1DE:

    // End:0x21F [Loop If]
    if(NumAtteptedToSpawnSoFarThisEvolution < NumToTryAndSpawnThisEvolution)
    {
        SpawnDefender();
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x1DE;
    }
    J0x21F:

    // End:0x2AE [Loop If]
    if(!IsDoneWithThisLaunchState(4, Outer.CarrierPawn.TuneDataCarrier.HowLongToLoopMiddlePartOfLaunchDefendersBehavior.GetValue()))
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x21F;
    }
    Outer.CarrierPawn.EnableWinchPoints(false);
    FinishLoopingLaunchSpecialMove();
    goto 'LoweringOutOfLaunchPos';
LoweringOutOfLaunchPos:


    Outer.CurrentLaunchDefendersState = 6;
    StartLoweringOutOfLaunchPos();
    J0x322:

    // End:0x358 [Loop If]
    if(!IsDoneWithThisLaunchState(6, 2.0000000))
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x322;
    }
    goto 'EndCommand';
EndCommand:


    Outer.PopCommand(self);
    stop;        
}

defaultproperties
{
    bInterruptible=false
}