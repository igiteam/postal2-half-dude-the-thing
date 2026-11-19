class LPSM_VSIP_OpenHangarDoor extends LPSM_VSIPBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    bForkArmLocked = false;
    //return;    
}

function PlayInteractAnim()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return super.PlayInteractAnim();
    //return ReturnValue;    
}

function PlayHoldLoop()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    vsPawn.PlayVSGrabSuccess();
    super.PlayHoldLoop(Node, InUserData, bInterrupted);
    //return;    
}

function PlayForkArmMoveUpAnim()
{
    bForkArmLocked = true;
    vsPawn.NotifyInteractionPoint(Class'LPVSInteractionPoint'.default.IPM_Interact);
    MySPPawn.PlayFullBodyAnimation(VSIP.ForkArmRaiseAnimationName, EndSpecialMove,, 1.0000000, 0.1000000, 0.1000000, false, true, 2, 2, true);
    //return;    
}

function PlayReleaseAnim()
{
    vsPawn.SetVSReticleGrabState(false);
    super.PlayReleaseAnim();
    //return;    
}

function ProcessSMMessage()
{
    local /*0x97E50000-0x00000000*/ private name MessageName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int Data[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return super.ProcessSMMessage(MessageName, Sender, Data);
    //return ReturnValue;    
}

function DoForkArmReleaseAction()
{
    // End:0x46
    if(!bForkArmLocked)
    {
        // End:0x2D
        if(!bIsHolding)
        {
            bWantsRelease = true;            
        }
        else
        {
            // End:0x46
            if(!bIsReleasing)
            {
                PlayReleaseAnim();
            }
        }
    }
    //return;    
}

function EndSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    // End:0x4D
    if(bIsReleasing)
    {
        vsPawn.NotifyInteractionPoint(Class'LPVSInteractionPoint'.default.IPM_Aborted);        
    }
    else
    {
        // End:0x97
        if(bForkArmLocked)
        {
            vsPawn.NotifyInteractionPoint(Class'LPVSInteractionPoint'.default.IPM_Finished);
        }
    }
    super.EndSpecialMove(Node, InUserData, bInterrupted);
    //return;    
}

function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super(GameSpecialMove).Tick(DeltaTime);
    UpdateJoystickRaise();
    //return;    
}

function UpdateJoystickRaise()
{
    local /*0x97E50000-0x00000000*/ private @NULL PC, PInput;

    // End:0x3E
    if(((bForkArmLocked || !bIsHolding) || bWantsRelease) || bIsReleasing)
    {
        return;
    }
    PC = LPPlayerController(MySPPawn.Controller);
    // End:0x105
    if(PC != none)
    {
        PInput = LPPlayerInput(PC.PlayerInput);
        // End:0x105
        if((PInput != none) && PInput.UnfilteredMovementStick.Y > 0.4000000)
        {
            PlayForkArmMoveUpAnim();
        }
    }
    //return;    
}

defaultproperties
{
    bShouldDoLeftArmIK=false
    // Reference: SPTuneDataEventDefSoundBase'Default__LPSM_VSIP_OpenHangarDoor.MaxDistancePlaybackOverrideObj'
    begin object name=MaxDistancePlaybackOverrideObj
        PlaybackDistanceOverride=(OverrideType=SPFloatScaleOverrideType.SPFSOverride_None,OverrideValue=0.0000000)
    end object
    MaxDistancePlaybackOverride=MaxDistancePlaybackOverrideObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_VSIP_OpenHangarDoor.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultGrabCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_VSIP_OpenHangarDoor.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    GrabCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPSM_VSIP_OpenHangarDoor.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    GrabTransitionInParam=GrabCamTransitionInParamObj
}