class SPCameraModeAimControl extends SPCameraMode
    abstract;

const AimAdjustment_OFF = 0;
const AimAdjustment_FirstPersonCamera = 1;
const AimAdjustment_ThirdPersonCamera = 2;

var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL AimParams;
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL RotationFromInput;
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL StaticOffsetFilter[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private bool bResetCameraBehindTarget;
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL TargetAimCollisionPointOnActivation[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private float AdjustViewSoAimGoesThroughTargetAimCollisionPointDuration;
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private float AdjustViewSoAimGoesThroughTargetAimCollisionPointTimeLeft[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private float AdjustViewSoAimGoesThroughTargetAimCollisionPointMinDistance;
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private int AdjustViewSoAimGoesThroughTargetAimCollisionPointEnablerMask;

// Export USPCameraModeAimControl::execGetScreenNormalizedXAimLimits(FFrame&, void* const)
native final simulated function GetScreenNormalizedXAimLimits()
{
    local /*0x043A0000-0x00000000*/ private float Min[25165825], Max;


}

// Export USPCameraModeAimControl::execGetScreenNormalizedYAimLimits(FFrame&, void* const)
native final simulated function GetScreenNormalizedYAimLimits()
{
    local /*0x043A0000-0x00000000*/ private float Min[25165825], Max;


}

// Export USPCameraModeAimControl::execApplyRotationConstraints(FFrame&, void* const)
native function ApplyRotationConstraints()
{
    local /*0x043A0000-0x00000000*/ private @NULL InRotation[8388609];
    local /*0x043A0000-0x00000000*/ private bool bPredicting[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USPCameraModeAimControl::execPredictInputAdjustedCameraViewPoint(FFrame&, void* const)
native final function PredictInputAdjustedCameraViewPoint()
{
    local /*0x043A0000-0x00000000*/ private @NULL OutLocation[25165825], OutRotation;


}

// Export USPCameraModeAimControl::execGetInputAdjustedCameraViewPoint(FFrame&, void* const)
native function GetInputAdjustedCameraViewPoint()
{
    local /*0x043A0000-0x00000000*/ private @NULL OutLocation[25165825], OutRotation;
    local /*0x043A0000-0x00000000*/ private bool bPredicting[9437185], bUseActualCameraLocation;

    false
    false                        
}

// Export USPCameraModeAimControl::execGetAllowFloatingAim(FFrame&, void* const)
native function GetAllowFloatingAim()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPCameraModeAimControl::execGetAllowableFloatingAimRegion(FFrame&, void* const)
native function GetAllowableFloatingAimRegion()
{
    local /*0x043A0000-0x00000000*/ private float MinX[25165825], MaxX, MinY, MaxY;


}

// Export USPCameraModeAimControl::execFilterFloatingAimToRotationYaw(FFrame&, void* const)
native function FilterFloatingAimToRotationYaw()
{
    local /*0x043A0000-0x00000000*/ private float CurrentScreenOffset[8388609], MinScreenOffset, MaxScreenOffset, ReturnValue;


}

// Export USPCameraModeAimControl::execFilterFloatingAimToRotationPitch(FFrame&, void* const)
native function FilterFloatingAimToRotationPitch()
{
    local /*0x043A0000-0x00000000*/ private float CurrentScreenOffset[8388609], MinScreenOffset, MaxScreenOffset, ReturnValue;


}

// Export USPCameraModeAimControl::execComputeDeltaRotationFromInput(FFrame&, void* const)
native function ComputeDeltaRotationFromInput()
{
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USPCameraModeAimControl::execHasCameraBasedMovement(FFrame&, void* const)
native function HasCameraBasedMovement()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPCameraModeAimControl::execNeedsInputBasisFiltering(FFrame&, void* const)
native function NeedsInputBasisFiltering()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPCameraModeAimControl::execGetAimAssistFrictionScaler(FFrame&, void* const)
native final simulated function GetAimAssistFrictionScaler()
{
    local /*0x043A0000-0x00000000*/ private float ReturnValue[92274689];


}

function ResetCameraBehindTarget()
{
    bResetCameraBehindTarget = true;
    TimeSinceLastLook = 0.0000000;
    AdjustViewSoAimGoesThroughTargetAimCollisionPointTimeLeft = 0.0000000;
    //return;    
}

function InitPendingMode()
{
    local /*0x043A0000-0x00000000*/ private @NULL PendingModeParam[8388609];

    super.InitPendingMode(PendingModeParam);
    AimParams = SPCameraModeAimControlParam(PendingModeParam.ModeParam);
    Rig.CameraCollisionMain = CameraCollisionMain;
    //return;    
}

function OnBecomeActive()
{
    local /*0x043A0000-0x00000000*/ private @NULL PrevCameraMode[8388609], TargetPawn, AimController, PrevCameraModeAimControl;

    super.OnBecomeActive(PrevCameraMode);
    TimeSinceLastLook = 0.0000000;
    CameraMgr.Targeting.Params.EyeSocket = AimParams.CameraSocket;
    CameraMgr.Targeting.Params.LookAroundClampYaw = AimParams.LookAroundClampYaw;
    CameraMgr.Targeting.Params.LookAroundPitchMinimum = AimParams.LookAroundPitchMinimum;
    CameraMgr.Targeting.Params.LookAroundPitchMaximum = AimParams.LookAroundPitchMaximum;
    Rig.PitchMin = AimParams.LookAroundPitchMinimum;
    Rig.PitchMax = AimParams.LookAroundPitchMaximum;
    AdjustViewSoAimGoesThroughTargetAimCollisionPointTimeLeft = 0.0000000;
    // End:0x25D
    if(PrevCameraMode == none)
    {
        bResetCameraBehindTarget = true;        
    }
    else
    {
        PrevCameraModeAimControl = SPCameraModeAimControl(PrevCameraMode);
        // End:0x44A
        if((PrevCameraModeAimControl != none) && (AdjustViewSoAimGoesThroughTargetAimCollisionPointEnablerMask & PrevCameraModeAimControl.AdjustViewSoAimGoesThroughTargetAimCollisionPointEnablerMask) != 0)
        {
            TargetPawn = CameraMgr.Targeting.TargetPawn;
            // End:0x44A
            if(TargetPawn != none)
            {
                AimController = TargetPawn.GetAimController();
                // End:0x44A
                if(AimController != none)
                {
                    TargetAimCollisionPointOnActivation = AimController.GetAimCollisionPoint();
                    // End:0x44A
                    if((((TargetAimCollisionPointOnActivation.X != float(0)) || TargetAimCollisionPointOnActivation.Y != float(0)) || TargetAimCollisionPointOnActivation.Z != float(0)) || AimController.GetAimCollisionActor() != none)
                    {
                        // End:0x44A
                        if(VSize(TargetAimCollisionPointOnActivation - TargetPawn.Location) > AdjustViewSoAimGoesThroughTargetAimCollisionPointMinDistance)
                        {
                            AdjustViewSoAimGoesThroughTargetAimCollisionPointTimeLeft = AdjustViewSoAimGoesThroughTargetAimCollisionPointDuration;
                        }
                    }
                }
            }
        }
    }
    //return;    
}

function IsCameraFirstPerson()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

event IsYawLockedToTarget()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    return IsCameraFirstPerson();
    //return ReturnValue;    
}

event IsPitchLockedToTarget()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    return IsCameraFirstPerson();
    //return ReturnValue;    
}

simulated function RecenterCamera()
{
    local /*0x043A0000-0x00000000*/ private @NULL SavedVT[25165825];
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function ResetFilters()
{
    CFD.Resync();
    //return;    
}

simulated function Update()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL FinalView, FinalViewLoc, tempViewTarget;
    local /*0x043A0000-0x00000000*/ private float tempFOV, TurnInput, LookInput;

    TimeSinceLastLook += DeltaTime;
    UpdateFilters(DeltaTime);
    CFD.IdealVT.CollideOffset = vect(0.0000000, 0.0000000, 0.0000000);
    GetInputAdjustedCameraViewPoint(FinalViewLoc, FinalView);
    ClearDeltaRotationFromInput();
    Rig.FOV = Params.DesiredFOV;
    Rig.Offset = GetDesiredLocalOffset();
    Rig.Location = FinalViewLoc;
    Rig.Rotation = FinalView;
    Rig.Orbit = RotatorToSpherical(FinalView);
    PostRigUpdate(DeltaTime);
    // End:0x1E6
    if((ShouldOrbitOverrideRotation()) == true)
    {
        Rig.Rotation = SphericalToRotator(Rig.Orbit);        
    }
    else
    {
        Rig.Orbit = RotatorToSpherical(Rig.Rotation);
    }
    CFD.DesiredVT.CopyFrom(CFD.IdealVT);
    Rig.EnforceLimits(DeltaTime);
    CFD.CheckValid();
    // End:0x2ED
    if(bIgnoreBlend)
    {
        ResetFilters();
        bIgnoreBlend = false;        
    }
    else
    {
        BlendViewTargets(DeltaTime);
    }
    CFD.CheckValid();
    // End:0x379
    if((ShouldOrbitOverrideRotation()) == true)
    {
        Rig.Rotation = SphericalToRotator(Rig.Orbit);        
    }
    else
    {
        Rig.Orbit = RotatorToSpherical(Rig.Rotation);
    }
    CFD.CheckValid();
    Rig.ConvertToTViewTarget(tempViewTarget);
    CameraMgr.ApplyCameraModifiers(DeltaTime, tempViewTarget.POV);
    // End:0x490
    if(CameraMgr.Targeting.IsTargetInGhostMode())
    {
        DontCollideViewTargets();        
    }
    else
    {
        tempFOV = Rig.FOV;
        Rig.FOV = float(Max(int(Rig.FOV), int(tempViewTarget.POV.FOV)));
        CollideViewTargets(DeltaTime);
        Rig.FOV = tempFOV;
    }
    CFD.CheckValid();
    // End:0x650
    if(AdjustViewSoAimGoesThroughTargetAimCollisionPointTimeLeft > 0.0000000)
    {
        CameraMgr.GetCameraRotationInput(TurnInput, LookInput);
        AdjustViewSoAimGoesThroughTargetAimCollisionPoint();
        AdjustViewSoAimGoesThroughTargetAimCollisionPointTimeLeft -= DeltaTime;
        // End:0x650
        if((DeltaTime > float(0)) && ((Abs(TurnInput) / DeltaTime) > float(500)) || (Abs(LookInput) / DeltaTime) > float(500))
        {
            AdjustViewSoAimGoesThroughTargetAimCollisionPointTimeLeft = 0.0000000;
        }
    }
    Rig.EnforceLimits(DeltaTime);
    CheckForTeleport();
    CFD.NextFrame();
    //return;    
}

function CalculateNearClippingPlaneExtents()
{
    local /*0x043A0000-0x00000000*/ private float HorizontalFOV[8388609], AspectRatio, outNearClipPlaneWidth, outNearClipPlaneHeight, NearClipPaneDist;

    NearClipPaneDist = Class'SPEngine.SPUtil'.static.GetNearPlane();
    outNearClipPlaneWidth = (2.0000000 * Tan((HorizontalFOV * 0.0174533) / 2.0000000)) * NearClipPaneDist;
    outNearClipPlaneHeight = outNearClipPlaneWidth / AspectRatio;
    //return;    
}

function AdjustViewSoAimGoesThroughTargetAimCollisionPoint()
{
    local /*0x043A0000-0x00000000*/ private @NULL NewCameraPos, DesiredAimDir, NormalizedCrosshairScreenOffset, CrosshairOffsetOnNearClipPlane;
    local /*0x043A0000-0x00000000*/ private float NearClipPlaneWidth, NearClipPlaneHeight, NearClipPaneDist;
    local /*0x043A0000-0x00000000*/ private @NULL CurrentAimDir, CurrentAimDirInCameraSpace, DeltaRotationBetweenCurrentAimAndDesiredAim, CurrentAimRotation, DesiredAimRotation, UpdatedViewRotation,
	    TargetPawn, AimController;

    local /*0x043A0000-0x00000000*/ private int IterationIdx;

    TargetPawn = CameraMgr.Targeting.TargetPawn;
    // End:0x4E
    if(TargetPawn == none)
    {
        return;
    }
    AimController = TargetPawn.GetAimController();
    // End:0x88
    if(AimController == none)
    {
        return;
    }
    // End:0xC3
    if(VSize(TargetAimCollisionPointOnActivation - TargetPawn.Location) <= AdjustViewSoAimGoesThroughTargetAimCollisionPointMinDistance)
    {
        return;
    }
    Rig.CheckValid();
    NearClipPaneDist = Class'SPEngine.SPUtil'.static.GetNearPlane();
    NormalizedCrosshairScreenOffset = AimController.GetNormalizedScreenOffset();
    CalculateNearClippingPlaneExtents(Rig.FOV, Rig.AspectRatio, NearClipPlaneWidth, NearClipPlaneHeight);
    CrosshairOffsetOnNearClipPlane.X = NormalizedCrosshairScreenOffset.X * NearClipPlaneWidth;
    CrosshairOffsetOnNearClipPlane.Y = NormalizedCrosshairScreenOffset.Y * NearClipPlaneHeight;
    CurrentAimDirInCameraSpace = SPMakeVector(NearClipPaneDist, CrosshairOffsetOnNearClipPlane.X, -CrosshairOffsetOnNearClipPlane.Y);
    CurrentAimDirInCameraSpace = Normal(CurrentAimDirInCameraSpace);
    IterationIdx = 0;
    J0x28B:

    // End:0x452 [Loop If]
    if(IterationIdx < 5)
    {
        NewCameraPos = Rig.CameraLoc();
        DesiredAimDir = Normal(TargetAimCollisionPointOnActivation - NewCameraPos);
        DesiredAimRotation = CartesianToSpherical(DesiredAimDir);
        CurrentAimDir = CurrentAimDirInCameraSpace >> Rig.Rotation;
        CurrentAimRotation = CartesianToSpherical(CurrentAimDir);
        DeltaRotationBetweenCurrentAimAndDesiredAim = Subtract_SphericalSpherical(DesiredAimRotation, CurrentAimRotation);
        UpdatedViewRotation = Add_SphericalSpherical(Rig.Orbit, DeltaRotationBetweenCurrentAimAndDesiredAim);
        Rig.Rotation = SphericalToRotator(UpdatedViewRotation);
        Rig.Orbit = UpdatedViewRotation;
        Rig.Orbit.Radius = 0.0000000;
        IterationIdx++;
        // [Loop Continue]
        goto J0x28B;
    }
    //return;    
}

simulated function ShouldOrbitOverrideRotation()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function PostRigUpdate()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];

    //return;    
}

function UpdateFilters()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL TargetPawn;

    TargetPawn = CameraMgr.Targeting.TargetPawn;
    Rig.OffsetFilter = StaticOffsetFilter;
    // End:0xD3
    if(TargetPawn != none)
    {
        StaticOffsetFilter.Rate = TargetPawn.AdjustFilterRate(AimParams.FilterRateOffset);        
    }
    else
    {
        StaticOffsetFilter.Rate = AimParams.FilterRateOffset;
    }
    //return;    
}

simulated function GetDesiredLocalOffset()
{
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689], WorldInfo;

    // End:0xA8
    if(AimParams.UseMPOverrideForLocation == true)
    {
        WorldInfo = Class'Engine.WorldInfo'.static.GetWorldInfo();
        // End:0xA8
        if((WorldInfo != none) && int(WorldInfo.NetMode) != int(NM_Standalone))
        {
            return AimParams.LocalOffsetMP;
        }
    }
    return AimParams.LocalOffset;
    //return ReturnValue;    
}

function ClearDeltaRotationFromInput()
{
    RotationFromInput.Yaw = 0;
    RotationFromInput.Pitch = 0;
    //return;    
}

defaultproperties
{
    // Reference: SPCameraBlendSpeedFilter'Default__SPCameraModeAimControl.OffsetFilterObj'
    begin object name=OffsetFilterObj class=Class'SPCameraBlendSpeedFilter'
    end object
    StaticOffsetFilter=OffsetFilterObj
    AdjustViewSoAimGoesThroughTargetAimCollisionPointDuration=0.4000000
    AdjustViewSoAimGoesThroughTargetAimCollisionPointMinDistance=180.0000000
    // Reference: SPCameraCollision'Default__SPCameraModeAimControl.MainCameraCollisionObj'
    begin object name=MainCameraCollisionObj class=Class'SPCameraCollision'
        Data=(PenetrationBlendOutTime=0.0000000,PenetrationBlendInTime=0.0000000,CollisionFeelers=/* Array type was not detected. */)
    end object
    CameraCollisionMain=MainCameraCollisionObj
}