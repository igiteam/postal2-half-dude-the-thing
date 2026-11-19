class LPAICmd_VsLarocheStrightSawingStrike extends LPAICmd_VsLarocheStrikeBase within LPAIControllerVsLaroche;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeSawingStarted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeSawingShouldEnd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeSawingCutIntoSomething[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDonePutingArmOutToStartSawing[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDoneBringingArmInToEndSawing[536870913];

function Pushed()
{
    super.Pushed();
    Outer.bMeleeFinished = false;
    TimeSawingCutIntoSomething = -1.0000000;
    bDonePutingArmOutToStartSawing = false;
    bDoneBringingArmInToEndSawing = false;
    Outer.VsLarochePawn.StartSawRunning();
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.MeleeFinished();
    Outer.VsLarochePawn.StopSawRunning();
    //return;    
}

function StartStrightArmSawying()
{
    Outer.VsLarochePawn.DoSpecialMove(Class'LPSM_VsLarocheSawArmSawingStart', true, false, On_StartStrightArmSawying_Finished, EnemyForStrike);
    //return;    
}

function On_StartStrightArmSawying_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    StartHoldingOutArmForStrightArmSawying();
    bDonePutingArmOutToStartSawing = true;
    bDoneBringingArmInToEndSawing = false;
    //return;    
}

function StartHoldingOutArmForStrightArmSawying()
{
    Outer.VsLarochePawn.DoSpecialMove(Class'LPSM_VsLarocheSawArmSawing', true, false, None, EnemyForStrike);
    //return;    
}

function StopStrightArmSawying()
{
    Outer.VsLarochePawn.EndSpecialMove(Class'LPSM_VsLarocheSawArmSawing');
    bDoneBringingArmInToEndSawing = false;
    Outer.VsLarochePawn.DoSpecialMove(Class'LPSM_VsLarocheSawArmSawingEnd', true, false, On_EndStrightArmSawying_Finished, EnemyForStrike);
    //return;    
}

function On_EndStrightArmSawying_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bDoneBringingArmInToEndSawing = true;
    //return;    
}

function GetMaxSawTimeAginstThisTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL TargetOfSawing[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.VsLarochePawn.TuneDataVsLaroche.MaxStrightSawingTimePerStrikePof.GetValue();
    //return ReturnValue;    
}

function IsPutingSawArmOutDone()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bDonePutingArmOutToStartSawing;
    //return ReturnValue;    
}

function IsSawingDone()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x43
    if(TimeSawingShouldEnd <= Outer.WorldInfo.TimeSeconds)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function IsBringingSawArmInDone()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bDoneBringingArmInToEndSawing;
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

    TimeSawingStarted = Outer.WorldInfo.TimeSeconds;
    TimeSawingShouldEnd = TimeSawingStarted + (GetMaxSawTimeAginstThisTarget(EnemyForStrike));
    StartStrightArmSawying();
    J0x6F:

    // End:0x9E [Loop If]
    if(!IsPutingSawArmOutDone())
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x6F;
    }
    J0x9E:

    // End:0xCD [Loop If]
    if(!IsSawingDone())
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x9E;
    }
    StopStrightArmSawying();
    J0xD7:

    // End:0x106 [Loop If]
    if(!IsBringingSawArmInDone())
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0xD7;
    }
    Outer.PopCommand(self);
    stop;        
}
