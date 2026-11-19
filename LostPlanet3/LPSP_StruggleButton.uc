class LPSP_StruggleButton extends LPSP_StruggleAnimControl;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyTuneData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSucceed;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSuccessRateDown;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bButtonPressedFirstTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStampStarted;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStampButtonPressedFirstTime;

function InitObject()
{
    local /*0x97E50000-0x00000000*/ private @NULL inSMStruggleMode[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bOk;

    bOk = super.InitObject(inSMStruggleMode);
    MyTuneData = LPTuneDataStrugglePhaseButton(TuneData);
    return bOk;
    //return ReturnValue;    
}

function Start()
{
    local /*0x97E50000-0x00000000*/ private name PrevPhaseName[8388609];

    super.Start(PrevPhaseName);
    Class'SPEngine.SPUtil'.static.SetIntegrateButtonSubSamples(false);
    bSuccessRateDown = MyTuneData.AnimPctgFailed > MyTuneData.AnimPctgSuccess;
    // End:0x115
    if(smStruggleMode.bLocalPlayer && MyTuneData.bEnablePostProcess)
    {
        smStruggleMode.PlayerPawn.GetFXActionManager().StartFXAction(Class'LPFXAction_StrugglePostProcess');
    }
    TimeStampStarted = smStruggleMode.PlayerPawn.WorldInfo.TimeSeconds;
    bButtonPressedFirstTime = false;
    smStruggleMode.PlayerPawn.TriggerEventClass(Class'LPSeqEvent_StruggleMode', smStruggleMode.FollowerPawn, 1);
    // End:0x23E
    if(smStruggleMode.PlayerPawn.DisableCameraCollisionInStruggleMode)
    {
        smStruggleMode.StruggleCamParams.bCollideCamera = true;
    }
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
        return MyTuneData.AnimPctgFailed + ((MyTuneData.AnimPctgSuccess - MyTuneData.AnimPctgFailed) / float(2));
    }
    //return ReturnValue;    
}

function Stop()
{
    local /*0x97E50000-0x00000000*/ private name NextPhaseName[8388609];

    Class'SPEngine.SPUtil'.static.SetIntegrateButtonSubSamples(true);
    // End:0xB9
    if(smStruggleMode.bLocalPlayer && MyTuneData.bEnablePostProcess)
    {
        smStruggleMode.PlayerPawn.GetFXActionManager().StopFXAction(Class'LPFXAction_StrugglePostProcess');
    }
    // End:0x1A3
    if(bSucceed)
    {
        LPPawn(smStruggleMode.MySPPawn).NotifySucceedStruggleButtomMode(MyTuneData.PhaseName);
        // End:0x1A0
        if(smStruggleMode.FollowerPawn != none)
        {
            LPPawn(smStruggleMode.FollowerPawn).NotifyFailedStruggleButtomMode(MyTuneData.PhaseName);
        }        
    }
    else
    {
        LPPawn(smStruggleMode.MySPPawn).NotifyFailedStruggleButtomMode(MyTuneData.PhaseName);
        // End:0x27D
        if(smStruggleMode.FollowerPawn != none)
        {
            LPPawn(smStruggleMode.FollowerPawn).NotifySucceedStruggleButtomMode(MyTuneData.PhaseName);
        }
    }
    super.Stop(NextPhaseName);
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bFinished;
    local /*0x97E50000-0x00000000*/ private float amountToFightAgainst, CurrentPctgSuccess, timeSinceStarted;
    local /*0x97E50000-0x00000000*/ private @NULL FollowerSpecialMove;

    CurrentPctgSuccess = GetPctgSuccess();
    smStruggleMode.GetLeadersController().SetStruggleButtonStrength(CurrentPctgSuccess);
    amountToFightAgainst = MyTuneData.EnemyPushAtStart + (CurrentPctgSuccess * (MyTuneData.EnemyPushAtEnd - MyTuneData.EnemyPushAtStart));
    // End:0x176
    if(bButtonPressedFirstTime)
    {
        timeSinceStarted = GetTimeSince(TimeStampButtonPressedFirstTime);
        // End:0x176
        if(timeSinceStarted >= MyTuneData.TimeIncreasesDifficulty)
        {
            amountToFightAgainst *= (1.0000000 + ((timeSinceStarted - MyTuneData.TimeIncreasesDifficulty) * MyTuneData.RatioIncreasesDifficulty));
        }
    }
    FollowerSpecialMove = LPSM_FollowerStruggleMode(smStruggleMode.FollowerSMInstance);
    // End:0x1DE
    if(FollowerSpecialMove != none)
    {
        FollowerSpecialMove.NotifyFollowersSpecialMoveOfSuccessPctg(CurrentPctgSuccess);
    }
    AddValueToButtonMeter(-DeltaTime * amountToFightAgainst);
    bFinished = super.Update(DeltaTime);
    // End:0x296
    if(bFinished)
    {
        bSucceed = false;
        smStruggleMode.PlayerPawn.TriggerEventClass(Class'LPSeqEvent_StruggleMode', smStruggleMode.FollowerPawn, 2);
        return true;
    }
    timeSinceStarted = GetTimeSince(TimeStampStarted);
    // End:0x36C
    if(CurrentPctgSuccess >= 1.0000000)
    {
        // End:0x369
        if(MyTuneData.SuccessPhaseName != 'None')
        {
            bFinished = true;
            bSucceed = true;
            smStruggleMode.PlayerPawn.TriggerEventClass(Class'LPSeqEvent_StruggleMode', smStruggleMode.FollowerPawn, 3);
        }        
    }
    else
    {
        // End:0x498
        if((CurrentPctgSuccess <= 0.0000000) && timeSinceStarted > (MyTuneData.InitTimeCanNotLose * smStruggleMode.PlayerPawn.StruggleSettings.TimeFactorPhaseButtonCanNotLose))
        {
            // End:0x498
            if(MyTuneData.failPhaseName != 'None')
            {
                bFinished = true;
                bSucceed = false;
                smStruggleMode.PlayerPawn.TriggerEventClass(Class'LPSeqEvent_StruggleMode', smStruggleMode.FollowerPawn, 2);
            }
        }
    }
    return bFinished;
    //return ReturnValue;    
}

function GetTimeSince()
{
    local /*0x97E50000-0x00000000*/ private float TimeStamp[8388609], ReturnValue;

    return smStruggleMode.PlayerPawn.WorldInfo.TimeSeconds - TimeStamp;
    //return ReturnValue;    
}

function GetPctgSuccess()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], CurrentPctgSuccess;

    CurrentPctgSuccess = PushButtonMeter;
    // End:0xC0
    if(MyAnimNode != none)
    {
        CurrentPctgSuccess = Abs(MyTuneData.AnimPctgFailed - CurrentPctgSuccess) / Abs(MyTuneData.AnimPctgFailed - MyTuneData.AnimPctgSuccess);
        // End:0xC0
        if(bSuccessRateDown)
        {
            CurrentPctgSuccess = 1.0000000 - CurrentPctgSuccess;
        }
    }
    return CurrentPctgSuccess;
    //return ReturnValue;    
}

function StruggleButton()
{
    // End:0x6D
    if(!bButtonPressedFirstTime)
    {
        bButtonPressedFirstTime = true;
        TimeStampButtonPressedFirstTime = smStruggleMode.PlayerPawn.WorldInfo.TimeSeconds;
    }
    AddValueToButtonMeter(MyTuneData.PlayerPushEachButton);
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
