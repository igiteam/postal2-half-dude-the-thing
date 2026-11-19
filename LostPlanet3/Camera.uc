class Camera extends Actor
    transient
    notplaceable
    hidecategories(AnimDependency,Navigation);

const MAX_ACTIVE_CAMERA_ANIMS = 8;

enum EViewTargetBlendFunction
{
    VTBlend_Linear,                 // 0
    VTBlend_Cubic,                  // 1
    VTBlend_EaseIn,                 // 2
    VTBlend_EaseOut,                // 3
    VTBlend_EaseInOut,              // 4
    VTBlend_MAX                     // 5
};

enum ECameraAnimPlaySpace
{
    CAPS_CameraLocal,               // 0
    CAPS_World,                     // 1
    CAPS_UserDefined,               // 2
    CAPS_MAX                        // 3
};

struct native TCameraCache
{
    var(*) /*0x35EA0000-0x00000000*/ private float TimeStamp;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL POV;

    structdefaultproperties
    {
        TimeStamp=0.0000000
        POV=(Location=(X=0.0000000,Y=0.0000000,Z=0.0000000),Rotation=(Pitch=0,Yaw=0,Roll=0),FOV=90.0000000)
    }
};

struct native TViewTarget
{
    var(*) /*0x4E070000-0x00000000*/ private @NULL Target[65537];
    var(*) /*0x4E070000-0x00000000*/ private @NULL Controller[65537];
    var(*) /*0x4E070000-0x00000000*/ private @NULL POV[65537];
    var(*) /*0x4E070000-0x00000000*/ private float AspectRatio[65537];
    var(*) /*0x4E070000-0x00000000*/ private @NULL PRI[65537];

    structdefaultproperties
    {
        Target=none
        Controller=none
        POV=(Location=(X=0.0000000,Y=0.0000000,Z=0.0000000),Rotation=(Pitch=0,Yaw=0,Roll=0),FOV=90.0000000)
        AspectRatio=0.0000000
        PRI=none
    }
};

struct native ViewTargetTransitionParams
{
    var(*) /*0x4FF30000-0x00000000*/ private float BlendTime[65537];
    var(*) /*0x4FF30000-0x00000000*/ private byte BlendFunction[65537];
    var(*) /*0x4FF30000-0x00000000*/ private float BlendExp[65537];
    var(*) /*0x4FF30000-0x00000000*/ private bool bLockOutgoing[65537];

    structdefaultproperties
    {
        BlendTime=0.0000000
        BlendFunction=EViewTargetBlendFunction.VTBlend_Cubic
        BlendExp=2.0000000
        bLockOutgoing=false
    }
};

var(*) /*0x35EA0000-0x00000000*/ private @NULL PCOwner;
var(*) /*0x35EA0000-0x00000000*/ private name CameraStyle;
var(*) /*0x35EA0000-0x00000000*/ private float DefaultFOV;
var(*) /*0x35EA0000-0x00000000*/ private bool bLockedFOV;
var(*) /*0x35EA0000-0x00000000*/ private bool bConstrainAspectRatio;
var(*) /*0x35EA0000-0x00000000*/ private bool bEnableFading;
var(*) /*0x35EA0000-0x00000000*/ private bool bFadeAudio;
var(*) /*0x35EA0000-0x00000000*/ private bool bForceDisableTemporalAA[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bEnableColorScaling;
var(*) /*0x35EA0000-0x00000000*/ private bool bEnableColorScaleInterp;
var(*) /*0x35EA0000-0x00000000*/ private bool bUseClientSideCameraUpdates;
var(*) /*0x35EA0000-0x00000000*/ private bool bDebugClientSideCamera;
var(*) /*0x35EA0000-0x00000000*/ private bool bShouldSendClientSideCameraUpdate;
var(*) /*0x35EA0000-0x00000000*/ private float LockedFOV;
var(*) /*0x35EA0000-0x00000000*/ private float ConstrainedAspectRatio;
var(*) /*0x35EA0000-0x00000000*/ private float DefaultAspectRatio;
var(*) /*0x35EA0000-0x00000000*/ private float OffAxisYawAngle;
var(*) /*0x35EA0000-0x00000000*/ private float OffAxisPitchAngle;
var(*) /*0x35EA0000-0x00000000*/ private @NULL FadeColor;
var(*) /*0x35EA0000-0x00000000*/ private float FadeAmount;
var(*) /*0x35EA0000-0x00000000*/ private float CamOverridePostProcessAlpha;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL CamPostProcessSettings;
var(*) /*0x35EA0000-0x00000000*/ private @NULL RenderingOverrides;
var(*) /*0x35EA0000-0x00000000*/ private @NULL ColorScale;
var(*) /*0x35EA0000-0x00000000*/ private @NULL DesiredColorScale;
var(*) /*0x35EA0000-0x00000000*/ private @NULL OriginalColorScale;
var(*) /*0x35EA0000-0x00000000*/ private float ColorScaleInterpDuration;
var(*) /*0x35EA0000-0x00000000*/ private float ColorScaleInterpStartTime;
var(*) /*0x35EA0000-0x00000000*/ private @NULL CameraCache;
var(*) /*0x35EA0000-0x00000000*/ private @NULL LastFrameCameraCache;
var(*) /*0x35EA0000-0x00000000*/ private @NULL ViewTarget;
var(*) /*0x35EA0000-0x00000000*/ private @NULL PendingViewTarget;
var(*) /*0x35EA0000-0x00000000*/ private float BlendTimeToGo;
var(*) /*0x35EA0000-0x00000000*/ private @NULL BlendParams;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ModifierList;
var(*) /*0x35EA0000-0x00000000*/ private float FreeCamDistance;
var(*) /*0x35EA0000-0x00000000*/ private @NULL FreeCamOffset;
var(*) /*0x35EA0000-0x00000000*/ private @NULL FadeAlpha;
var(*) /*0x35EA0000-0x00000000*/ private float FadeTime;
var(*) /*0x35EA0000-0x00000000*/ private float FadeTimeRemaining;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array CameraLensEffects[536870913];
var(*) /*0x10A20000-0x00000400*/ private @NULL CameraShakeCamMod[536936449];
var(*) /*0x10A20000-0x00000000*/ private class CameraShakeCamModClass[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL AnimInstPool[8];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ActiveAnims;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array FreeAnims;
var(*) /*0x35EA0000-0x00000000*/ private @NULL AnimCameraActor[536870913];

protected function CreateCameraModifier()
{
    local /*0x35EA0000-0x00000000*/ private class ModifierClass[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689], NewMod;

    NewMod = new (Outer) ModifierClass;
    NewMod.Init();
    NewMod.AddCameraModifier(self);
    return NewMod;
    //return ReturnValue;    
}

function PostBeginPlay()
{
    local /*0x35EA0000-0x00000000*/ private int Idx;

    super.PostBeginPlay();
    // End:0x50
    if((CameraShakeCamMod == none) && CameraShakeCamModClass != none)
    {
        CameraShakeCamMod = CameraModifier_CameraShake(CreateCameraModifier(CameraShakeCamModClass));
    }
    Idx = 0;
    J0x5B:

    // End:0xC2 [Loop If]
    if(Idx < 8)
    {
        AnimInstPool[Idx] = new (self) Class'CameraAnimInst';
        FreeAnims[Idx] = AnimInstPool[Idx];
        ++Idx;
        // [Loop Continue]
        goto J0x5B;
    }
    AnimCameraActor = Spawn(Class'DynamicCameraActor', self,,,,, true);
    //return;    
}

event Destroyed()
{
    AnimCameraActor.Destroy();
    super.Destroyed();
    //return;    
}

function UserUpdateViewTarget()
{
    local /*0x35EA0000-0x00000000*/ private @NULL OutVT[25165825];
    local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];

    //return;    
}

// Export UCamera::execApplyCameraModifiers(FFrame&, void* const)
native function ApplyCameraModifiers()
{
    local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL OutPOV[25165825];


}

function InitializeFor()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PC[8388609];

    CameraCache.POV.FOV = DefaultFOV;
    PCOwner = PC;
    SetViewTarget(PC.ViewTarget);
    SetDesiredColorScale(WorldInfo.DefaultColorScale, 5.0000000);
    UpdateCamera(0.0000000);
    //return;    
}

