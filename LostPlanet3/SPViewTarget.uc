class SPViewTarget extends Object
    abstract
    hidecategories(Object);

// Export USPViewTarget::execCameraLoc(FFrame&, void* const)
native simulated function CameraLoc()
{
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USPViewTarget::execCameraRot(FFrame&, void* const)
native simulated function CameraRot()
{
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

function Reset()
{
    //return;    
}

// Export USPViewTarget::execCopyFrom(FFrame&, void* const)
native simulated function CopyFrom()
{
    local /*0x043A0000-0x00000000*/ private @NULL Other[8388609];


}

simulated function ConvertFromTViewTarget()
{
    local /*0x043A0000-0x00000000*/ private @NULL VT[8388609];

    //return;    
}

// Export USPViewTarget::execAdjustFromTViewTarget(FFrame&, void* const)
native simulated function AdjustFromTViewTarget()
{
    local /*0x043A0000-0x00000000*/ private @NULL VT[25296897];


}

// Export USPViewTarget::execConvertToTViewTarget(FFrame&, void* const)
native simulated function ConvertToTViewTarget()
{
    local /*0x043A0000-0x00000000*/ private @NULL VT[25165825];


}

simulated function CameraOrbit()
{
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];

    return RotatorToSpherical(CameraRot(), 1.0000000);
    //return ReturnValue;    
}

final simulated function CameraForward()
{
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];

    return Vector(CameraRot());
    //return ReturnValue;    
}

final simulated function CameraUp()
{
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];

    return CameraToWorld(vect(0.0000000, 0.0000000, 1.0000000));
    //return ReturnValue;    
}

final simulated function CameraRight()
{
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];

    return CameraToWorld(vect(0.0000000, 1.0000000, 0.0000000));
    //return ReturnValue;    
}

final simulated function CameraOrbitForward()
{
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689], sph;

    sph = CameraOrbit();
    sph.Radius = 1.0000000;
    return SphericalToCartesian(sph);
    //return ReturnValue;    
}

final simulated function CameraToWorld()
{
    local /*0x043A0000-0x00000000*/ private @NULL V[8388609], ReturnValue;

    return V >> (CameraRot());
    //return ReturnValue;    
}

final simulated function CameraToWorldLoc()
{
    local /*0x043A0000-0x00000000*/ private @NULL V[8388609], ReturnValue;

    return (V >> (CameraRot())) + (CameraLoc());
    //return ReturnValue;    
}

final simulated function WorldToCamera()
{
    local /*0x043A0000-0x00000000*/ private @NULL V[8388609], ReturnValue;

    return V << (CameraRot());
    //return ReturnValue;    
}

final simulated function WorldToCameraLoc()
{
    local /*0x043A0000-0x00000000*/ private @NULL V[8388609], ReturnValue;

    return (V - (CameraLoc())) << (CameraRot());
    //return ReturnValue;    
}

final simulated function CameraXAxis()
{
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];

    return CameraToWorld(vect(1.0000000, 0.0000000, 0.0000000));
    //return ReturnValue;    
}

final simulated function CameraYAxis()
{
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];

    return CameraToWorld(vect(0.0000000, 1.0000000, 0.0000000));
    //return ReturnValue;    
}

final simulated function CameraZAxis()
{
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];

    return CameraToWorld(vect(0.0000000, 0.0000000, 1.0000000));
    //return ReturnValue;    
}

simulated function OffsetToIncludeSphere()
{
    local /*0x043A0000-0x00000000*/ private @NULL Loc[8388609];
    local /*0x043A0000-0x00000000*/ private float Radius[8388609], AspectRatio;

    //return;    
}

simulated function OrbitToIncludeCylinder()
{
    local /*0x043A0000-0x00000000*/ private @NULL Loc[8388609], C;
    local /*0x043A0000-0x00000000*/ private float AspectRatio[8388609];

    //return;    
}

simulated function RotateToIncludeCylinder()
{
    local /*0x043A0000-0x00000000*/ private @NULL Loc[8388609], C;
    local /*0x043A0000-0x00000000*/ private float AspectRatio[8388609];

    //return;    
}

function IncludeCylinder()
{
    local /*0x043A0000-0x00000000*/ private @NULL Loc[8388609], C;
    local /*0x043A0000-0x00000000*/ private bool Orbit[8388609];
    local /*0x043A0000-0x00000000*/ private float AspectRatio[8388609];

    // End:0x35
    if(Orbit)
    {
        OrbitToIncludeCylinder(Loc, C, AspectRatio);        
    }
    else
    {
        RotateToIncludeCylinder(Loc, C, AspectRatio);
    }
    //return;    
}

