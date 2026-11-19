class LPAICmd_Pause extends LPAICommand within LPAIController;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PauseDuration[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StartPauseTime[536870913];

function SetPauseDuration()
{
    local /*0x97E50000-0x00000000*/ private float InDuration[8388609];

    PauseDuration = InDuration;
    //return;    
}

function Pushed()
{
    super.Pushed();
    Outer.Focus = none;
    PauseDuration = 1.0000000;
    Outer.PawnZeroVelocity();
    //return;    
}

function Popped()
{
    super.Popped();
    //return;    
}

state StateCmdActive
{Begin:

    Outer.Focus = none;
    StartPauseTime = Outer.WorldInfo.TimeSeconds;
    J0x5D:

    // End:0xDC [Loop If]
    if((PauseDuration < float(0)) || Outer.WorldInfo.TimeSeconds <= (StartPauseTime + PauseDuration))
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x5D;
    }
    Outer.PopCommand(self);
    stop;                
}

defaultproperties
{
    bInterruptible=false
}