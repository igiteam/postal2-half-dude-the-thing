class SPCameraModeDirector extends SPCameraMode
    abstract;

var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL DirectorParams;
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL PositionTarget[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL LookAtTarget[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL ControlTarget[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL StaticLocationFilter[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL StaticRotationFilter[536870913];

// Export USPCameraModeDirector::execHasCameraBasedMovement(FFrame&, void* const)
native function HasCameraBasedMovement()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPCameraModeDirector::execGetPawnRotationType(FFrame&, void* const)
native function GetPawnRotationType()
{
    local /*0x043A0000-0x00000000*/ private byte ReturnValue[92274689];


}

simulated event Destroyed()
{
    super.Destroyed();
    ClearParamRefs();
    //return;    
}

function InitPendingMode()
{
    local /*0x043A0000-0x00000000*/ private @NULL PendingModeParam[8388609];

    super.InitPendingMode(PendingModeParam);
    DirectorParams = SPCameraModeDirectorParam(PendingModeParam.ModeParam);
    // End:0x183
    if(DirectorParams != none)
    {
        PositionTarget = DirectorParams.PositionTarget;
        LookAtTarget = DirectorParams.LookAtTarget;
        ControlTarget = DirectorParams.ControlTarget;
        // End:0xDB
        if(PositionTarget == none)
        {            
        }
        else
        {
            // End:0x183
            if(PositionTarget.IsA('SplineActor'))
            {
                // End:0x137
                if(SplineActor(PositionTarget).Connections.Length != 1)
                {
                    PositionTarget = none;
                }
                // End:0x183
                if(LookAtTarget == none)
                {
                    LookAtTarget = CameraMgr.Targeting.Target;
                }
            }
        }
    }
    //return;    
}

function OnBecomeActive()
{
    local /*0x043A0000-0x00000000*/ private @NULL PrevCameraMode[8388609];

    super.OnBecomeActive(PrevCameraMode);
    Rig.Reset();
    Rig.LocationFilter = StaticLocationFilter;
    StaticLocationFilter.Rate = DirectorParams.FilterRateLocation;
    Rig.RotationFilter = StaticRotationFilter;
    StaticRotationFilter.Rate = DirectorParams.FilterRateRotation;
    //return;    
}

function OnBecomeInActive()
{
    local /*0x043A0000-0x00000000*/ private @NULL NewCameraMode[8388609];

    super.OnBecomeInActive(NewCameraMode);
    //return;    
}

function ClearParamRefs()
{
    super.ClearParamRefs();
    PositionTarget = none;
    LookAtTarget = none;
    ControlTarget = none;
    DirectorParams.ControlTarget = none;
    //return;    
}

simulated function AllowLookAround()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    return (DirectorParams.LookPitchDelta > 0.0000000) || DirectorParams.LookYawDelta > 0.0000000;
    //return ReturnValue;    
}

simulated function GetCameraRigBase()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689], posspline, tgtspline, ctrlspline;
    local /*0x043A0000-0x00000000*/ private float ctrlpct;
    local /*0x043A0000-0x00000000*/ private @NULL Pt, tgt, Delta;

    // End:0x1D
    if(PositionTarget == none)
    {
        return vect(0.0000000, 0.0000000, 0.0000000);
    }
    tgt = CameraMgr.Targeting;
    posspline = SPSplineActor(PositionTarget);
    tgtspline = SPSplineActor(LookAtTarget);
    ctrlspline = SPSplineActor(ControlTarget);
    UpdateViewTarget(DeltaTime);
    Pt = Pawn(tgt.Target);
    // End:0x164
    if(((tgtspline == none) && LookAtTarget != none) && (Pt == none) || LookAtTarget != Pt.Controller)
    {
        tgt.SetTarget(LookAtTarget);
    }
    // End:0x2EF
    if(posspline != none)
    {
        // End:0x1BC
        if(LookAtTarget == none)
        {
            LookAtTarget = tgt.Target;
            // End:0x1B9
            if(LookAtTarget == none)
            {
            }            
        }
        else
        {
            // End:0x25D
            if(ctrlspline != none)
            {
                ctrlpct = ctrlspline.IndexNearestPoint(tgt.TargetEyeLoc());
                Rig.Location = posspline.GetPointAtIndex(ctrlpct);                
            }
            else
            {
                ctrlpct = posspline.IndexNearestPoint(tgt.TargetEyeLoc());
                Rig.Location = posspline.GetPointAtIndex(ctrlpct);
            }
        }        
    }
    else
    {
        Rig.Location = PositionTarget.Location;
        // End:0x383
        if(LookAtTarget == none)
        {
            Rig.Orbit = RotatorToSpherical(PositionTarget.Rotation);
        }
    }
    // End:0x3D9
    if(tgtspline != none)
    {
        Rig.LookAt(tgtspline.GetPointAtIndex(ctrlpct));
    }
    // End:0x4B0
    if(LookAtTarget != none)
    {
        Delta = tgt.TargetEyeLoc() - Rig.RotateAround();
        // End:0x4B0
        if(VSizeSq(Delta) > 0.0000000)
        {
            Rig.Orbit = CartesianToSpherical(Delta);
            Rig.Orbit.Radius = 0.0000000;
        }
    }
    Rig.Orbit.Pitch = float(Clamp(int(Rig.Orbit.Pitch), int(DirectorParams.PitchMin), int(DirectorParams.PitchMax)));
    return Rig.Location;
    //return ReturnValue;    
}

simulated function SetTargetingLookaroundParams()
{
    local /*0x043A0000-0x00000000*/ private @NULL tgt;

    tgt = CameraMgr.Targeting;
    super.SetTargetingLookaroundParams();
    tgt.Params.LookAroundCenterYaw = Rig.Orbit.Yaw;
    tgt.Params.LookAroundClampYaw = FMin(Params.LookAroundClampYaw, DirectorParams.LookYawDelta);
    tgt.Params.LookAroundPitchMinimum = FMax(Rig.Orbit.Pitch - DirectorParams.LookPitchDelta, Params.LookAroundPitchMinimum);
    tgt.Params.LookAroundPitchMaximum = FMin(Rig.Orbit.Pitch + DirectorParams.LookPitchDelta, Params.LookAroundPitchMaximum);
    tgt.DefaultLookDirection = Rig.CameraOrbitForward();
    tgt.Params.bUseSelfCentering = DirectorParams.bUseSelfCentering;
    //return;    
}

simulated function PerformLookaround()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];

    // End:0xC6
    if(DirectorParams.bUseSelfCentering)
    {
        CameraMgr.Targeting.DirectorLookAround(DeltaTime, DirectorParams.FilterRateLookAround, vect2d(DirectorParams.LookYawDelta, DirectorParams.LookPitchDelta));        
    }
    else
    {
        CameraMgr.Targeting.LookAround(DeltaTime);
    }
    //return;    
}

simulated function UpdateViewTarget()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];

    //return;    
}

simulated function GetOffset()
{
    Rig.Offset = DirectorParams.TargetOffset;
    //return;    
}

simulated function GetLookInfluences()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];

    return SphericalToCartesian(MakeSpherical(0.0040000, Rig.Orbit.Yaw, Rig.Orbit.Pitch));
    //return ReturnValue;    
}

simulated function CollideViewTargets()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function FinalConstraints()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private bool collided[9437185];

    false
    CFD.CheckValid();
    //return;    
}

simulated function DoesRequireTarget()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: SPCameraBlendLowPassFilter'Default__SPCameraModeDirector.LocationFilterObj'
    begin object name=LocationFilterObj class=Class'SPCameraBlendLowPassFilter'
    end object
    StaticLocationFilter=LocationFilterObj
    // Reference: SPCameraBlendLowPassFilter'Default__SPCameraModeDirector.RotationFilterObj'
    begin object name=RotationFilterObj class=Class'SPCameraBlendLowPassFilter'
    end object
    StaticRotationFilter=RotationFilterObj
}