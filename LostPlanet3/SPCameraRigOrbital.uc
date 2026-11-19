class SPCameraRigOrbital extends SPCameraRigFOV
    hidecategories(Object,Object);

var(__Filter1__Delegate) /*0x057A0000-0x00000000*/ private @NULL Orbit[65537];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL RadiusFilter;
var(__Filter1__Delegate) /*0x043A0000-0x00000400*/ private editfixedsize @NULL CameraCollisionMain[524289];
var(__Filter1__Delegate) /*0x057A0000-0x00000000*/ private float PitchMin[65537];
var(__Filter1__Delegate) /*0x057A0000-0x00000000*/ private float PitchMax[65537];
var(__Filter1__Delegate) /*0x057A0000-0x00000000*/ private bool bTestForStartPenetration[65537];

simulated function Reset()
{
    super(SPCameraRig).Reset();
    CameraCollisionMain.Reset();
    //return;    
}

// Export USPCameraRigOrbital::execCopyFrom(FFrame&, void* const)
native simulated function CopyFrom()
{
    local /*0x043A0000-0x00000000*/ private @NULL Other[8388609];


}

simulated function ConvertFromTViewTarget()
{
    local /*0x043A0000-0x00000000*/ private @NULL VT[8388609];

    super.ConvertFromTViewTarget(VT);
    Location = Class'SPCameraTargeting'.static.ActorEyeLoc(VT.Target);
    Orbit = RotatorToSpherical(Rotation, FMax(0.0000000, Vector(Rotation) Dot (Location - VT.POV.Location)));
    //return;    
}

// Export USPCameraRigOrbital::execAdjustFromTViewTarget(FFrame&, void* const)
native simulated function AdjustFromTViewTarget()
{
    local /*0x043A0000-0x00000000*/ private @NULL VT[25296897];


}

// Export USPCameraRigOrbital::execConvertToTViewTarget(FFrame&, void* const)
native simulated function ConvertToTViewTarget()
{
    local /*0x043A0000-0x00000000*/ private @NULL VT[25165825];


}

simulated function EnforceLimits()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];

    super.EnforceLimits(DeltaTime);
    LimitPitch(DeltaTime);
    //return;    
}

protected simulated function LimitPitch()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609], newpitch;

    PitchMin = FClamp(PitchMin, 0.0000000, 180.0000000);
    PitchMax = FClamp(PitchMax, PitchMin, 180.0000000);
    newpitch = FClamp(Orbit.Pitch, PitchMin, PitchMax);
    Orbit.Pitch = newpitch;
    Orbit.Pitch = FClamp(Orbit.Pitch, 0.0000000, 180.0000000);
    //return;    
}

protected simulated function LimitYaw()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];

    //return;    
}

protected simulated function ClampPitch()
{
    local /*0x043A0000-0x00000000*/ private float minpitchdegrees[8388609], maxpitchdegrees;

    Orbit.Pitch = FClamp(Orbit.Pitch, minpitchdegrees, maxpitchdegrees);
    //return;    
}

simulated function ClampYaw()
{
    local /*0x043A0000-0x00000000*/ private float goodcenterangle[8388609], MaxDegrees, Angle;

    Angle = NormalizeAngle(Orbit.Yaw - goodcenterangle);
    Angle = FClamp(Angle, -MaxDegrees, MaxDegrees);
    Orbit.Yaw = NormalizeAngle(Angle + goodcenterangle);
    //return;    
}

protected simulated function ClampRadius()
{
    local /*0x043A0000-0x00000000*/ private float MaxDistance[8388609];

    Orbit.Radius = FMin(Orbit.Radius, MaxDistance);
    //return;    
}

// Export USPCameraRigOrbital::execCameraLoc(FFrame&, void* const)
native simulated function CameraLoc()
{
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

simulated function CameraOrbit()
{
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];

    return Orbit;
    //return ReturnValue;    
}

