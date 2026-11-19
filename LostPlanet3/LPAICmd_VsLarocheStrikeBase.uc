class LPAICmd_VsLarocheStrikeBase extends LPAICmd_Strike within LPAIControllerVsLaroche;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMeleeStrikeFinished[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMeleeHitEnemy[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bNeedsToMoveCloserToFinishStriking[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SleepTimeInSecsDuringStrikeUpdate[536870913];

function Pushed()
{
    super.Pushed();
    Outer.bMeleeFinished = false;
    bMeleeStrikeFinished = false;
    bMeleeHitEnemy = false;
    bNeedsToMoveCloserToFinishStriking = false;
    //return;    
}

function Popped()
{
    super.Popped();
    //return;    
}

simulated event NotifyStopPawnChoreography()
{
    Outer.Focus = none;
    //return;    
}

event MeleeHitSomethingNew()
{
    local /*0x97E50000-0x00000000*/ private @NULL Info[25296897];

    // End:0x123
    if((!bMeleeHitEnemy && EnemyForStrike != none) && LPPawn(Info.Impact.HitActor) != none)
    {
        // End:0x123
        if((Info.Impact.HitActor == EnemyForStrike) && Outer.VsLarochePawn != none)
        {
            Outer.VsLarochePawn.StopPawnChoreography();
            bMeleeHitEnemy = true;
            ++Outer.NumOfMeleeHitsLandedOnEnemySinceLastStruggleMode;
        }
    }
    //return;    
}

function ShouldKeepStackForSpecialMoveAICommand()
{
    local /*0x97E50000-0x00000000*/ private class CommandClass[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL NextSpecialMove[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return LPSM_ActiveDefenseFollower(NextSpecialMove) != none;
    //return ReturnValue;    
}

function On_VsLarocheStrikeSm_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bMeleeStrikeFinished = true;
    //return;    
}

function GetSmForStrike()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_VsLarocheRightJabVs';
    //return ReturnValue;    
}

function CanActiveDefense()
{
    local /*0x97E50000-0x00000000*/ private @NULL InVsPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function StartMeleeStrikeSM()
{
    bMeleeStrikeFinished = false;
    Outer.VsLarochePawn.DoSpecialMove(GetSmForStrike(), true, false, On_VsLarocheStrikeSm_Finished, EnemyForStrike);
    //return;    
}

simulated function IsLeftArmGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

simulated function IsLeftShoulderGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

simulated function IsRightShoulderGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

simulated function IsRightBicepGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

simulated function IsCockpitCrossBarForShieldGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

simulated function IsCockpitCrossBarGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

simulated function IsRightInnerShoulderGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
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
        super(SPStateObject).PushedState();
        //return;        
    }

    event PausedState()
    {
        super(SPStateObject).PausedState();
        //return;        
    }

    function ContinuedState()
    {
        super(SPStateObject).ContinuedState();
        //return;        
    }

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
Begin:

    StartMeleeStrikeSM();
    J0x0A:

    // End:0x3D [Loop If]
    if(!bMeleeStrikeFinished)
    {
        Outer.Sleep(SleepTimeInSecsDuringStrikeUpdate);
        // [Loop Continue]
        goto J0x0A;
    }
    Outer.MeleeFinished();
    Outer.PopCommand(self);
    stop;                
}

defaultproperties
{
    SleepTimeInSecsDuringStrikeUpdate=0.0100000
}