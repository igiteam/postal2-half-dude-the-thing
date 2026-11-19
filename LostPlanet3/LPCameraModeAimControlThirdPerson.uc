class LPCameraModeAimControlThirdPerson extends SPCameraModeAimControlThirdPerson;

// Export ULPCameraModeAimControlThirdPerson::execGetAllowFloatingAim(FFrame&, void* const)
native function GetAllowFloatingAim()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPCameraModeAimControlThirdPerson::execDoesSprintCameraFollowRotation(FFrame&, void* const)
native function DoesSprintCameraFollowRotation()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

function OnBecomeActive()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevCameraMode[8388609];

    super.OnBecomeActive(PrevCameraMode);
    //return;    
}

simulated function ForceUseGlobalFilter()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function DisplayDebug()
{
    local /*0x97E50000-0x00000000*/ private @NULL HUD[8388609];
    local /*0x97E50000-0x00000000*/ private float out_YL[25165825], out_YPos;

    super.DisplayDebug(HUD, out_YL, out_YPos);
    out_YPos = HUD.Canvas.CurY;
    //return;    
}

defaultproperties
{
    // Reference: SPCameraBlendLowPassFilter'Default__LPCameraModeAimControlThirdPerson.LocationFilterObj'
    begin object name=LocationFilterObj
    end object
    StaticLocationFilter=LocationFilterObj
    // Reference: SPCameraBlendLowPassFilter'Default__LPCameraModeAimControlThirdPerson.RadiusFilterObj'
    begin object name=RadiusFilterObj
    end object
    StaticRadiusFilter=RadiusFilterObj
    // Reference: SPCameraBlendLowPass2Filter'Default__LPCameraModeAimControlThirdPerson.FOVFilterObj2'
    begin object name=FOVFilterObj2
    end object
    StaticFOVFilter=FOVFilterObj2
    // Reference: SPCameraBlendLowPassFilter'Default__LPCameraModeAimControlThirdPerson.SprintLocalOffsetFilterObj'
    begin object name=SprintLocalOffsetFilterObj
    end object
    StaticSprintLocalOffsetFilter=SprintLocalOffsetFilterObj
    // Reference: SPCameraBlendLowPassFilter'Default__LPCameraModeAimControlThirdPerson.SprintFOVFilterObj'
    begin object name=SprintFOVFilterObj
    end object
    StaticSprintFOVFilter=SprintFOVFilterObj
    // Reference: SPCameraBlendLowPassFilter'Default__LPCameraModeAimControlThirdPerson.RollLocalOffsetFilterObj'
    begin object name=RollLocalOffsetFilterObj
    end object
    StaticRollLocalOffsetFilter=RollLocalOffsetFilterObj
    // Reference: SPCameraBlendLowPassFilter'Default__LPCameraModeAimControlThirdPerson.RollFOVFilterObj'
    begin object name=RollFOVFilterObj
    end object
    StaticRollFOVFilter=RollFOVFilterObj
    // Reference: SPCameraBlendLowPass2Filter'Default__LPCameraModeAimControlThirdPerson.StaticSmoothOffsetFilterObj2'
    begin object name=StaticSmoothOffsetFilterObj2
    end object
    StaticSmoothOffsetFilter=StaticSmoothOffsetFilterObj2
    // Reference: SPCameraBlendLowPass2Filter'Default__LPCameraModeAimControlThirdPerson.StaticHeadBobFilterObj'
    begin object name=StaticHeadBobFilterObj
    end object
    StaticHeadBobFilter=StaticHeadBobFilterObj
    // Reference: SPCameraBlendSpeedFilter'Default__LPCameraModeAimControlThirdPerson.OffsetFilterObj'
    begin object name=OffsetFilterObj
    end object
    StaticOffsetFilter=OffsetFilterObj
    AdjustViewSoAimGoesThroughTargetAimCollisionPointEnablerMask=2
    // Reference: SPCameraCollision'Default__LPCameraModeAimControlThirdPerson.MainCameraCollisionObj'
    begin object name=MainCameraCollisionObj
    end object
    CameraCollisionMain=MainCameraCollisionObj
}