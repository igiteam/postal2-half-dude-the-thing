class LPSP_StruggleWaggle extends LPSP_StruggleAnimControl;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyTuneData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSucceed;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSuccessDirUp;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStampStarted;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StickPosLastUpdate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TotalWaggleSum;

function InitObject()
{
    local /*0x97E50000-0x00000000*/ private @NULL inSMStruggleMode[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bOk;

    bOk = super.InitObject(inSMStruggleMode);
    MyTuneData = LPTuneDataStrugglePhaseWaggle(TuneData);
    return bOk;
    //return ReturnValue;    
}

function Start()
{
    local /*0x97E50000-0x00000000*/ private name PrevPhaseName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL currentPlayerInput;

    super.Start(PrevPhaseName);
    TotalWaggleSum = 0.0000000;
    bSuccessDirUp = true;
    currentPlayerInput = LPPlayerInput(LPPlayerController(smStruggleMode.PlayerPawn.Controller).PlayerInput);
    StickPosLastUpdate = (currentPlayerInput.RawJoyRight + 1.0000000) / 2.0000000;
    // End:0x161
    if(smStruggleMode.bLocalPlayer && MyTuneData.bEnablePostProcess)
    {
        smStruggleMode.PlayerPawn.GetFXActionManager().StartFXAction(Class'LPFXAction_StrugglePostProcess');
    }
    TimeStampStarted = smStruggleMode.PlayerPawn.WorldInfo.TimeSeconds;
    smStruggleMode.PlayerPawn.TriggerEventClass(Class'LPSeqEvent_StruggleMode', smStruggleMode.FollowerPawn, 4);
    //return;    
}

function DisplayStruggleMessage()
{
    LPPlayerController(smStruggleMode.MySPPawn.Controller).DisplayStruggleWaggleMessage(true);
    //return;    
}

function GetStartPctg()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x4A
    if(tuneDataAnim.AnimStartPctg >= 0.0000000)
    {
        return tuneDataAnim.AnimStartPctg;        
    }
    else
    {
        return 0.0000000;
    }
    //return ReturnValue;    
}

function Stop()
{
    local /*0x97E50000-0x00000000*/ private name NextPhaseName[8388609];

    // End:0x99
    if(smStruggleMode.bLocalPlayer && MyTuneData.bEnablePostProcess)
    {
        smStruggleMode.PlayerPawn.GetFXActionManager().StopFXAction(Class'LPFXAction_StrugglePostProcess');
    }
    // End:0x183
    if(bSucceed)
    {
        LPPawn(smStruggleMode.MySPPawn).NotifySucceedStruggleWaggleMode(MyTuneData.PhaseName);
        // End:0x180
        if(smStruggleMode.FollowerPawn != none)
        {
            LPPawn(smStruggleMode.FollowerPawn).NotifyFailedStruggleWaggleMode(MyTuneData.PhaseName);
        }        
    }
    else
    {
        LPPawn(smStruggleMode.MySPPawn).NotifyFailedStruggleWaggleMode(MyTuneData.PhaseName);
        // End:0x25D
        if(smStruggleMode.FollowerPawn != none)
        {
            LPPawn(smStruggleMode.FollowerPawn).NotifySucceedStruggleWaggleMode(MyTuneData.PhaseName);
        }
    }
    super.Stop(NextPhaseName);
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL currentPlayerInput;
    local /*0x97E50000-0x00000000*/ private float currentStickLoc, deltaFromLastUpdate, PercentComplete;
    local /*0x97E50000-0x00000000*/ private bool bphaseCompleted;

    currentPlayerInput = LPPlayerInput(LPPlayerController(smStruggleMode.PlayerPawn.Controller).PlayerInput);
    currentStickLoc = (currentPlayerInput.RawJoyRight + 1.0000000) / 2.0000000;
    // End:0xDF
    if(bSuccessDirUp)
    {
        // End:0xDC
        if(currentStickLoc > StickPosLastUpdate)
        {
            deltaFromLastUpdate = currentStickLoc - StickPosLastUpdate;
        }        
    }
    else
    {
        // End:0x114
        if(currentStickLoc < StickPosLastUpdate)
        {
            deltaFromLastUpdate = StickPosLastUpdate - currentStickLoc;
        }
    }
    StickPosLastUpdate = currentStickLoc;
    TotalWaggleSum += deltaFromLastUpdate;
    PercentComplete = TotalWaggleSum / MyTuneData.TotalNumberOfWagglesForSuccess;
    PushButtonMeter = PercentComplete;
    LPPlayerController(smStruggleMode.MySPPawn.Controller).SetStruggleButtonStrength(PercentComplete);
    // End:0x20D
    if(bSuccessDirUp && StickPosLastUpdate >= 0.9500000)
    {
        bSuccessDirUp = false;        
    }
    else
    {
        // End:0x23D
        if(!bSuccessDirUp && StickPosLastUpdate <= 0.0500000)
        {
            bSuccessDirUp = true;
        }
    }
    // End:0x25B
    if(IsWinValueSatisfied())
    {
        bSucceed = true;
        return true;        
    }
    else
    {
        // End:0x276
        if(IsLoseValueSatisfied())
        {
            bSucceed = false;
            return true;
        }
    }
    bphaseCompleted = super.Update(DeltaTime);
    // End:0x2A1
    if(bphaseCompleted)
    {
    }
    return bphaseCompleted;
    //return ReturnValue;    
}

function IsWinValueSatisfied()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2E
    if(TotalWaggleSum >= MyTuneData.TotalNumberOfWagglesForSuccess)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function IsLoseValueSatisfied()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float phaseTimeDelta;

    phaseTimeDelta = smStruggleMode.PlayerPawn.WorldInfo.TimeSeconds - TimeStampStarted;
    // End:0x8B
    if(phaseTimeDelta >= MyTuneData.MaxTimeAfterWhichPhaseFails)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
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
