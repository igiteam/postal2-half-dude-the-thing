class LPCameraModeAimControlCrouch extends LPCameraModeAimControlThirdPerson;

defaultproperties
{
    // Reference: SPCameraBlendLowPassFilter'Default__LPCameraModeAimControlCrouch.LocationFilterObj'
    begin object name=LocationFilterObj
    end object
    StaticLocationFilter=LocationFilterObj
    // Reference: SPCameraBlendLowPassFilter'Default__LPCameraModeAimControlCrouch.RadiusFilterObj'
    begin object name=RadiusFilterObj
    end object
    StaticRadiusFilter=RadiusFilterObj
    // Reference: SPCameraBlendLowPass2Filter'Default__LPCameraModeAimControlCrouch.FOVFilterObj2'
    begin object name=FOVFilterObj2
    end object
    StaticFOVFilter=FOVFilterObj2
    // Reference: SPCameraBlendLowPassFilter'Default__LPCameraModeAimControlCrouch.SprintLocalOffsetFilterObj'
    begin object name=SprintLocalOffsetFilterObj
    end object
    StaticSprintLocalOffsetFilter=SprintLocalOffsetFilterObj
    // Reference: SPCameraBlendLowPassFilter'Default__LPCameraModeAimControlCrouch.SprintFOVFilterObj'
    begin object name=SprintFOVFilterObj
    end object
    StaticSprintFOVFilter=SprintFOVFilterObj
    // Reference: SPCameraBlendLowPassFilter'Default__LPCameraModeAimControlCrouch.RollLocalOffsetFilterObj'
    begin object name=RollLocalOffsetFilterObj
    end object
    StaticRollLocalOffsetFilter=RollLocalOffsetFilterObj
    // Reference: SPCameraBlendLowPassFilter'Default__LPCameraModeAimControlCrouch.RollFOVFilterObj'
    begin object name=RollFOVFilterObj
    end object
    StaticRollFOVFilter=RollFOVFilterObj
    // Reference: SPCameraBlendLowPass2Filter'Default__LPCameraModeAimControlCrouch.StaticSmoothOffsetFilterObj2'
    begin object name=StaticSmoothOffsetFilterObj2
    end object
    StaticSmoothOffsetFilter=StaticSmoothOffsetFilterObj2
    // Reference: SPCameraBlendLowPass2Filter'Default__LPCameraModeAimControlCrouch.StaticHeadBobFilterObj'
    begin object name=StaticHeadBobFilterObj
    end object
    StaticHeadBobFilter=StaticHeadBobFilterObj
    // Reference: SPCameraBlendSpeedFilter'Default__LPCameraModeAimControlCrouch.OffsetFilterObj'
    begin object name=OffsetFilterObj
    end object
    StaticOffsetFilter=OffsetFilterObj
    // Reference: SPCameraCollision'Default__LPCameraModeAimControlCrouch.MainCameraCollisionObj'
    begin object name=MainCameraCollisionObj
        Data=(AutoHidePlayerBlockedThreshold=0.1500000)
    end object
    CameraCollisionMain=MainCameraCollisionObj
}