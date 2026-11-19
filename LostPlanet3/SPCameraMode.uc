class SPCameraMode extends Object
    abstract;

var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL CameraType[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL CameraMgr[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL CFD[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL Rig[536870913];
var(__Filter1__Delegate) /*0x055B0000-0x00000400*/ private @NULL Params[65537];
var(__Filter1__Delegate) /*0x043A0000-0x00000400*/ private editfixedsize @NULL CameraCollisionMain[524289];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL LookDirection[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private float TimeSinceLastLook[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private bool bIgnoreBlend[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private int LayerIdx[536870913];
//var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private editfixedsize delegate<@NULL> __Filter1__Delegate;
//var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private editfixedsize delegate<@NULL> __Filter2__Delegate;
//var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private editfixedsize delegate<@NULL> __Filter3__Delegate;

// Export USPCameraMode::execPreProcessInput(FFrame&, void* const)
native function PreProcessInput()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL SPInput[8388609];


}

// Export USPCameraMode::execProcessViewRotation(FFrame&, void* const)
native function ProcessViewRotation()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL OutViewRotation[25165825], OutDeltaRot;


}

// Export USPCameraMode::execHasCameraBasedMovement(FFrame&, void* const)
native function HasCameraBasedMovement()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPCameraMode::execNeedsInputBasisFiltering(FFrame&, void* const)
native function NeedsInputBasisFiltering()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPCameraMode::execIsUsingCameraAdjustedInputValues(FFrame&, void* const)
native function IsUsingCameraAdjustedInputValues()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPCameraMode::execGetPawnRotationType(FFrame&, void* const)
native function GetPawnRotationType()
{
    local /*0x043A0000-0x00000000*/ private byte ReturnValue[92274689];


}

// Export USPCameraMode::execShouldPlayerFaceView(FFrame&, void* const)
native function ShouldPlayerFaceView()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];


}

function Init()
{
    CFD = new (self) Class'SPCameraFrameData';
    CFD.Init();
    Rig = CFD.IdealVT;
    //return;    
}

simulated event Destroyed()
{
    Params.PositionTarget = none;
    Params.LookAtTarget = none;
    //return;    
}

function InitPendingMode()
{
    local /*0x043A0000-0x00000000*/ private @NULL PendingModeParam[8388609];

    Params = PendingModeParam.ModeParam;
    //return;    
}

function OnBecomeActive()
{
    local /*0x043A0000-0x00000000*/ private @NULL PrevCameraMode[8388609];

    CameraMgr.Targeting.Reset();
    CameraMgr.Targeting.Params.MouseSensitivity = Params.MouseSensitivity;
    CameraMgr.SetLookScale(Params.LookRightScale, Params.LookUpScale);
    CameraMgr.Targeting.Params.CameraTurnMax = Params.CameraTurnMax;
    CameraMgr.Targeting.Params.CameraLookUpMax = Params.CameraLookUpMax;
    CFD.IdealVT.Reset();
    //return;    
}

function OnBecomeInActive()
{
    local /*0x043A0000-0x00000000*/ private @NULL NewCameraMode[8388609];

    // End:0x45
    if(NewCameraMode != self)
    {
        // End:0x45
        if(LayerIdx == NewCameraMode.LayerIdx)
        {
            ClearParamRefs();
        }
    }
    //return;    
}

function OnClearCameraMode()
{
    ClearParamRefs();
    //return;    
}

function ClearParamRefs()
{
    Params.PositionTarget = none;
    Params.LookAtTarget = none;
    //return;    
}

function IsCameraFirstPerson()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function GetCurrentViewTarget()
{
    local /*0x043A0000-0x00000000*/ private @NULL Result[25165825];

    Rig.ConvertToTViewTarget(Result);
    // End:0x9A
    if(Result.Target == none)
    {
        Result.Target = CameraMgr.Targeting.Target;
    }
    //return;    
}

function ShouldBlendEyeLocation()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function SyncViewTarget()
{
    local /*0x043A0000-0x00000000*/ private @NULL Dest[8388609];

    Rig.ConvertFromTViewTarget(Dest);
    //return;    
}

simulated function SyncViewTargetExceptBase()
{
    local /*0x043A0000-0x00000000*/ private @NULL Dest[8388609];

    Rig.AdjustFromTViewTarget(Dest);
    //return;    
}

simulated function Update()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private bool collided;
    local /*0x043A0000-0x00000000*/ private @NULL tgt, tempViewTarget;
    local /*0x043A0000-0x00000000*/ private float tempFOV;

    tgt = CameraMgr.Targeting;
    tgt.Params.HeadTrackingPercent = Params.HeadTrackingPercent;
    CFD.IdealVT.Location = GetCameraRigBase(DeltaTime);
    // End:0xE9
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
    GetOffset();
    CFD.CheckValid();
    AdjustCameraOrientation(DeltaTime);
    CFD.CheckValid();
    Rig.EnforceLimits(DeltaTime);
    CFD.CheckValid();
    // End:0x2B5
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
    // End:0x341
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
    // End:0x443
    if(tgt.IsTargetInGhostMode())
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
    //return;    
}

simulated function SetTargetingLookaroundParams()
{
    local /*0x043A0000-0x00000000*/ private @NULL tgt;

    tgt = CameraMgr.Targeting;
    tgt.Params.LookAroundClampYaw = Params.LookAroundClampYaw;
    tgt.Params.LookAroundPitchMinimum = Params.LookAroundPitchMinimum;
    tgt.Params.LookAroundPitchMaximum = Params.LookAroundPitchMaximum;
    tgt.DefaultLookDirection = Rig.CameraForward();
    //return;    
}

simulated function PerformLookaround()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];

    CameraMgr.Targeting.LookAround(DeltaTime);
    //return;    
}

