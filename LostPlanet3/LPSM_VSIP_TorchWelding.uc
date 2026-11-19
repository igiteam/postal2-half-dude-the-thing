class LPSM_VSIP_TorchWelding extends LPSM_VSIPBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL VSIPWeld[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name ReleaseInteractionMessageToSend[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyPlayerController[536870913];

function GetRegisterLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], idealStart, Offset, focusLocation;

    focusLocation = VSIPWeld.GetFocusLocation();
    Offset = focusLocation - vsPawn.Location;
    Offset.Z = 0.0000000;
    Offset = Normal(Offset);
    idealStart = focusLocation - (Offset * VSIP.InitialLocationOffset);
    return idealStart;
    //return ReturnValue;    
}

function GetRegisterRotation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return Rotator(Normal2D(VSIPWeld.GetFocusLocation() - (GetRegisterLocation())));
    //return ReturnValue;    
}

function GetEffectorLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return super.GetEffectorLocation() + VSIPWeld.GrabOffset;
    //return ReturnValue;    
}

function PrepSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], InteractionActor;

    super.PrepSpecialMove(PrevMove, InteractionActor);
    VSIPWeld = LPVSInteractionPoint_Welding(VSIP);
    VSIPWeld.RegisterActors();
    //return;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    // End:0x76
    if(!ClassIsChildOf(vsPawn.RightArmPartClass, Class'LPWeaponVSWelder'))
    {
        vsPawn.SwitchToInventoryPart(1, Class'LPWeaponVSWelder');
    }
    MyPlayerController = LPPlayerController(vsPawn.Controller);
    vsPawn.NotifyArmWeld();
    MyPlayerController.myLPHUD.SetVSReticleWelderState(true);
    MyPlayerController.myLPHUD.ShowVSReticleWeldCompletionMeter(true);
    MyPlayerController.SetVSReticleHelpButton(9, true);
    MyPlayerController.SubscribedPostProcessCB = ScriptedModifyPostProcessSettings;
    //return;    
}

function ScriptedModifyPostProcessSettings()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL PPSettings[25165825];

    PPSettings.bEnableDOF = true;
    PPSettings.DOF_MaxNearBlurAmount = VSIPWeld.MaxNearBlurAmount;
    PPSettings.DOF_MaxFarBlurAmount = VSIPWeld.MaxFarBlurAmount;
    PPSettings.DOF_MinBlurAmount = VSIPWeld.MinBlurAmount;
    PPSettings.DOF_FalloffExponent = VSIPWeld.FalloffExponent;
    PPSettings.DOF_FocusInnerRadius = VSIPWeld.FocusInnerRadius;
    PPSettings.DOF_FocusDistance = VSIPWeld.FocusDistance;
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    MyPlayerController.SubscribedPostProcessCB = None;
    MyPlayerController.SetVSReticleHelpButton(9, false);
    MyPlayerController.myLPHUD.ShowVSReticleWeldCompletionMeter(false);
    MyPlayerController.myLPHUD.SetVSReticleWelderState(false);
    vsPawn.NotifyArmGrab();
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super(GameSpecialMove).Tick(DeltaTime);
    MyPlayerController.myLPHUD.SetVSReticleWeldProgress(VSIPWeld.GetProgress());
    //return;    
}

function SetAimScale()
{
    local /*0x97E50000-0x00000000*/ private float InX[8388609], InY;
    local /*0x97E50000-0x00000000*/ private @NULL LPC;

    LPC = LPPlayerController(MySPPawn.Controller);
    // End:0x3FC
    if(MySPPawn.IsLocallyControlled() && LPC != none)
    {
        GrabCamParams.FloatingAimInputScaleX = ((InX > float(0)) ? InX : DefaultGrabCamParams.FloatingAimInputScaleX * vsPawn.RightArmPart.TuneDataVSParts.ForkArmGrab_FloatingAimInputScaleX);
        GrabCamParams.FloatingAimInputScaleY = ((InY > float(0)) ? InY : DefaultGrabCamParams.FloatingAimInputScaleY * vsPawn.RightArmPart.TuneDataVSParts.ForkArmGrab_FloatingAimInputScaleY);
        GrabCamParams.FloatingAimThresholdMinX = -vsPawn.RightArmPart.TuneDataVSParts.ForkArmGrab_FloatingAimX;
        GrabCamParams.FloatingAimThresholdMaxX = vsPawn.RightArmPart.TuneDataVSParts.ForkArmGrab_FloatingAimX;
        GrabCamParams.FloatingAimThresholdMinY = -vsPawn.RightArmPart.TuneDataVSParts.ForkArmGrab_FloatingAimY;
        GrabCamParams.FloatingAimThresholdMaxY = vsPawn.RightArmPart.TuneDataVSParts.ForkArmGrab_FloatingAimY;
        GrabCamParams.FloatingAimForce = true;
        GrabCamParams.FloatingAimDontScale = true;
        GrabCamParams.DesiredFOV = VSIPWeld.FOV;
        LPC.ChangeCameraMode(GrabCamParams, GrabTransitionInParam,, false);
    }
    //return;    
}

