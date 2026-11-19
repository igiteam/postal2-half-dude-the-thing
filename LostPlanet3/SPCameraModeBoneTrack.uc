class SPCameraModeBoneTrack extends SPCameraMode
    abstract;

var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL BoneTrackParams;

// Export USPCameraModeBoneTrack::execHasCameraBasedMovement(FFrame&, void* const)
native function HasCameraBasedMovement()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];


}

function InitPendingMode()
{
    local /*0x043A0000-0x00000000*/ private @NULL PendingModeParam[8388609];

    super.InitPendingMode(PendingModeParam);
    BoneTrackParams = SPCameraModeBoneTrackParam(PendingModeParam.ModeParam);
    //return;    
}

simulated function AllowLookAround()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function RecenterCamera()
{
    local /*0x043A0000-0x00000000*/ private @NULL SavedVT[25165825];
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function UpdateViewTarget()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL P;

    super.UpdateViewTarget(DeltaTime);
    P = CameraMgr.Targeting.TargetPawn;
    // End:0x106
    if(P == none)
    {
        CFD.IdealVT.Location = P.Location;
        CFD.IdealVT.Rotation = P.Rotation;        
    }
    else
    {
        P.Mesh.TransformFromBoneSpace(BoneTrackParams.Bone, BoneTrackParams.TargetOffset + SphericalToCartesian(BoneTrackParams.Orbit), SphericalToRotator(BoneTrackParams.Orbit), CFD.IdealVT.Location, CFD.IdealVT.Rotation);
    }
    CFD.IdealVT.Orbit = MakeSpherical(0.0000000, 0.0000000, 0.0000000);
    //return;    
}

simulated function GetOffset()
{
    CFD.IdealVT.Offset = vect(0.0000000, 0.0000000, 8.0000000);
    //return;    
}
