class SPCameraTargeting extends Object;

struct native CameraTarget
{
    var(__Filter1__Delegate) /*0x012B0000-0x00000000*/ private @NULL eyeLoc[65537];
    var(__Filter1__Delegate) /*0x012B0000-0x00000000*/ private @NULL eyeRot[65537];
    var(__Filter1__Delegate) /*0x012B0000-0x00000000*/ private @NULL Loc[65537];
    var(__Filter1__Delegate) /*0x012B0000-0x00000000*/ private @NULL Rot[65537];

    structdefaultproperties
    {
        eyeLoc=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        eyeRot=(Pitch=0,Yaw=0,Roll=0)
        Loc=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Rot=(Pitch=0,Yaw=0,Roll=0)
    }
};

struct native CameraInclude
{
    var(__Filter1__Delegate) /*0x01110000-0x00000000*/ private float CylinderHeight[65537];
    var(__Filter1__Delegate) /*0x01110000-0x00000000*/ private float CylinderRadius[65537];
    var(__Filter1__Delegate) /*0x01110000-0x00000000*/ private @NULL Center[65537];

    structdefaultproperties
    {
        CylinderHeight=0.0000000
        CylinderRadius=0.0000000
        Center=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    }
};

struct native CameraTargetingParams
{
    var(__Filter1__Delegate) /*0x012C0000-0x00000000*/ private float LookAroundPitchMinimum[65537];
    var(__Filter1__Delegate) /*0x012C0000-0x00000000*/ private float LookAroundPitchMaximum[65537];
    var(__Filter1__Delegate) /*0x012C0000-0x00000000*/ private float LookAroundClampYaw[65537];
    var(__Filter1__Delegate) /*0x012C0000-0x00000000*/ private float LookAroundCenterYaw[65537];
    var(__Filter1__Delegate) /*0x012C0000-0x00000000*/ private float HeadRadius[65537];
    var(__Filter1__Delegate) /*0x012C0000-0x00000000*/ private float FilterRateEnemySphere[65537];
    var(__Filter1__Delegate) /*0x012C0000-0x00000000*/ private float FilterRateEnemyHeads[65537];
    var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private float HorizontalHeadTrackingSmoothRate;
    var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private float HorizontalHeadTrackingDeadZoneDistance;
    var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private float HeadTrackingPercent;
    var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private float MouseSensitivity;
    var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private float CameraTurnMax;
    var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private float CameraLookUpMax;
    var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private float LookInfluenceDelay;
    var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private float WeightEnemyRadiusMin;
    var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private float WeightEnemyRadiusMax;
    var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private float IncludeEnemyRadiusMax;
    var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private float EnemyLookInfluence;
    var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private name EyeSocket;
    var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private bool bUseSelfCentering;

    structdefaultproperties
    {
        LookAroundPitchMinimum=20.0000000
        LookAroundPitchMaximum=160.0000000
        LookAroundClampYaw=180.0000000
        LookAroundCenterYaw=0.0000000
        HeadRadius=12.0000000
        FilterRateEnemySphere=0.4000000
        FilterRateEnemyHeads=0.2500000
        HorizontalHeadTrackingSmoothRate=0.3000000
        HorizontalHeadTrackingDeadZoneDistance=250.0000000
        HeadTrackingPercent=0.0000000
        MouseSensitivity=0.7000000
        CameraTurnMax=12.0000000
        CameraLookUpMax=10.0000000
        LookInfluenceDelay=3.0000000
        WeightEnemyRadiusMin=200.0000000
        WeightEnemyRadiusMax=900.0000000
        IncludeEnemyRadiusMax=650.0000000
        EnemyLookInfluence=0.0000000
        EyeSocket="None"
        bUseSelfCentering=false
    }
};

