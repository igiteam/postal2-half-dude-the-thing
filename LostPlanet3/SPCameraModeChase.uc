class SPCameraModeChase extends SPCameraMode
    abstract;

var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL ChaseParams;
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private bool bCameraAvoidWorld[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL StaticLocationFilter[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL StaticRotationFilter[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL StaticFOVFilter[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL StaticOffsetFilter[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL StaticCollideFilter[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL StaticRadiusFilter[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL OldTargetVelocity[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private float TimeTilSwitchSides[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL CollideOffset[536870913];

// Export USPCameraModeChase::execHasCameraBasedMovement(FFrame&, void* const)
native function HasCameraBasedMovement()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPCameraModeChase::execGetPawnRotationType(FFrame&, void* const)
native function GetPawnRotationType()
{
    local /*0x043A0000-0x00000000*/ private byte ReturnValue[92274689];


}

function OnBecomeActive()
{
    local /*0x043A0000-0x00000000*/ private @NULL PrevCameraMode[8388609];

    super.OnBecomeActive(PrevCameraMode);
    Rig.Reset();
    Rig.LocationFilter = StaticLocationFilter;
    StaticLocationFilter.Rate = ChaseParams.FilterRateLocation;
    Rig.RotationFilter = StaticRotationFilter;
    StaticRotationFilter.Rate = ChaseParams.FilterRateRotation;
    Rig.FOVFilter = StaticFOVFilter;
    StaticFOVFilter.Rate = ChaseParams.FilterRateFOV;
    Rig.RadiusFilter = StaticRadiusFilter;
    StaticRadiusFilter.Rate = ChaseParams.FilterRateRadius;
    Rig.OffsetFilter = StaticOffsetFilter;
    StaticOffsetFilter.Rate = ChaseParams.FilterRateOffset;
    //return;    
}

function OnBecomeInActive()
{
    local /*0x043A0000-0x00000000*/ private @NULL NewCameraMode[8388609];

    super.OnBecomeInActive(NewCameraMode);
    //return;    
}

function InitPendingMode()
{
    local /*0x043A0000-0x00000000*/ private @NULL PendingModeParam[8388609];

    super.InitPendingMode(PendingModeParam);
    ChaseParams = SPCameraModeChaseParam(PendingModeParam.ModeParam);
    //return;    
}

simulated function GetCameraRigBase()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689], veladjustloc, NewTargetVelocity;

    // End:0xF4
    if((!bIgnoreBlend && CameraMgr.Targeting.Target != none) && int(CameraMgr.Targeting.Target.Physics) != int(2))
    {
        NewTargetVelocity = CameraMgr.Targeting.Target.Velocity;        
    }
    else
    {
        NewTargetVelocity = vect(0.0000000, 0.0000000, 0.0000000);
    }
    // End:0x163
    if(!bIgnoreBlend)
    {
        NewTargetVelocity = Class'SPCameraBlend'.static.LowPassVector(OldTargetVelocity, NewTargetVelocity, 1.0000000, DeltaTime);
    }
    veladjustloc = NewTargetVelocity * ChaseParams.LocPredictVelocityScale;
    OldTargetVelocity = NewTargetVelocity;
    return super.GetCameraRigBase(DeltaTime) + veladjustloc;
    //return ReturnValue;    
}

simulated function GetLookInfluences()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689], LookDir, PlayerVelocity;
    local /*0x043A0000-0x00000000*/ private float PlayerSpeed, tocamdot;
    local /*0x043A0000-0x00000000*/ private @NULL looksph;
    local /*0x043A0000-0x00000000*/ private float TowardCameraLimitDot;

    // End:0x254
    if(CameraMgr.Targeting.Target != none)
    {
        PlayerVelocity = CameraMgr.Targeting.Target.Velocity;
        PlayerSpeed = VSize2D(PlayerVelocity);
        // End:0x254
        if(PlayerSpeed > 100.0000000)
        {
            TowardCameraLimitDot = Cos(ChaseParams.TowardCameraLimitAngle * 0.0174533);
            tocamdot = CFD.IdealVT.CameraForward() Dot PlayerVelocity;
            // End:0x254
            if(tocamdot >= (TowardCameraLimitDot * PlayerSpeed))
            {
                LookDir = PlayerVelocity * ChaseParams.FollowYawStrength;
                looksph = CartesianToSpherical(LookDir);
                // End:0x1FC
                if(tocamdot < 0.0000000)
                {
                    looksph.Radius *= (float(1) - (tocamdot / (TowardCameraLimitDot * PlayerSpeed)));
                }
                looksph.Pitch = ChaseParams.CenterPitch;
                LookDir = SphericalToCartesian(looksph);
            }
        }
    }
    return LookDir + super.GetLookInfluences(DeltaTime);
    //return ReturnValue;    
}

simulated function UpdateViewTarget()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL PlayerVelocity;
    local /*0x043A0000-0x00000000*/ private float PlayerSpeed;
    local /*0x043A0000-0x00000000*/ private @NULL neworbit;

    CFD.CheckValid();
    super.UpdateViewTarget(DeltaTime);
    CFD.CheckValid();
    // End:0x8C
    if(CameraMgr.Targeting.Target == none)
    {
        return;
    }
    CameraMgr.Targeting.Params.LookAroundCenterYaw = CameraMgr.Targeting.TargetYaw() + 180.0000000;
    neworbit = CFD.IdealVT.Orbit;
    neworbit.Radius = ChaseParams.Radius;
    PlayerVelocity = CameraMgr.Targeting.Target.Velocity;
    PlayerSpeed = VSize2D(PlayerVelocity);
    // End:0x25F
    if(PlayerSpeed > 1.0000000)
    {
        neworbit.Radius += (ChaseParams.RadiusAddSprinting * Square(FMin(PlayerSpeed * 0.0020000, 1.0000000)));
    }
    CFD.IdealVT.Orbit = neworbit;
    CFD.CheckValid();
    //return;    
}

simulated function GetDesiredLocalOffset()
{
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];

    return ChaseParams.TargetOffset;
    //return ReturnValue;    
}

simulated function GetOffset()
{
    local /*0x043A0000-0x00000000*/ private @NULL Ofs, oldofs;
    local /*0x043A0000-0x00000000*/ private float angledelta, signtest;

    Ofs = GetDesiredLocalOffset();
    // End:0x286
    if(ChaseParams.bEnableTargetOffsetShoulderSwitch)
    {
        oldofs = CFD.CurrentVT.Offset;
        angledelta = Abs(NormalizeAngle((CameraMgr.Targeting.TargetYaw() - Rig.Orbit.Yaw) - 90.0000000)) - 90.0000000;
        signtest = ((((ChaseParams.bTargetOffsetTransitionOnlyIfMoving && CameraMgr.Targeting.Target != none) && VSizeSq2D(CameraMgr.Targeting.Target.Velocity) < 5.0000000) || Abs(angledelta) < ChaseParams.TargetOffsetTransitionDeadZoneDegrees) ? oldofs.Y : angledelta);
        // End:0x286
        if((signtest * Ofs.Y) < 0.0000000)
        {
            Ofs.Y = -Ofs.Y;
        }
    }
    CFD.IdealVT.Offset = Ofs;
    //return;    
}

private final function TestClosestPoints()
{
    local /*0x043A0000-0x00000000*/ private @NULL Test, Result;

    Test = CFD.IdealVT.Location;
    // End:0x79
    if(Class'SPEngine.SPProbe'.static.ScanClosestPoint(Test, 200.0000000, Result, none))
    {
    }
    //return;    
}

static simulated function CameraAvoidWorld()
{
    local /*0x043A0000-0x00000000*/ private @NULL VT[25165825];
    local /*0x043A0000-0x00000000*/ private float Radius[8388609], Scale;
    local /*0x043A0000-0x00000000*/ private @NULL TargetLoc[8388609], toobstacles, avoidcollide;
    local /*0x043A0000-0x00000000*/ private float D, camcollideradius, NearPlane;
    local /*0x043A0000-0x00000000*/ private @NULL CamLoc;

    NearPlane = Class'SPEngine.SPUtil'.static.GetNearPlane();
    camcollideradius = Radius + NearPlane;
    CamLoc = VT.CameraLoc() + (Vector(VT.Rotation) * camcollideradius);
    // End:0xDD
    if(Class'SPEngine.SPProbe'.static.ScanClosestPoint(CamLoc, camcollideradius, toobstacles, none))
    {
    }
    D = VSizeSq(toobstacles);
    // End:0x1F8
    if(D > 0.0000000)
    {
        // End:0x1F8
        if(D < Square(camcollideradius))
        {
            D = Sqrt(D);
            avoidcollide = toobstacles * ((D - camcollideradius) / D);
            avoidcollide = Class'SPEngine.SPUtil'.static.RemoveSignedVectorComponent(avoidcollide, CamLoc - TargetLoc);
            VT.CollideOffset += (avoidcollide << VT.OffsetRot());
        }
    }
    //return;    
}

simulated function DontCollideViewTargets()
{
    CollideOffset = vect(0.0000000, 0.0000000, 0.0000000);
    //return;    
}

simulated function CollideViewTargets()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    return CFD.IdealVT.Collide(CameraMgr.Targeting.Target, DeltaTime);
    //return ReturnValue;    
}

simulated function FinalConstraints()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private bool collided[9437185];

    false
    super.FinalConstraints(DeltaTime, collided);
    Rig.Location = CFD.DesiredVT.Location + ClampLength(Rig.Location - CFD.DesiredVT.Location, ChaseParams.MaxRigBaseDist);
    Rig.Orbit.Radius = FMin(Rig.Orbit.Radius, ChaseParams.MaxRadius);
    LimitPitch(DeltaTime);
    //return;    
}

simulated function LimitPitch()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609], PitchMin, PitchMax;

    // End:0x75
    if(CameraMgr.IsCheatFlying())
    {
        PitchMin = ChaseParams.DebugPitchMin;
        PitchMax = ChaseParams.DebugPitchMax;        
    }
    else
    {
        // End:0x15F
        if((CameraMgr.Targeting.Target != none) && VSizeSq2D(CameraMgr.Targeting.Target.Velocity) > 1.0000000)
        {
            PitchMin = ChaseParams.PitchMin;
            PitchMax = ChaseParams.PitchMax;            
        }
        else
        {
            PitchMin = ChaseParams.DebugPitchMin;
            PitchMax = ChaseParams.DebugPitchMax;
        }
    }
    PitchMin = float(Min(Max(int(PitchMin), 0), 180));
    PitchMax = float(Min(Max(int(PitchMax), int(PitchMin)), 180));
    Rig.PitchMin = PitchMin;
    Rig.PitchMax = PitchMax;
    Rig.EnforceLimits(DeltaTime);
    //return;    
}

