class LPAICmd_VsLarocheGrabStrikeBase extends LPAICmd_VsLarocheStrikeBase within LPAIControllerVsLaroche;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeGrabStarted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeGrabShouldEnd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bGrabFinished[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bGotBloackedParriedCounterOrSomethingLikeThat[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ForThisGrabStrikeForkArmGrabRange2D[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ForThisGrabStrikeForkArmGrabRangeZ[536870913];

function Pushed()
{
    super.Pushed();
    Outer.bMeleeFinished = false;
    bGrabFinished = false;
    bGotBloackedParriedCounterOrSomethingLikeThat = false;
    Outer.bDidLastStrikeOfLastComboLand = false;
    Outer.GetForkArmGrabRange(ForThisGrabStrikeForkArmGrabRange2D, ForThisGrabStrikeForkArmGrabRangeZ);
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.MeleeFinished();
    //return;    
}

function NotifyPreActiveDefenseSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL CombatWindow[25296897], Activator;

    bGotBloackedParriedCounterOrSomethingLikeThat = true;
    //return;    
}

function StartGrabStrikeSM()
{
    Outer.VsLarochePawn.LastTimeAttemptedToGrabOtherPawn = Outer.WorldInfo.TimeSeconds;
    Outer.VsLarochePawn.DoSpecialMove(Class'LPSM_VSLarocheForkArmGrab_Start', true, false, OnGrabStrikeEnd, EnemyForStrike);
    //return;    
}

function OnGrabStrikeEnd()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    // End:0x29
    if((DidGrabSucceed()) && ShouldGoToStruggleModeRightAfterSuccessfulGrab())
    {
        StartPostGrabStruggleMode();        
    }
    else
    {
        // End:0x45
        if(!bGotBloackedParriedCounterOrSomethingLikeThat)
        {
            StartPostGrabMiss();            
        }
        else
        {
            bGrabFinished = true;
        }
    }
    //return;    
}

function OnGrabStrikeMissEnd()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bGrabFinished = true;
    //return;    
}

function StartPostGrabMiss()
{
    Outer.VsLarochePawn.DoSpecialMove(Class'LPSM_VSLarocheForkArmGrab_Fail', true, false, OnGrabStrikeMissEnd, EnemyForStrike);
    //return;    
}

function GetMaxGrabTimeAginstThisTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL TargetOfSawing[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.VsLarochePawn.TuneDataVsLaroche.MaxTimeForBaseGrabbing.GetValue();
    //return ReturnValue;    
}

function DidGrabSucceed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float range2Enemy2D, zDiff2Enemy2D;

    // End:0x0F
    if(bGotBloackedParriedCounterOrSomethingLikeThat)
    {
        return false;
    }
    range2Enemy2D = EnemyRange2D();
    // End:0x6D
    if(range2Enemy2D <= ForThisGrabStrikeForkArmGrabRange2D)
    {
        zDiff2Enemy2D = EnemyZDiff();
        // End:0x6A
        if(zDiff2Enemy2D <= ForThisGrabStrikeForkArmGrabRangeZ)
        {
            return true;            
        }        
    }
    return false;
    //return ReturnValue;    
}

function ShouldGoToStruggleModeRightAfterSuccessfulGrab()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function StartPostGrabStruggleMode()
{
    Outer.VsLarochePawn.LastTimeSuccessfullyGrabOtherPawn = Outer.WorldInfo.TimeSeconds;
    //return;    
}

function IsGrabDone()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x52
    if(bGrabFinished || TimeGrabShouldEnd <= Outer.WorldInfo.TimeSeconds)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

simulated function IsLeftArmGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function IsLeftShoulderGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function IsRightShoulderGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function IsRightBicepGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function IsCockpitCrossBarForShieldGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function IsCockpitCrossBarGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function IsRightInnerShoulderGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

state StateCmdActive
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        //return;        
    }

    event PushedState()
    {
        super.PushedState();
        //return;        
    }

    event PausedState()
    {
        super.PausedState();
        //return;        
    }

    function ContinuedState()
    {
        super.ContinuedState();
        //return;        
    }

    event PoppedState()
    {
        super.PoppedState();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super.EndState(NextStateName);
        //return;        
    }
Begin:

    TimeGrabStarted = Outer.WorldInfo.TimeSeconds;
    TimeGrabShouldEnd = TimeGrabStarted + (GetMaxGrabTimeAginstThisTarget(EnemyForStrike));
    StartGrabStrikeSM();
    J0x6F:

    // End:0x9E [Loop If]
    if(!IsGrabDone())
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x6F;
    }
    Outer.PopCommand(self);
    stop;        
}
