class LPSM_VSIPBase extends SPSpecialMove
    abstract
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL VSIP;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL vsPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsGrabbing;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsHolding;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWantsRelease;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsReleasing;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bForkArmLocked;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsPlayingInteractAnim;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPlayOuttro;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUsesFloatingAim;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRegisterToInteractionPoint;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLockPitchControl;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShouldDoLeftArmIK;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MaxDistancePlaybackOverride;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DefaultGrabCamParams;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GrabCamParams;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GrabTransitionInParam;

// Export ULPSM_VSIPBase::execGetDestinationFromBoneAnimation(FFrame&, void* const)
native function GetDestinationFromBoneAnimation()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name BoneName[8388609], AnimName;
    local /*0x97E50000-0x00000000*/ private @NULL BoneLocation[25165825], BoneRotation;
    local /*0x97E50000-0x00000000*/ private float animTime[9437185];

    -1.0000000                                
}

function CanDoVSRightArm()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
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

function GetRegisterLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return VSIP.Location;
    //return ReturnValue;    
}

function GetRegisterRotation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return VSIP.Rotation;
    //return ReturnValue;    
}

function GetEffectorLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], tempVect, FocusLoc;

    FocusLoc = VSIP.GetFocusLocation(true);
    tempVect = FocusLoc - MySPPawn.Location;
    tempVect.Z = 0.0000000;
    tempVect = Normal(tempVect);
    return FocusLoc - (tempVect * VSIP.GrabLocationOffset);
    //return ReturnValue;    
}

function PrepSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], InteractionActor;
    local /*0x97E50000-0x00000000*/ private editfixedsize array AnimSets;

    super.PrepSpecialMove(PrevMove, InteractionActor);
    vsPawn = LPVSPlayerPawn(MySPPawn);
    VSIP = vsPawn.GetVSInteractionPoint();
    VSIP.CurrentSpecialMove = self;
    // End:0xF9
    if(VSIP.InteractionAnimSet != none)
    {
        AnimSets.AddItem(VSIP.InteractionAnimSet);        
        vsPawn.SPAddAnimSets(AnimSets);
    }
    //return;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    // End:0x6F
    if(bLockPitchControl)
    {
        vsPawn.SetPitchControllerTarget(0, 0.5000000);
        vsPawn.SetPitchControllerLock(true);
    }
    // End:0xDA
    if(MySPPawn.Controller != none)
    {
        LPPlayerController(MySPPawn.Controller).MPStartState('Interacting');
    }
    bIsGrabbing = true;
    bIsHolding = false;
    bWantsRelease = false;
    bIsReleasing = false;
    MySPPawn.Mesh.RootMotionMode = 3;
    // End:0x198
    if(bRegisterToInteractionPoint)
    {
        MySPPawn.RegisterDestinationAndOrientation(PlayInteractAnim(), GetRegisterLocation(), GetRegisterRotation(), 0.0000000, 0.5000000, true, false);
    }
    //return;    
}

function PlayInteractAnim()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x56
    if(bShouldDoLeftArmIK)
    {
        EnableLeftArmIK(true);
        vsPawn.CCDControl_LeftArm.EffectorLocation = GetEffectorLocation();
    }
    bIsPlayingInteractAnim = true;
    return MySPPawn.PlayFullBodyAnimation(VSIP.GrabAnimationName, PlayHoldLoop,, 1.0000000, 0.2000000, 0.1000000, false, true, 2, 2, true);
    //return ReturnValue;    
}

function PlayHoldLoop()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    // End:0x0F
    if(bInterrupted)
    {
        return;
    }
    MySPPawn.CancelDestinationRegistration();
    // End:0x49
    if(bWantsRelease)
    {
        PlayReleaseAnim();
        return;
    }
    bIsGrabbing = false;
    bIsHolding = true;
    bForkArmLocked = false;
    vsPawn.NotifyInteractionPoint(Class'LPVSInteractionPoint'.default.IPM_Grabbed);
    MySPPawn.PlayFullBodyAnimation(VSIP.HoldAnimationName,,, 1.0000000, 0.1000000, 0.1000000, true, true, 2, 2, true);
    //return;    
}