function PlayHoldLoop()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    bUsesFloatingAim = true;
    SetAimScale(VSIPWeld.AimScaleHoldX, VSIPWeld.AimScaleHoldY);
    super.PlayHoldLoop(Node, InUserData, bInterrupted);
    //return;    
}

function GetForkArmGrabRange()
{
    local /*0x97E50000-0x00000000*/ private float OutRadius[25165825], OutHeight;

    // End:0x8C
    if(vsPawn != none)
    {
        OutRadius = vsPawn.TuneDataVSPlayerPawn.ForkArmGrabRange2D;
        OutHeight = vsPawn.TuneDataVSPlayerPawn.ForkArmGrabRangeZ;        
    }
    else
    {
        OutRadius = 0.0000000;
        OutHeight = 0.0000000;
    }
    //return;    
}

function WeldFinished()
{
    VSIPWeld.Completed();
    ReleaseInteractionMessageToSend = Class'LPVSInteractionPoint'.default.IPM_Finished;
    PlayReleaseAnim();
    //return;    
}

function DoForkArmReleaseAction()
{
    ReleaseInteractionMessageToSend = Class'LPVSInteractionPoint'.default.IPM_Aborted;
    super.DoForkArmReleaseAction();
    //return;    
}

function PlayReleaseAnim()
{
    vsPawn.StopRightArmPartAction(0, true, 0.0500000);
    super.PlayReleaseAnim();
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
        // End:0xCC
        case Class'LPSMMTypes'.default.SMM_VSRightArmPartStart:
            MyPlayerController.SetVSReticleHelpButton(9, false);
            vsPawn.StartRightArmPartAction(0, 2, true, 1);
            SetAimScale(VSIPWeld.AimScaleWeldX, VSIPWeld.AimScaleWeldY);
            return true;
        // End:0xED
        case Class'LPSMMTypes'.default.SMM_PlayerExitedVS:
        // End:0x19B
        case Class'LPSMMTypes'.default.SMM_VSRightArmPartEnd:
            MyPlayerController.SetVSReticleHelpButton(9, true);
            vsPawn.StopRightArmPartAction(0);
            SetAimScale(VSIPWeld.AimScaleHoldX, VSIPWeld.AimScaleHoldY);
            return true;
        // End:0x1C8
        case Class'LPSMMTypes'.default.SMM_ForkArmGrabVictimLidRemoved:
            WeldFinished();
            return true;
        // End:0x1EB
        case Class'LPSMMTypes'.default.SMM_NewVSRightArmPartSwitchRequest:
            return true;
        // End:0xFFFF
        default:
            // End:0x1F1
            break;
            break;
    }
    return super.ProcessSMMessage(MessageName, Sender, Data);
    //return ReturnValue;    
}

function CanDoVSRightArm()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function HasAltVSExit()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function DoAltVSExit()
{
    //return;    
}

function EndSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    EnableLeftArmIK(false);
    VSIPWeld.ProcessInteractionMessage(ReleaseInteractionMessageToSend);
    MySPPawn.EndCurrentSpecialMove();
    //return;    
}

defaultproperties
{
    // Reference: SPTuneDataEventDefSoundBase'Default__LPSM_VSIP_TorchWelding.MaxDistancePlaybackOverrideObj'
    begin object name=MaxDistancePlaybackOverrideObj
        PlaybackDistanceOverride=(OverrideType=SPFloatScaleOverrideType.SPFSOverride_None,OverrideValue=0.0000000)
    end object
    MaxDistancePlaybackOverride=MaxDistancePlaybackOverrideObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_VSIP_TorchWelding.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultGrabCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_VSIP_TorchWelding.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    GrabCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPSM_VSIP_TorchWelding.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    GrabTransitionInParam=GrabCamTransitionInParamObj
}