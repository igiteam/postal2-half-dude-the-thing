class LPFXAction_LoopingRumble extends LPFXActionBase;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyPlayerController[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ActiveFFWaveform[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ActiveFFWaveformInstigator[536870913];

// Export ULPFXAction_LoopingRumble::execTick(FFrame&, void* const)
native event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

event ScriptTick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x48
    if(((MyPlayerController == none) || MyPlayerController.ForceFeedbackManager == none) || ActiveFFWaveform == none)
    {
        return false;
    }
    // End:0xBA
    if(MyPlayerController.ForceFeedbackManager.bIsPaused || MyPlayerController.ForceFeedbackManager.bPreventAllForceFeedbackForDebugging)
    {
        return true;
    }
    // End:0xFD
    if(MyPlayerController.ForceFeedbackManager.FFWaveform == ActiveFFWaveform)
    {
        return true;
    }
    // End:0x17E
    if(MyPlayerController.ForceFeedbackManager.FFWaveform == none)
    {
        MyPlayerController.ForceFeedbackManager.PlayForceFeedbackWaveform(ActiveFFWaveform, ActiveFFWaveformInstigator);
        return true;
    }
    return true;
    //return ReturnValue;    
}

function End()
{
    ActiveFFWaveform = none;
    ActiveFFWaveformInstigator = none;
    super(SPFXActionBase).End();
    //return;    
}

function @NULL SetData()
{
    local /*0x97E50000-0x00000000*/ private @NULL FFWaveform[8388609], FFWaveformInstigator, FXAManager;

    // End:0x64
    if(MyPlayerController == none)
    {
        FXAManager = FXActionManager();
        // End:0x64
        if(FXAManager != none)
        {
            MyPlayerController = LPPlayerController(FXAManager.Owner);
        }
    }
    ActiveFFWaveform = FFWaveform;
    ActiveFFWaveformInstigator = FFWaveformInstigator;
    //return;    
}

defaultproperties
{
    bIsTickable=true
}