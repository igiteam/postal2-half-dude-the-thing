class SPCameraRigFOV extends SPCameraRigBasic
    hidecategories(Object,Object);

var(__Filter1__Delegate) /*0x05780000-0x00000000*/ private float FOV[65537];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private float AspectRatio;
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL FOVFilter;

// Export USPCameraRigFOV::execCopyFrom(FFrame&, void* const)
native simulated function CopyFrom()
{
    local /*0x043A0000-0x00000000*/ private @NULL Other[8388609];


}

simulated function ConvertFromTViewTarget()
{
    local /*0x043A0000-0x00000000*/ private @NULL VT[8388609];

    super.ConvertFromTViewTarget(VT);
    FOV = VT.POV.FOV;
    AspectRatio = VT.AspectRatio;
    //return;    
}

// Export USPCameraRigFOV::execAdjustFromTViewTarget(FFrame&, void* const)
native simulated function AdjustFromTViewTarget()
{
    local /*0x043A0000-0x00000000*/ private @NULL VT[25296897];


}

// Export USPCameraRigFOV::execConvertToTViewTarget(FFrame&, void* const)
native simulated function ConvertToTViewTarget()
{
    local /*0x043A0000-0x00000000*/ private @NULL VT[25165825];


}

final function BlendFOV()
{
    local /*0x043A0000-0x00000000*/ private @NULL A[8388609], B, C;
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];

    BlendBasic(A, B, C, DeltaTime);
    // End:0x68
    if(FOVFilter == none)
    {
        FOV = C.FOV;        
    }
    else
    {
        FOVFilter.Update(DeltaTime);
        FOV = FOVFilter.BlendFloat(A.FOV, B.FOV, C.FOV);
    }
    //return;    
}

simulated function FOVToFrameCylinder()
{
    local /*0x043A0000-0x00000000*/ private @NULL Loc[8388609], cyl;
    local /*0x043A0000-0x00000000*/ private float OutputAspectRatio[8388609], fovrad, origfov, A, B, C,
	    ax, ay, lx, ly, rx,
	    ry;

    origfov = FOV;
    Loc = WorldToCameraLoc(Loc);
    // End:0x58
    if(Loc.X < 1.0000000)
    {
        return;
    }
    fovrad = (FOV * 0.0174533) * 0.5000000;
    rx = fovrad;
    ry = Atan(Tan(rx) / OutputAspectRatio);
    lx = Sqrt(Square(Loc.X) + Square(Loc.Y));
    ly = Sqrt(Square(Loc.X) + Square(Loc.Z));
    ax = Atan2(Loc.Y, Loc.X);
    ay = Atan2(Loc.Z, Loc.X);
    // End:0x2F9
    if(lx > cyl.Radius)
    {
        A = Asin(FMin(1.0000000, cyl.Radius / lx));
        B = 0.0000000;
        C = 0.0000000;
        // End:0x299
        if(ax < A)
        {
            B = A - ax;
        }
        // End:0x2D0
        if(ax > -A)
        {
            C = A + ax;
        }
        rx = FMin(rx, FMax(B, C));
    }
    // End:0x418
    if(ly > cyl.Height)
    {
        A = Asin(FMin(1.0000000, cyl.Height / ly));
        B = 0.0000000;
        C = 0.0000000;
        // End:0x3B8
        if(ay < A)
        {
            B = A - ay;
        }
        // End:0x3EF
        if(ay > -A)
        {
            C = A + ay;
        }
        ry = FMin(ry, FMax(B, C));
    }
    ry = Atan(Tan(ry) * OutputAspectRatio);
    fovrad = FMax(rx, ry);
    fovrad *= (57.2957800 * 2.0000000);
    FOV = FClamp(fovrad, 0.1000000, 179.9000000);
    FOV = FMin(FOV, 100.0000000);
    FOV = FMin(FOV, origfov);
    //return;    
}

