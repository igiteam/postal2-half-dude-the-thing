class LPCameraModeLedgeWalk extends LPCameraModeAimControlThirdPerson;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LedgeParams[536870913];

// Export ULPCameraModeLedgeWalk::execDoesSprintCameraFollowRotation(FFrame&, void* const)
native function DoesSprintCameraFollowRotation()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

function InitPendingMode()
{
    local /*0x97E50000-0x00000000*/ private @NULL PendingModeParam[8388609];

    super(SPCameraModeAimControlThirdPerson).InitPendingMode(PendingModeParam);
    LedgeParams = LPCameraModeLedgeWalkParam(PendingModeParam.ModeParam);
    //return;    
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

simulated function ShouldOrbitOverrideRotation()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function PostRigUpdate()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609], TargetYaw;
    local /*0x97E50000-0x00000000*/ private @NULL CoverPawn;

    super(SPCameraModeAimControlThirdPerson).PostRigUpdate(DeltaTime);
    CoverPawn = SPGFCoverPawn(CameraMgr.Targeting.TargetPawn);
    // End:0x118
    if(CoverPawn != none)
    {
        TargetYaw = Class'SPEngine.SPUtil'.static.NormalizeDegreesPositiveIncremental((float(CoverPawn.LastCoverRotation.Yaw) * 0.0054932) + 180.0000000);
        Rig.ClampYaw(TargetYaw, LedgeParams.YawAngleLimit);
    }
    //return;    
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
    // Reference: SPCameraBlendLowPassFilter'Default__LPCameraModeLedgeWalk.LocationFilterObj'
    begin object name=LocationFilterObj
    end object
    StaticLocationFilter=LocationFilterObj
    // Reference: SPCameraBlendLowPassFilter'Default__LPCameraModeLedgeWalk.RadiusFilterObj'
    begin object name=RadiusFilterObj
    end object
    StaticRadiusFilter=RadiusFilterObj
    // Reference: SPCameraBlendLowPass2Filter'Default__LPCameraModeLedgeWalk.FOVFilterObj2'
    begin object name=FOVFilterObj2
    end object
    StaticFOVFilter=FOVFilterObj2
    // Reference: SPCameraBlendLowPassFilter'Default__LPCameraModeLedgeWalk.SprintLocalOffsetFilterObj'
    begin object name=SprintLocalOffsetFilterObj
    end object
    StaticSprintLocalOffsetFilter=SprintLocalOffsetFilterObj
    // Reference: SPCameraBlendLowPassFilter'Default__LPCameraModeLedgeWalk.SprintFOVFilterObj'
    begin object name=SprintFOVFilterObj
    end object
    StaticSprintFOVFilter=SprintFOVFilterObj
    // Reference: SPCameraBlendLowPassFilter'Default__LPCameraModeLedgeWalk.RollLocalOffsetFilterObj'
    begin object name=RollLocalOffsetFilterObj
    end object
    StaticRollLocalOffsetFilter=RollLocalOffsetFilterObj
    // Reference: SPCameraBlendLowPassFilter'Default__LPCameraModeLedgeWalk.RollFOVFilterObj'
    begin object name=RollFOVFilterObj
    end object
    StaticRollFOVFilter=RollFOVFilterObj
    // Reference: SPCameraBlendLowPass2Filter'Default__LPCameraModeLedgeWalk.StaticSmoothOffsetFilterObj2'
    begin object name=StaticSmoothOffsetFilterObj2
    end object
    StaticSmoothOffsetFilter=StaticSmoothOffsetFilterObj2
    // Reference: SPCameraBlendLowPass2Filter'Default__LPCameraModeLedgeWalk.StaticHeadBobFilterObj'
    begin object name=StaticHeadBobFilterObj
    end object
    StaticHeadBobFilter=StaticHeadBobFilterObj
    // Reference: SPCameraBlendSpeedFilter'Default__LPCameraModeLedgeWalk.OffsetFilterObj'
    begin object name=OffsetFilterObj
    end object
    StaticOffsetFilter=OffsetFilterObj
    // Reference: SPCameraCollision'Default__LPCameraModeLedgeWalk.MainCameraCollisionObj'
    begin object name=MainCameraCollisionObj
    end object
    CameraCollisionMain=MainCameraCollisionObj
}