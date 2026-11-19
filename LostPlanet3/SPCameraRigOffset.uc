class SPCameraRigOffset extends SPCameraRigOrbital
    hidecategories(Object,Object);

var(__Filter1__Delegate) /*0x05790000-0x00000000*/ private @NULL Offset[65537];
var(__Filter1__Delegate) /*0x05790000-0x00000000*/ private @NULL CollideOffset[65537];
var(__Filter1__Delegate) /*0x05790000-0x00000000*/ private @NULL NearOffset[65537];
var(__Filter1__Delegate) /*0x05790000-0x00000000*/ private float AvoidRadius[65537];
var(__Filter1__Delegate) /*0x05790000-0x00000000*/ private bool bAvoidPawns[65537];
var(__Filter1__Delegate) /*0x05790000-0x00000000*/ private bool bAvoidWorld[65537];
var(__Filter1__Delegate) /*0x05790000-0x00000000*/ private bool bAvoidRestrictAxis[65537];
var(__Filter1__Delegate) /*0x05790000-0x00000000*/ private int AvoidIterations[65537];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL OffsetFilter;

simulated function Reset()
{
    super.Reset();
    //return;    
}

// Export USPCameraRigOffset::execCopyFrom(FFrame&, void* const)
native simulated function CopyFrom()
{
    local /*0x043A0000-0x00000000*/ private @NULL Other[8388609];


}

simulated function ConvertFromTViewTarget()
{
    local /*0x043A0000-0x00000000*/ private @NULL VT[8388609];

    super.ConvertFromTViewTarget(VT);
    Offset = (VT.POV.Location - (Location + SphericalToCartesian(Orbit))) << (OffsetRot());
    CollideOffset = vect(0.0000000, 0.0000000, 0.0000000);
    //return;    
}

// Export USPCameraRigOffset::execAdjustFromTViewTarget(FFrame&, void* const)
native simulated function AdjustFromTViewTarget()
{
    local /*0x043A0000-0x00000000*/ private @NULL VT[25296897];


}

// Export USPCameraRigOffset::execConvertToTViewTarget(FFrame&, void* const)
native simulated function ConvertToTViewTarget()
{
    local /*0x043A0000-0x00000000*/ private @NULL VT[25165825];


}

simulated function OffsetRot()
{
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];

    return Rotation;
    //return ReturnValue;    
}

simulated function WorldOffset()
{
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];

    return (Offset + CollideOffset) >> Rotation;
    //return ReturnValue;    
}

// Export USPCameraRigOffset::execCameraLoc(FFrame&, void* const)
native simulated function CameraLoc()
{
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

simulated function DesiredLoc()
{
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];

    return (Location + SphericalToCartesian(Orbit)) + (Offset >> Rotation);
    //return ReturnValue;    
}

final function BlendOffset()
{
    local /*0x043A0000-0x00000000*/ private @NULL A[8388609], B, C;
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];

    BlendOrbital(A, B, C, DeltaTime);
    // End:0x68
    if(OffsetFilter == none)
    {
        Offset = C.Offset;        
    }
    else
    {
        OffsetFilter.Update(DeltaTime);
        Offset = OffsetFilter.BlendVector(A.Offset, B.Offset, C.Offset);
    }
    //return;    
}

simulated function SetWorldOffset()
{
    local /*0x043A0000-0x00000000*/ private @NULL Ofs[8388609];

    Offset = (Ofs - Location) << (OffsetRot());
    //return;    
}

static simulated function ReduceFloat()
{
    local /*0x043A0000-0x00000000*/ private float A[25165825], B;

    // End:0x20
    if((A * B) <= 0.0000000)
    {
        return;
    }
    // End:0x61
    if(Abs(A) > Abs(B))
    {
        A -= B;
        B = 0.0000000;        
    }
    else
    {
        B -= A;
        A = 0.0000000;
    }
    //return;    
}