final function BlendOrbital()
{
    local /*0x043A0000-0x00000000*/ private @NULL A[8388609], B, C;
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL orb;

    BlendFOV(A, B, C, DeltaTime);
    // End:0xDC
    if(RotationFilter == none)
    {
        Orbit.Yaw = C.Orbit.Yaw;
        Orbit.Pitch = C.Orbit.Pitch;        
    }
    else
    {
        orb = RotationFilter.BlendSpherical(A.Orbit, B.Orbit, C.Orbit);
        Orbit.Yaw = orb.Yaw;
        Orbit.Pitch = orb.Pitch;
    }
    // End:0x231
    if(RadiusFilter == none)
    {
        Orbit.Radius = C.Orbit.Radius;        
    }
    else
    {
        RadiusFilter.Update(DeltaTime);
        Orbit.Radius = FMax(0.0000000, RadiusFilter.BlendFloat(A.Orbit.Radius, B.Orbit.Radius, C.Orbit.Radius));
    }
    //return;    
}

simulated function OrbitToIncludeCylinder()
{
    local /*0x043A0000-0x00000000*/ private @NULL Loc[8388609], C;
    local /*0x043A0000-0x00000000*/ private float OutputAspectRatio[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL sph, tobase, basesph;
    local /*0x043A0000-0x00000000*/ private float Angle, maxrelangle, radiusfactor, heightfactor, distfactor;

    tobase = (CameraLoc()) - Loc;
    distfactor = VSize(tobase);
    // End:0x49
    if(distfactor <= 0.0000000)
    {
        return;
    }
    sph = Orbit;
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
    // End:0x39E
    if(sph.Pitch <= 160.0000000)
    {
        sph.Pitch = FClamp(sph.Pitch, 20.0000000, 160.0000000);
        Orbit = sph;
    }
    //return;    
}

simulated function Collide()
{
    local /*0x043A0000-0x00000000*/ private @NULL Target[8388609];
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x043A0000-0x00000000*/ private @NULL StartLoc, CollideLoc;
    local /*0x043A0000-0x00000000*/ private byte camcollide;

    StartLoc = Location;
    CollideLoc = CameraLoc();
    // End:0x78
    if(bTestForStartPenetration)
    {
        StartLoc = CameraCollisionMain.GetVTCollisionLoc(Target, StartLoc, CollideLoc);
    }
    camcollide = CameraCollisionMain.PreventCameraPenetration(Target, StartLoc, CollideLoc, DeltaTime, CameraForward(), CameraUp(), CameraRight(), FOV, AspectRatio);
    return int(camcollide) == int(2);
    //return ReturnValue;    
}

simulated function CheckValid()
{
    super.CheckValid();
    //return;    
}

protected static final simulated function SphericalString()
{
    local /*0x043A0000-0x00000000*/ private @NULL S[8388609];
    local /*0x043A0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return (((string(S.Radius) $ ",") @ SmallFloat(S.Yaw)) $ ",") @ SmallFloat(S.Pitch);
    //return ReturnValue;    
}

simulated function ToString()
{
    local /*0x043A0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return (((("Base:" @ string(Location)) @ "  Sph:") @ SphericalString(Orbit)) @ "  FoV:") @ string(FOV);
    //return ReturnValue;    
}

simulated function DisplayDebug()
{
    local /*0x043A0000-0x00000000*/ private @NULL HUD[8388609];

    super.DisplayDebug(HUD);
    HUD.Canvas.DrawText("Orbital Yaw:" @ string(Orbit.Yaw), true);
    HUD.Canvas.DrawText("Orbital Pitch:" @ string(Orbit.Pitch), true);
    HUD.Canvas.DrawText("Orbital PitchMin:" @ string(PitchMin), true);
    HUD.Canvas.DrawText("Orbital PitchMax:" @ string(PitchMax), true);
    //return;    
}

defaultproperties
{
    // Reference: SPCameraCollision'Default__SPCameraRigOrbital.DefaultCameraCollisionObj'
    begin object name=DefaultCameraCollisionObj class=Class'SPCameraCollision'
        Data=(PenetrationBlendOutTime=0.0000000,PenetrationBlendInTime=0.0000000,CollisionFeelers=/* Array type was not detected. */)
    end object
    CameraCollisionMain=DefaultCameraCollisionObj
    PitchMin=20.0000000
    PitchMax=160.0000000
}