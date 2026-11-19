class LPCameraModeAimControlShoulder extends SPCameraModeAimControlShoulder;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurAnimInst;

// Export ULPCameraModeAimControlShoulder::execGetAllowFloatingAim(FFrame&, void* const)
native function GetAllowFloatingAim()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

function OnBecomeActive()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevCameraMode[8388609];
    local /*0x97E50000-0x00000000*/ private float ADS_GroundSpeed;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    super(SPCameraModeAimControlThirdPerson).OnBecomeActive(PrevCameraMode);
    // End:0x211
    if(CameraMgr.Targeting.TargetPawn != none)
    {
        LPPC = LPPlayerController(CameraMgr.Targeting.TargetPawn.Controller);
        // End:0x211
        if(LPPC != none)
        {
            LPPC.NotifyIsAimingDownSight(true);
            LPPC.NotifyShoulderAimCameraActive();
            ADS_GroundSpeed = LPPC.MyBasePlayerPawn.TuneDataBasePawn.ADS_GroundSpeed;
            LPPC.MyBasePlayerPawn.SetMaxSpeedScale(ADS_GroundSpeed / LPPC.MyBasePlayerPawn.GroundSpeed);
            // End:0x211
            if(LPPC.IsLocalPlayerController())
            {
                LPPC.MyBasePlayerPawn.SetDepthPriorityGroup(2);
            }
        }
    }
    //return;    
}

function OnBecomeInActive()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewCameraMode[8388609], LPPC;

    super(SPCameraMode).OnBecomeInActive(NewCameraMode);
    // End:0x4D
    if(CurAnimInst != none)
    {
        CurAnimInst.Stop();
        CurAnimInst = none;
    }
    // End:0x1E8
    if(CameraMgr.Targeting.TargetPawn != none)
    {
        LPPC = LPPlayerController(CameraMgr.Targeting.TargetPawn.Controller);
        // End:0x1E8
        if(LPPC != none)
        {
            LPPC.NotifyIsAimingDownSight(false);
            LPPC.MyBasePlayerPawn.SetMaxSpeedScale(1.0000000);
            LPPC.NotifyShoulderAimCameraInactive();
            LPPC.SetTimer(0.0300000, false, 'UpdateAimDownSight');
            // End:0x1E8
            if(LPPC.IsLocalPlayerController())
            {
                LPPC.MyBasePlayerPawn.SetDepthPriorityGroup(1);
            }
        }
    }
    //return;    
}

function ShouldBlendEyeLocation()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return ((bIsRollingOrDodging) ? true : false);
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: SPCameraBlendLowPassFilter'Default__LPCameraModeAimControlShoulder.LocationFilterObj'
    begin object name=LocationFilterObj
    end object
    StaticLocationFilter=LocationFilterObj
    // Reference: SPCameraBlendLowPassFilter'Default__LPCameraModeAimControlShoulder.RadiusFilterObj'
    begin object name=RadiusFilterObj
    end object
    StaticRadiusFilter=RadiusFilterObj
    // Reference: SPCameraBlendLowPass2Filter'Default__LPCameraModeAimControlShoulder.FOVFilterObj2'
    begin object name=FOVFilterObj2
    end object
    StaticFOVFilter=FOVFilterObj2
    // Reference: SPCameraBlendLowPassFilter'Default__LPCameraModeAimControlShoulder.SprintLocalOffsetFilterObj'
    begin object name=SprintLocalOffsetFilterObj
    end object
    StaticSprintLocalOffsetFilter=SprintLocalOffsetFilterObj
    // Reference: SPCameraBlendLowPassFilter'Default__LPCameraModeAimControlShoulder.SprintFOVFilterObj'
    begin object name=SprintFOVFilterObj
    end object
    StaticSprintFOVFilter=SprintFOVFilterObj
    // Reference: SPCameraBlendLowPassFilter'Default__LPCameraModeAimControlShoulder.RollLocalOffsetFilterObj'
    begin object name=RollLocalOffsetFilterObj
    end object
    StaticRollLocalOffsetFilter=RollLocalOffsetFilterObj
    // Reference: SPCameraBlendLowPassFilter'Default__LPCameraModeAimControlShoulder.RollFOVFilterObj'
    begin object name=RollFOVFilterObj
    end object
    StaticRollFOVFilter=RollFOVFilterObj
    // Reference: SPCameraBlendLowPass2Filter'Default__LPCameraModeAimControlShoulder.StaticSmoothOffsetFilterObj2'
    begin object name=StaticSmoothOffsetFilterObj2
    end object
    StaticSmoothOffsetFilter=StaticSmoothOffsetFilterObj2
    // Reference: SPCameraBlendLowPass2Filter'Default__LPCameraModeAimControlShoulder.StaticHeadBobFilterObj'
    begin object name=StaticHeadBobFilterObj
    end object
    StaticHeadBobFilter=StaticHeadBobFilterObj
    // Reference: SPCameraBlendSpeedFilter'Default__LPCameraModeAimControlShoulder.OffsetFilterObj'
    begin object name=OffsetFilterObj
    end object
    StaticOffsetFilter=OffsetFilterObj
    AdjustViewSoAimGoesThroughTargetAimCollisionPointEnablerMask=2
    // Reference: SPCameraCollision'Default__LPCameraModeAimControlShoulder.MainCameraCollisionObj'
    begin object name=MainCameraCollisionObj
    end object
    CameraCollisionMain=MainCameraCollisionObj
}