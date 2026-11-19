class LPSP_StruggleDefault extends LPStrugglePhaseAnim;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyTuneData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHasDodges;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDodged;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWindowActive;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bNeedToWaitForStickReset;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte DodgeDirection;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStampWindowActive;

function InitObject()
{
    local /*0x97E50000-0x00000000*/ private @NULL inSMStruggleMode[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bOk;

    bOk = super.InitObject(inSMStruggleMode);
    MyTuneData = LPTuneDataStrugglePhaseDefault(TuneData);
    bHasDodges = (MyTuneData.DodgeLeftPhaseName != 'None') || MyTuneData.DodgeRightPhaseName != 'None';
    return bOk;
    //return ReturnValue;    
}

function Start()
{
    local /*0x97E50000-0x00000000*/ private name PrevPhaseName[8388609];

    super.Start(PrevPhaseName);
    bDodged = false;
    bWindowActive = false;
    TimeStampWindowActive = 0.0000000;
    //return;    
}

function Stop()
{
    local /*0x97E50000-0x00000000*/ private name inNextPhaseName[8388609];

    LPPawn(smStruggleMode.MySPPawn).NotifyEnddedStruggleDefaultMode(MyTuneData.PhaseName);
    // End:0xDA
    if(smStruggleMode.FollowerPawn != none)
    {
        LPPawn(smStruggleMode.FollowerPawn).NotifyEnddedStruggleDefaultMode(MyTuneData.PhaseName);
    }
    // End:0x113
    if(smStruggleMode.bLocalPlayer)
    {
        // End:0x113
        if(bWindowActive)
        {
            StopDodgeWindow();
        }
    }
    super.Stop(inNextPhaseName);
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL PlayerCtrl;

    // End:0x0F
    if(bDodged)
    {
        return true;
    }
    // End:0xFB
    if(bHasDodges && !MyTuneData.UseEvadeButtonToDodge)
    {
        PlayerCtrl = LPPlayerController(smStruggleMode.PlayerPawn.Controller);
        // End:0xE4
        if(PlayerCtrl.SpecialDodgeActor != none)
        {
            // End:0xCE
            if(!bWindowActive)
            {
                StartDodgeWindow(PlayerCtrl);
            }
            UpdateDodgeWindow(PlayerCtrl);            
        }
        else
        {
            // End:0xFB
            if(bWindowActive)
            {
                StopDodgeWindow();
            }
        }
    }
    return super.Update(DeltaTime);
    //return ReturnValue;    
}

function StartDodgeWindow()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerCtrl[8388609];

    EnableStruggleDodgeHUDMessage();
    // End:0xAF
    if(MyTuneData.SlomoDodgeAmount > 0.0000000)
    {
        smStruggleMode.MySPPawn.WorldInfo.Game.SetGameSpeed(MyTuneData.SlomoDodgeAmount);
    }
    bNeedToWaitForStickReset = false;
    // End:0x199
    if(MyTuneData.DodgeOnStickPressedEvent)
    {
        // End:0x199
        if((PlayerCtrl.PlayerInput.RawJoyRight < -MyTuneData.DodgeRawJoyRight) || PlayerCtrl.PlayerInput.RawJoyRight > MyTuneData.DodgeRawJoyRight)
        {
            bNeedToWaitForStickReset = true;
        }
    }
    TimeStampWindowActive = smStruggleMode.MySPPawn.WorldInfo.TimeSeconds;
    bWindowActive = true;
    //return;    
}

function UpdateDodgeWindow()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerCtrl[8388609];

    // End:0x104
    if((MyTuneData.SlomoDodgeAmount > 0.0000000) && (smStruggleMode.MySPPawn.WorldInfo.TimeSeconds - TimeStampWindowActive) > MyTuneData.SlomoDodgeTime)
    {
        smStruggleMode.MySPPawn.WorldInfo.Game.SetGameSpeed(1.0000000);
    }
    // End:0x1CF
    if(bNeedToWaitForStickReset)
    {
        // End:0x1CD
        if((PlayerCtrl.PlayerInput.RawJoyRight >= -MyTuneData.DodgeRawJoyRight) && PlayerCtrl.PlayerInput.RawJoyRight <= MyTuneData.DodgeRawJoyRight)
        {
            bNeedToWaitForStickReset = false;
        }
        return;
    }
    // End:0x264
    if((MyTuneData.DodgeLeftPhaseName != 'None') && PlayerCtrl.PlayerInput.RawJoyRight < -MyTuneData.DodgeRawJoyRight)
    {
        StruggleDodge(0);        
    }
    else
    {
        // End:0x2F4
        if((MyTuneData.DodgeRightPhaseName != 'None') && PlayerCtrl.PlayerInput.RawJoyRight > MyTuneData.DodgeRawJoyRight)
        {
            StruggleDodge(1);
        }
    }
    //return;    
}

