class LPCameraModeAimControlJobLog extends LPCameraModeAimControlShoulder;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ConstrainYawDelta;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ConstrainPitchDelta;

// Export ULPCameraModeAimControlJobLog::execApplyRotationConstraints(FFrame&, void* const)
native function ApplyRotationConstraints()
{
    local /*0x97E50000-0x00000000*/ private @NULL InRotation[8388609];
    local /*0x97E50000-0x00000000*/ private bool bPredicting[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

defaultproperties
{
    ConstrainYawDelta=4000
    ConstrainPitchDelta=2000
    // Reference: SPCameraBlendLowPassFilter'Default__LPCameraModeAimControlJobLog.LocationFilterObj'
    begin object name=LocationFilterObj
    end object
    StaticLocationFilter=LocationFilterObj
    // Reference: SPCameraBlendLowPassFilter'Default__LPCameraModeAimControlJobLog.RadiusFilterObj'
    begin object name=RadiusFilterObj
    end object
    StaticRadiusFilter=RadiusFilterObj
    // Reference: SPCameraBlendLowPass2Filter'Default__LPCameraModeAimControlJobLog.FOVFilterObj2'
    begin object name=FOVFilterObj2
    end object
    StaticFOVFilter=FOVFilterObj2
    // Reference: SPCameraBlendLowPassFilter'Default__LPCameraModeAimControlJobLog.SprintLocalOffsetFilterObj'
    begin object name=SprintLocalOffsetFilterObj
    end object
    StaticSprintLocalOffsetFilter=SprintLocalOffsetFilterObj
    // Reference: SPCameraBlendLowPassFilter'Default__LPCameraModeAimControlJobLog.SprintFOVFilterObj'
    begin object name=SprintFOVFilterObj
    end object
    StaticSprintFOVFilter=SprintFOVFilterObj
    // Reference: SPCameraBlendLowPassFilter'Default__LPCameraModeAimControlJobLog.RollLocalOffsetFilterObj'
    begin object name=RollLocalOffsetFilterObj
    end object
    StaticRollLocalOffsetFilter=RollLocalOffsetFilterObj
    // Reference: SPCameraBlendLowPassFilter'Default__LPCameraModeAimControlJobLog.RollFOVFilterObj'
    begin object name=RollFOVFilterObj
    end object
    StaticRollFOVFilter=RollFOVFilterObj
    // Reference: SPCameraBlendLowPass2Filter'Default__LPCameraModeAimControlJobLog.StaticSmoothOffsetFilterObj2'
    begin object name=StaticSmoothOffsetFilterObj2
    end object
    StaticSmoothOffsetFilter=StaticSmoothOffsetFilterObj2
    // Reference: SPCameraBlendLowPass2Filter'Default__LPCameraModeAimControlJobLog.StaticHeadBobFilterObj'
    begin object name=StaticHeadBobFilterObj
    end object
    StaticHeadBobFilter=StaticHeadBobFilterObj
    // Reference: SPCameraBlendSpeedFilter'Default__LPCameraModeAimControlJobLog.OffsetFilterObj'
    begin object name=OffsetFilterObj
    end object
    StaticOffsetFilter=OffsetFilterObj
    AdjustViewSoAimGoesThroughTargetAimCollisionPointEnablerMask=0
    // Reference: SPCameraCollision'Default__LPCameraModeAimControlJobLog.MainCameraCollisionObj'
    begin object name=MainCameraCollisionObj
    end object
    CameraCollisionMain=MainCameraCollisionObj
}