function PlayReleaseAnim()
{
    bIsReleasing = true;
    MySPPawn.PlayFullBodyAnimation(VSIP.RetractAnimationName, EndSpecialMove,, 1.0000000, 0.2000000, 0.1000000, false, true, 2, 2, true);
    //return;    
}

function EndSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    bIsHolding = false;
    EnableLeftArmIK(false);
    // End:0x75
    if(bIsReleasing && !bForkArmLocked)
    {
        vsPawn.NotifyInteractionPoint(Class'LPVSInteractionPoint'.default.IPM_Aborted);        
    }
    else
    {
        // End:0x120
        if(bForkArmLocked)
        {
            vsPawn.NotifyInteractionPoint(Class'LPVSInteractionPoint'.default.IPM_Finished);
            // End:0x120
            if(VSIP.NumSuccessfulInteractions == VSIP.MaxSuccessfulInteractions)
            {
                VSIP.SetEnabled(false);
            }
        }
    }
    MySPPawn.EndCurrentSpecialMove();
    //return;    
}

simulated function PlayHitReactionAnimation()
{
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
        // End:0x4D
        case Class'LPSMMTypes'.default.SMM_ForkArmGrabPressed:
            // End:0x4B
            if(bIsHolding)
            {
                DoForkArmReleaseAction();
            }
            return true;
        // End:0x6E
        case Class'LPSMMTypes'.default.SMM_VSRightArmAltActionPressed:
        // End:0x91
        case Class'LPSMMTypes'.default.SMM_VSRightArmPartStart:
            return true;
        // End:0xFFFF
        default:
            // End:0x97
            break;
            break;
    }
    return super.ProcessSMMessage(MessageName, Sender, Data);
    //return ReturnValue;    
}

function @NULL SetupAkComponent()
{
    local /*0x97E50000-0x00000400*/ private @NULL C[8388609];
    local /*0x97E50000-0x00000000*/ private name BoneName[8388609];

    // End:0xB7
    if(C != none)
    {
        C.bAutoDestroy = false;
        C.bUseLocation = false;
        C.BoneName = BoneName;
        C.Stop();
        C.Play();
    }
    //return;    
}

function @NULL CleanupAudioComponent()
{
    local /*0x97E50000-0x00000400*/ private @NULL C[8388609];

    // End:0x4D
    if(C != none)
    {
        C.Stop();
        C.DetachFromAny();
    }
    //return;    
}

function EnableLeftArmIK()
{
    local /*0x97E50000-0x00000000*/ private bool Enable[8388609];

    // End:0x7E
    if(Enable)
    {
        vsPawn.CCDControl_LeftArm.BlendInTime = 1.0000000;
        vsPawn.CCDControl_LeftArm.SetSkelControlActive(true);        
    }
    else
    {
        vsPawn.CCDControl_LeftArm.SetSkelControlActive(false);
    }
    //return;    
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

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;
    local /*0x97E50000-0x00000000*/ private editfixedsize array AnimSets;

    super.SpecialMoveEnded(PrevMove, NextMove);
    // End:0x2A1
    if(vsPawn != none)
    {
        vsPawn.CancelDestinationRegistration();
        vsPawn.SetPitchControllerLock(false);
        // End:0xC8
        if(vsPawn.Controller != none)
        {
            vsPawn.Controller.GotoState('PlayerWalking');
        }
        vsPawn.StopRightArmPartAction(0);
        bUsesFloatingAim = false;
        UseForkArmGrabCamera();
        // End:0x179
        if(VSIP.InteractionAnimSet != none)
        {
            AnimSets.AddItem(VSIP.InteractionAnimSet);            
            vsPawn.SPRemoveAnimSets(AnimSets);
        }
        MySPPawn.Mesh.RootMotionMode = MySPPawn.default.Mesh.RootMotionMode;
        vsPawn.CCDControl_LeftArm.SetSkelControlActive(false);
        // End:0x248
        if(NextMove != none)
        {
            vsPawn.StopUpperBodyAnim(0.2500000);
        }
        // End:0x2A1
        if(bIsHolding || bIsGrabbing)
        {
            vsPawn.NotifyInteractionPoint(Class'LPVSInteractionPoint'.default.IPM_Aborted);
        }
    }
    // End:0x2DB
    if(VSIP != none)
    {
        VSIP.CurrentSpecialMove = none;
        VSIP = none;
    }
    //return;    
}