var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL Params;
var(__Filter1__Delegate) /*0x05820000-0x00000000*/ private @NULL Target[65537];
var(__Filter1__Delegate) /*0x05820000-0x00000000*/ private @NULL TargetPawn[65537];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL Current;
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL Previous;
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private editfixedsize array SecondaryTargets;
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL MergedTargetSphere;
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL OldEnemySphere[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private float AspectRatio;
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private editfixedsize array FrustumPlanes[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL LookDirection[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL DefaultLookDirection[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private float TimeSinceLastLook[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL LookInput[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private bool AllowLook;
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private bool FocusUseTargetDir;
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private bool IncludeByRotating;
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL FocalVector;
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL FocalPoint;
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private float FocalPointMagnitude;
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private float FocalDelay;
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL IncludePoint;
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private float IncludeRadius;

// Export USPCameraTargeting::execTargetEyeLoc(FFrame&, void* const)
native simulated function TargetEyeLoc()
{
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USPCameraTargeting::execTargetLoc(FFrame&, void* const)
native simulated function TargetLoc()
{
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USPCameraTargeting::execTargetEyeRot(FFrame&, void* const)
native simulated function TargetEyeRot()
{
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

simulated function ClearSecondaryTargets()
{
    SecondaryTargets.Length = 0;
    MergedTargetSphere.Radius = 0.0000000;
    //return;    
}

simulated function AddSecondarySphere()
{
    local /*0x043A0000-0x00000000*/ private @NULL S[8388609], ci;

    ci.Center = S.Center;
    ci.CylinderHeight = S.Radius;
    ci.CylinderRadius = S.Radius;
    SecondaryTargets.AddItem(ci);    
    //return;    
}

simulated function AddSecondaryCylinder()
{
    local /*0x043A0000-0x00000000*/ private @NULL Center[8388609], C, ci;

    ci.Center = Center;
    ci.CylinderHeight = C.Height;
    ci.CylinderRadius = C.Radius;
    SecondaryTargets.AddItem(ci);    
    //return;    
}

simulated function AddSecondaryHead()
{
    local /*0x043A0000-0x00000000*/ private @NULL HeadCenter[8388609];

    AddSecondarySphere(Class'SPEngine.SPUtil'.static.MakeSphere(HeadCenter, Params.HeadRadius));
    //return;    
}

simulated function SetTarget()
{
    local /*0x043A0000-0x00000000*/ private @NULL NewTarget[8388609];

    Target = NewTarget;
    TargetPawn = SPPawn(Target);
    UpdateTargetLoc();
    //return;    
}

private final function GetTargetSocketLocationAndRotation()
{
    local /*0x043A0000-0x00000000*/ private name SocketName[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL OutLocation[25165825], OutRotation, PawnTarget;

    PawnTarget = SPPawn(Target);
    // End:0x7B
    if(PawnTarget != none)
    {
        PawnTarget.Mesh.GetSocketWorldLocationAndRotation(SocketName, OutLocation, OutRotation);
    }
    //return;    
}

simulated function TargetForward()
{
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];

    return Vector(Current.Rot);
    //return ReturnValue;    
}

simulated function TargetYaw()
{
    local /*0x043A0000-0x00000000*/ private float ReturnValue[92274689];

    return (float(Target.Rotation.Yaw) * 0.0000959) * 57.2957800;
    //return ReturnValue;    
}

simulated function IsTargetUnconscious()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x043A0000-0x00000000*/ private @NULL Pt;

    Pt = Pawn(Target);
    return (Pt != none) && ((Pt.Health <= 0) || Pt.bDeleteMe) || Pt.bPlayedDeath;
    //return ReturnValue;    
}

simulated function IsTargetInGhostMode()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x043A0000-0x00000000*/ private @NULL Pt;

    Pt = Pawn(Target);
    return ((Pt != none) && !Pt.bCollideWorld) && PlayerController(Pt.Controller).bCheatFlying;
    //return ReturnValue;    
}

simulated function IsTargetOnPlatform()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    return ((Target != none) && Target.Base != none) && !Target.Base.bWorldGeometry;
    //return ReturnValue;    
}

simulated function Update()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];

    MergedTargetSphere = MergeSecondaryTargets(DeltaTime);
    //return;    
}

static simulated function ClampYaw()
{
    local /*0x043A0000-0x00000000*/ private float Angle[8388609], goodcenterangle, MaxDegrees, ReturnValue;

    return NormalizeAngle(FClamp(NormalizeAngle(Angle - goodcenterangle), -MaxDegrees, MaxDegrees) + goodcenterangle);
    //return ReturnValue;    
}

simulated function LookAround()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x043A0000-0x00000000*/ private @NULL looksph, StickInput;

    StickInput = vect2d(FClampAbs(LookInput.X, Params.CameraTurnMax), FClampAbs(LookInput.Y, Params.CameraLookUpMax));
    // End:0x2DE
    if(V2DSizeSq(StickInput) > 0.0000000)
    {
        TimeSinceLastLook = 0.0000000;
        // End:0x12E
        if(VSizeSq(LookDirection) < Square(0.0100000))
        {
            LookDirection = DefaultLookDirection;
            // End:0x119
            if(VSizeSq(LookDirection) < Square(0.0100000))
            {
                LookDirection = TargetForward();
            }
            LookDirection = Normal(LookDirection);
        }
        looksph = CartesianToSpherical(LookDirection);
        looksph.Radius = 1.0000000;
        looksph = Add_SphericalSpherical(looksph, MakeSpherical(0.0000000, StickInput.X, StickInput.Y));
        looksph.Pitch = FClamp(looksph.Pitch, Params.LookAroundPitchMinimum, Params.LookAroundPitchMaximum);
        looksph.Yaw = ClampYaw(looksph.Yaw, Params.LookAroundCenterYaw, Params.LookAroundClampYaw);
        LookDirection = SphericalToCartesian(looksph);
        return true;
    }
    looksph.Pitch = FClamp(looksph.Pitch, Params.LookAroundPitchMinimum, Params.LookAroundPitchMaximum);
    looksph.Yaw = ClampYaw(looksph.Yaw, Params.LookAroundCenterYaw, Params.LookAroundClampYaw);
    TimeSinceLastLook += DeltaTime;
    // End:0x44D
    if(Params.bUseSelfCentering)
    {
        LookDirection = Class'SPCameraBlend'.static.LowPassVector(LookDirection, vect(0.0000000, 0.0000000, 0.0000000), 2.0000000, DeltaTime);
    }
    return false;
    //return ReturnValue;    
}

simulated function DirectorLookAround()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609], FilterRateLookAround;
    local /*0x043A0000-0x00000000*/ private @NULL LookDelta[8388609];
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x043A0000-0x00000000*/ private @NULL StickInput, NewLook, CurLook, CenterLook;
    local /*0x043A0000-0x00000000*/ private bool looking;

    StickInput = vect2d(FClampAbs(LookInput.X, 1.0000000), FClampAbs(LookInput.Y, 1.0000000));
    looking = V2DSizeSq(StickInput) > 0.0000000;
    // End:0x15C
    if(looking)
    {
        TimeSinceLastLook = 0.0000000;
        NewLook.X = StickInput.X * LookDelta.X;
        NewLook.Y = StickInput.Y * LookDelta.Y;        
    }
    else
    {
        TimeSinceLastLook += DeltaTime;
    }
    // End:0x19A
    if(VSizeSq(LookDirection) < Square(0.0010000))
    {
        LookDirection = DefaultLookDirection;
    }
    CenterLook = CartesianToSpherical(DefaultLookDirection);
    CurLook = CartesianToSpherical(LookDirection);
    CurLook.Yaw = Class'SPEngine.SPBlend'.static.LowPassDegrees(CurLook.Yaw, CenterLook.Yaw + NewLook.X, FilterRateLookAround, DeltaTime);
    CurLook.Pitch = Class'SPEngine.SPBlend'.static.LowPassDegrees(CurLook.Pitch, CenterLook.Pitch + NewLook.Y, FilterRateLookAround, DeltaTime);
    CurLook.Radius = 1.0000000;
    CurLook.Pitch = FClamp(CurLook.Pitch, 0.0000000, 180.0000000);
    LookDirection = SphericalToCartesian(CurLook);
    return looking;
    //return ReturnValue;    
}

simulated function ResetLook()
{
    LookDirection = vect(0.0000000, 0.0000000, 0.0000000);
    TimeSinceLastLook = 0.0000000;
    //return;    
}

simulated function TargetCloseEnough()
{
    local /*0x043A0000-0x00000000*/ private @NULL tgt[8388609];
    local /*0x043A0000-0x00000000*/ private float MaxDist[8388609];
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    return VSizeSq(tgt - (TargetLoc())) <= Square(MaxDist);
    //return ReturnValue;    
}

simulated function DirTowardSecondaryTargets()
{
    local /*0x043A0000-0x00000000*/ private @NULL LocalOffset[8388609], ReturnValue, tgt, acc, playerloc;

    local /*0x043A0000-0x00000000*/ private float l2;

    playerloc = TargetLoc();
    // End:0xCD
    if(TimeSinceLastLook < Params.LookInfluenceDelay)
    {
        // End:0xCC
        foreach SecondaryTargets(tgt)
        {
            // End:0xCB
            if(TargetCloseEnough(tgt.Center, Params.WeightEnemyRadiusMax))
            {
                acc = tgt.Center - playerloc;
            }            
        }        
    }
    acc.Z = 0.0000000;
    l2 = VSizeSq2D(acc);
    // End:0x151
    if(l2 < Square(10.0000000))
    {
        return ((TimeSinceLastLook > FocalDelay) ? FocalVector : vect(0.0000000, 0.0000000, 0.0000000));
    }
    acc /= l2;
    acc *= 3.0000000;
    acc = ClampLength(acc, Params.EnemyLookInfluence);
    return acc;
    //return ReturnValue;    
}

simulated function GetTargetLookInfluences()
{
    local /*0x043A0000-0x00000000*/ private @NULL LocalOffset[8388609];
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609], ForcePitchAngle;
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689], LookInfluence, looksph;

    LookInfluence = DirTowardSecondaryTargets(LocalOffset);
    // End:0x90
    if(ForcePitchAngle >= 0.0000000)
    {
        looksph = CartesianToSpherical(LookInfluence);
        looksph.Pitch = ForcePitchAngle;
        LookInfluence = SphericalToCartesian(looksph);
    }
    return LookInfluence;
    //return ReturnValue;    
}