function RecenterCamera()
{
    local /*0x043A0000-0x00000000*/ private @NULL SavedVT[25165825];
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x043A0000-0x00000000*/ private @NULL Ofs;

    // End:0x39
    if(CameraMgr.Targeting.IsTargetUnconscious())
    {
        return false;
    }
    CameraMgr.Targeting.ResetLook();
    SavedVT.CopyFrom(CFD.IdealVT);
    SavedVT.Location = CameraMgr.Targeting.Current.eyeLoc;
    SavedVT.Orbit = CartesianToSpherical(CameraMgr.Targeting.TargetForward() * SavedVT.Orbit.Radius);
    SavedVT.Orbit.Pitch = ChaseParams.CenterPitch;
    Ofs = GetDesiredLocalOffset();
    // End:0x2BB
    if(ChaseParams.bEnableTargetOffsetShoulderSwitch && (SavedVT.Offset.Y * Ofs.Y) > 0.0000000)
    {
        Ofs.Y = -Ofs.Y;
    }
    SavedVT.Offset = Ofs;
    SavedVT.Rotation = SphericalToRotator(SavedVT.Orbit);
    SavedVT.CheckValid();
    SavedVT.Collide(CameraMgr.Targeting.Target, 1.0000000);
    SavedVT.CheckValid();
    return true;
    //return ReturnValue;    
}

