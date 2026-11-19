class ForceFeedbackManager extends Object within PlayerController
    abstract
    transient
    config(Engine);

var(*) /*0x35EA0000-0x00000000*/ private bool bAllowsForceFeedback;
var(*) /*0x35EA0000-0x00000000*/ private input bool bPreventAllForceFeedbackForDebugging[1073872897];
var(*) /*0x35EA0000-0x00000000*/ private bool bIsPaused;
var(*) /*0x35EA0000-0x00000000*/ private @NULL FFWaveform;
var(*) /*0x35EA0000-0x00000000*/ private int CurrentSample;
var(*) /*0x35EA0000-0x00000000*/ private float ElapsedTime;
var(*) /*0x35EA0000-0x00000000*/ private float ScaleAllWaveformsBy;
var(*) /*0x35EA0000-0x00000000*/ private @NULL WaveformInstigator;

simulated function PlayForceFeedbackWaveform()
{
    local /*0x35EA0000-0x00000000*/ private @NULL WaveForm[8388609], WaveInstigator;

    CurrentSample = 0;
    ElapsedTime = 0.0000000;
    bIsPaused = false;
    FFWaveform = none;
    WaveformInstigator = none;
    // End:0xB8
    if(((!bPreventAllForceFeedbackForDebugging && WaveForm != none) && WaveForm.Samples.Length > 0) && bAllowsForceFeedback)
    {
        FFWaveform = WaveForm;
        WaveformInstigator = WaveInstigator;
    }
    //return;    
}

simulated function StopForceFeedbackWaveform()
{
    local /*0x35EA0000-0x00000000*/ private @NULL WaveForm[9437185];

    // End:0x3F
    if((WaveForm == none) || WaveForm == FFWaveform)
    {
        FFWaveform = none;
        WaveformInstigator = none;
    }
    //return;    
}

simulated function PauseWaveform()
{
    local /*0x35EA0000-0x00000000*/ private bool bPause[9437185];

    bIsPaused = bPause;
    //return;    
}

defaultproperties
{
    bAllowsForceFeedback=true
    ScaleAllWaveformsBy=1.0000000
}