simulated function AdjustLook()
{
    local /*0x043A0000-0x00000000*/ private @NULL Orbit[8388609], LookInDir;
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609], GettingCloseCosine, CloseEnoughCosine;
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689], neworbit;
    local /*0x043A0000-0x00000000*/ private float Len;
    local /*0x043A0000-0x00000000*/ private @NULL Dir;
    local /*0x043A0000-0x00000000*/ private float dotprod;

    0.9900000
    1.0000000
    Len = VSizeSq(LookInDir);
    // End:0x46
    if(Len < Square(0.0001000))
    {
        return Orbit;
    }
    neworbit = Orbit;
    neworbit.Radius = 1.0000000;
    Dir = SphericalToCartesian(neworbit);
    dotprod = (Dir Dot LookInDir) / VSize(LookInDir);
    // End:0xE4
    if(dotprod >= CloseEnoughCosine)
    {
        return Orbit;
    }
    neworbit = CartesianToSpherical(LookInDir);
    Len = neworbit.Radius;
    // End:0x18C
    if((dotprod >= GettingCloseCosine) && GettingCloseCosine < CloseEnoughCosine)
    {
        Len *= ((CloseEnoughCosine - dotprod) / (CloseEnoughCosine - GettingCloseCosine));
    }
    neworbit.Radius = Orbit.Radius;
    return Class'SPCameraBlend'.static.LowPassSpherical(Orbit, neworbit, Len * 30.0000000, DeltaTime);
    //return ReturnValue;    
}

