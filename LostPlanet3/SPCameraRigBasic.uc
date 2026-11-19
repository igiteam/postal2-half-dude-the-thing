class SPCameraRigBasic extends SPCameraRig
    hidecategories(Object,Object);

var(__Filter1__Delegate) /*0x05770000-0x00000000*/ private @NULL Location[65537];
var(__Filter1__Delegate) /*0x05770000-0x00000000*/ private @NULL Rotation[65537];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL LocationFilter;
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL RotationFilter;
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private bool bFilterZLocationOnly;

// Export USPCameraRigBasic::execCopyFrom(FFrame&, void* const)
native simulated function CopyFrom()
{
    local /*0x043A0000-0x00000000*/ private @NULL Other[8388609];


}

simulated function ConvertFromTViewTarget()
{
    local /*0x043A0000-0x00000000*/ private @NULL VT[8388609];

    Location = VT.POV.Location;
    Rotation = VT.POV.Rotation;
    //return;    
}

// Export USPCameraRigBasic::execAdjustFromTViewTarget(FFrame&, void* const)
native simulated function AdjustFromTViewTarget()
{
    local /*0x043A0000-0x00000000*/ private @NULL VT[25296897];


}

// Export USPCameraRigBasic::execConvertToTViewTarget(FFrame&, void* const)
native simulated function ConvertToTViewTarget()
{
    local /*0x043A0000-0x00000000*/ private @NULL VT[25165825];


}

simulated function RotateAround()
{
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];

    return Location;
    //return ReturnValue;    
}

// Export USPCameraRigBasic::execCameraLoc(FFrame&, void* const)
native simulated function CameraLoc()
{
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USPCameraRigBasic::execCameraRot(FFrame&, void* const)
native simulated function CameraRot()
{
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

final function BlendBasic()
{
    local /*0x043A0000-0x00000000*/ private @NULL A[8388609], B, C;
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];

    // End:0x3A
    if(LocationFilter == none)
    {
        Location = C.Location;        
    }
    else
    {
        // End:0x141
        if(bFilterZLocationOnly)
        {
            LocationFilter.Update(DeltaTime);
            Location.Z = LocationFilter.BlendFloat(A.Location.Z, B.Location.Z, C.Location.Z);            
        }
        else
        {
            LocationFilter.Update(DeltaTime);
            Location = LocationFilter.BlendVector(A.Location, B.Location, C.Location);
        }
    }
    // End:0x226
    if(RotationFilter == none)
    {
        Rotation = C.Rotation;        
    }
    else
    {
        RotationFilter.Update(DeltaTime);
        Rotation = RotationFilter.BlendRotator(A.Rotation, B.Rotation, C.Rotation);
    }
    //return;    
}

simulated function LookAt()
{
    local /*0x043A0000-0x00000000*/ private @NULL LookAt[8388609];

    Rotation = Rotator(LookAt - (CameraLoc()));
    //return;    
}

simulated function LookDir()
{
    local /*0x043A0000-0x00000000*/ private @NULL LookInDir[8388609];

    Rotation = Rotator(LookInDir);
    //return;    
}

// Export USPCameraRigBasic::execLookRot(FFrame&, void* const)
native simulated function LookRot()
{
    local /*0x043A0000-0x00000000*/ private @NULL LookInRot[25296897];


}

simulated function CheckValid()
{
    super.CheckValid();
    //return;    
}

simulated function ToString()
{
    local /*0x043A0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return (("Base:" @ string(Location)) @ "  Rot:") @ RotatorString(Rotation);
    //return ReturnValue;    
}

protected static final simulated function SmallFloat()
{
    local /*0x043A0000-0x00000000*/ private float F[8388609];
    local /*0x043A0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return string(int(F));
    //return ReturnValue;    
}

protected static final simulated function ToDegrees()
{
    local /*0x043A0000-0x00000000*/ private int ur[8388609];
    local /*0x043A0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return SmallFloat(NormalizeAngle((float(ur) * 0.0000959) * 57.2957800));
    //return ReturnValue;    
}

protected static final simulated function RotatorString()
{
    local /*0x043A0000-0x00000000*/ private @NULL R[8388609];
    local /*0x043A0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return (((ToDegrees(R.Yaw) $ ",") @ ToDegrees(R.Pitch)) $ ",") @ ToDegrees(R.Roll);
    //return ReturnValue;    
}

simulated function DisplayDebug()
{
    local /*0x043A0000-0x00000000*/ private @NULL HUD[8388609];

    super.DisplayDebug(HUD);
    //return;    
}
