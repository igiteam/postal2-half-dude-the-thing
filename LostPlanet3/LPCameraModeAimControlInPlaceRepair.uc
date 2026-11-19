class LPCameraModeAimControlInPlaceRepair extends LPCameraModeAimControlShoulder;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL InPlaceRepairParams;

// Export ULPCameraModeAimControlInPlaceRepair::execApplyRotationConstraints(FFrame&, void* const)
native function ApplyRotationConstraints()
{
    local /*0x97E50000-0x00000000*/ private @NULL InRotation[8388609];
    local /*0x97E50000-0x00000000*/ private bool bPredicting[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

function InitPendingMode()
{
    local /*0x97E50000-0x00000000*/ private @NULL PendingModeParam[8388609];

    super(SPCameraModeAimControlShoulder).InitPendingMode(PendingModeParam);
    InPlaceRepairParams = LPCameraModeAimControlInPlaceRepairParam(PendingModeParam.ModeParam);
    //return;    
}

defaultproperties
{
    // Reference: SPCameraBlendLowPassFilter'Default__LPCameraModeAimControlInPlaceRepair.LocationFilterObj'
    begin object name=LocationFilterObj
    end object
    StaticLocationFilter=LocationFilterObj
    // Reference: SPCameraBlendLowPassFilter'Default__LPCameraModeAimControlInPlaceRepair.RadiusFilterObj'
    begin object name=RadiusFilterObj
    end object
    StaticRadiusFilter=RadiusFilterObj
    // Reference: SPCameraBlendLowPass2Filter'Default__LPCameraModeAimControlInPlaceRepair.FOVFilterObj2'
    begin object name=FOVFilterObj2
    end object
    StaticFOVFilter=FOVFilterObj2
    // Reference: SPCameraBlendLowPassFilter'Default__LPCameraModeAimControlInPlaceRepair.SprintLocalOffsetFilterObj'
    begin object name=SprintLocalOffsetFilterObj
    end object
    StaticSprintLocalOffsetFilter=SprintLocalOffsetFilterObj
    // Reference: SPCameraBlendLowPassFilter'Default__LPCameraModeAimControlInPlaceRepair.SprintFOVFilterObj'
    begin object name=SprintFOVFilterObj
    end object
    StaticSprintFOVFilter=SprintFOVFilterObj
    // Reference: SPCameraBlendLowPassFilter'Default__LPCameraModeAimControlInPlaceRepair.RollLocalOffsetFilterObj'
    begin object name=RollLocalOffsetFilterObj
    end object
    StaticRollLocalOffsetFilter=RollLocalOffsetFilterObj
    // Reference: SPCameraBlendLowPassFilter'Default__LPCameraModeAimControlInPlaceRepair.RollFOVFilterObj'
    begin object name=RollFOVFilterObj
    end object
    StaticRollFOVFilter=RollFOVFilterObj
    // Reference: SPCameraBlendLowPass2Filter'Default__LPCameraModeAimControlInPlaceRepair.StaticSmoothOffsetFilterObj2'
    begin object name=StaticSmoothOffsetFilterObj2
    end object
    StaticSmoothOffsetFilter=StaticSmoothOffsetFilterObj2
    // Reference: SPCameraBlendLowPass2Filter'Default__LPCameraModeAimControlInPlaceRepair.StaticHeadBobFilterObj'
    begin object name=StaticHeadBobFilterObj
    end object
    StaticHeadBobFilter=StaticHeadBobFilterObj
    // Reference: SPCameraBlendSpeedFilter'Default__LPCameraModeAimControlInPlaceRepair.OffsetFilterObj'
    begin object name=OffsetFilterObj
    end object
    StaticOffsetFilter=OffsetFilterObj
    AdjustViewSoAimGoesThroughTargetAimCollisionPointEnablerMask=0
    // Reference: SPCameraCollision'Default__LPCameraModeAimControlInPlaceRepair.MainCameraCollisionObj'
    begin object name=MainCameraCollisionObj
    end object
    CameraCollisionMain=MainCameraCollisionObj
}