class LPSM_ForkArmGrab_Hold extends LPSM_ForkArmGrab_Base
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HydraulicPressureLeft;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxHydraulicPressure;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDrawHydraulicBar;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bReleaseOnEnd;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShowTaserHelp;

function ShouldShowReticleHelp()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], vsPawn, holdSM, LPPC;

    vsPawn = LPBaseVSPlayerPawn(MySPPawn);
    LPPC = LPPlayerController(vsPawn.Controller);
    super.SpecialMoveStarted(bForced, PrevMove);
    // End:0x123
    if((ShouldShowReticleHelp()) && LPPC != none)
    {
        // End:0xC5
        if(LPAIPawnKingCrab(FollowerPawn) == none)
        {
            LPPC.SetVSReticleHelpButton(7, true);            
        }
        else
        {
            LPPC.myLPHUD.DisplayHUDMessageLayer(25, vsPawn.ExitPromptString);
        }
    }
    // End:0x152
    if(bShowTaserHelp)
    {
        LPPC.SetVSReticleHelpButton(10, true);
    }
    holdSM = LPSM_ForkArmGrab_Hold(PrevMove);
    // End:0x1D0
    if(holdSM != none)
    {
        HydraulicPressureLeft = holdSM.HydraulicPressureLeft;
        MaxHydraulicPressure = holdSM.MaxHydraulicPressure;        
    }
    else
    {
        // End:0x259
        if(ForkArmGrabInfo.GrabPoint.bFirmGrab)
        {
            HydraulicPressureLeft = vsPawn.TuneDataVSPlayerPawn.ForkArmGrabMaxHydraulicPressure.GetValue();            
        }
        else
        {
            HydraulicPressureLeft = vsPawn.TuneDataVSPlayerPawn.ForkArmWeakGrabHydraulicPressure.GetValue();
        }
        MaxHydraulicPressure = vsPawn.TuneDataVSPlayerPawn.ForkArmGrabMaxHydraulicPressure.GetValue();
    }
    //return;    
}

function StartInteraction()
{
    super.StartInteraction();
    StartHoldAnimation();
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, LPC;

    LPC = LPPlayerController(MySPPawn.Controller);
    // End:0x62
    if((LPSM_ForkArmGrab_Base(NextMove) == none) && bReleaseOnEnd)
    {
        FinishGrabAbrupt();
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
    // End:0x107
    if(LPC != none)
    {
        LPC.SetVSReticleHelpButton(7, false);
        LPC.SetVSReticleHelpButton(10, false);
        LPC.myLPHUD.RemoveMessageLayer(25);
    }
    // End:0x1C0
    if(LPSM_ForkArmGrab_Hold(NextMove) == none)
    {
        // End:0x161
        if(MySPPawn.IsLocallyControlled())
        {
            LPC.EnableHydraulicPressureDisplay(false);
        }
        // End:0x1C0
        if(bDrillInUse && LPSM_ForkArmGrab_Release(NextMove) != none)
        {
            LPVSPlayerPawn(MySPPawn).StopRightArmPartAction(0);
            bDrillInUse = false;
        }
    }
    //return;    
}

function StartHoldAnimation()
{
    StartChoreographedAnimationLooped(MySPPawn, FollowerPawn, 2, 0.0000000);
    //return;    
}

function ProcessSMMessage()
{
    local /*0x97E50000-0x00000000*/ private name MessageName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int Data[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    switch(MessageName)
    {
        // End:0x41
        case Class'LPSMMTypes'.default.SMM_ForkArmGrabPressed:
            FinishGrabGraceful(true);
            return true;
        // End:0xFFFF
        default:
            return super.ProcessSMMessage(MessageName, Sender, Data);
            break;
    }
    //return ReturnValue;    
}

function GetPressureDepletionRate()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL AIFollower, vsPawn;
    local /*0x97E50000-0x00000000*/ private float ret;

    AIFollower = LPAIPawn(FollowerPawn);
    // End:0x58
    if(AIFollower != none)
    {
        ret = AIFollower.GetPressureDepletionRate(self);        
    }
    else
    {
        ret = 0.0000000;
    }
    vsPawn = LPVSPlayerPawn(MySPPawn);
    // End:0xBC
    if(vsPawn != none)
    {
        ret *= vsPawn.GetForkArmPressureDepletionModifier();
    }
    return ret;
    //return ReturnValue;    
}

function UpdateHydrolicPressure()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPC;

    HydraulicPressureLeft -= (DeltaTime * (GetPressureDepletionRate()));
    // End:0xA6
    if(MySPPawn.IsLocallyControlled())
    {
        LPC = LPPlayerController(MySPPawn.Controller);
        LPC.SetHydraulicPressureLevel(HydraulicPressureLeft / MaxHydraulicPressure);
    }
    // End:0xC4
    if(HydraulicPressureLeft <= 0.0000000)
    {
        FinishGrabGraceful(false);
    }
    //return;    
}

function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super.Tick(DeltaTime);
    // End:0x4D
    if(!FollowerPawn.IsDoingSpecialMove(FollowerSpecialMoveClass))
    {
        FinishGrabAbrupt();        
    }
    else
    {
        UpdateHydrolicPressure(DeltaTime);
    }
    //return;    
}

function GetEscapeMove()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_ForkArmGrab_Escape';
    //return ReturnValue;    
}

function GetReleaseMove()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_ForkArmGrab_Release';
    //return ReturnValue;    
}

function FinishGrabGraceful()
{
    local /*0x97E50000-0x00000000*/ private bool bUserInitiated[8388609];

    // End:0x17D
    if(int(MySPPawn.Role) != int(ROLE_SimulatedProxy))
    {
        // End:0xBF
        if(bUserInitiated && MySPPawn.CanDoSpecialMove(GetReleaseMove()))
        {
            // End:0xBC
            if(MySPPawn.IsLocallyControlled())
            {
                MySPPawn.LocalDoSpecialMove(GetReleaseMove(),,,, FollowerPawn);
            }            
        }
        else
        {
            // End:0x173
            if(!bUserInitiated && MySPPawn.CanDoSpecialMove(GetEscapeMove()))
            {
                // End:0x170
                if(int(MySPPawn.WorldInfo.NetMode) != int(NM_Client))
                {
                    MySPPawn.ServerDoSpecialMove(GetEscapeMove(),,,, FollowerPawn);
                }                
            }
            else
            {
                FinishGrabAbrupt();
            }
        }
    }
    //return;    
}

function NotifyVictimLidRemoved()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x62
    if(MySPPawn.CanDoSpecialMove(Class'LPSM_ForkArmGrab_RemoveLid'))
    {
        MySPPawn.DoSpecialMove(Class'LPSM_ForkArmGrab_RemoveLid',,,, FollowerPawn);
        return true;
    }
    return false;
    //return ReturnValue;    
}

function NotifyFollowerDamagedByLeader()
{
    local /*0x97E50000-0x00000000*/ private @NULL InDamageParams[25296897];

    //return;    
}

defaultproperties
{
    bReleaseOnEnd=true
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_Hold.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultGrabCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_Hold.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    GrabCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPSM_ForkArmGrab_Hold.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    GrabTransitionInParam=GrabCamTransitionInParamObj
    bAllowDrillUse=true
    bUsesFloatingAim=true
    FollowerSpecialMoveClass=Class'LPSM_ForkArmGrabVictim_Hold'
}