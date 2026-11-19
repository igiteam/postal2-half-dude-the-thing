class SPCameraModeZoomToTarget extends SPCameraMode;

var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL ZoomToTargetParams;
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL Position[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL LookAtTarget[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL FOVFilter[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private float TimeSinceActivated[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private float TimeBeforeZoomActivates[536870913];

function InitPendingMode()
{
    local /*0x043A0000-0x00000000*/ private @NULL PendingModeParam[8388609];

    super.InitPendingMode(PendingModeParam);
    ZoomToTargetParams = SPCameraModeZoomToTargetParam(PendingModeParam.ModeParam);
    // End:0xA1
    if(ZoomToTargetParams != none)
    {
        Position = ZoomToTargetParams.Position;
        LookAtTarget = ZoomToTargetParams.LookAtTarget;
    }
    //return;    
}

function OnBecomeActive()
{
    local /*0x043A0000-0x00000000*/ private @NULL PrevCameraMode[8388609];
    local /*0x043A0000-0x00000000*/ private float currentFOV;

    super.OnBecomeActive(PrevCameraMode);
    Rig.LocationFilter = none;
    Rig.RotationFilter = none;
    TimeSinceActivated = 0.0000000;
    // End:0x210
    if(ZoomToTargetParams != none)
    {
        // End:0xF9
        if((ZoomToTargetParams.UsePreviousCamerasPosition == true) && CFD.PreviousVT != none)
        {
            Position = CFD.PreviousVT.Location;
        }
        Rig.FOVFilter = FOVFilter;
        FOVFilter.Rate = ZoomToTargetParams.FilterRateFOV;
        currentFOV = CameraMgr.ViewTarget.POV.FOV;
        // End:0x1E8
        if((LookAtTarget != none) && (CalculateDesiredFOV()) > currentFOV)
        {
            TimeBeforeZoomActivates /= 3.0000000;            
        }
        else
        {
            TimeBeforeZoomActivates = ZoomToTargetParams.TimeBeforeZoomActivates;
        }
    }
    // End:0x271
    if(LookAtTarget == none)
    {
        Rig.Orbit = CFD.PreviousVT.Orbit;
    }
    //return;    
}

simulated function AllowLookAround()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function GetCameraRigBase()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];

    return CFD.CurrentVT.Location;
    //return ReturnValue;    
}

simulated function UpdateViewTarget()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL Direction;
    local /*0x043A0000-0x00000000*/ private float NewFOV;

    super.UpdateViewTarget(DeltaTime);
    TimeSinceActivated += DeltaTime;
    CFD.IdealVT.Location = Position;
    // End:0x179
    if(LookAtTarget != none)
    {
        Direction = LookAtTarget.Location - Position;
        Direction = Normal(Direction);
        CFD.IdealVT.Orbit = CartesianToSpherical(Direction);
        // End:0x179
        if(ZoomToTargetParams != none)
        {
            // End:0x179
            if(TimeSinceActivated >= TimeBeforeZoomActivates)
            {
                NewFOV = CalculateDesiredFOV();
                CFD.IdealVT.FOV = NewFOV;
            }
        }
    }
    //return;    
}

function CalculateDesiredFOV()
{
    local /*0x043A0000-0x00000000*/ private float ReturnValue[92274689], NewFOV, BorderAtMaxZoom;

    // End:0xED
    if(ZoomToTargetParams != none)
    {
        BorderAtMaxZoom = ZoomToTargetParams.BorderSizeAsFractionOfFOV;
        NewFOV = CalculateFOVToFrameActor(Position, LookAtTarget, CameraMgr.Targeting.AspectRatio, BorderAtMaxZoom);
        NewFOV = FClamp(NewFOV, ZoomToTargetParams.MinimumFOV, ZoomToTargetParams.MaximumFOV);        
    }
    else
    {
        NewFOV = 75.0000000;
    }
    return NewFOV;
    //return ReturnValue;    
}

simulated function CalculateFOVToFrameActor()
{
    local /*0x043A0000-0x00000000*/ private @NULL CameraPosition[8388609], Target;
    local /*0x043A0000-0x00000000*/ private float AspectRatio[8388609], BorderSizeAsFractionOfFOV, ReturnValue, TargetDistance, RadiusToFitHorizontally, TargetCylinderHeight,
	    TargetCylinderRadius, PerfectFitFOV, FinalFOV;

    1.0000000
    Target.GetBoundingCylinder(TargetCylinderRadius, TargetCylinderHeight);
    TargetDistance = CalculateFocusingDistance(CameraPosition, Target, 300.0000000);
    RadiusToFitHorizontally = FMax(TargetCylinderRadius, TargetCylinderHeight);
    // End:0xAA
    if(AspectRatio > 1.0000000)
    {
        RadiusToFitHorizontally *= AspectRatio;
    }
    // End:0xCA
    if(TargetDistance == float(0))
    {
        TargetDistance = 0.0010000;
    }
    PerfectFitFOV = 2.0000000 * Atan(RadiusToFitHorizontally / TargetDistance);
    FinalFOV = PerfectFitFOV * BorderSizeAsFractionOfFOV;
    FinalFOV *= 57.2957800;
    return FinalFOV;
    //return ReturnValue;    
}

// Export USPCameraModeZoomToTarget::execCalculateFocusingDistance(FFrame&, void* const)
native simulated function CalculateFocusingDistance()
{
    local /*0x043A0000-0x00000000*/ private @NULL CameraPosition[8388609], Target;
    local /*0x043A0000-0x00000000*/ private float ThresholdDeltaForReducedDistance[8388609], ReturnValue;


}

simulated function CollideViewTargets()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: SPCameraBlendSpeedFilter'Default__SPCameraModeZoomToTarget.FOVFilterObj'
    begin object name=FOVFilterObj class=Class'SPCameraBlendSpeedFilter'
    end object
    FOVFilter=FOVFilterObj
}