class LPSM_VSIP_Taser extends LPSM_VSIPBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShockStarted;

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], MyPlayerController;

    bShockStarted = false;
    super.SpecialMoveStarted(bForced, PrevMove);
    MyPlayerController = LPPlayerController(vsPawn.Controller);
    MyPlayerController.SetVSReticleHelpButton(10, true);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    LPPlayerController(vsPawn.Controller).SetVSReticleHelpButton(10, false);
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function PlayInteractAnim()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return super.PlayInteractAnim();
    //return ReturnValue;    
}

function PlayReleaseAnim()
{
    super.PlayReleaseAnim();
    //return;    
}

function ShockObject()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xE3
    if(!bShockStarted)
    {
        VSIP.NumSuccessfulInteractions++;
        VSIP.TriggerEventClass(Class'LPSeqEvent_VSIP_Taser', MySPPawn, 0);
        MySPPawn.PlayFullBodyAnimation(VSIP.ShockAnimationName, EndTaser,, 1.0000000, 0.2000000, 0.1000000, false, true, 2, 2, true);
        bForkArmLocked = true;
        bShockStarted = true;
        return true;
    }
    return false;
    //return ReturnValue;    
}

function EndTaser()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    PlayReleaseAnim();
    VSIP.TriggerEventClass(Class'LPSeqEvent_VSIP_Taser', MySPPawn, 1);
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
        // End:0x37
        case Class'LPSMMTypes'.default.SMM_VSInteractionPointDisable:
            // End:0x8A
            break;
        // End:0x5B
        case Class'LPSMMTypes'.default.SMM_VSInteractionPointEnable:
            // End:0x8A
            break;
        // End:0x87
        case Class'LPSMMTypes'.default.SMM_ShockStart:
            return ShockObject();
        // End:0xFFFF
        default:
            break;
    }
    return super.ProcessSMMessage(MessageName, Sender, Data);
    //return ReturnValue;    
}

function DoForkArmReleaseAction()
{
    // End:0x28
    if(!bForkArmLocked)
    {
        // End:0x28
        if(!bIsReleasing)
        {
            PlayReleaseAnim();
        }
    }
    //return;    
}

function EndSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    // End:0x5E
    if(bIsReleasing && !bForkArmLocked)
    {
        vsPawn.NotifyInteractionPoint(Class'LPVSInteractionPoint'.default.IPM_Aborted);        
    }
    else
    {
        // End:0x10C
        if(bForkArmLocked)
        {
            vsPawn.NotifyInteractionPoint(Class'LPVSInteractionPoint'.default.IPM_Finished);
            // End:0x10C
            if(VSIP.NumSuccessfulInteractions == VSIP.MaxSuccessfulInteractions)
            {
                VSIP.GotoState('Disabled');
            }
        }
    }
    vsPawn.ForkArmSkelControl.bApplyRotation = false;
    vsPawn.ForkArmSkelControl.bApplyTranslation = false;
    vsPawn.ForkArmSkelControl.ControlStrength = 0.0000000;
    MySPPawn.AdditiveAnimInfo.AnimNodeSlot.StopCustomAnim(0.0000000);
    vsPawn.CCDControl_LeftArm.SetSkelControlActive(false);
    MySPPawn.EndCurrentSpecialMove();
    //return;    
}

defaultproperties
{
    // Reference: SPTuneDataEventDefSoundBase'Default__LPSM_VSIP_Taser.MaxDistancePlaybackOverrideObj'
    begin object name=MaxDistancePlaybackOverrideObj
        PlaybackDistanceOverride=(OverrideType=SPFloatScaleOverrideType.SPFSOverride_None,OverrideValue=0.0000000)
    end object
    MaxDistancePlaybackOverride=MaxDistancePlaybackOverrideObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_VSIP_Taser.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultGrabCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_VSIP_Taser.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    GrabCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPSM_VSIP_Taser.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    GrabTransitionInParam=GrabCamTransitionInParamObj
}