simulated function CheckForTeleport()
{
    // End:0xF0
    if(!CameraType.IsInTransition())
    {
        // End:0xF0
        if(VSizeSq(CFD.IdealVT.RotateAround() - CFD.CurrentVT.RotateAround()) > Square(500.0000000))
        {
            self.RecenterCamera(CFD.IdealVT);
            CameraType.TransitionCut();
        }
    }
    //return;    
}

function IgnoreBlend()
{
    bIgnoreBlend = true;
    //return;    
}

simulated function GetCameraRigBase()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];

    return CameraMgr.Targeting.Current.eyeLoc;
    //return ReturnValue;    
}

simulated function UpdateViewTarget()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];

    // End:0x63
    if(Params.DesiredFOV > float(0))
    {
        Rig.FOV = Params.DesiredFOV;
    }
    //return;    
}

simulated function GetOffset()
{
    CFD.IdealVT.Offset = vect(0.0000000, 0.0000000, 0.0000000);
    //return;    
}

simulated function BlendViewTargets()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];

    CFD.IdealVT.BlendOffset(CFD.PreviousVT, CFD.CurrentVT, CFD.IdealVT, DeltaTime);
    //return;    
}

simulated function AdjustLookInputs()
{
    local /*0x043A0000-0x00000000*/ private @NULL Look[25165825];

    //return;    
}

simulated function GetLookInfluences()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];

    return CameraMgr.Targeting.GetTargetLookInfluences(Rig.Offset, DeltaTime, Rig.Orbit.Pitch);
    //return ReturnValue;    
}

simulated function AdjustCameraOrientation()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL LookDir;
    local /*0x043A0000-0x00000000*/ private float threshold1, threshold2;

    threshold1 = 1.0000000;
    threshold2 = 1.0000000;
    LookDir = CameraMgr.Targeting.LookDirection;
    // End:0xDF
    if(VSizeSq(LookDir) < Square(0.0020000))
    {
        LookDir = GetLookInfluences(DeltaTime);
        threshold1 = Params.IndirectLookThresholdOuter;
        threshold2 = Params.IndirectLookThresholdInner;
    }
    CFD.IdealVT.Orbit = CameraMgr.Targeting.AdjustLook(CFD.IdealVT.Orbit, LookDir, DeltaTime, threshold1, threshold2);
    //return;    
}

simulated function AllowLookAround()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

simulated function DoesRequireTarget()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

simulated function ForceUseGlobalFilter()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function DontCollideViewTargets()
{
    //return;    
}

simulated function CollideViewTargets()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    return Rig.Collide(CameraMgr.Targeting.Target, DeltaTime);
    //return ReturnValue;    
}

simulated function ShouldOrbitOverrideRotation()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

simulated function FinalConstraints()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private bool collided[9437185];

    false
    CFD.CheckValid();
    // End:0x52
    if(!collided)
    {
        CFD.CheckValid();
    }
    //return;    
}

