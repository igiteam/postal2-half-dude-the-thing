class LPAICmd_VsLarocheSeperateAfterStrikes extends LPAICmd_VsLarocheStrikeBase within LPAIControllerVsLaroche;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeLastSpecialMoveStarted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxDurationOfSeperationOpportunity[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinSeperationToBeAwayAfterStrikes[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDoneWithBackwardsSeperation[536870913];

function Pushed()
{
    super.Pushed();
    TimeLastSpecialMoveStarted = -1.0000000;
    MaxDurationOfSeperationOpportunity = 10.0000000;
    MinSeperationToBeAwayAfterStrikes = 1000.0000000;
    bDoneWithBackwardsSeperation = false;
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.VsLarochePawn.SetMaxSpeedScale(Outer.VsLarochePawn.TuneDataAIPawn.GetNormalMaxSpeedScale(Outer.VsLarochePawn));
    //return;    
}

function SetMinSeperationToBeAwayAfterStrikes()
{
    local /*0x97E50000-0x00000000*/ private float MinSeperationNeeded[8388609];

    MinSeperationToBeAwayAfterStrikes = MinSeperationNeeded;
    //return;    
}

function SetMaxDurationOfSeperationOpportunity()
{
    local /*0x97E50000-0x00000000*/ private float InMaxDurationOfSeperationOpportunity[8388609];

    MaxDurationOfSeperationOpportunity = InMaxDurationOfSeperationOpportunity;
    //return;    
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

event NotifyOfCoreHit()
{
    local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function GetBackwardsSeperationSM()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_VsLarocheBackwardsSeperation';
    //return ReturnValue;    
}

function FinishBackwardsSeperationSpecialMove()
{
    Outer.VsLarochePawn.EndSpecialMove(GetBackwardsSeperationSM());
    //return;    
}

function On_LPSM_BackwardsSeperationSM_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    // End:0x2D
    if(!bDoneWithBackwardsSeperation && HasMinSeperationToBeAwayAfterStrikesBeenReached())
    {
        bDoneWithBackwardsSeperation = true;        
    }
    else
    {
        // End:0x8E
        if(!bDoneWithBackwardsSeperation)
        {
            Outer.VsLarochePawn.DoSpecialMove(GetBackwardsSeperationSM(), true, true, On_LPSM_BackwardsSeperationSM_Finished);
        }
    }
    //return;    
}

function StartBackwardsSeperationSM()
{
    TimeLastSpecialMoveStarted = Outer.WorldInfo.TimeSeconds;
    bDoneWithBackwardsSeperation = false;
    Outer.VsLarochePawn.DoSpecialMove(GetBackwardsSeperationSM(), true, true, On_LPSM_BackwardsSeperationSM_Finished);
    //return;    
}

function HasMinSeperationToBeAwayAfterStrikesBeenReached()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float sep2d;

    sep2d = Outer.Seperation2DTight(EnemyForStrike);
    // End:0x4B
    if(sep2d > MinSeperationToBeAwayAfterStrikes)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function IsBackwardsSeperationDone()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float durationOfAction;

    // End:0x0F
    if(bDoneWithBackwardsSeperation)
    {
        return true;
    }
    // End:0x34
    if(HasMinSeperationToBeAwayAfterStrikesBeenReached())
    {
        bDoneWithBackwardsSeperation = true;
        FinishBackwardsSeperationSpecialMove();
        return true;
    }
    durationOfAction = Outer.WorldInfo.TimeSeconds - TimeLastSpecialMoveStarted;
    // End:0xAB
    if(durationOfAction > MaxDurationOfSeperationOpportunity)
    {
        bDoneWithBackwardsSeperation = true;
        FinishBackwardsSeperationSpecialMove();
        return true;
    }
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

    StartBackwardsSeperationSM();
    J0x0A:

    // End:0x3D [Loop If]
    if(!IsBackwardsSeperationDone())
    {
        Outer.Sleep(SleepTimeInSecsDuringStrikeUpdate);
        // [Loop Continue]
        goto J0x0A;
    }
    Outer.PopCommand(self);
    stop;            
}

defaultproperties
{
    bInterruptible=false
}