simulated function FOVToIncludeSphere()
{
    local /*0x043A0000-0x00000000*/ private @NULL Loc[8388609];
    local /*0x043A0000-0x00000000*/ private float Radius[8388609], OutputAspectRatio, fovrad, origfov, A, ax,
	    ay, lx, ly, rx, ry;

    origfov = FOV;
    Loc = WorldToCameraLoc(Loc);
    // End:0x58
    if(Loc.X < 1.0000000)
    {
        return;
    }
    fovrad = (FOV * 0.0174533) * 0.5000000;
    rx = fovrad;
    ry = Atan(Tan(rx) / OutputAspectRatio);
    lx = Sqrt(Square(Loc.X) + Square(Loc.Y));
    ly = Sqrt(Square(Loc.X) + Square(Loc.Z));
    ax = Atan2(Loc.Y, Loc.X);
    ay = Atan2(Loc.Z, Loc.X);
    // End:0x2A2
    if(lx > Radius)
    {
        A = Asin(FMin(1.0000000, Radius / lx));
        // End:0x260
        if(ax < A)
        {
            rx = FMax(rx, A - ax);
        }
        // End:0x2A2
        if(ax > -A)
        {
            rx = FMax(rx, A + ax);
        }
    }
    // End:0x36A
    if(ly > Radius)
    {
        A = Asin(FMin(1.0000000, Radius / ly));
        // End:0x328
        if(ay < A)
        {
            ry = FMax(ry, A - ay);
        }
        // End:0x36A
        if(ay > -A)
        {
            ry = FMax(ry, A + ay);
        }
    }
    ry = Atan(Tan(ry) * OutputAspectRatio);
    fovrad = FMax(rx, ry);
    fovrad *= (57.2957800 * 2.0000000);
    FOV = FClamp(fovrad, 0.1000000, 179.9000000);
    FOV = FMin(FOV, 100.0000000);
    FOV = FMax(FOV, origfov);
    //return;    
}

simulated function RotateToIncludeCylinder()
{
    local /*0x043A0000-0x00000000*/ private @NULL Loc[8388609], C;
    local /*0x043A0000-0x00000000*/ private float OutputAspectRatio[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL sph, tobase, basesph, tolookat, campos;

    local /*0x043A0000-0x00000000*/ private float Angle, maxrelangle, radiusfactor, heightfactor, distfactor;

    campos = CameraLoc();
    tolookat = Vector(CameraRot());
    tobase = Loc - campos;
    distfactor = VSize(tobase);
    // End:0x72
    if(distfactor <= 0.0000000)
    {
        return;
    }
    sph = CartesianToSpherical(tolookat);
    basesph = CartesianToSpherical(tobase);
    Angle = basesph.Yaw;
    Angle -= sph.Yaw;
    Angle = NormalizeAngle(Angle);
    maxrelangle = FOV * 0.5000000;
    radiusfactor = Atan(C.Radius / distfactor) * 57.2957800;
    maxrelangle -= radiusfactor;
    maxrelangle = FMax(0.0000000, maxrelangle);
    Angle -= FClamp(Angle, -maxrelangle, maxrelangle);
    sph.Yaw += Angle;
    Angle = basesph.Pitch;
    Angle -= sph.Pitch;
    Angle = NormalizeAngle(Angle);
    maxrelangle = Atan(Tan((FOV * 0.0174533) * 0.5000000) / OutputAspectRatio) * 57.2957800;
    maxrelangle *= 0.7800000;
    heightfactor = Atan(C.Height / distfactor) * 57.2957800;
    maxrelangle -= heightfactor;
    maxrelangle = FMax(0.0000000, maxrelangle);
    Angle -= FClamp(Angle, -maxrelangle, maxrelangle);
    sph.Pitch += Angle;
    // End:0x3DB
    if(sph.Pitch <= 160.0000000)
    {
        sph.Pitch = FClamp(sph.Pitch, 20.0000000, 160.0000000);
        Rotation = SphericalToRotator(sph);
    }
    //return;    
}

simulated function EnforceLimits()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];

    super(SPCameraRig).EnforceLimits(DeltaTime);
    FOV = FClamp(FOV, 0.0100000, 179.9000000);
    //return;    
}

simulated function CheckValid()
{
    super.CheckValid();
    //return;    
}

simulated function ToString()
{
    local /*0x043A0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return (((super.ToString() @ "  FoV:") @ string(FOV)) @ " Aspect ratio:") @ string(AspectRatio);
    //return ReturnValue;    
}

simulated function DisplayDebug()
{
    local /*0x043A0000-0x00000000*/ private @NULL HUD[8388609];

    super.DisplayDebug(HUD);
    //return;    
}

defaultproperties
{
    FOV=75.0000000
    AspectRatio=1.0000000
}