function GetFOVAngle()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x17
    if(bLockedFOV)
    {
        return LockedFOV;
    }
    return CameraCache.POV.FOV;
    //return ReturnValue;    
}

function SetFOV()
{
    local /*0x35EA0000-0x00000000*/ private float NewFOV[8388609];

    // End:0x33
    if((NewFOV < float(1)) || NewFOV > float(170))
    {
        bLockedFOV = false;
        return;
    }
    bLockedFOV = true;
    LockedFOV = NewFOV;
    //return;    
}

simulated event SetCameraViewPoint()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InViewTarget[8388609], InCamLoc, InCamRot;
    local /*0x35EA0000-0x00000000*/ private float InFov[8388609];

    //return;    
}

// Export UCamera::execGetCameraViewPoint(FFrame&, void* const)
native final function GetCameraViewPoint()
{
    local /*0x35EA0000-0x00000000*/ private @NULL OutCamLoc[25165825], OutCamRot;


}

// Export UCamera::execGetCameraRotation(FFrame&, void* const)
native final function GetCameraRotation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

simulated function SetDesiredColorScale()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewColorScale[8388609];
    local /*0x35EA0000-0x00000000*/ private float InterpTime[8388609];

    // End:0x81
    if(!bEnableColorScaling)
    {
        bEnableColorScaling = true;
        ColorScale.X = 1.0000000;
        ColorScale.Y = 1.0000000;
        ColorScale.Z = 1.0000000;
    }
    // End:0x105
    if(NewColorScale != ColorScale)
    {
        OriginalColorScale = ColorScale;
        DesiredColorScale = NewColorScale;
        ColorScaleInterpStartTime = WorldInfo.TimeSeconds;
        ColorScaleInterpDuration = InterpTime;
        bEnableColorScaleInterp = true;
    }
    //return;    
}

simulated event UpdateCamera()
{
    local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];

    // End:0x17F
    if((PCOwner.IsLocalPlayerController() || !bUseClientSideCameraUpdates) || bDebugClientSideCamera)
    {
        DoUpdateCamera(DeltaTime);
        // End:0x17F
        if((int(WorldInfo.NetMode) == int(NM_Client)) && bShouldSendClientSideCameraUpdate)
        {
            PCOwner.ServerUpdateCamera(CameraCache.POV.Location, (CameraCache.POV.Rotation.Pitch & 65535) + ((CameraCache.POV.Rotation.Yaw & 65535) << 16));
            bShouldSendClientSideCameraUpdate = false;
        }
    }
    //return;    
}