static final simulated function ActorEyeLoc()
{
    local /*0x043A0000-0x00000000*/ private @NULL A[8388609], ReturnValue, Loc, Rot;

    // End:0x40
    if(A != none)
    {
        A.GetActorEyesViewPoint(Loc, Rot);
    }
    return Loc;
    //return ReturnValue;    
}

static final simulated function ActorHeadLoc()
{
    local /*0x043A0000-0x00000000*/ private @NULL A[8388609], ReturnValue, cyl, headoffset, pa;

    pa = Pawn(A);
    // End:0xAB
    if((pa == none) || pa.CylinderComponent == none)
    {
        A.GetBoundingCylinder(cyl.Radius, cyl.Height);        
    }
    else
    {
        cyl.Height = pa.CylinderComponent.CollisionHeight;
        cyl.Radius = pa.CylinderComponent.CollisionRadius;
    }
    headoffset.Z = cyl.Height * 0.9000000;
    return A.Location + headoffset;
    //return ReturnValue;    
}

static final simulated function PawnHeadLoc()
{
    local /*0x043A0000-0x00000000*/ private @NULL A[8388609], ReturnValue, P;

    P = SPPawn(A);
    // End:0x4E
    if(P != none)
    {
        return P.GetPawnHeadLocation();        
    }
    else
    {
        return ActorEyeLoc(A);
    }
    //return ReturnValue;    
}