simulated function DisplayDebug()
{
    local /*0x043A0000-0x00000000*/ private @NULL HUD[8388609];
    local /*0x043A0000-0x00000000*/ private float out_YL[25165825], out_YPos;

    super.DisplayDebug(HUD, out_YL, out_YPos);
    out_YPos = HUD.Canvas.CurY;
    //return;    
}

defaultproperties
{
    bCameraAvoidWorld=true
    // Reference: SPCameraBlendLowPassFilter'Default__SPCameraModeChase.LocationFilterObj'
    begin object name=LocationFilterObj class=Class'SPCameraBlendLowPassFilter'
    end object
    StaticLocationFilter=LocationFilterObj
    // Reference: SPCameraBlendLowPassFilter'Default__SPCameraModeChase.RotationFilterObj'
    begin object name=RotationFilterObj class=Class'SPCameraBlendLowPassFilter'
    end object
    StaticRotationFilter=RotationFilterObj
    // Reference: SPCameraBlendSpeedFilter'Default__SPCameraModeChase.FOVFilterObj'
    begin object name=FOVFilterObj class=Class'SPCameraBlendSpeedFilter'
    end object
    StaticFOVFilter=FOVFilterObj
    // Reference: SPCameraBlendSpeedFilter'Default__SPCameraModeChase.OffsetFilterObj'
    begin object name=OffsetFilterObj class=Class'SPCameraBlendSpeedFilter'
    end object
    StaticOffsetFilter=OffsetFilterObj
    // Reference: SPCameraBlendLowPassFilter'Default__SPCameraModeChase.CollideFilterObj'
    begin object name=CollideFilterObj class=Class'SPCameraBlendLowPassFilter'
    end object
    StaticCollideFilter=CollideFilterObj
    // Reference: SPCameraBlendLowPassFilter'Default__SPCameraModeChase.RadiusFilterObj'
    begin object name=RadiusFilterObj class=Class'SPCameraBlendLowPassFilter'
    end object
    StaticRadiusFilter=RadiusFilterObj
}