simulated function DoUpdateCamera()
{
    local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL NewPOV;
    local /*0x35EA0000-0x00000000*/ private float DurationPct, BlendPct;

    // End:0xA5
    if(bEnableColorScaleInterp)
    {
        BlendPct = FClamp((WorldInfo.TimeSeconds - ColorScaleInterpStartTime) / ColorScaleInterpDuration, 0.0000000, 1.0000000);
        ColorScale = VLerp(OriginalColorScale, DesiredColorScale, BlendPct);
        // End:0xA5
        if(BlendPct == 1.0000000)
        {
            bEnableColorScaleInterp = false;
        }
    }
    bConstrainAspectRatio = false;
    CamOverridePostProcessAlpha = 0.0000000;
    // End:0x135
    if((PendingViewTarget.Target == none) || !BlendParams.bLockOutgoing)
    {
        CheckViewTarget(ViewTarget);
        UpdateViewTarget(ViewTarget, DeltaTime);
    }
    NewPOV = ViewTarget.POV;
    ConstrainedAspectRatio = ViewTarget.AspectRatio;
    // End:0x4A5
    if(PendingViewTarget.Target != none)
    {
        BlendTimeToGo -= DeltaTime;
        bConstrainAspectRatio = false;
        CheckViewTarget(PendingViewTarget);
        UpdateViewTarget(PendingViewTarget, DeltaTime);
        // End:0x3EE
        if(BlendTimeToGo > float(0))
        {
            DurationPct = (BlendParams.BlendTime - BlendTimeToGo) / BlendParams.BlendTime;
            switch(BlendParams.BlendFunction)
            {
                // End:0x29F
                case 0:
                    BlendPct = Lerp(0.0000000, 1.0000000, DurationPct);
                    // End:0x3BC
                    break;
                // End:0x2D8
                case 1:
                    BlendPct = FCubicInterp(0.0000000, 0.0000000, 1.0000000, 0.0000000, DurationPct);
                    // End:0x3BC
                    break;
                // End:0x323
                case 2:
                    BlendPct = FInterpEaseIn(0.0000000, 1.0000000, DurationPct, BlendParams.BlendExp);
                    // End:0x3BC
                    break;
                // End:0x36E
                case 3:
                    BlendPct = FInterpEaseOut(0.0000000, 1.0000000, DurationPct, BlendParams.BlendExp);
                    // End:0x3BC
                    break;
                // End:0x3B9
                case 4:
                    BlendPct = FInterpEaseInOut(0.0000000, 1.0000000, DurationPct, BlendParams.BlendExp);
                    // End:0x3BC
                    break;
                // End:0xFFFF
                default:
                    break;
            }
            NewPOV = BlendViewTargets(ViewTarget, PendingViewTarget, BlendPct);            
        }
        else
        {
            ViewTarget = PendingViewTarget;
            PendingViewTarget.Target = none;
            PendingViewTarget.Controller = none;
            BlendTimeToGo = 0.0000000;
            NewPOV = PendingViewTarget.POV;
        }
        // End:0x4A5
        if(bConstrainAspectRatio)
        {
            ConstrainedAspectRatio = PendingViewTarget.AspectRatio;
        }
    }
    FillCameraCache(NewPOV);
    // End:0x5C5
    if(bEnableFading && FadeTimeRemaining > 0.0000000)
    {
        FadeTimeRemaining = FMax(FadeTimeRemaining - DeltaTime, 0.0000000);
        // End:0x591
        if(FadeTime > 0.0000000)
        {
            FadeAmount = FadeAlpha.X + ((1.0000000 - (FadeTimeRemaining / FadeTime)) * (FadeAlpha.Y - FadeAlpha.X));
        }
        // End:0x5C5
        if(bFadeAudio)
        {
            ApplyAudioFade();
            // End:0x5C5
            if(FadeAmount == float(0))
            {
                bFadeAudio = false;
            }
        }
    }
    //return;    
}

// Export UCamera::execApplyAudioFade(FFrame&, void* const)
native function ApplyAudioFade();

final function BlendViewTargets()
{
    local /*0x35EA0000-0x00000000*/ private @NULL A[25296897], B;
    local /*0x35EA0000-0x00000000*/ private float Alpha[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689], POV;

    POV.Location = VLerp(A.POV.Location, B.POV.Location, Alpha);
    POV.FOV = Lerp(A.POV.FOV, B.POV.FOV, Alpha);
    POV.Rotation = RLerp(A.POV.Rotation, B.POV.Rotation, Alpha, true);
    return POV;
    //return ReturnValue;    
}

final function FillCameraCache()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewPOV[25296897];

    // End:0x52
    if(CameraCache.TimeStamp != WorldInfo.TimeSeconds)
    {
        LastFrameCameraCache = CameraCache;
    }
    CameraCache.TimeStamp = WorldInfo.TimeSeconds;
    CameraCache.POV = NewPOV;
    //return;    
}

// Export UCamera::execCheckViewTarget(FFrame&, void* const)
native function CheckViewTarget()
{
    local /*0x35EA0000-0x00000000*/ private @NULL VT[25165825];


}

function ApplyFinalConstraints()
{
    local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL VT[25165825];

    //return;    
}

function UpdateViewTarget()
{
    local /*0x35EA0000-0x00000000*/ private @NULL OutVT[25165825];
    local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Loc, pos, HitLocation, HitNormal, Rot, HitActor,
	    CamActor;

    local /*0x35EA0000-0x00000000*/ private bool bDoNotApplyModifiers;
    local /*0x35EA0000-0x00000000*/ private @NULL OrigPOV, TPawn;

    // End:0x66
    if(((PendingViewTarget.Target != none) && OutVT == ViewTarget) && BlendParams.bLockOutgoing)
    {
        return;
    }
    OrigPOV = OutVT.POV;
    OutVT.POV.FOV = DefaultFOV;
    CamActor = CameraActor(OutVT.Target);
    // End:0x20E
    if(CamActor != none)
    {
        CamActor.GetCameraView(DeltaTime, OutVT.POV);
        bConstrainAspectRatio = bConstrainAspectRatio || CamActor.bConstrainAspectRatio;
        OutVT.AspectRatio = CamActor.AspectRatio;
        CamOverridePostProcessAlpha = CamActor.CamOverridePostProcessAlpha;
        CamPostProcessSettings = CamActor.CamOverridePostProcess;        
    }
    else
    {
        TPawn = Pawn(OutVT.Target);
        // End:0x879
        if((TPawn == none) || !TPawn.CalcCamera(DeltaTime, OutVT.POV.Location, OutVT.POV.Rotation, OutVT.POV.FOV))
        {
            bDoNotApplyModifiers = true;
            switch(CameraStyle)
            {
                // End:0x35C
                case 'Fixed':
                    OutVT.POV = OrigPOV;
                    // End:0x879
                    break;
                // End:0x368
                case 'ThirdPerson':
                // End:0x374
                case 'FreeCam':
                // End:0x380
                case 'FreeCam_Default':
                // End:0x673
                case 'FreeCamNoCollision':
                    Loc = OutVT.Target.Location;
                    Rot = OutVT.Target.Rotation;
                    // End:0x4DE
                    if((TPawn != none) && TPawn.Mesh != none)
                    {
                        Loc += ((TPawn.Mesh.Translation - TPawn.default.Mesh.Translation) >> OutVT.Target.Rotation);
                    }
                    // End:0x536
                    if((CameraStyle == 'FreeCam') || CameraStyle == 'FreeCam_Default')
                    {
                        Rot = PCOwner.Rotation;
                    }
                    Loc += (FreeCamOffset >> Rot);
                    pos = Loc - (Vector(Rot) * FreeCamDistance);
                    HitActor = none;
                    // End:0x5E4
                    if(CameraStyle != 'FreeCamNoCollision')
                    {
                        HitActor = Trace(HitLocation, HitNormal, pos, Loc, false, vect(12.0000000, 12.0000000, 12.0000000));
                    }
                    OutVT.POV.Location = ((HitActor == none) ? pos : HitLocation);
                    OutVT.POV.Rotation = Rot;
                    // End:0x879
                    break;
                // End:0x6D5
                case 'UserStyle':
                    bDoNotApplyModifiers = true;
                    UserUpdateViewTarget(OutVT, DeltaTime);
                    ApplyCameraModifiers(0.0000000, OutVT.POV);
                    // End:0x879
                    break;
                // End:0x6E1
                case 'FirstPerson':
                // End:0xFFFF
                default:
                    OutVT.Target.GetActorEyesViewPoint(OutVT.POV.Location, OutVT.POV.Rotation);
                    // End:0x876
                    if((TPawn != none) && TPawn.Mesh != none)
                    {
                        OutVT.POV.Location += ((TPawn.Mesh.Translation - TPawn.default.Mesh.Translation) >> OutVT.Target.Rotation);
                    }
                    // End:0x879
                    break;
                    break;
            }
        }
    }
    // End:0x8B7
    if(!bDoNotApplyModifiers)
    {
        ApplyCameraModifiers(DeltaTime, OutVT.POV);
    }
    ApplyFinalConstraints(DeltaTime, OutVT);
    //return;    
}