static final function GetHead()
{
    local /*0x043A0000-0x00000000*/ private @NULL A[8388609], ReturnValue, Loc, aPawn;

    aPawn = SPPawn(A);
    // End:0x4B
    if(aPawn != none)
    {
        return aPawn.GetHeadSphere();
    }
    Loc = Class'SPCameraTargeting'.static.ActorHeadLoc(A);
    return Class'SPEngine.SPUtil'.static.MakeSphere(Loc, 12.0000000);
    //return ReturnValue;    
}

simulated function UpdateTargetLoc()
{
    Previous = Current;
    // End:0x24
    if(Target == none)
    {
        return;
    }
    // End:0x265
    if((TargetPawn == none) || !TargetPawn.GetCameraTarget(Current.Loc, Current.Rot, Current.eyeLoc, Current.eyeRot))
    {
        Current.Loc = Target.Location;
        Current.Rot = Target.Rotation;
        // End:0x1CA
        if(Params.EyeSocket != 'None')
        {
            GetTargetSocketLocationAndRotation(Params.EyeSocket, Current.eyeLoc, Current.eyeRot);            
        }
        else
        {
            Current.eyeLoc = ((TargetPawn != none) ? TargetPawn.GetPawnViewLocation() : ActorEyeLoc(Target));
            Current.eyeRot = Target.Rotation;
        }
    }
    //return;    
}

simulated function CutTargetLoc()
{
    Previous = Current;
    //return;    
}

simulated function BlendTargetLoc()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL blendedloc, blendedofs, previousofs, localofs;

    localofs = (Current.eyeLoc - Current.Loc) << Current.Rot;
    // End:0xDD
    if(VSizeSq2D(localofs) < Square(Params.HorizontalHeadTrackingDeadZoneDistance))
    {
        localofs.X = 0.0000000;
        localofs.Y = 0.0000000;
    }
    previousofs = (Previous.eyeLoc - Previous.Loc) << Previous.Rot;
    blendedofs = Class'SPCameraBlend'.static.LowPassVector(previousofs, localofs, Params.HorizontalHeadTrackingSmoothRate, DeltaTime);
    blendedloc = (blendedofs >> Current.Rot) + Current.Loc;
    Current.eyeLoc.X = blendedloc.X;
    Current.eyeLoc.Y = blendedloc.Y;
    //return;    
}

simulated function MergeSecondaryTargets()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689], InC, Offset, merged, tgtsph;

    tgtsph = GetHead(Target);
    merged = tgtsph;
    Offset = ((SecondaryTargets.Length > 1) ? vect(0.0000000, 0.0000000, -50.0000000) : vect(0.0000000, 0.0000000, -25.0000000));
    merged.Center += Offset;
    // End:0x15F
    foreach SecondaryTargets(InC)
    {
        tgtsph = Class'SPEngine.SPUtil'.static.MakeSphere(InC.Center, FMax(InC.CylinderRadius, InC.CylinderHeight));
        merged = Class'SPEngine.SPUtil'.static.MergeSpheres(merged, tgtsph);        
    }    
    merged.Radius *= 0.2500000;
    tgtsph = GetHead(Target);
    // End:0x1D9
    if(OldEnemySphere.Radius < 0.0000000)
    {
        OldEnemySphere = tgtsph;
    }
    merged = Class'SPEngine.SPUtil'.static.MergeSpheres(merged, tgtsph);
    // End:0x2E6
    foreach SecondaryTargets(InC)
    {
        tgtsph = Class'SPEngine.SPUtil'.static.MakeSphere(InC.Center, FMax(InC.CylinderRadius, InC.CylinderHeight));
        merged = Class'SPEngine.SPUtil'.static.MergeSpheres(merged, tgtsph);        
    }    
    merged.Radius *= 0.9000000;
    merged.Center += Offset;
    merged = Class'SPEngine.SPUtil'.static.MakeSphere(Class'SPCameraBlend'.static.LowPassVector(OldEnemySphere.Center, merged.Center, Params.FilterRateEnemySphere, DeltaTime), Class'SPCameraBlend'.static.LowPassFloat(OldEnemySphere.Radius, merged.Radius, Params.FilterRateEnemySphere, DeltaTime));
    OldEnemySphere = merged;
    return merged;
    //return ReturnValue;    
}

function SetCameraFocalVector()
{
    local /*0x043A0000-0x00000000*/ private @NULL LookDir[8388609];

    FocalVector = LookDir;
    //return;    
}

