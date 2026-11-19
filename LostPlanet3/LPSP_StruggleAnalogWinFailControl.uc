class LPSP_StruggleAnalogWinFailControl extends LPSP_StruggleAnimControl;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyTuneData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSucceed;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bGoingUp;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeHitWinPos;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeHitLosePos;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PushButtonMeterStartAnimPercentageOffSet;

function InitObject()
{
    local /*0x97E50000-0x00000000*/ private @NULL inSMStruggleMode[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bOk;

    bOk = super.InitObject(inSMStruggleMode);
    MyTuneData = LPTuneDataStrugglePhaseAnalogWinFailControl(TuneData);
    bSucceed = false;
    TimeHitWinPos = -1.0000000;
    TimeHitLosePos = -1.0000000;
    PushButtonMeterStartAnimPercentageOffSet = MyTuneData.AnimStartPctg - 0.5000000;
    // End:0xE3
    if(MyTuneData.WinValue > MyTuneData.LoseValue)
    {
        bGoingUp = true;        
    }
    else
    {
        bGoingUp = false;
    }
    return bOk;
    //return ReturnValue;    
}

function Start()
{
    local /*0x97E50000-0x00000000*/ private name PrevPhaseName[8388609];

    super.Start(PrevPhaseName);
    //return;    
}

function Stop()
{
    local /*0x97E50000-0x00000000*/ private name NextPhaseName[8388609];

    super.Stop(NextPhaseName);
    //return;    
}

function DisplayStruggleMessage()
{
    // End:0x63
    if(bGoingUp)
    {
        LPPlayerController(smStruggleMode.MySPPawn.Controller).DisplayStruggleStickRightMessage(true);        
    }
    else
    {
        LPPlayerController(smStruggleMode.MySPPawn.Controller).DisplayStruggleStickLeftMessage(true);
    }
    //return;    
}

function GetNextPhase()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    // End:0x2F
    if(bSucceed)
    {
        return MyTuneData.SuccessPhaseName;        
    }
    else
    {
        return MyTuneData.failPhaseName;
    }
    //return ReturnValue;    
}

function IsWinValueSatisfied()
{
    local /*0x97E50000-0x00000000*/ private float Value2Test[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x3E
    if(bGoingUp)
    {
        // End:0x3B
        if(Value2Test >= MyTuneData.WinValue)
        {
            return true;
        }        
    }
    else
    {
        // End:0x6C
        if(Value2Test <= MyTuneData.WinValue)
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function IsLoseValueSatisfied()
{
    local /*0x97E50000-0x00000000*/ private float Value2Test[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x3E
    if(bGoingUp)
    {
        // End:0x3B
        if(Value2Test <= MyTuneData.LoseValue)
        {
            return true;
        }        
    }
    else
    {
        // End:0x6C
        if(Value2Test >= MyTuneData.LoseValue)
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL PlayerInput;
    local /*0x97E50000-0x00000000*/ private float deltaTimeInPose;

    PlayerInput = LPPlayerInput(LPPlayerController(smStruggleMode.PlayerPawn.Controller).PlayerInput);
    PushButtonMeter = (PlayerInput.RawJoyRight + 1.0000000) / 2.0000000;
    // End:0xC3
    if(!bGoingUp)
    {
        PushButtonMeter = 1.0000000 - PushButtonMeter;
    }
    PushButtonMeter += PushButtonMeterStartAnimPercentageOffSet;
    PushButtonMeter = FClamp(PushButtonMeter, 0.0000000, 1.0000000);
    // End:0x22F
    if(IsWinValueSatisfied(PlayerInput.RawJoyRight))
    {
        // End:0x195
        if(TimeHitWinPos < 0.0000000)
        {
            TimeHitWinPos = smStruggleMode.PlayerPawn.WorldInfo.TimeSeconds;
            TimeHitLosePos = -1.0000000;
        }
        deltaTimeInPose = smStruggleMode.PlayerPawn.WorldInfo.TimeSeconds - TimeHitWinPos;
        // End:0x22C
        if(deltaTimeInPose >= MyTuneData.MinTimeRequiredToHoldWinPose)
        {
            bSucceed = true;
            return true;
        }        
    }
    else
    {
        // End:0x368
        if(IsLoseValueSatisfied(PlayerInput.RawJoyRight))
        {
            // End:0x2CE
            if(TimeHitLosePos < 0.0000000)
            {
                TimeHitLosePos = smStruggleMode.PlayerPawn.WorldInfo.TimeSeconds;
                TimeHitWinPos = -1.0000000;
            }
            deltaTimeInPose = smStruggleMode.PlayerPawn.WorldInfo.TimeSeconds - TimeHitLosePos;
            // End:0x365
            if(deltaTimeInPose >= MyTuneData.MinTimeRequiredToHoldLosePose)
            {
                bSucceed = false;
                return true;
            }            
        }
        else
        {
            TimeHitWinPos = -1.0000000;
            TimeHitLosePos = -1.0000000;
        }
    }
    return super.Update(DeltaTime);
    //return ReturnValue;    
}