simulated function OffsetToIncludeSphere()
{
    local /*0x043A0000-0x00000000*/ private @NULL Loc[8388609];
    local /*0x043A0000-0x00000000*/ private float Radius[8388609], OutputAspectRatio;
    local /*0x043A0000-0x00000000*/ private @NULL acc;
    local /*0x043A0000-0x00000000*/ private editfixedsize array FrustumPlanes;

    acc = OffsetToIncludeSphereGeneric(Loc, Radius, CameraLoc(), Rotation, FOV, OutputAspectRatio, FrustumPlanes);
    // End:0x6B
    if(VSizeSq(acc) < 0.0016000)
    {
        return;
    }
    acc = acc << (OffsetRot());
    ReduceFloat(CollideOffset.X, acc.X);
    ReduceFloat(CollideOffset.Y, acc.Y);
    ReduceFloat(CollideOffset.Z, acc.Z);
    Offset -= acc;
    //return;    
}

simulated function CameraAvoidWorld()
{
    local /*0x043A0000-0x00000000*/ private float Radius[8388609], Scale;
    local /*0x043A0000-0x00000000*/ private @NULL TargetLoc[8388609], ignoreActor;
    local /*0x043A0000-0x00000000*/ private bool bIncludePawns[9437185], bIncludeWorld;
    local /*0x043A0000-0x00000000*/ private @NULL toobstacles, avoidcollide;
    local /*0x043A0000-0x00000000*/ private float D, camcollideradius, NearPlane;
    local /*0x043A0000-0x00000000*/ private @NULL CamLoc;

    none
    false
    true
    // End:0x31
    if(!bIncludePawns && !bIncludeWorld)
    {
        return;
    }
    NearPlane = Class'SPEngine.SPUtil'.static.GetNearPlane();
    camcollideradius = Radius + NearPlane;
    CamLoc = (CameraLoc()) + (Vector(Rotation) * camcollideradius);
    // End:0xFE
    if(Class'SPEngine.SPProbe'.static.ScanClosestPoint(CamLoc, camcollideradius, toobstacles, ignoreActor, bIncludePawns, bIncludeWorld))
    {
    }
    D = VSizeSq(toobstacles);
    // End:0x234
    if(D > 0.0000000)
    {
        // End:0x234
        if(D < Square(camcollideradius))
        {
            D = Sqrt(D);
            avoidcollide = toobstacles * ((D - camcollideradius) / D);
            avoidcollide = Class'SPEngine.SPUtil'.static.RemoveSignedVectorComponent(avoidcollide, CamLoc - TargetLoc);
            CollideOffset += (avoidcollide << (OffsetRot()));
            Class'SPEngine.SPDebugUtil'.static.DrawDebugSphere(CamLoc, camcollideradius, 8, MakeColor(255, 0, 0));
        }
    }
    //return;    
}

simulated function GetBlockedPercent()
{
    local /*0x043A0000-0x00000000*/ private float ReturnValue[92274689];

    return 1.0000000 - CameraCollisionMain.Data.CurrDistUnblockedPct;
    //return ReturnValue;    
}

simulated function GetBlockedDistance()
{
    local /*0x043A0000-0x00000000*/ private float ReturnValue[92274689];

    return VSize(CollideOffset);
    //return ReturnValue;    
}