// Export UCamera::execSetViewTarget(FFrame&, void* const)
native final function SetViewTarget()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewViewTarget[8388609], TransitionParams;


}

function ProcessViewRotation()
{
    local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL OutViewRotation[25165825], OutDeltaRot;
    local /*0x35EA0000-0x00000000*/ private int ModifierIdx;

    ModifierIdx = 0;
    J0x0B:

    // End:0xB0 [Loop If]
    if(ModifierIdx < ModifierList.Length)
    {
        // End:0xA2
        if(ModifierList[ModifierIdx] != none)
        {
            // End:0xA2
            if(ModifierList[ModifierIdx].ProcessViewRotation(ViewTarget.Target, DeltaTime, OutViewRotation, OutDeltaRot))
            {
                // [Explicit Break]
                goto J0xB0;
            }
        }
        ModifierIdx++;
        // [Loop Continue]
        goto J0x0B;
    }
    J0xB0:

    //return;    
}

simulated function DisplayDebug()
{
    local /*0x35EA0000-0x00000000*/ private @NULL HUD[8388609];
    local /*0x35EA0000-0x00000000*/ private float out_YL[25165825], out_YPos;
    local /*0x35EA0000-0x00000000*/ private @NULL EyesLoc, EyesRot, Canvas;

    Canvas = HUD.Canvas;
    Canvas.SetDrawColor(255, 255, 255);
    Canvas.DrawText((("	Camera Style:" $ string(CameraStyle)) @ "main ViewTarget:") $ string(ViewTarget.Target));
    out_YPos += out_YL;
    Canvas.SetPos(4.0000000, out_YPos);
    Canvas.DrawText((((("   CamLoc:" $ string(CameraCache.POV.Location)) @ "CamRot:") $ string(CameraCache.POV.Rotation)) @ "FOV:") $ string(CameraCache.POV.FOV));
    out_YPos += out_YL;
    Canvas.SetPos(4.0000000, out_YPos);
    Canvas.DrawText("   AspectRatio:" $ string(ConstrainedAspectRatio));
    out_YPos += out_YL;
    Canvas.SetPos(4.0000000, out_YPos);
    // End:0x3A2
    if(ViewTarget.Target != none)
    {
        ViewTarget.Target.GetActorEyesViewPoint(EyesLoc, EyesRot);
        Canvas.DrawText((("   EyesLoc:" $ string(EyesLoc)) @ "EyesRot:") $ string(EyesRot));
        out_YPos += out_YL;
        Canvas.SetPos(4.0000000, out_YPos);
    }
    //return;    
}

function FindCameraLensEffect()
{
    local /*0x35EA0000-0x00000000*/ private class LensEffectEmitterClass[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689], LensEffect;

    // End:0xF8
    foreach CameraLensEffects(LensEffect)
    {
        // End:0xF7
        if(!LensEffect.bDeleteMe && ((LensEffect.Class == LensEffectEmitterClass) || LensEffect.EmittersToTreatAsSame.Find(LensEffectEmitterClass) != ) || )
        {
            LensEffectEmitterClass.default.EmittersToTreatAsSame.Find(LensEffect.Class);            
            -1                                                
            return LensEffect;
        }        
    }    
    return none;
    //return ReturnValue;    
}

function AddCameraLensEffect()
{
    local /*0x35EA0000-0x00000000*/ private class LensEffectEmitterClass[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL CamLoc, CamRot, LensEffect;

    // End:0x16B
    if(LensEffectEmitterClass != none)
    {
        // End:0x7E
        if(!LensEffectEmitterClass.default.bAllowMultipleInstances)
        {
            LensEffect = FindCameraLensEffect(LensEffectEmitterClass);
            // End:0x7E
            if(LensEffect != none)
            {
                LensEffect.NotifyRetriggered();
            }
        }
        // End:0x16B
        if(LensEffect == none)
        {
            LensEffect = Spawn(LensEffectEmitterClass, PCOwner.GetViewTarget());
            // End:0x16B
            if(LensEffect != none)
            {
                GetCameraViewPoint(CamLoc, CamRot);
                LensEffect.UpdateLocation(CamLoc, CamRot, GetFOVAngle());
                LensEffect.RegisterCamera(self);
                CameraLensEffects.AddItem(LensEffect);                
            }
        }
    }
    //return;    
}

function RemoveCameraLensEffect()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Emitter[8388609];

    CameraLensEffects.RemoveItem(Emitter);    
    //return;    
}

