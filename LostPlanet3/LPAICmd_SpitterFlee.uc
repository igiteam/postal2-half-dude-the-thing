class LPAICmd_SpitterFlee extends LPAICmd_Flee within LPAIControllerSpitter;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ActorToFocus;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAllowInterruptionOfFlee;

function Pushed()
{
    super.Pushed();
    Outer.SpitterPawn.DisableTailIKImmediate();
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.myAIPawn.SetMaxSpeedScale(Outer.SpitterPawn.TuneDataSpitter.GetNormalMaxSpeedScale(Outer.myAIPawn));
    Outer.EnableRotation(false);
    Outer.ResetRotationRate();
    //return;    
}

function Paused()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewCommand[8388609];

    super.Paused(NewCommand);
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    AICMDFleeParams.bStopWhenHidden = true;
    AICMDFleeParams.computeDestinationInterval = 1.0000000;
    Outer.Focus = ActorToFocus;
    Outer.myAIPawn.bDontStopDesiredSpeedOnSpeedUpdate = true;
    //return;    
}

function PreFleeSetup()
{
    super.PreFleeSetup();
    AICMDFleeParams.bStopWhenHidden = true;
    AICMDFleeParams.computeDestinationInterval = 1.0000000;
    Outer.SpitterPawn.DoSpecialMove(none);
    Outer.Focus = ActorToFocus;
    Outer.myAIPawn.bDontStopDesiredSpeedOnSpeedUpdate = true;
    Outer.EnableRotation(true);
    SetInterruptible(bAllowInterruptionOfFlee);
    //return;    
}

event LPCommandTick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    // End:0x2D
    if(AtSafeDistance())
    {
        Outer.PopCommand(self);
    }
    // End:0xCD
    if(ActorToFocus != none)
    {
        Outer.myAIPawn.SetDesiredRotation(Rotator(ActorToFocus.Location - Outer.myAIPawn.Location), true, true, -1.0000000, false);
    }
    //return;    
}

function AtSafeDistance()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private bool bSafe;
    local /*0x97E50000-0x00000000*/ private float CurSeperation;

    bSafe = true;
    I = 0;
    J0x17:

    // End:0xD8 [Loop If]
    if(I < AICMDFleeParams.FleeDangerousBots.Length)
    {
        CurSeperation = Outer.Seperation2D(AICMDFleeParams.FleeDangerousBots[I]);
        // End:0xCA
        if(CurSeperation < AICMDFleeParams.DangerRadius)
        {
            bSafe = false;
            // [Explicit Break]
            goto J0xD8;
        }
        ++I;
        // [Loop Continue]
        goto J0x17;
    }
    J0xD8:

    return bSafe;
    //return ReturnValue;    
}
