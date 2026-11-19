class LPSP_StruggleAnalogControl extends LPSP_StruggleAnimControl;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyTuneData;

function InitObject()
{
    local /*0x97E50000-0x00000000*/ private @NULL inSMStruggleMode[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bOk;

    bOk = super.InitObject(inSMStruggleMode);
    MyTuneData = LPTuneDataStrugglePhaseAnalogControl(TuneData);
    return bOk;
    //return ReturnValue;    
}

function Start()
{
    local /*0x97E50000-0x00000000*/ private name PrevPhaseName[8388609];

    super.Start(PrevPhaseName);
    LPPlayerController(smStruggleMode.MySPPawn.Controller).DisplayStruggleWaggleMessage(true);
    //return;    
}

function Stop()
{
    local /*0x97E50000-0x00000000*/ private name NextPhaseName[8388609];

    LPPlayerController(smStruggleMode.MySPPawn.Controller).DisplayStruggleWaggleMessage(false);
    super.Stop(NextPhaseName);
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL PlayerInput;

    PlayerInput = LPPlayerInput(LPPlayerController(smStruggleMode.PlayerPawn.Controller).PlayerInput);
    PushButtonMeter = (PlayerInput.RawJoyRight + 1.0000000) / 2.0000000;
    PushButtonMeter = FClamp(PushButtonMeter, 0.0000000, 1.0000000);
    return super.Update(DeltaTime);
    //return ReturnValue;    
}