function StopDodgeWindow()
{
    DisableStruggleDodgeHUDMessage();
    // End:0x96
    if(MyTuneData.SlomoDodgeAmount > 0.0000000)
    {
        smStruggleMode.MySPPawn.WorldInfo.Game.SetGameSpeed(1.0000000);
    }
    LPPlayerController(smStruggleMode.MySPPawn.Controller).NotifyCloseAllDodgeWindows();
    bWindowActive = false;
    //return;    
}

function GetNextPhase()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    // End:0x98
    if(bDodged)
    {
        // End:0x40
        if(int(DodgeDirection) == int(0))
        {
            return MyTuneData.DodgeLeftPhaseName;
        }
        // End:0x76
        if(int(DodgeDirection) == int(1))
        {
            return MyTuneData.DodgeRightPhaseName;            
        }
        else
        {
            return MyTuneData.DodgeRightPhaseName;
        }        
    }
    else
    {
        return MyTuneData.NextPhaseName;
    }
    //return ReturnValue;    
}

function StruggleDodge()
{
    local /*0x97E50000-0x00000000*/ private byte InDodgeDir[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL MyAnimNode, DodgeAnimPhase;
    local /*0x97E50000-0x00000000*/ private name DodgePhaseName;

    // End:0x3F
    if(int(InDodgeDir) == int(0))
    {
        DodgePhaseName = MyTuneData.DodgeLeftPhaseName;        
    }
    else
    {
        DodgePhaseName = MyTuneData.DodgeRightPhaseName;
    }
    // End:0x261
    if(DodgePhaseName != 'None')
    {
        DodgeAnimPhase = LPStrugglePhaseAnim(smStruggleMode.GetPhase(DodgePhaseName));
        // End:0x261
        if(DodgeAnimPhase != none)
        {
            bDodged = true;
            DodgeDirection = InDodgeDir;
            // End:0x196
            if(MyTuneData.StartDodgePhaseFromCurrentTime)
            {
                MyAnimNode = smStruggleMode.MySPPawn.PawnChoreographyParams.MySequence;
                DodgeAnimPhase.OverwrittenAnimStartTime = MyAnimNode.CurrentTime;
            }
            // End:0x261
            if(smStruggleMode.MySPPawn.WorldInfo.Game.GameSpeed < 1.0000000)
            {
                smStruggleMode.MySPPawn.WorldInfo.Game.SetGameSpeed(1.0000000);
            }
        }
    }
    //return;    
}

function EnableStruggleDodgeHUDMessage()
{
    // End:0x82
    if(MyTuneData.DodgeRightPhaseName == 'None')
    {
        LPPlayerController(smStruggleMode.MySPPawn.Controller).DisplayStruggleStickLeftMessage(true);        
    }
    else
    {
        // End:0x104
        if(MyTuneData.DodgeLeftPhaseName == 'None')
        {
            LPPlayerController(smStruggleMode.MySPPawn.Controller).DisplayStruggleStickRightMessage(true);            
        }
        else
        {
            LPPlayerController(smStruggleMode.MySPPawn.Controller).DisplayStruggleWaggleMessage(true);
        }
    }
    //return;    
}

function DisableStruggleDodgeHUDMessage()
{
    // End:0x82
    if(MyTuneData.DodgeRightPhaseName == 'None')
    {
        LPPlayerController(smStruggleMode.MySPPawn.Controller).DisplayStruggleStickLeftMessage(false);        
    }
    else
    {
        // End:0x104
        if(MyTuneData.DodgeLeftPhaseName == 'None')
        {
            LPPlayerController(smStruggleMode.MySPPawn.Controller).DisplayStruggleStickRightMessage(false);            
        }
        else
        {
            LPPlayerController(smStruggleMode.MySPPawn.Controller).DisplayStruggleWaggleMessage(false);
        }
    }
    //return;    
}

function StruggleTakeDamage()
{
    // End:0x0F
    if(bDodged)
    {
        return;
    }
    super(LPStrugglePhase).StruggleTakeDamage();
    //return;    
}