function SetCameraFocusPoint()
{
    local /*0x043A0000-0x00000000*/ private @NULL LookAt[8388609];
    local /*0x043A0000-0x00000000*/ private float magnitude[9437185];

    0.0500000
    FocalPoint = LookAt;
    FocalPointMagnitude = magnitude;
    FocalVector = vect(0.0000000, 0.0000000, 0.0000000);
    //return;    
}

function HandleFocalPoint()
{
    local /*0x043A0000-0x00000000*/ private @NULL CameraLoc[8388609];

    // End:0x92
    if(FocalPoint != none)
    {
        // End:0x49
        if(FocusUseTargetDir)
        {
            FocalVector = Vector(FocalPoint.Rotation);            
        }
        else
        {
            FocalVector = Normal(FocalPoint.Location - CameraLoc);
        }
        FocalVector *= FocalPointMagnitude;
    }
    //return;    
}

function SetCameraIncludePoint()
{
    local /*0x043A0000-0x00000000*/ private @NULL Center[8388609];
    local /*0x043A0000-0x00000000*/ private float Radius[8388609];
    local /*0x043A0000-0x00000000*/ private bool Rotate[9437185];

    true
    IncludePoint = Center;
    IncludeRadius = Radius;
    IncludeByRotating = Rotate;
    //return;    
}

function ClearCameraIncludePoint()
{
    IncludeRadius = -1.0000000;
    //return;    
}

simulated function HandleIncludePoint()
{
    local /*0x043A0000-0x00000000*/ private @NULL CFD[8388609];

    // End:0xC2
    if(IncludeRadius >= 0.0000000)
    {
        // End:0x73
        if(IncludeByRotating)
        {
            CFD.IdealVT.RotateToIncludeSphere(IncludePoint, IncludeRadius, true, AspectRatio);            
        }
        else
        {
            CFD.IdealVT.OffsetToIncludeSphere(IncludePoint, IncludeRadius, AspectRatio);
        }
    }
    //return;    
}

simulated function ResetParams()
{
    Params = default.Params;
    //return;    
}

simulated function Reset()
{
    SecondaryTargets.Length = 0;
    OldEnemySphere.Radius = -1.0000000;
    ResetLook();
    ResetParams();
    ClearCameraIncludePoint();
    //return;    
}

simulated function IsPointInsideViewTargetCollision()
{
    local /*0x043A0000-0x00000000*/ private @NULL TestPoint[25296897];
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x89
    if((Target != none) && Target.CollisionComponent != none)
    {
        return Target.PointCheckComponent(Target.CollisionComponent, TestPoint, vect(0.0000000, 0.0000000, 0.0000000));
    }
    return false;
    //return ReturnValue;    
}

simulated function DisplayDebug()
{
    local /*0x043A0000-0x00000000*/ private @NULL HUD[8388609];
    local /*0x043A0000-0x00000000*/ private float out_YL[25165825], out_YPos;

    // End:0x58
    if(IncludeRadius >= 0.0000000)
    {
        Class'SPEngine.SPDebugUtil'.static.DrawDebugSphere(IncludePoint, IncludeRadius, 8, MakeColor(0, 255, 128));
    }
    //return;    
}

defaultproperties
{
    Params=(LookAroundPitchMinimum=20.0000000,LookAroundPitchMaximum=160.0000000,LookAroundClampYaw=180.0000000,LookAroundCenterYaw=0.0000000,HeadRadius=12.0000000,FilterRateEnemySphere=0.4000000,FilterRateEnemyHeads=0.2500000,HorizontalHeadTrackingSmoothRate=0.3000000,HorizontalHeadTrackingDeadZoneDistance=250.0000000,HeadTrackingPercent=0.0000000,MouseSensitivity=0.7000000,CameraTurnMax=12.0000000,CameraLookUpMax=10.0000000,LookInfluenceDelay=3.0000000,WeightEnemyRadiusMin=200.0000000,WeightEnemyRadiusMax=900.0000000,IncludeEnemyRadiusMax=650.0000000,EnemyLookInfluence=0.0000000,EyeSocket="None",bUseSelfCentering=false)
    AspectRatio=16.0000000
    AllowLook=true
    FocalDelay=2.0000000
    IncludeRadius=-1.0000000
}