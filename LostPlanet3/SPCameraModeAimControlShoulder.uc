class SPCameraModeAimControlShoulder extends SPCameraModeAimControlThirdPerson
    abstract;

var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL SPShoulderAimParams;

// Export USPCameraModeAimControlShoulder::execHasCameraBasedMovement(FFrame&, void* const)
native function HasCameraBasedMovement()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPCameraModeAimControlShoulder::execShouldPlayerFaceView(FFrame&, void* const)
native function ShouldPlayerFaceView()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];


}

function InitPendingMode()
{
    local /*0x043A0000-0x00000000*/ private @NULL PendingModeParam[8388609];

    super.InitPendingMode(PendingModeParam);
    SPShoulderAimParams = SPCameraModeAimControlShoulderParam(PendingModeParam.ModeParam);
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

    return false;
    //return ReturnValue;    
}

event IsPitchLockedToTarget()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: SPCameraBlendLowPassFilter'Default__SPCameraModeAimControlShoulder.LocationFilterObj'
    begin object name=LocationFilterObj
    end object
    StaticLocationFilter=LocationFilterObj
    // Reference: SPCameraBlendLowPassFilter'Default__SPCameraModeAimControlShoulder.RadiusFilterObj'
    begin object name=RadiusFilterObj
    end object
    StaticRadiusFilter=RadiusFilterObj
    // Reference: SPCameraBlendLowPass2Filter'Default__SPCameraModeAimControlShoulder.FOVFilterObj2'
    begin object name=FOVFilterObj2
    end object
    StaticFOVFilter=FOVFilterObj2
    // Reference: SPCameraBlendLowPassFilter'Default__SPCameraModeAimControlShoulder.SprintLocalOffsetFilterObj'
    begin object name=SprintLocalOffsetFilterObj
    end object
    StaticSprintLocalOffsetFilter=SprintLocalOffsetFilterObj
    // Reference: SPCameraBlendLowPassFilter'Default__SPCameraModeAimControlShoulder.SprintFOVFilterObj'
    begin object name=SprintFOVFilterObj
    end object
    StaticSprintFOVFilter=SprintFOVFilterObj
    // Reference: SPCameraBlendLowPassFilter'Default__SPCameraModeAimControlShoulder.RollLocalOffsetFilterObj'
    begin object name=RollLocalOffsetFilterObj
    end object
    StaticRollLocalOffsetFilter=RollLocalOffsetFilterObj
    // Reference: SPCameraBlendLowPassFilter'Default__SPCameraModeAimControlShoulder.RollFOVFilterObj'
    begin object name=RollFOVFilterObj
    end object
    StaticRollFOVFilter=RollFOVFilterObj
    // Reference: SPCameraBlendLowPass2Filter'Default__SPCameraModeAimControlShoulder.StaticSmoothOffsetFilterObj2'
    begin object name=StaticSmoothOffsetFilterObj2
    end object
    StaticSmoothOffsetFilter=StaticSmoothOffsetFilterObj2
    // Reference: SPCameraBlendLowPass2Filter'Default__SPCameraModeAimControlShoulder.StaticHeadBobFilterObj'
    begin object name=StaticHeadBobFilterObj
    end object
    StaticHeadBobFilter=StaticHeadBobFilterObj
    // Reference: SPCameraBlendSpeedFilter'Default__SPCameraModeAimControlShoulder.OffsetFilterObj'
    begin object name=OffsetFilterObj
    end object
    StaticOffsetFilter=OffsetFilterObj
    // Reference: SPCameraCollision'Default__SPCameraModeAimControlShoulder.MainCameraCollisionObj'
    begin object name=MainCameraCollisionObj
        Data=(PenetrationBlendOutTime=0.0000000,PenetrationBlendInTime=0.0000000,bSmallObstaclesDontHardBlock=false)
    end object
    CameraCollisionMain=MainCameraCollisionObj
}