function UseForkArmGrabCamera()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC;

    LPC = LPPlayerController(MySPPawn.Controller);
    // End:0x476
    if(MySPPawn.IsLocallyControlled() && LPC != none)
    {
        GrabCamParams.FloatingAimInputScaleX = DefaultGrabCamParams.FloatingAimInputScaleX * vsPawn.RightArmPart.TuneDataVSParts.ForkArmGrab_FloatingAimInputScaleX;
        GrabCamParams.FloatingAimInputScaleY = DefaultGrabCamParams.FloatingAimInputScaleY * vsPawn.RightArmPart.TuneDataVSParts.ForkArmGrab_FloatingAimInputScaleY;
        // End:0x322
        if(bUsesFloatingAim)
        {
            GrabCamParams.FloatingAimThresholdMinX = -vsPawn.RightArmPart.TuneDataVSParts.ForkArmGrab_FloatingAimX;
            GrabCamParams.FloatingAimThresholdMaxX = vsPawn.RightArmPart.TuneDataVSParts.ForkArmGrab_FloatingAimX;
            GrabCamParams.FloatingAimThresholdMinY = -vsPawn.RightArmPart.TuneDataVSParts.ForkArmGrab_FloatingAimY;
            GrabCamParams.FloatingAimThresholdMaxY = vsPawn.RightArmPart.TuneDataVSParts.ForkArmGrab_FloatingAimY;            
        }
        else
        {
            GrabCamParams.FloatingAimThresholdMinX = 0.0000000;
            GrabCamParams.FloatingAimThresholdMaxX = 0.0000000;
            GrabCamParams.FloatingAimThresholdMinY = 0.0000000;
            GrabCamParams.FloatingAimThresholdMaxY = 0.0000000;
        }
        GrabCamParams.FloatingAimForce = bUsesFloatingAim;
        GrabCamParams.FloatingAimDontScale = bUsesFloatingAim;
        GrabCamParams.DesiredFOV = Class'LPCameraModeAimControlGrabParam'.default.DesiredFOV;
        LPC.ChangeCameraMode(GrabCamParams, GrabTransitionInParam,, false);
    }
    //return;    
}

defaultproperties
{
    bUsesFloatingAim=true
    bRegisterToInteractionPoint=true
    bLockPitchControl=true
    bShouldDoLeftArmIK=true
    // Reference: SPTuneDataEventDefSoundBase'Default__LPSM_VSIPBase.MaxDistancePlaybackOverrideObj'
    begin object name=MaxDistancePlaybackOverrideObj class=Class'SPEngine.SPTuneDataEventDefSoundBase'
        PlaybackDistanceOverride=(OverrideType=SPFloatScaleOverrideType.SPFSDOverride_ByValue,OverrideValue=100000000000000000.0000000)
    end object
    MaxDistancePlaybackOverride=MaxDistancePlaybackOverrideObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_VSIPBase.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj class=Class'LPCameraModeAimControlGrabParam'
    end object
    DefaultGrabCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_VSIPBase.GrabCamParamObj'
    begin object name=GrabCamParamObj class=Class'LPCameraModeAimControlGrabParam'
    end object
    GrabCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPSM_VSIPBase.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj class=Class'LPCameraTransitionCubicParam'
        Duration=0.1000000
    end object
    GrabTransitionInParam=GrabCamTransitionInParamObj
}