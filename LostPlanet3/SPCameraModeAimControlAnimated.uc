class SPCameraModeAimControlAnimated extends SPCameraModeAimControl
    abstract;

var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL AnimatedParams;
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private bool Animating;
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private name CameraSocketName;
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL CamAngle;
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL DesCamAngle;

function InitPendingMode()
{
    local /*0x043A0000-0x00000000*/ private @NULL PendingModeParam[8388609];

    super.InitPendingMode(PendingModeParam);
    AnimatedParams = SPCameraModeAimControlAnimatedParam(PendingModeParam.ModeParam);
    AnimatedParams.CheckCameraCollision = false;
    Animating = true;
    CamAngle = rot(0, 0, 0);
    DesCamAngle = rot(0, 0, 0);
    // End:0xF1
    if(AnimatedParams.CameraSocketName != 'None')
    {
        CameraSocketName = AnimatedParams.CameraSocketName;
    }
    //return;    
}

function FindCameraAngle()
{
    local /*0x043A0000-0x00000000*/ private @NULL CamLoc, End, Extent, CamRot, MyPawn;

    // End:0x15E
    if(AnimatedParams.CheckCameraCollision)
    {
        MyPawn = SPPawn(AnimatedParams.MyPawn);
        MyPawn.Mesh.GetSocketWorldLocationAndRotation(CameraSocketName, CamLoc, CamRot);
        End = CamLoc - MyPawn.Location;
        Extent = vect(10.0000000, 10.0000000, 10.0000000);
        // End:0x15E
        if(!Class'SPEngine.SPUtil'.static.SweepForValidDirection(MyPawn.Location, End, Extent, true, DesCamAngle.Yaw))
        {
        }
    }
    //return;    
}

function GetBaseLoc()
{
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];

    return SPPawn(AnimatedParams.MyPawn).GetCylinderHeadLocation();
    //return ReturnValue;    
}

function GetHeadSphere()
{
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689], sph;

    sph = SPPawn(AnimatedParams.MyPawn).GetHeadSphere();
    sph.Center += (Rig.CameraForward() * sph.Radius);
    sph.Radius *= 2.0000000;
    return sph;
    //return ReturnValue;    
}

function GetFollowerSphere()
{
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689], HeadSph, SM, MyPawn;

    MyPawn = SPPawn(AnimatedParams.MyPawn);
    HeadSph.Center = MyPawn.Location;
    HeadSph.Radius = -1.0000000;
    SM = SPSM_LeaderPawnBase(MyPawn.SpecialMoveState.CurSMInstance);
    // End:0x145
    if((SM != none) && SM.FollowerPawn != none)
    {
        HeadSph = SM.FollowerPawn.GetCameraFocusSphere();
    }
    return HeadSph;
    //return ReturnValue;    
}

function IncludeSphereByOffset()
{
    local /*0x043A0000-0x00000000*/ private @NULL Loc[8388609];
    local /*0x043A0000-0x00000000*/ private float Radius[8388609];

    // End:0x15
    if(Radius < 0.0000000)
    {
        return;
    }
    Rig.OffsetToIncludeSphere(Loc, Radius, CameraMgr.Targeting.AspectRatio);
    //return;    
}

function IncludeSphereByFOV()
{
    local /*0x043A0000-0x00000000*/ private @NULL Loc[8388609];
    local /*0x043A0000-0x00000000*/ private float Radius[8388609];

    // End:0x15
    if(Radius < 0.0000000)
    {
        return;
    }
    Rig.FOVToIncludeSphere(Loc, Radius, CameraMgr.Targeting.AspectRatio);
    //return;    
}

function IncludeHeadLoc()
{
    local /*0x043A0000-0x00000000*/ private @NULL HeadSphere;

    HeadSphere = GetHeadSphere();
    IncludeSphereByFOV(HeadSphere.Center, HeadSphere.Radius);
    //return;    
}

function IncludeFollower()
{
    local /*0x043A0000-0x00000000*/ private @NULL head;

    head = GetFollowerSphere();
    IncludeSphereByFOV(head.Center, head.Radius);
    //return;    
}

simulated function @NULL UpdateViewTarget()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL CamLoc, CamLoc2;
    local /*0x043A0000-0x00000000*/ private float fovx;
    local /*0x043A0000-0x00000400*/ private @NULL Mesh;

    // End:0x86
    if((!Animating || AnimatedParams.MyPawn == none) || AnimatedParams.MyPawn.Mesh == none)
    {
        super(SPCameraMode).UpdateViewTarget(DeltaTime);        
    }
    else
    {
        Mesh = AnimatedParams.MyPawn.Mesh;
        Rig.FOV = AnimatedParams.DesiredFOV;
        // End:0x165
        if(AnimatedParams.AnimatedFOV > 0.0000000)
        {
            Rig.FOV = AnimatedParams.AnimatedFOV;
        }
        // End:0x250
        if(AnimatedParams.CameraFOVBoneName != 'None')
        {
            fovx = Class'SPCameraActor'.static.RetrieveFOVFromAnimation(Mesh, AnimatedParams.CameraFOVBoneName, AnimatedParams.CameraFOVComponentAxis);
            // End:0x250
            if((fovx > 0.0000000) && fovx < 180.0000000)
            {
                Rig.FOV = fovx;
            }
        }
        Mesh.GetSocketWorldLocationAndRotation(CameraSocketName, CamLoc, Rig.Rotation);
        Rig.Location = GetBaseLoc();
        // End:0x446
        if(AnimatedParams.CheckCameraCollision)
        {
            CamAngle.Yaw = int(Class'SPEngine.SPBlend'.static.LowPassDegrees(float(CamAngle.Yaw), float(DesCamAngle.Yaw), 0.5000000, DeltaTime));
            Rig.SetWorldOffset(CamLoc);
            Rig.Rotation += CamAngle;
            CamLoc2 = Rig.CameraLoc();
            // End:0x443
            if(!Class'SPEngine.SPUtil'.static.WorldLineTest(CamLoc2, Rig.Location))
            {
                FindCameraAngle();
            }            
        }
        else
        {
            Rig.SetWorldOffset(CamLoc);
        }
        Rig.Orbit = RotatorToSpherical(Rig.Rotation);
    }
    //return;    
}