function ClearCameraLensEffects()
{
    local /*0x35EA0000-0x00000000*/ private @NULL LensEffect;

    // End:0x30
    foreach CameraLensEffects(LensEffect)
    {
        LensEffect.Destroy();        
    }    
    CameraLensEffects.Length = 0;
    //return;    
}

function PlayCameraShake()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Shake[8388609];
    local /*0x35EA0000-0x00000000*/ private float Scale[8388609];
    local /*0x35EA0000-0x00000000*/ private byte PlaySpace[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL UserPlaySpaceRot[9437185];

    0    
    // End:0x59
    if(Shake != none)
    {
        CameraShakeCamMod.AddCameraShake(Shake, Scale, PlaySpace, UserPlaySpaceRot);
    }
    //return;    
}

function StopCameraShake()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Shake[8388609];

    // End:0x37
    if(Shake != none)
    {
        CameraShakeCamMod.RemoveCameraShake(Shake);
    }
    //return;    
}

static function CalcRadialShakeScale()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Cam[8388609], Epicenter;
    local /*0x35EA0000-0x00000000*/ private float InnerRadius[8388609], OuterRadius, Falloff, ReturnValue;
    local /*0x35EA0000-0x00000000*/ private @NULL POVLoc;
    local /*0x35EA0000-0x00000000*/ private float DistPct;

    POVLoc = Cam.Location;
    // End:0xBE
    if(InnerRadius < OuterRadius)
    {
        DistPct = (VSize(Epicenter - POVLoc) - InnerRadius) / (OuterRadius - InnerRadius);
        DistPct = 1.0000000 - FClamp(DistPct, 0.0000000, 1.0000000);
        return DistPct ** Falloff;        
    }
    else
    {
        return ((VSize(Epicenter - POVLoc) < InnerRadius) ? 1.0000000 : 0.0000000);
    }
    //return ReturnValue;    
}

static function PlayWorldCameraShake()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Shake[8388609], ShakeInstigator, Epicenter;
    local /*0x35EA0000-0x00000000*/ private float InnerRadius[8388609], OuterRadius, Falloff;
    local /*0x35EA0000-0x00000000*/ private bool bTryForceFeedback[8388609], bOrientShakeTowardsEpicenter;
    local /*0x35EA0000-0x00000000*/ private @NULL PC;
    local /*0x35EA0000-0x00000000*/ private float ShakeScale;
    local /*0x35EA0000-0x00000000*/ private @NULL CamRot, CamLoc;

    // End:0x1CC
    if(ShakeInstigator != none)
    {
        // End:0x1CB
        foreach ShakeInstigator.LocalPlayerControllers(Class'PlayerController', PC)
        {
            // End:0x1CA
            if(PC.PlayerCamera != none)
            {
                ShakeScale = CalcRadialShakeScale(PC.PlayerCamera, Epicenter, InnerRadius, OuterRadius, Falloff);
                // End:0x18D
                if(bOrientShakeTowardsEpicenter && PC.Pawn != none)
                {
                    PC.PlayerCamera.GetCameraViewPoint(CamLoc, CamRot);
                    PC.ClientPlayCameraShake(Shake, ShakeScale, bTryForceFeedback, 2, Rotator(Epicenter - CamLoc));
                    // End:0x1CA
                    continue;
                }
                PC.ClientPlayCameraShake(Shake, ShakeScale, bTryForceFeedback);
            }            
        }        
    }
    //return;    
}

function ClearAllCameraShakes()
{
    CameraShakeCamMod.RemoveAllCameraShakes();
    //return;    
}

