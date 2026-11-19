class SPCameraModeAimControlFirstPerson extends SPCameraModeAimControl
    abstract;

var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL FirstPersonAimParams;
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL MotionPIDFilterYaw;
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL MotionPIDFilterPitch;
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private bool bIsPitchLowerBound;
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private bool bIsPitchUpperBound;
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL CurrentFrameRotationFromInput;

// Export USPCameraModeAimControlFirstPerson::execComputeDeltaRotationFromInput(FFrame&, void* const)
native function ComputeDeltaRotationFromInput()
{
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USPCameraModeAimControlFirstPerson::execApplyRotationMotionFilter(FFrame&, void* const)
native function ApplyRotationMotionFilter()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USPCameraModeAimControlFirstPerson::execApplyRotationConstraints(FFrame&, void* const)
native function ApplyRotationConstraints()
{
    local /*0x043A0000-0x00000000*/ private @NULL InRotation[8388609];
    local /*0x043A0000-0x00000000*/ private bool bPredicting[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USPCameraModeAimControlFirstPerson::execProcessViewRotation(FFrame&, void* const)
native function ProcessViewRotation()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL OutViewRotation[25165825], OutDeltaRot;


}

// Export USPCameraModeAimControlFirstPerson::execHasCameraBasedMovement(FFrame&, void* const)
native function HasCameraBasedMovement()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];


}

function InitPendingMode()
{
    local /*0x043A0000-0x00000000*/ private @NULL PendingModeParam[8388609];

    super.InitPendingMode(PendingModeParam);
    FirstPersonAimParams = SPCameraModeAimControlFirstPersonParam(PendingModeParam.ModeParam);
    //return;    
}

function OnBecomeActive()
{
    local /*0x043A0000-0x00000000*/ private @NULL PrevCameraMode[8388609];

    super.OnBecomeActive(PrevCameraMode);
    MotionPIDFilterYaw.Kp = float(FirstPersonAimParams.MotionPIDFilterYaw_Kp);
    MotionPIDFilterPitch.Kp = float(FirstPersonAimParams.MotionPIDFilterPitch_Kp);
    bIsPitchLowerBound = false;
    bIsPitchUpperBound = false;
    // End:0xF8
    if(FirstPersonAimParams.MotionFilterSubStep <= 0.0000000)
    {
        FirstPersonAimParams.MotionFilterSubStep = 1.0000000 / 60.0000000;
    }
    CameraMgr.Targeting.Params.HorizontalHeadTrackingDeadZoneDistance = 0.0000000;
    Rig.CameraCollisionMain.Data.bDisabled = true;
    // End:0x1B9
    if(AimParams.CameraSocket == 'None')
    {
    }
    //return;    
}

function OnBecomeInActive()
{
    local /*0x043A0000-0x00000000*/ private @NULL PrevCameraMode[8388609];

    super(SPCameraMode).OnBecomeInActive(PrevCameraMode);
    Rig.CameraCollisionMain.Data.bDisabled = false;
    //return;    
}

function IsCameraFirstPerson()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

event IsYawLockedToTarget()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    return MotionPIDFilterYaw.Kp == 0.0000000;
    //return ReturnValue;    
}

event IsPitchLockedToTarget()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    return MotionPIDFilterPitch.Kp == 0.0000000;
    //return ReturnValue;    
}

function UpdateFilters()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];

    super.UpdateFilters(DeltaTime);
    //return;    
}

simulated function ShouldOrbitOverrideRotation()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function ClearDeltaRotationFromInput()
{
    // End:0x44
    if(MotionPIDFilterYaw.Kp == 0.0000000)
    {
        RotationFromInput.Yaw = 0;
    }
    // End:0x88
    if(MotionPIDFilterPitch.Kp == 0.0000000)
    {
        RotationFromInput.Pitch = 0;
    }
    //return;    
}

defaultproperties
{
    // Reference: SPCameraBlendSpeedFilter'Default__SPCameraModeAimControlFirstPerson.OffsetFilterObj'
    begin object name=OffsetFilterObj
    end object
    StaticOffsetFilter=OffsetFilterObj
    // Reference: SPCameraCollision'Default__SPCameraModeAimControlFirstPerson.MainCameraCollisionObj'
    begin object name=MainCameraCollisionObj
    end object
    CameraCollisionMain=MainCameraCollisionObj
}