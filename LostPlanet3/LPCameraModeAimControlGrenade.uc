class LPCameraModeAimControlGrenade extends SPCameraModeAimControlShoulder;

function OnBecomeActive()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevCameraMode[8388609], LPPC;
    local /*0x97E50000-0x00000000*/ private float Grenade_GroundSpeed;

    super(SPCameraModeAimControlThirdPerson).OnBecomeActive(PrevCameraMode);
    LPPC = LPPlayerController(CameraMgr.Targeting.TargetPawn.Controller);
    // End:0x141
    if(LPPC != none)
    {
        Grenade_GroundSpeed = LPPC.MyBasePlayerPawn.TuneDataBasePawn.Grenade_GroundSpeed;
        LPPC.MyBasePlayerPawn.SetMaxSpeedScale(Grenade_GroundSpeed / LPPC.MyBasePlayerPawn.GroundSpeed);
    }
    //return;    
}

function OnBecomeInActive()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewCameraMode[8388609], LPPC;

    super(SPCameraMode).OnBecomeInActive(NewCameraMode);
    LPPC = LPPlayerController(CameraMgr.Targeting.TargetPawn.Controller);
    // End:0x1EA
    if(LPPC != none)
    {
        LPPC.MyBasePlayerPawn.SetMaxSpeedScale(1.0000000);
        // End:0x1C2
        if(((LPPlayerPawn(LPPC.Pawn).GetGrenade() != none) && LPPC.MyBasePlayerPawn.IsDoingSpecialMove_OF_Class(Class'LPSM_GrenadePrime')) && (NewCameraMode.Class == Class'LPCameraModeAimControlThirdPerson') || NewCameraMode.Class == Class'LPCameraModeAimControlCrouch')
        {
            LPPC.SetTimer(0.0300000, false, 'SetGrenadeCam');            
        }
        else
        {
            LPPC.SetTimer(0.0300000, false, 'UpdateAimDownSight');
        }
    }
    //return;    
}

defaultproperties
{
    // Reference: SPCameraBlendLowPassFilter'Default__LPCameraModeAimControlGrenade.LocationFilterObj'
    begin object name=LocationFilterObj
    end object
    StaticLocationFilter=LocationFilterObj
    // Reference: SPCameraBlendLowPassFilter'Default__LPCameraModeAimControlGrenade.RadiusFilterObj'
    begin object name=RadiusFilterObj
    end object
    StaticRadiusFilter=RadiusFilterObj
    // Reference: SPCameraBlendLowPass2Filter'Default__LPCameraModeAimControlGrenade.FOVFilterObj2'
    begin object name=FOVFilterObj2
    end object
    StaticFOVFilter=FOVFilterObj2
    // Reference: SPCameraBlendLowPassFilter'Default__LPCameraModeAimControlGrenade.SprintLocalOffsetFilterObj'
    begin object name=SprintLocalOffsetFilterObj
    end object
    StaticSprintLocalOffsetFilter=SprintLocalOffsetFilterObj
    // Reference: SPCameraBlendLowPassFilter'Default__LPCameraModeAimControlGrenade.SprintFOVFilterObj'
    begin object name=SprintFOVFilterObj
    end object
    StaticSprintFOVFilter=SprintFOVFilterObj
    // Reference: SPCameraBlendLowPassFilter'Default__LPCameraModeAimControlGrenade.RollLocalOffsetFilterObj'
    begin object name=RollLocalOffsetFilterObj
    end object
    StaticRollLocalOffsetFilter=RollLocalOffsetFilterObj
    // Reference: SPCameraBlendLowPassFilter'Default__LPCameraModeAimControlGrenade.RollFOVFilterObj'
    begin object name=RollFOVFilterObj
    end object
    StaticRollFOVFilter=RollFOVFilterObj
    // Reference: SPCameraBlendLowPass2Filter'Default__LPCameraModeAimControlGrenade.StaticSmoothOffsetFilterObj2'
    begin object name=StaticSmoothOffsetFilterObj2
    end object
    StaticSmoothOffsetFilter=StaticSmoothOffsetFilterObj2
    // Reference: SPCameraBlendLowPass2Filter'Default__LPCameraModeAimControlGrenade.StaticHeadBobFilterObj'
    begin object name=StaticHeadBobFilterObj
    end object
    StaticHeadBobFilter=StaticHeadBobFilterObj
    // Reference: SPCameraBlendSpeedFilter'Default__LPCameraModeAimControlGrenade.OffsetFilterObj'
    begin object name=OffsetFilterObj
    end object
    StaticOffsetFilter=OffsetFilterObj
    // Reference: SPCameraCollision'Default__LPCameraModeAimControlGrenade.MainCameraCollisionObj'
    begin object name=MainCameraCollisionObj
        Data=(CollisionFeelers=/* Array type was not detected. */)
    end object
    CameraCollisionMain=MainCameraCollisionObj
}