function RotateToIncludeSphere()
{
    local /*0x043A0000-0x00000000*/ private @NULL Target[8388609];
    local /*0x043A0000-0x00000000*/ private float Radius[8388609];
    local /*0x043A0000-0x00000000*/ private bool Orbit[8388609];
    local /*0x043A0000-0x00000000*/ private float AspectRatio[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL cyl;

    cyl.Radius = Radius;
    cyl.Height = Radius;
    IncludeCylinder(Target, cyl, Orbit, AspectRatio);
    //return;    
}

function RotateToIncludePoint()
{
    local /*0x043A0000-0x00000000*/ private @NULL Target[8388609];
    local /*0x043A0000-0x00000000*/ private bool Orbit[8388609];
    local /*0x043A0000-0x00000000*/ private float AspectRatio[8388609];

    RotateToIncludeSphere(Target, 0.0000000, Orbit, AspectRatio);
    //return;    
}

function RotateToIncludeActor()
{
    local /*0x043A0000-0x00000000*/ private @NULL Target[8388609];
    local /*0x043A0000-0x00000000*/ private bool Orbit[8388609];
    local /*0x043A0000-0x00000000*/ private float AspectRatio[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL cyl;

    // End:0x11
    if(Target == none)
    {
        return;
    }
    Target.GetBoundingCylinder(cyl.Radius, cyl.Height);
    IncludeCylinder(Target.Location, cyl, Orbit, AspectRatio);
    //return;    
}

function RotateToIncludePawn()
{
    local /*0x043A0000-0x00000000*/ private @NULL Target[8388609];
    local /*0x043A0000-0x00000000*/ private bool Orbit[8388609];
    local /*0x043A0000-0x00000000*/ private float AspectRatio[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL cyl, headoffset;

    // End:0x11
    if(Target == none)
    {
        return;
    }
    // End:0x5E
    if(Target.CylinderComponent == none)
    {
        RotateToIncludeActor(Target, Orbit, AspectRatio);        
    }
    else
    {
        cyl.Height = Target.CylinderComponent.CollisionHeight;
        cyl.Radius = Target.CylinderComponent.CollisionRadius;
        headoffset.Z = cyl.Height * 0.2500000;
        IncludeCylinder(Target.Location + headoffset, cyl, Orbit, AspectRatio);
    }
    //return;    
}

simulated function PointBehindPlanes()
{
    local /*0x043A0000-0x00000000*/ private @NULL Pt[8388609];
    local /*0x043A0000-0x00000000*/ private editfixedsize array Planes[25296897];
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x043A0000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x63 [Loop If]
    if(I < Planes.Length)
    {
        // End:0x55
        if(SignedDistancePointToPlane(Pt, Planes[I]) < 0.0000000)
        {
            return false;
        }
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    return true;
    //return ReturnValue;    
}

simulated function OffsetToIncludeSphereGeneric()
{
    local /*0x043A0000-0x00000000*/ private @NULL Loc[8388609];
    local /*0x043A0000-0x00000000*/ private float Radius[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL CamLoc[8388609], CamRot;
    local /*0x043A0000-0x00000000*/ private float FOV[8388609], Aspect;
    local /*0x043A0000-0x00000000*/ private editfixedsize array FrustumPlanes[25165825];
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x043A0000-0x00000000*/ private int I;
    local /*0x043A0000-0x00000000*/ private @NULL acc;
    local /*0x043A0000-0x00000000*/ private float neard;

    Loc = (Loc - CamLoc) << CamRot;
    neard = Class'SPEngine.SPUtil'.static.GetNearPlane();
    Class'SPEngine.SPUtil'.static.GetFrustumPlanes(FrustumPlanes, FOV * 0.5000000, Aspect, neard, (FMax(Loc.X, 0.0000000) + neard) + (Radius * 4.0000000));
    I = 0;
    J0xE8:

    // End:0x17E [Loop If]
    if(I < FrustumPlanes.Length)
    {
        FrustumPlanes[I] = MakePlane(-NormalOfPlane(FrustumPlanes[I]), -FrustumPlanes[I].W - Radius);
        ++I;
        // [Loop Continue]
        goto J0xE8;
    }
    // End:0x1AB
    if(PointBehindPlanes(Loc, FrustumPlanes))
    {
        return vect(0.0000000, 0.0000000, 0.0000000);
    }
    // End:0x1FF
    if(!PointBehindPlanes(SPMakeVector((neard + Radius) - 0.0050000, 0.0000000, 0.0000000), FrustumPlanes))
    {
        FrustumPlanes.Remove(0, 1);        
    }
    acc = Class'SPEngine.SPUtil'.static.ClosestPointToHull(Loc, FrustumPlanes) - Loc;
    // End:0x25E
    if(IsZero(acc))
    {
        return acc;
    }
    return acc >> CamRot;
    //return ReturnValue;    
}

simulated function Collide()
{
    local /*0x043A0000-0x00000000*/ private @NULL Target[8388609];
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function CheckValid()
{
    //return;    
}

function ToString()
{
    local /*0x043A0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return "";
    //return ReturnValue;    
}

private static final simulated function SmallFloat()
{
    local /*0x043A0000-0x00000000*/ private float F[8388609];
    local /*0x043A0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return string(int(F));
    //return ReturnValue;    
}

private static final simulated function ToDegrees()
{
    local /*0x043A0000-0x00000000*/ private int ur[8388609];
    local /*0x043A0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return SmallFloat(NormalizeAngle((float(ur) * 0.0000959) * 57.2957800));
    //return ReturnValue;    
}

private static final simulated function RotatorString()
{
    local /*0x043A0000-0x00000000*/ private @NULL R[8388609];
    local /*0x043A0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return (((ToDegrees(R.Yaw) $ ",") @ ToDegrees(R.Pitch)) $ ",") @ ToDegrees(R.Roll);
    //return ReturnValue;    
}

private static final simulated function SphericalString()
{
    local /*0x043A0000-0x00000000*/ private @NULL S[8388609];
    local /*0x043A0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return (((string(S.Radius) $ ",") @ SmallFloat(S.Yaw)) $ ",") @ SmallFloat(S.Pitch);
    //return ReturnValue;    
}

static final simulated function TViewTargetString()
{
    local /*0x043A0000-0x00000000*/ private @NULL VT[25296897];
    local /*0x043A0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return ((((((" Loc:" @ string(VT.POV.Location)) @ "  Rot:") @ RotatorString(VT.POV.Rotation)) @ "  Fwd:") @ string(Vector(VT.POV.Rotation))) @ "  FoV:") @ string(VT.POV.FOV);
    //return ReturnValue;    
}

simulated function DisplayDebug()
{
    local /*0x043A0000-0x00000000*/ private @NULL HUD[8388609];

    HUD.Canvas.SetDrawColor(224, 255, 0);
    HUD.Canvas.DrawText("      " @ (ToString()), true);
    //return;    
}