simulated function Collide()
{
    local /*0x043A0000-0x00000000*/ private @NULL Target[8388609];
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x043A0000-0x00000000*/ private @NULL StartLoc, CollideLoc, DesiredLoc, OrbitOfs, BaseLoc, OfsRot;

    local /*0x043A0000-0x00000000*/ private float OfsYsign;
    local /*0x043A0000-0x00000000*/ private @NULL SignNearOfs, Forward;
    local /*0x043A0000-0x00000000*/ private byte camcollide;
    local /*0x043A0000-0x00000000*/ private int I;
    local /*0x043A0000-0x00000000*/ private bool B;
    local /*0x043A0000-0x00000000*/ private @NULL tgtPawn;

    // End:0x4E
    if(CameraCollisionMain.Data.bDisabled)
    {
        CollideOffset = vect(0.0000000, 0.0000000, 0.0000000);
        return false;
    }
    OfsYsign = ((Abs(Offset.Y) < 2.5000000) ? 0.0000000 : Sign(Offset.Y));
    SignNearOfs = NearOffset;
    SignNearOfs.Y *= OfsYsign;
    OfsRot = OffsetRot();
    OrbitOfs = SphericalToCartesian(Orbit);
    BaseLoc = Location + OrbitOfs;
    StartLoc = Location + (SignNearOfs >> OfsRot);
    DesiredLoc = BaseLoc + (Offset >> OfsRot);
    CollideLoc = DesiredLoc;
    Forward = CameraForward();
    camcollide = CameraCollisionMain.PreventCameraPenetration(Target, StartLoc, CollideLoc, DeltaTime, Forward, CameraUp(), CameraRight(), FOV, AspectRatio);
    switch(camcollide)
    {
        // End:0x245
        case 2:
        // End:0x282
        case 1:
            CollideOffset = ((CollideLoc - BaseLoc) << OfsRot) - Offset;
            // End:0x2A7
            break;
        // End:0x2A1
        case 0:
            CollideOffset = vect(0.0000000, 0.0000000, 0.0000000);
            // End:0x2A7
            break;
        // End:0xFFFF
        default:
            // End:0x2A7
            break;
            break;
    }
    tgtPawn = SPPawn(Target);
    // End:0x41D
    if(tgtPawn != none)
    {
        // End:0x3EB
        if(CameraCollisionMain.Data.AutoHidePlayerBlockedThreshold >= 0.0000000)
        {
            B = (int(camcollide) == int(2)) && CameraCollisionMain.Data.CurrDistUnblockedPct <= CameraCollisionMain.Data.AutoHidePlayerBlockedThreshold;
            B = B || tgtPawn.bDesiresLocalInvisibility;
            SetLocalPlayerInvisibility(tgtPawn, B);            
        }
        else
        {
            SetLocalPlayerInvisibility(tgtPawn, tgtPawn.bDesiresLocalInvisibility);
        }
    }
    // End:0x4EB
    if(AvoidRadius > 0.0000000)
    {
        Forward = vect(1.0000000, 0.0000000, 0.0000000);
        I = AvoidIterations;
        J0x45A:

        // End:0x4EB [Loop If]
        if(I > 0)
        {
            CameraAvoidWorld(AvoidRadius, 0.5000000, StartLoc, Target, bAvoidPawns, bAvoidWorld);
            // End:0x4DD
            if(bAvoidRestrictAxis)
            {
                CollideOffset = Forward * (Forward Dot CollideOffset);
            }
            --I;
            // [Loop Continue]
            goto J0x45A;
        }
    }
    return int(camcollide) == int(2);
    //return ReturnValue;    
}

static function SetLocalPlayerInvisibility()
{
    local /*0x043A0000-0x00000000*/ private @NULL Target[8388609];
    local /*0x043A0000-0x00000000*/ private bool hide[8388609];

    Target.SetLocalPlayerInvisibility(hide);
    //return;    
}

simulated function EnableCollision()
{
    local /*0x043A0000-0x00000000*/ private bool bOn[8388609];

    CameraCollisionMain.Data.bDisabled = !bOn;
    //return;    
}

simulated function EnableCollisionDisplayFeelers()
{
    local /*0x043A0000-0x00000000*/ private bool bOn[8388609];

    CameraCollisionMain.Data.bDisplayFeelers = bOn;
    //return;    
}

simulated function CheckValid()
{
    //return;    
}

simulated function ToString()
{
    local /*0x043A0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return (((super.ToString() @ "  Ofs:") @ string(Offset)) @ "  COfs:") @ string(CollideOffset);
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
    bAvoidWorld=true
    AvoidIterations=2
    // Reference: SPCameraCollision'Default__SPCameraRigOffset.CameraCollisionObj'
    begin object name=CameraCollisionObj class=Class'SPCameraCollision'
        Data=(PenetrationBlendOutTime=0.0000000,PenetrationBlendInTime=0.0000000,CollisionFeelers=/* Array type was not detected. */)
    end object
    CameraCollisionMain=CameraCollisionObj
}