function RecenterCamera()
{
    local /*0x043A0000-0x00000000*/ private @NULL SavedVT[25165825];
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

private final delegate Filter1()
{
    local /*0x043A0000-0x00000000*/ private float A[8388609], B, T, ReturnValue;

    //return ReturnValue;    
}

private final delegate Filter2()
{
    local /*0x043A0000-0x00000000*/ private float A[8388609], B, C, T, ReturnValue;

    //return ReturnValue;    
}

private final delegate Filter3()
{
    local /*0x043A0000-0x00000000*/ private float A[8388609], B, C, D, T, ReturnValue;

    //return ReturnValue;    
}

private static final function GraphBackground()
{
    local /*0x043A0000-0x00000000*/ private @NULL Canvas[8388609], background, Border;
    local /*0x043A0000-0x00000000*/ private int bx[8388609], By, Z;

    Canvas.SetDrawColorStruct(background);
    Canvas.DrawRect(float(Z), float(Z));
    Canvas.SetPos(float(bx), float(By), 0.0000000);
    Canvas.SetDrawColorStruct(Border);
    Canvas.DrawBox(float(Z), float(Z));
    //return;    
}

private final function GraphFilter1Response()
{
    local /*0x043A0000-0x00000000*/ private @NULL cv[8388609], tint;
    local /*0x043A0000-0x00000000*/ private float bx[8388609], By, Z;
    local /*0x043A0000-0x00000000*/ private int G[8388609];
    local /*0x043A0000-0x00000000*/ private float T[8388609];
    local /*0x043A0000-0x00000000*/ private editfixedsize delegate<@NULL> Filter[8388609];
    local /*0x043A0000-0x00000000*/ private float N, J, K, M, div, tgt;

    local /*0x043A0000-0x00000000*/ private int I;

    J = 0.0000000;
    K = 0.0000000;
    M = 0.0000000;
    tgt = 1.0000000;
    div = 1.0000000 / float(G);
    I = 1;
    J0x63:

    // End:0x1AA [Loop If]
    if(I <= G)
    {
        N = float(I) * div;
        M = Filter1(K, tgt, T);
        cv.Draw2DLine(bx + (Z * N), By + (Z * M), bx + (Z * J), By + (Z * K), tint);
        J = N;
        K = M;
        ++I;
        // [Loop Continue]
        goto J0x63;
    }
    //return;    
}

private final function GraphFilter2Response()
{
    local /*0x043A0000-0x00000000*/ private @NULL cv[8388609], tint;
    local /*0x043A0000-0x00000000*/ private float bx[8388609], By, Z;
    local /*0x043A0000-0x00000000*/ private int G[8388609];
    local /*0x043A0000-0x00000000*/ private float T[8388609];
    local /*0x043A0000-0x00000000*/ private editfixedsize delegate<@NULL> Filter[8388609];
    local /*0x043A0000-0x00000000*/ private float N, J, K, M, O, div,
	    tgt;

    local /*0x043A0000-0x00000000*/ private int I;

    J = 0.0000000;
    K = 0.0000000;
    M = 0.0000000;
    O = 0.0000000;
    tgt = 1.0000000;
    div = 1.0000000 / float(G);
    I = 1;
    J0x72:

    // End:0x1D5 [Loop If]
    if(I <= G)
    {
        N = float(I) * div;
        M = Filter2(O, K, tgt, T);
        cv.Draw2DLine(bx + (Z * N), By + (Z * M), bx + (Z * J), By + (Z * K), tint);
        O = K;
        J = N;
        K = M;
        ++I;
        // [Loop Continue]
        goto J0x72;
    }
    //return;    
}

private final function GraphFilter3Response()
{
    local /*0x043A0000-0x00000000*/ private @NULL cv[8388609], tint;
    local /*0x043A0000-0x00000000*/ private float bx[8388609], By, Z;
    local /*0x043A0000-0x00000000*/ private int G[8388609];
    local /*0x043A0000-0x00000000*/ private float T[8388609];
    local /*0x043A0000-0x00000000*/ private editfixedsize delegate<@NULL> Filter[8388609];
    local /*0x043A0000-0x00000000*/ private float N, J, K, L, M, O,
	    div, tgt;

    local /*0x043A0000-0x00000000*/ private int I;

    J = 0.0000000;
    K = 0.0000000;
    L = 0.0000000;
    M = 0.0000000;
    O = 0.0000000;
    tgt = 1.0000000;
    div = 1.0000000 / float(G);
    I = 1;
    J0x81:

    // End:0x200 [Loop If]
    if(I <= G)
    {
        N = float(I) * div;
        M = Filter3(O, K, L, tgt, T);
        cv.Draw2DLine(bx + (Z * N), By + (Z * M), bx + (Z * J), By + (Z * K), tint);
        O = K;
        J = N;
        K = M;
        L = tgt;
        ++I;
        // [Loop Continue]
        goto J0x81;
    }
    //return;    
}

private static final function Filter1A()
{
    local /*0x043A0000-0x00000000*/ private float A[8388609], B, T, ReturnValue;

    return Class'SPEngine.SPBlend'.static.LowPassFloat(A, B, 0.0700000, T);
    //return ReturnValue;    
}

private static final function Filter1C()
{
    local /*0x043A0000-0x00000000*/ private float A[8388609], B, T, ReturnValue;

    return Class'SPEngine.SPBlend'.static.SpeedLimitFloat(A, B, 0.5000000, T);
    //return ReturnValue;    
}

private static final function Filter1D()
{
    local /*0x043A0000-0x00000000*/ private float A[8388609], B, T, ReturnValue;

    return Class'SPEngine.SPBlend'.static.SpeedLimitFloat(A, B, 0.2500000, T);
    //return ReturnValue;    
}

private static final function Filter2A()
{
    local /*0x043A0000-0x00000000*/ private float A[8388609], B, C, T, ReturnValue;

    return Class'SPEngine.SPBlend'.static.LowPass2Float(A, B, C, 0.1500000, T);
    //return ReturnValue;    
}

private static final function Filter2B()
{
    local /*0x043A0000-0x00000000*/ private float A[8388609], B, C, T, ReturnValue;

    return Class'SPEngine.SPBlend'.static.LowPass2Float(A, B, C, 0.2400000, T);
    //return ReturnValue;    
}

private static final function Filter2C()
{
    local /*0x043A0000-0x00000000*/ private float A[8388609], B, C, T, ReturnValue;

    return Class'SPEngine.SPBlend'.static.LowPass2Float(A, B, C, 0.1600000, T);
    //return ReturnValue;    
}

private static final function Filter2D()
{
    local /*0x043A0000-0x00000000*/ private float A[8388609], B, C, T, ReturnValue;

    return Class'SPEngine.SPBlend'.static.LowPass3Float(A, B, C, 0.6000000, T);
    //return ReturnValue;    
}

static final simulated function Hermite()
{
    local /*0x043A0000-0x00000000*/ private float A[8388609], B, av, bv, T, ReturnValue,
	    t2, t3;

    t2 = T * T;
    t3 = t2 * T;
    return ((((((2.0000000 * t3) - (float(3) * t2)) + float(1)) * A) + (((t3 - (float(2) * t2)) + T) * av)) + (((float(-2) * t3) + (float(3) * t2)) * B)) + ((t3 - t2) * bv);
    //return ReturnValue;    
}

static final simulated function SmoothFloat()
{
    local /*0x043A0000-0x00000000*/ private float ao[8388609], A, bo, B, Rate, Time,
	    ReturnValue, av, bv, Q, T,
	    t2, t3;

    T = Time * Rate;
    // End:0x3B
    if(T >= 1.0000000)
    {
        return B;
    }
    av = (A - ao) / T;
    bv = B - bo;
    Q = B - A;
    Q *= 4.0000000;
    av = ((Q >= 0.0000000) ? FMin(av, Q) : FMax(av, Q));
    t2 = T * T;
    t3 = t2 * T;
    return ((((((2.0000000 * t3) - (3.0000000 * t2)) + 1.0000000) * A) + (((t3 - (2.0000000 * t2)) + T) * av)) + (((-2.0000000 * t3) + (3.0000000 * t2)) * B)) + ((t3 - t2) * bv);
    //return ReturnValue;    
}

private static final function Filter3C()
{
    local /*0x043A0000-0x00000000*/ private float A[8388609], B, C, D, T, ReturnValue;

    return SmoothFloat(A, B, C, D, 0.4000000, T);
    //return ReturnValue;    
}

simulated function DisplayDebug()
{
    local /*0x043A0000-0x00000000*/ private @NULL HUD[8388609];
    local /*0x043A0000-0x00000000*/ private float out_YL[25165825], out_YPos, bx, By, Z, T;

    local /*0x043A0000-0x00000000*/ private int G;
    local /*0x043A0000-0x00000000*/ private @NULL Canvas;

    Canvas = HUD.Canvas;
    // End:0x23F
    if(HUD.ShouldDisplayDebug('Filter'))
    {
        G = 64;
        T = 10.0000000 / float(G);
        Z = 500.0000000;
        bx = Canvas.CurX;
        By = Canvas.CurY;
        GraphBackground(Canvas, MakeColor(16, 16, 16, 96), MakeColor(128, 128, 128), int(bx), int(By), int(Z));
        GraphFilter2Response(Canvas, MakeColor(0, 255, 0), bx, By, Z, G, T, Filter2C);
        GraphFilter3Response(Canvas, MakeColor(0, 255, 255), bx, By, Z, G, T, Filter3C);
        By += Z;
        Canvas.SetPos(bx, By, 0.0000000);
    }
    out_YPos = Canvas.CurY;
    HUD.Canvas.SetDrawColor(255, 192, 0);
    HUD.Canvas.DrawText("CameraMode:" @ string(self), true);
    out_YPos = HUD.Canvas.CurY;
    // End:0x372
    if(CFD != none)
    {
        CFD.DisplayDebug(HUD, out_YL, out_YPos);
    }
    //return;    
}

defaultproperties
{
    LayerIdx=-1
}