// Export UCamera::execPlayCameraAnim(FFrame&, void* const)
native simulated function PlayCameraAnim()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Anim[8388609];
    local /*0x35EA0000-0x00000000*/ private float Rate[9437185], Scale, BlendInTime, BlendOutTime;
    local /*0x35EA0000-0x00000000*/ private bool bLoop[9437185], bRandomStartTime;
    local /*0x35EA0000-0x00000000*/ private float Duration[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bSingleInstance[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    1.0000000
    1.0000000                                                                    
}

// Export UCamera::execStopAllCameraAnims(FFrame&, void* const)
native simulated function StopAllCameraAnims()
{
    local /*0x35EA0000-0x00000000*/ private bool bImmediate[9437185];


}

// Export UCamera::execStopAllCameraAnimsByType(FFrame&, void* const)
native simulated function StopAllCameraAnimsByType()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Anim[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bImmediate[9437185];


}

// Export UCamera::execStopCameraAnim(FFrame&, void* const)
native simulated function StopCameraAnim()
{
    local /*0x35EA0000-0x00000000*/ private @NULL AnimInst[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bImmediate[9437185];


}

defaultproperties
{
    DefaultFOV=90.0000000
    bUseClientSideCameraUpdates=true
    DefaultAspectRatio=1.3333300
    CamPostProcessSettings=(SPPostFXSettings=(Filter=(bEnabled=false,InterpolationDuration=1.0000000,BlurKernelRadius=8.0000000,VerticalStreak=0.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_BlurKernelRadius=true,bOverride_VerticalStreak=true,bOverride_Interp_Scale=true,Interp_BlurKernelRadius=(Amount=0.0000000,Blend=1.0000000),Interp_VerticalStreak=(Amount=0.0000000,Blend=1.0000000)),Bloom=(bEnabled=false,InterpolationDuration=1.0000000,Threshold=0.5000000,Intensity=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_Threshold=true,bOverride_Intensity=true,bOverride_Interp_Scale=true,Interp_Threshold=(Amount=0.0000000,Blend=1.0000000),Interp_Intensity=(Amount=0.0000000,Blend=1.0000000)),DepthOfField=(bEnabled=false,InterpolationDuration=1.0000000,MaxBlurAmountNear=0.0000000,MaxBlurAmountFar=0.0000000,FocusRadius=5000.0000000,FocusDistance=0.0000000,FocusExponent=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_MaxBlurAmountNear=true,bOverride_MaxBlurAmountFar=true,bOverride_FocusRadius=true,bOverride_FocusDistance=true,bOverride_FocusExponent=true,bOverride_Interp_Scale=true,Interp_MaxBlurAmountNear=(Amount=0.0000000,Blend=1.0000000),Interp_MaxBlurAmountFar=(Amount=0.0000000,Blend=1.0000000),Interp_FocusRadius=(Amount=0.0000000,Blend=1.0000000),Interp_FocusDistance=(Amount=0.0000000,Blend=1.0000000),Interp_FocusExponent=(Amount=0.0000000,Blend=1.0000000)),MotionBlur=(bEnabled=false,InterpolationDuration=1.0000000,Amount=0.0000000,MaxVelocity=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_Amount=true,bOverride_MaxVelocity=true,bOverride_Interp_Scale=true,Interp_Amount=(Amount=0.0000000,Blend=1.0000000),Interp_MaxVelocity=(Amount=0.0000000,Blend=1.0000000)),Fog=(bEnabled=false,InterpolationDuration=1.0000000,DistanceNear=0.0000000,DistanceFar=5000.0000000,ColorNear=(X=1.0000000,Y=1.0000000,Z=1.0000000),ColorFar=(X=1.0000000,Y=1.0000000,Z=1.0000000),ColorDistanceExponent=(X=1.0000000,Y=1.0000000,Z=1.0000000),OpacityNear=0.0000000,OpacityFar=0.0000000,OpacityDistanceExponent=1.0000000,OpacitySky=0.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_DistanceNear=true,bOverride_DistanceFar=true,bOverride_ColorNear=true,bOverride_ColorFar=true,bOverride_ColorDistanceExponent=true,bOverride_OpacityNear=true,bOverride_OpacityFar=true,bOverride_OpacityDistanceExponent=true,bOverride_OpacitySky=true,bOverride_Interp_Scale=true,Interp_DistanceNear=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceFar=(Amount=0.0000000,Blend=1.0000000),Interp_ColorNear=(Amount=0.0000000,Blend=1.0000000),Interp_ColorFar=(Amount=0.0000000,Blend=1.0000000),Interp_ColorDistanceExponent=(Amount=0.0000000,Blend=1.0000000),Interp_OpacityNear=(Amount=0.0000000,Blend=1.0000000),Interp_OpacityFar=(Amount=0.0000000,Blend=1.0000000),Interp_OpacityDistanceExponent=(Amount=0.0000000,Blend=1.0000000),Interp_OpacitySky=(Amount=0.0000000,Blend=1.0000000)),ColorAdjust=(bEnabled=false,InterpolationDuration=1.0000000,bAfterBloom=true,Saturation=1.0000000,ColorBalance=(X=0.0000000,Y=0.0000000,Z=0.0000000),ColorBalanceBias=0.0000000,ColorBalancePreserveLuminosity=0.0000000,ColorBalanceDesaturation=(X=0.0000000,Y=0.0000000,Z=0.0000000),Shadows=(X=1.0000000,Y=1.0000000,Z=1.0000000),HighlightsColor=(X=0.0000000,Y=0.0000000,Z=0.0000000),HighlightsBias=0.0000000,HighlightsThreshold=0.0000000,HighlightsSaturation=0.0000000,HighlightsGamma=1.0000000,Overbright=(X=0.0000000,Y=0.0000000,Z=0.0000000),LevelsMin=0.0000000,LevelsMid=0.0000000,LevelsMax=1.0000000,bEnableFarSettings=false,bUseGradientSphere=false,DistanceNear=0.0000000,DistanceFar=5000.0000000,DistanceExponent=1.0000000,DistanceScale=1.0000000,Far_Saturation=1.0000000,Far_ColorBalance=(X=0.0000000,Y=0.0000000,Z=0.0000000),Far_ColorBalanceBias=0.0000000,Far_ColorBalancePreserveLuminosity=0.0000000,Far_ColorBalanceDesaturation=(X=0.0000000,Y=0.0000000,Z=0.0000000),Far_Shadows=(X=1.0000000,Y=1.0000000,Z=1.0000000),Far_HighlightsColor=(X=0.0000000,Y=0.0000000,Z=0.0000000),Far_HighlightsBias=0.0000000,Far_HighlightsThreshold=0.0000000,Far_HighlightsSaturation=0.0000000,Far_HighlightsGamma=1.0000000,Far_Overbright=(X=0.0000000,Y=0.0000000,Z=0.0000000),Far_LevelsMin=0.0000000,Far_LevelsMid=0.0000000,Far_LevelsMax=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_bAfterBloom=true,bOverride_Saturation=true,bOverride_ColorBalance=true,bOverride_ColorBalanceBias=true,bOverride_ColorBalancePreserveLuminosity=true,bOverride_ColorBalanceDesaturation=true,bOverride_Shadows=true,bOverride_HighlightsColor=true,bOverride_HighlightsBias=true,bOverride_HighlightsThreshold=true,bOverride_HighlightsSaturation=true,bOverride_HighlightsGamma=true,bOverride_Overbright=true,bOverride_LevelsMin=true,bOverride_LevelsMid=true,bOverride_LevelsMax=true,bOverride_bEnableFarSettings=true,bOverride_bUseGradientSphere=true,bOverride_DistanceNear=true,bOverride_DistanceFar=true,bOverride_DistanceExponent=true,bOverride_DistanceScale=true,bOverride_Far_Saturation=true,bOverride_Far_ColorBalance=true,bOverride_Far_ColorBalanceBias=true,bOverride_Far_ColorBalancePreserveLuminosity=true,bOverride_Far_ColorBalanceDesaturation=true,bOverride_Far_Shadows=true,bOverride_Far_HighlightsColor=true,bOverride_Far_HighlightsBias=true,bOverride_Far_HighlightsThreshold=true,bOverride_Far_HighlightsSaturation=true,bOverride_Far_HighlightsGamma=true,bOverride_Far_Overbright=true,bOverride_Far_LevelsMin=true,bOverride_Far_LevelsMid=true,bOverride_Far_LevelsMax=true,bOverride_Interp_Scale=true,Interp_Saturation=(Amount=0.0000000,Blend=1.0000000),Interp_ColorBalance=(Amount=0.0000000,Blend=1.0000000),Interp_ColorBalanceBias=(Amount=0.0000000,Blend=1.0000000),Interp_ColorBalancePreserveLuminosity=(Amount=0.0000000,Blend=1.0000000),Interp_ColorBalanceDesaturation=(Amount=0.0000000,Blend=1.0000000),Interp_Shadows=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsColor=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsBias=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsThreshold=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsSaturation=(Amount=0.0000000,Blend=1.0000000),Interp_HighlightsGamma=(Amount=0.0000000,Blend=1.0000000),Interp_Overbright=(Amount=0.0000000,Blend=1.0000000),Interp_LevelsMin=(Amount=0.0000000,Blend=1.0000000),Interp_LevelsMid=(Amount=0.0000000,Blend=1.0000000),Interp_LevelsMax=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceNear=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceFar=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceExponent=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceScale=(Amount=0.0000000,Blend=1.0000000),Interp_Far_Saturation=(Amount=0.0000000,Blend=1.0000000),Interp_Far_ColorBalance=(Amount=0.0000000,Blend=1.0000000),Interp_Far_ColorBalanceBias=(Amount=0.0000000,Blend=1.0000000),Interp_Far_ColorBalancePreserveLuminosity=(Amount=0.0000000,Blend=1.0000000),Interp_Far_ColorBalanceDesaturation=(Amount=0.0000000,Blend=1.0000000),Interp_Far_Shadows=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsColor=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsBias=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsThreshold=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsSaturation=(Amount=0.0000000,Blend=1.0000000),Interp_Far_HighlightsGamma=(Amount=0.0000000,Blend=1.0000000),Interp_Far_Overbright=(Amount=0.0000000,Blend=1.0000000),Interp_Far_LevelsMin=(Amount=0.0000000,Blend=1.0000000),Interp_Far_LevelsMid=(Amount=0.0000000,Blend=1.0000000),Interp_Far_LevelsMax=(Amount=0.0000000,Blend=1.0000000)),DebugControl=(bEnabled=false,InterpolationDuration=1.0000000,Interp_Scale=0.0000000,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_Interp_Scale=true)),ScreenLayersSettings=(bEnabled=false,InterpolationDuration=1.0000000,Material=none,AltMaterial=none,bUseAltMaterial=false,NumPlanes=4,DistanceNear=10.0000000,DistanceFar=1010.0000000,TextureScale=1.0000000,MotionScaleRotation=0.5000000,MotionScaleTranslation=(X=1.0000000,Y=1.0000000,Z=1.0000000),TintColor=(R=255,G=255,B=255,A=255),Scroll=(X=0.0000000,Y=0.0000000,Z=0.0000000),bUseRotation=true,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_NumPlanes=true,bOverride_Material=true,bOverride_AltMaterial=true,bOverride_bUseAltMaterial=true,bOverride_DistanceNear=true,bOverride_DistanceFar=true,bOverride_TextureScale=true,bOverride_MotionScaleRotation=true,bOverride_MotionScaleTranslation=true,bOverride_TintColor=true,bOverride_Scroll=true,bOverride_bUseRotation=true,Interp_DistanceNear=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceFar=(Amount=0.0000000,Blend=1.0000000),Interp_TextureScale=(Amount=0.0000000,Blend=1.0000000),Interp_MotionScaleRotation=(Amount=0.0000000,Blend=1.0000000),Interp_MotionScaleTranslation=(Amount=0.0000000,Blend=1.0000000),Interp_TintColor=(Amount=0.0000000,Blend=1.0000000),Interp_Scroll=(Amount=0.0000000,Blend=1.0000000)),bOverride_EnableBloom=true,bOverride_EnableDOF=true,bOverride_EnableMotionBlur=true,bOverride_EnableSceneEffect=true,bOverride_EnableMaterialEffect=true,bOverride_AllowAmbientOcclusion=true,bOverride_OverrideRimShaderColor=true,bOverride_Bloom_Scale=true,bOverride_Bloom_Threshold=true,bOverride_Bloom_Tint=true,bOverride_Bloom_ScreenBlendThreshold=true,bOverride_Bloom_InterpolationDuration=true,bOverride_DOF_FalloffExponent=true,bOverride_DOF_BlurKernelSize=true,bOverride_DOF_BlurBloomKernelSize=true,bOverride_DOF_MaxNearBlurAmount=true,bOverride_DOF_MinBlurAmount=false,bOverride_DOF_MaxFarBlurAmount=true,bOverride_DOF_FocusType=true,bOverride_DOF_FocusInnerRadius=true,bOverride_DOF_FocusDistance=true,bOverride_DOF_FocusPosition=true,bOverride_DOF_InterpolationDuration=true,bOverride_DOF_BokehTexture=false,bOverride_MotionBlur_MaxVelocity=false,bOverride_MotionBlur_Amount=false,bOverride_MotionBlur_FullMotionBlur=false,bOverride_MotionBlur_CameraRotationThreshold=false,bOverride_MotionBlur_CameraTranslationThreshold=false,bOverride_MotionBlur_InterpolationDuration=false,bOverride_Scene_Desaturation=true,bOverride_Scene_Colorize=false,bOverride_Scene_TonemapperScale=false,bOverride_Scene_ImageGrainScale=false,bOverride_Scene_HighLights=true,bOverride_Scene_MidTones=true,bOverride_Scene_Shadows=true,bOverride_Scene_InterpolationDuration=true,bOverride_Scene_ColorGradingLUT=false,bOverride_RimShader_Color=true,bOverride_RimShader_InterpolationDuration=true,bOverride_MobileColorGrading=false,bOverride_SSAO_OcclusionColor=true,bOverride_SSAO_OcclusionPower=true,bOverride_SSAO_OcclusionScale=true,bOverride_SSAO_OcclusionBias=true,bOverride_SSAO_OcclusionRadius=true,bOverride_SSAO_OcclusionQuality=true,bOverride_SSAO_OcclusionFadeoutMinDistance=true,bOverride_SSAO_OcclusionFadeoutMaxDistance=true,bOverride_SSAO_InterpolationDuration=true,bOverride_Scene_Material=true,bOverride_MaterialEffect_InterpolationDuration=true,bEnableBloom=true,bEnableDOF=false,bEnableMotionBlur=true,bEnableSceneEffect=true,bEnableMaterialEffect=true,bAllowAmbientOcclusion=true,bOverrideRimShaderColor=false,Bloom_Scale=1.0000000,Bloom_Threshold=1.0000000,Bloom_Tint=(R=255,G=255,B=255,A=0),Bloom_ScreenBlendThreshold=10.0000000,Bloom_InterpolationDuration=1.0000000,DOF_BlurBloomKernelSize=16.0000000,DOF_FalloffExponent=4.0000000,DOF_BlurKernelSize=16.0000000,DOF_MaxNearBlurAmount=1.0000000,DOF_MinBlurAmount=0.0000000,DOF_MaxFarBlurAmount=1.0000000,DOF_FocusType=EFocusType.FOCUS_Distance,DOF_FocusInnerRadius=2000.0000000,DOF_FocusDistance=0.0000000,DOF_FocusPosition=(X=0.0000000,Y=0.0000000,Z=0.0000000),DOF_InterpolationDuration=1.0000000,DOF_BokehTexture=none,MotionBlur_MaxVelocity=1.0000000,MotionBlur_Amount=0.5000000,MotionBlur_FullMotionBlur=true,MotionBlur_CameraRotationThreshold=45.0000000,MotionBlur_CameraTranslationThreshold=10000.0000000,MotionBlur_InterpolationDuration=1.0000000,Scene_Desaturation=0.0000000,Scene_Colorize=(X=1.0000000,Y=1.0000000,Z=1.0000000),Scene_TonemapperScale=1.0000000,Scene_ImageGrainScale=0.0000000,Scene_HighLights=(X=1.0000000,Y=1.0000000,Z=1.0000000),Scene_MidTones=(X=1.0000000,Y=1.0000000,Z=1.0000000),Scene_Shadows=(X=0.0000000,Y=0.0000000,Z=0.0000000),Scene_InterpolationDuration=1.0000000,RimShader_Color=(R=0.4704400,G=0.5859730,B=0.8277260,A=1.0000000),RimShader_InterpolationDuration=1.0000000,ColorGrading_LookupTable=none,ColorGradingLUT=(LUTTextures=none,LUTWeights=none),MobileColorGrading=(TransitionTime=1.0000000,Blend=0.0000000,Desaturation=0.0000000,HighLights=(R=0.7000000,G=0.7000000,B=0.7000000,A=1.0000000),MidTones=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000),Shadows=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000)),MobilePostProcess=(bOverride_Mobile_BlurAmount=false,bOverride_Mobile_TransitionTime=false,bOverride_Mobile_Bloom_Scale=false,bOverride_Mobile_Bloom_Threshold=false,bOverride_Mobile_Bloom_Tint=false,bOverride_Mobile_DOF_Distance=false,bOverride_Mobile_DOF_MinRange=false,bOverride_Mobile_DOF_MaxRange=false,bOverride_Mobile_DOF_NearBlurFactor=false,bOverride_Mobile_DOF_FarBlurFactor=false,Mobile_BlurAmount=16.0000000,Mobile_TransitionTime=1.0000000,Mobile_Bloom_Scale=6.0000000,Mobile_Bloom_Threshold=0.5000000,Mobile_Bloom_Tint=(R=1.0000000,G=1.0000000,B=1.0000000,A=1.0000000),Mobile_DOF_Distance=1500.0000000,Mobile_DOF_MinRange=600.0000000,Mobile_DOF_MaxRange=1200.0000000,Mobile_DOF_NearBlurFactor=1.0000000,Mobile_DOF_FarBlurFactor=1.0000000),SSAO_OcclusionColor=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000),SSAO_OcclusionPower=4.0000000,SSAO_OcclusionScale=20.0000000,SSAO_OcclusionBias=0.0000000,SSAO_OcclusionRadius=25.0000000,SSAO_OcclusionQuality=EAmbientOcclusionQuality.AO_Medium,SSAO_OcclusionFadeoutMinDistance=4000.0000000,SSAO_OcclusionFadeoutMaxDistance=4500.0000000,SSAO_InterpolationDuration=1.0000000,MaterialEffect_InterpolationDuration=1.0000000,Scene_Material=none,Scene_MaterialFadeOpacityValue=1.0000000,PreviousScene_Material=none,PreviousScene_MaterialFadeOpacityValue=0.0000000)
    RenderingOverrides=(bAllowAmbientOcclusion=true,bAllowDominantWholeSceneDynamicShadows=true,bAllowMotionBlurSkinning=true,bAllowTemporalAA=true,bAllowLightShafts=true)
    CameraCache=(TimeStamp=0.0000000,POV=(Location=(X=0.0000000,Y=0.0000000,Z=0.0000000),Rotation=(Pitch=0,Yaw=0,Roll=0),FOV=90.0000000))
    LastFrameCameraCache=(TimeStamp=0.0000000,POV=(Location=(X=0.0000000,Y=0.0000000,Z=0.0000000),Rotation=(Pitch=0,Yaw=0,Roll=0),FOV=90.0000000))
    ViewTarget=(Target=none,Controller=none,POV=(Location=(X=0.0000000,Y=0.0000000,Z=0.0000000),Rotation=(Pitch=0,Yaw=0,Roll=0),FOV=90.0000000),AspectRatio=0.0000000,PRI=none)
    PendingViewTarget=(Target=none,Controller=none,POV=(Location=(X=0.0000000,Y=0.0000000,Z=0.0000000),Rotation=(Pitch=0,Yaw=0,Roll=0),FOV=90.0000000),AspectRatio=0.0000000,PRI=none)
    BlendParams=(BlendTime=0.0000000,BlendFunction=EViewTargetBlendFunction.VTBlend_Cubic,BlendExp=2.0000000,bLockOutgoing=false)
    FreeCamDistance=256.0000000
    CameraShakeCamModClass=Class'CameraModifier_CameraShake'
    bHidden=true
}