simulated function AllowLookAround()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function CollideViewTargets()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689], collided;
    local /*0x043A0000-0x00000000*/ private @NULL TargetPawn;

    collided = Rig.Collide(CameraMgr.Targeting.Target, DeltaTime);
    // End:0x144
    if(collided)
    {
        TargetPawn = SPPawn(CameraMgr.Targeting.Target);
        // End:0x144
        if(TargetPawn != none)
        {
            TargetPawn.NotifyCameraColliding(Rig.CameraForward(), Rig.GetBlockedDistance(), Rig.DesiredLoc());
        }
    }
    return collided;
    //return ReturnValue;    
}

simulated function FinalConstraints()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private bool collided[9437185];

    false
    CFD.CheckValid();
    // End:0x50
    if(AnimatedParams.bConstrainEnemyInFOV)
    {
        IncludeFollower();
    }
    CFD.CheckValid();
    // End:0x9B
    if(AnimatedParams.bConstrainPlayerInFOV)
    {
        IncludeHeadLoc();
    }
    CFD.CheckValid();
    Rig.EnforceLimits(DeltaTime);
    CFD.CheckValid();
    //return;    
}

simulated function ShouldOrbitOverrideRotation()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function CheckForTeleport()
{
    //return;    
}

simulated function Update()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private bool collided;
    local /*0x043A0000-0x00000000*/ private @NULL tgt, tempViewTarget;
    local /*0x043A0000-0x00000000*/ private float tempFOV;

    // End:0x5DE
    if(Animating)
    {
        tgt = CameraMgr.Targeting;
        tgt.Params.HeadTrackingPercent = Params.HeadTrackingPercent;
        CFD.IdealVT.Location = GetCameraRigBase(DeltaTime);
        // End:0xF6
        if(AllowLookAround())
        {
            SetTargetingLookaroundParams();
            PerformLookaround(DeltaTime);
        }
        CFD.CheckValid();
        UpdateViewTarget(DeltaTime);
        CFD.CheckValid();
        CFD.DesiredVT.CopyFrom(CFD.IdealVT);
        tgt.Update(DeltaTime);
        CFD.CheckValid();
        AdjustCameraOrientation(DeltaTime);
        CFD.CheckValid();
        Rig.EnforceLimits(DeltaTime);
        CFD.CheckValid();
        // End:0x2B8
        if(bIgnoreBlend || tgt.IsTargetOnPlatform())
        {
            CFD.Resync();
            bIgnoreBlend = false;            
        }
        else
        {
            BlendViewTargets(DeltaTime);
        }
        CFD.CheckValid();
        // End:0x344
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
        // End:0x46C
        if(tgt.IsTargetInGhostMode() || !AnimatedParams.bCollideCamera)
        {
            DontCollideViewTargets();            
        }
        else
        {
            tempFOV = Rig.FOV;
            Rig.FOV = float(Max(int(Rig.FOV), int(tempViewTarget.POV.FOV)));
            collided = CollideViewTargets(DeltaTime);
            Rig.FOV = tempFOV;
        }
        CFD.CheckValid();
        FinalConstraints(DeltaTime, collided);
        Rig.EnforceLimits(DeltaTime);
        CheckForTeleport();
        CFD.NextFrame();        
    }
    else
    {
        super.Update(DeltaTime);
    }
    //return;    
}

simulated function DisplayDebug()
{
    local /*0x043A0000-0x00000000*/ private @NULL HUD[8388609];
    local /*0x043A0000-0x00000000*/ private float out_YL[25165825], out_YPos;
    local /*0x043A0000-0x00000000*/ private @NULL HeadSph;

    super(SPCameraMode).DisplayDebug(HUD, out_YL, out_YPos);
    Class'SPEngine.SPDebugUtil'.static.DrawPawnCylinder(AnimatedParams.MyPawn, MakeColor(0, 0, 128));
    HeadSph = GetHeadSphere();
    Class'SPEngine.SPDebugUtilNative'.static.DrawDebugSphere(HeadSph.Center, HeadSph.Radius, 18, MakeColor(0, 0, 255));
    HeadSph = GetFollowerSphere();
    Class'SPEngine.SPDebugUtilNative'.static.DrawDebugSphere(HeadSph.Center, HeadSph.Radius, 18, MakeColor(255, 0, 0));
    Class'SPEngine.SPDebugUtilNative'.static.DrawDebugCross(GetBaseLoc(), 15.0000000, MakeColor(0, 255, 0));
    // End:0x20A
    if(!Animating)
    {
        HUD.Canvas.DrawText("Not animating!", true);
    }
    out_YPos = HUD.Canvas.CurY;
    //return;    
}

defaultproperties
{
    CameraSocketName="CameraASocket"
    // Reference: SPCameraBlendSpeedFilter'Default__SPCameraModeAimControlAnimated.OffsetFilterObj'
    begin object name=OffsetFilterObj
    end object
    StaticOffsetFilter=OffsetFilterObj
    // Reference: SPCameraCollision'Default__SPCameraModeAimControlAnimated.MainCameraCollisionObj'
    begin object name=MainCameraCollisionObj
    end object
    CameraCollisionMain=MainCameraCollisionObj
}