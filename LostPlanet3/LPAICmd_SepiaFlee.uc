class LPAICmd_SepiaFlee extends LPAICmd_Flee within LPAIControllerSepia;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ScaredGlowIndicatorValue[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastScaredGlowUpdateTime[536870913];

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    StopProcessScaredGlowIndicatorTimer();
    super.Popped();
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
    //return;    
}

function PreFleeSetup()
{
    super.PreFleeSetup();
    // End:0x60
    if(Outer.SepiaPawn.TuneDataSepia.bAllowUseFleeScaredGlowPulse)
    {
        StartProcessScaredGlowIndicatorTimer();
    }
    //return;    
}

final function StartProcessScaredGlowIndicatorTimer()
{
    // End:0x5D
    if(!Outer.bDisableAI && !IsProcessScaredGlowIndicatorTimerActive())
    {
        Outer.SetTimer(0.0100000, true, 'ProcessScaredGlowIndicatorTimer', self);
    }
    //return;    
}

final function StopProcessScaredGlowIndicatorTimer()
{
    Outer.ClearTimer('ProcessScaredGlowIndicatorTimer', self);
    //return;    
}

function PauseProcessScaredGlowIndicatorTimer()
{
    local /*0x97E50000-0x00000000*/ private bool bPause[8388609];

    // End:0x1A
    if(bPause)
    {
        StopProcessScaredGlowIndicatorTimer();        
    }
    else
    {
        StartProcessScaredGlowIndicatorTimer();
    }
    //return;    
}

final function IsProcessScaredGlowIndicatorTimerActive()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.IsTimerActive('ProcessScaredGlowIndicatorTimer', self);
    //return ReturnValue;    
}

private final function ProcessScaredGlowIndicatorTimer()
{
    ProcessScaredGlowIndicator();
    //return;    
}

function ProcessScaredGlowIndicator()
{
    local /*0x97E50000-0x00000000*/ private float NewValue, timeSinceLastUpdate;

    // End:0x340
    if(Outer.SepiaPawn != none)
    {
        NewValue = Sin(Outer.SepiaPawn.TuneDataSepia.FleeScaredGlowPulseFrequency * ScaredGlowIndicatorValue) * Outer.SepiaPawn.TuneDataSepia.FleeScaredGlowPulseReductionFactor;
        // End:0x178
        if(NewValue > Outer.SepiaPawn.TuneDataSepia.FleeScaredGlowPulseMaxOutput)
        {
            NewValue = Outer.SepiaPawn.TuneDataSepia.FleeScaredGlowPulseMaxOutput;            
        }
        else
        {
            // End:0x220
            if(NewValue < Outer.SepiaPawn.TuneDataSepia.FleeScaredGlowPulseMinOutput)
            {
                NewValue = Outer.SepiaPawn.TuneDataSepia.FleeScaredGlowPulseMinOutput;
            }
        }
        Outer.SepiaPawn.HeadGlowFactor = NewValue;
        timeSinceLastUpdate = Outer.WorldInfo.TimeSeconds - LastScaredGlowUpdateTime;
        ScaredGlowIndicatorValue += (Outer.SepiaPawn.TuneDataSepia.FleeScaredGlowPulseRate * timeSinceLastUpdate);
        LastScaredGlowUpdateTime = Outer.WorldInfo.TimeSeconds;
    }
    //return;    
}

defaultproperties
{
    Duration=20.0000000
}