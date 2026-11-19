class LPAICmd_StationaryLaunchEngagement extends LPAICmd_Attack within LPAIControllerDefenderHive
    abstract;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShouldLaunchAtNextOpertunity[536870913];

event NotifyAIResourceChanged()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResAccess[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return super.NotifyAIResourceChanged(ResAccess);
    //return ReturnValue;    
}

function Pushed()
{
    super.Pushed();
    bShouldLaunchAtNextOpertunity = false;
    //return;    
}

function Popped()
{
    super.Popped();
    StopPocessLookForFixPlaceLaunchOpportunityTimer();
    OnExit();
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

event SPAborted()
{
    super.SPAborted();
    OnExit();
    //return;    
}

function OnExit()
{
    Outer.PawnZeroVelocity();
    //return;    
}

event NotifyAIResourceAccessLost()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResourceAccess[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function SetDesiredEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];

    super.SetDesiredEnemy(InEnemy);
    //return;    
}

function FixedPlacementAttackEnemy()
{
    StopPocessLookForFixPlaceLaunchOpportunityTimer();
    //return;    
}

function CanStillLaunchFromFixedPlacement()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function HandleFailureToStartLaunch()
{
    //return;    
}

function ShouldTryToLaunch()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function ProcessLookForFixPlaceLaunchOpportunity()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bshoudldLaunchImmediately;

    bshoudldLaunchImmediately = ShouldTryToLaunch();
    // End:0x2E
    if(bshoudldLaunchImmediately)
    {
        bShouldLaunchAtNextOpertunity = true;
    }
    return bshoudldLaunchImmediately;
    //return ReturnValue;    
}

function IsMyEnemyInRange()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.CheckValidRangeToEnemy();
    //return ReturnValue;    
}

event GotoStateWithEnemyCheck()
{
    local /*0x97E50000-0x00000000*/ private name StateName[8388609];

    // End:0x26
    if(IsMyEnemyAlive())
    {
        GotoState(StateName, 'Begin');        
    }
    else
    {
        Outer.PopCommand(self);
    }
    //return;    
}

function PerformReactionToVsBump()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheVs[8388609];

    //return;    
}

function ShouldFaceEnemyWhileMovingToSlot()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

final function StartPocessLookForFixPlaceLaunchOpportunityTimer()
{
    local /*0x97E50000-0x00000000*/ private bool isTimerAlreadyRunning;

    isTimerAlreadyRunning = IsPocessLookForFixPlaceLaunchOpportunityTimerActive();
    // End:0xCE
    if(!Outer.bDisableAI && !isTimerAlreadyRunning)
    {
        Outer.SetTimer(Outer.DefenderHivePawn.TuneDataDefenderHive.UpdateRateForLoiterPocessLookForAttackOpportunityTimer.GetValue(), true, 'PocessLookForFixPlaceLaunchOpportunityTimer', self);        
    }
    //return;    
}

final function StopPocessLookForFixPlaceLaunchOpportunityTimer()
{
    Outer.ClearTimer('PocessLookForFixPlaceLaunchOpportunityTimer', self);
    //return;    
}

function PausePocessLookForFixPlaceLaunchOpportunityTimer()
{
    local /*0x97E50000-0x00000000*/ private bool bPause[8388609];

    // End:0x1A
    if(bPause)
    {
        StopPocessLookForFixPlaceLaunchOpportunityTimer();        
    }
    else
    {
        StartPocessLookForFixPlaceLaunchOpportunityTimer();
    }
    //return;    
}

final function IsPocessLookForFixPlaceLaunchOpportunityTimerActive()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.IsTimerActive('PocessLookForFixPlaceLaunchOpportunityTimer', self);
    //return ReturnValue;    
}

private final function PocessLookForFixPlaceLaunchOpportunityTimer()
{
    ProcessLookForFixPlaceLaunchOpportunity();
    //return;    
}

function HasAccessToStartAttackFromFixedPlacement()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function GetStrikeAccessIfRequiredBeforeAttack()
{
    GetStrikeAccess(EnemyForAttack);
    //return;    
}

function StartLaunchBehavior()
{
    //return;    
}

state StateCmdActive
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousState[8388609];

        super.BeginState(PreviousState);
        //return;        
    }
    J0x00:
    // End:0x23 [Loop If]
    if(IsMyEnemyAlive())
    {
        GotoStateWithEnemyCheck('WaitForLaunch');
        // [Loop Continue]
        goto J0x00;
    }
    Outer.PopCommand(self);
    stop;                    
}

state WaitForLaunch
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

    function ShouldWaitWhileLookingForLaunchOpportunity()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return !bShouldLaunchAtNextOpertunity;
        //return ReturnValue;        
    }

    function GotoFixedPlacementLaunchState()
    {
        GotoStateWithEnemyCheck('StartLaunchFromFixedPlacement');
        //return;        
    }
Begin:

    StartPocessLookForFixPlaceLaunchOpportunityTimer();
    J0x0A:

    // End:0x37 [Loop If]
    if(ShouldWaitWhileLookingForLaunchOpportunity())
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x0A;
    }
    GotoFixedPlacementLaunchState();
    J0x41:

    // End:0x65 [Loop If]
    if(true)
    {
        Outer.Sleep(1.0000000);
        // [Loop Continue]
        goto J0x41;
    }
    stop;            
}

state StartLaunchFromFixedPlacement
{Begin:

    StartLaunchBehavior();
    Outer.Sleep(0.1000000);
    bShouldLaunchAtNextOpertunity = false;
    GotoStateWithEnemyCheck('WaitForLaunch');
    stop;        
}
