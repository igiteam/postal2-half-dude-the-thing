class LPAICmd_SpitterHobble extends LPAICommand within LPAIControllerSpitter;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHobbleInFinished[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHobbleHoldFinished[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHobbleOutFinished[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StunTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class LPSMClassHobbleIn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class LPSMClassHobbleHold;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class LPSMClassHobbleOut;

function Pushed()
{
    super.Pushed();
    bHobbleInFinished = false;
    bHobbleHoldFinished = false;
    bHobbleOutFinished = false;
    //return;    
}

function Popped()
{
    SetInterruptible(true, true);
    Outer.SpitterPawn.EndSpecialMove(LPSMClassHobbleIn);
    Outer.SpitterPawn.EndSpecialMove(LPSMClassHobbleHold);
    Outer.SpitterPawn.EndSpecialMove(LPSMClassHobbleOut);
    Outer.ClearTimer('StunTimer', self);
    //return;    
}

function OnHobbleInFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bHobbleInFinished = true;
    //return;    
}

function OnHobbleHoldFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    StartHobbleHold();
    //return;    
}

function OnHobbleOutFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bHobbleOutFinished = true;
    //return;    
}

function StartHobbleIn()
{
    // End:0x6F
    if(LPSMClassHobbleIn != none)
    {
        bHobbleInFinished = false;
        Outer.SpitterPawn.DoSpecialMove(LPSMClassHobbleIn, true, false, OnHobbleInFinished);        
    }
    else
    {
        bHobbleInFinished = true;
    }
    //return;    
}

function StartHobbleHold()
{
    // End:0x6F
    if(LPSMClassHobbleHold != none)
    {
        bHobbleHoldFinished = false;
        Outer.SpitterPawn.DoSpecialMove(LPSMClassHobbleHold, true, false, OnHobbleHoldFinished);        
    }
    else
    {
        bHobbleHoldFinished = true;
    }
    //return;    
}

function StartHobbleOut()
{
    // End:0x6F
    if(LPSMClassHobbleOut != none)
    {
        bHobbleOutFinished = false;
        Outer.SpitterPawn.DoSpecialMove(LPSMClassHobbleOut, true, false, OnHobbleOutFinished);        
    }
    else
    {
        bHobbleOutFinished = true;
    }
    //return;    
}

function StunTimer()
{
    bHobbleHoldFinished = true;
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

    Outer.EnableRotation(true);
    StartHobbleIn();
    J0x2A:

    // End:0x59 [Loop If]
    if(!bHobbleInFinished)
    {
        Outer.Sleep(0.0001000);
        // [Loop Continue]
        goto J0x2A;
    }
    StartHobbleHold();
    Outer.SetTimer(StunTime, false, 'StunTimer', self);
    J0x8F:

    // End:0xBE [Loop If]
    if(!bHobbleHoldFinished)
    {
        Outer.Sleep(0.0001000);
        // [Loop Continue]
        goto J0x8F;
    }
    StartHobbleOut();
    J0xC8:

    // End:0xF7 [Loop If]
    if(!bHobbleOutFinished)
    {
        Outer.Sleep(0.0001000);
        // [Loop Continue]
        goto J0xC8;
    }
    Outer.PopCommand(self);
    stop;                    
}

defaultproperties
{
    bInterruptible=false
}