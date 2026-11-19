class SPCameraTypeBase extends Object
    abstract;

struct native CameraModeStruct
{
    var(__Filter1__Delegate) /*0x011D0000-0x00000000*/ private const class CameraModeClass[196609];
    var(__Filter1__Delegate) /*0x011D0000-0x00000400*/ private @NULL CameraMode[536936449];

    structdefaultproperties
    {
        CameraModeClass=none
        CameraMode=none
    }
};

struct native PendingModeInfo
{
    var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL ModeParam;
    var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL TransitionModeParam;

    structdefaultproperties
    {
        ModeParam=none
        TransitionModeParam=none
    }
};

struct native CameraLayerStruct
{
    var(__Filter1__Delegate) /*0x01130000-0x00000000*/ private name LayerName[65537];
    var(__Filter1__Delegate) /*0x01130000-0x00000400*/ private editfixedsize array Modes[65537];
    var(__Filter1__Delegate) /*0x01130000-0x00000000*/ private @NULL CurrentCamMode[536936449];
    var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL CFD[536870913];
    var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL PendingMode[536870913];

    structdefaultproperties
    {
        LayerName="None"
        Modes=none
        CurrentCamMode=none
        CFD=none
        PendingMode=(ModeParam=none,TransitionModeParam=none)
    }
};

var(__Filter1__Delegate) /*0x058E0000-0x00000400*/ private editfixedsize array Layers[65537];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL CameraMgr[536870913];
var(__Filter1__Delegate) /*0x058E0000-0x00000400*/ private @NULL CurrentCamMode[536936449];
var(__Filter1__Delegate) /*0x043A0000-0x00000400*/ private @NULL PreviousCamMode[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private bool bWarnAboutUnknownLayers;
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private bool bEnableInputDuringTransition[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private bool bUseGlobalFilter[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private bool bGlobalFilterCutHappened[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private bool bRecenterCameraNextFrame[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private bool bUsingDestination[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private bool bIsFullyInitialized[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private bool bCutHappened[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private class DefaultCameraParamClass;
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private class DefaultCameraModeParamClass;
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL DefaultCameraParam;
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL CutTransition[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL CutTransitionParams[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL GlobalFilter[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL Transition[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL TransitionParams[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL RecenterTransition[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL RecenterTransitionParams[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL OldVT[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL StartVT[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL SavedVT[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL TempVT[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL PrevLinearVelocity[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL PrevLinearAcceleration[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL StartLinearVelocity[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL StartLinearAcceleration[536870913];

// Export USPCameraTypeBase::execCopyCameraModeParams(FFrame&, void* const)
native static final function CopyCameraModeParams()
{
    local /*0x043A0000-0x00000000*/ private @NULL InParams[8388609], ReturnValue;


}

// Export USPCameraTypeBase::execCopyCameraTransitionParams(FFrame&, void* const)
native static final function CopyCameraTransitionParams()
{
    local /*0x043A0000-0x00000000*/ private @NULL InParams[8388609], ReturnValue;


}

function OnBecomeActive()
{
    //return;    
}

function OnBecomeInActive()
{
    //return;    
}

function IsInTransition()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    return Transition != none;
    //return ReturnValue;    
}

function IsInCutTransition()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    return SPCameraBlendCut(Transition) != none;
    //return ReturnValue;    
}

function AllowLookAround()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    return bEnableInputDuringTransition || !IsInTransition();
    //return ReturnValue;    
}

function IsFullyInitialized()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    return bIsFullyInitialized;
    //return ReturnValue;    
}

function BeginTransition()
{
    local /*0x043A0000-0x00000000*/ private @NULL atransition[8388609], PosTgt;

    none
    // End:0x21
    if(atransition == none)
    {
        TransitionCut();        
    }
    else
    {
        BeginStaticTransition(atransition.MakeBlend(self), atransition, atransition.bEnableInput, atransition.bSaveAngle, atransition.bRestoreAngle || PosTgt != none);
    }
    // End:0x121
    if(PosTgt != none)
    {
        CurrentCamMode.GetCurrentViewTarget(SavedVT);
        ActorToTViewTarget(PosTgt, SavedVT);
        bUsingDestination = true;
    }
    //return;    
}

static function ActorToTViewTarget()
{
    local /*0x043A0000-0x00000000*/ private @NULL SyncTarget[8388609], VT, CamActor;

    VT.POV.Location = Class'SPCameraTargeting'.static.ActorEyeLoc(VT.Target);
    VT.POV.Rotation = SyncTarget.Rotation;
    CamActor = CameraActor(SyncTarget);
    // End:0x132
    if(CamActor != none)
    {
        VT.POV.FOV = CamActor.FOVAngle;
    }
    //return;    
}

function TransitionCut()
{
    BeginStaticTransition(CutTransition, CutTransitionParams, true, false, false);
    //return;    
}

function BeginStaticTransition()
{
    local /*0x043A0000-0x00000000*/ private @NULL atransitionblend[8388609], atransitionparams;
    local /*0x043A0000-0x00000000*/ private bool bEnableInput[8388609], bSaveAngle, bRestoreAngle;

    // End:0x106
    if(CurrentCamMode != none)
    {
        // End:0xA7
        if(SPCameraBlendCut(atransitionblend) != none)
        {
            CurrentCamMode.IgnoreBlend();
            bCutHappened = true;
            CurrentCamMode.CFD.IdealVT.ConvertToTViewTarget(OldVT);            
        }
        else
        {
            // End:0xF3
            if(atransitionparams.bMaintainSmoothVelocity)
            {
                StartLinearVelocity = PrevLinearVelocity;
                StartLinearAcceleration = vect(0.0000000, 0.0000000, 0.0000000);
            }
        }
        StartVT = OldVT;
    }
    Transition = atransitionblend;
    TransitionParams = atransitionparams;
    bEnableInputDuringTransition = bEnableInput;
    // End:0x161
    if(bSaveAngle)
    {
        SavedVT = StartVT;
    }
    bUsingDestination = false;
    // End:0x186
    if(bRestoreAngle)
    {
        bUsingDestination = true;
    }
    //return;    
}

function UpdateTransition()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL FinalVT[25165825];
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689], bIsTransitionFinished;
    local /*0x043A0000-0x00000000*/ private @NULL CFD, IdVT, CurVT, BlendVT;
    local /*0x043A0000-0x00000000*/ private bool bWasCut;

    CFD = self.CFD();
    bWasCut = bCutHappened;
    // End:0x3B4
    if(Transition != none)
    {
        bWasCut = bWasCut || SPCameraBlendCut(Transition) != none;
        // End:0xB8
        if(!Transition.Update(DeltaTime))
        {
            bIsTransitionFinished = true;
            PreviousCamMode = none;
        }
        // End:0x117
        if(PreviousCamMode != none)
        {
            PreviousCamMode.Update(DeltaTime);
            PreviousCamMode.GetCurrentViewTarget(StartVT);
        }
        // End:0x13A
        if(bUsingDestination)
        {
            IdVT = SavedVT;            
        }
        else
        {
            CFD.IdealVT.ConvertToTViewTarget(IdVT);
        }
        CFD.CurrentVT.ConvertToTViewTarget(CurVT);
        BlendVT = IdVT;
        Class'SPCameraTransitionParam'.static.BlendTViewTargets(StartVT, CurVT, IdVT, BlendVT, Transition);
        FinalVT = BlendVT;
        // End:0x3B1
        if(bIsTransitionFinished)
        {
            // End:0x37A
            if(bUsingDestination)
            {
                BlendVT.Target = CameraMgr.Targeting.Target;
                CFD.IdealVT.ConvertFromTViewTarget(BlendVT);
                CFD.IdealVT.CollideOffset = vect(0.0000000, 0.0000000, 0.0000000);
                CFD.Resync();
                // End:0x36E
                if(TransitionParams.bCutDestMode)
                {
                    CurrentCamMode.IgnoreBlend();
                }
                bUsingDestination = false;
            }
            // End:0x3A6
            if(bWasCut)
            {
                CFD.Resync();
            }
            Transition = none;
        }        
    }
    else
    {
        CFD.IdealVT.ConvertToTViewTarget(FinalVT);
    }
    return bWasCut;
    //return ReturnValue;    
}

simulated function Init()
{
    local /*0x043A0000-0x00000000*/ private int ModeIdx, LayerIdx;

    bIsFullyInitialized = false;
    DefaultCameraParam = new (self) DefaultCameraModeParamClass;
    TempVT = new (self) Class'SPCameraRigOffset';
    LayerIdx = 0;
    J0x47:

    // End:0x1CB [Loop If]
    if(LayerIdx < Layers.Length)
    {
        Layers[LayerIdx].PendingMode.ModeParam = none;
        Layers[LayerIdx].PendingMode.TransitionModeParam = none;
        ModeIdx = 0;
        J0xE0:

        // End:0x1BD [Loop If]
        if(ModeIdx < Layers[LayerIdx].Modes.Length)
        {
            Layers[LayerIdx].Modes[ModeIdx].CameraMode = CreateSPCameraMode(Layers[LayerIdx].Modes[ModeIdx].CameraModeClass, LayerIdx);
            ++ModeIdx;
            // [Loop Continue]
            goto J0xE0;
        }
        ++LayerIdx;
        // [Loop Continue]
        goto J0x47;
    }
    //return;    
}

simulated function InitTarget()
{
    local /*0x043A0000-0x00000000*/ private @NULL VT[8388609];
    local /*0x043A0000-0x00000000*/ private int LayerIdx, ModeIdx;

    // End:0x33
    if((CurrentCamMode != none) && CurrentCamMode.DoesRequireTarget())
    {
    }
    // End:0x6C
    if(VT.POV.FOV <= float(0))
    {
        return;
    }
    CameraMgr.Targeting.Target = VT.Target;
    // End:0x1FA
    if(VT.POV.Location == vect(0.0000000, 0.0000000, 0.0000000))
    {
        VT.POV.Location = VT.Target.Location - (float(200) * Vector(VT.Target.Rotation));
        VT.POV.Rotation = VT.Target.Rotation;
    }
    OldVT = VT;
    LayerIdx = 0;
    J0x218:

    // End:0x303 [Loop If]
    if(LayerIdx < Layers.Length)
    {
        ModeIdx = 0;
        J0x23B:

        // End:0x2F5 [Loop If]
        if(ModeIdx < Layers[LayerIdx].Modes.Length)
        {
            Layers[LayerIdx].Modes[ModeIdx].CameraMode.CFD.InitVT(VT);
            ++ModeIdx;
            // [Loop Continue]
            goto J0x23B;
        }
        ++LayerIdx;
        // [Loop Continue]
        goto J0x218;
    }
    SetCameraMode(DefaultCameraParam,,,, true);
    // End:0x440
    if(CurrentCamMode != none)
    {
        CurrentCamMode.RecenterCamera(CFD().IdealVT);
        CFD().IdealVT.Offset.Y = Abs(CFD().IdealVT.Offset.Y);
        TransitionCut();
        CFD().IdealVT.ConvertToTViewTarget(OldVT);
    }
    bIsFullyInitialized = true;
    //return;    
}

simulated event Destroyed()
{
    // End:0x2E
    if(CurrentCamMode != none)
    {
        CurrentCamMode.Destroyed();
    }
    // End:0x5C
    if(PreviousCamMode != none)
    {
        PreviousCamMode.Destroyed();
    }
    //return;    
}

function CFD()
{
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];

    return CurrentCamMode.CFD;
    //return ReturnValue;    
}

final function AddLayer()
{
    local /*0x043A0000-0x00000000*/ private name LayerName[8388609];

    Layers.Length = Layers.Length + 1;
    Layers[Layers.Length - 1].LayerName = LayerName;
    //return;    
}

final function CreateSPCameraMode()
{
    local /*0x043A0000-0x00000000*/ private class ModeClass[8388609];
    local /*0x043A0000-0x00000000*/ private int InLayerIdx[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689], NewMode;

    NewMode = new (self) ModeClass;
    NewMode.CameraType = self;
    NewMode.CameraMgr = CameraMgr;
    NewMode.LayerIdx = InLayerIdx;
    NewMode.Init();
    return NewMode;
    //return ReturnValue;    
}

function HasCameraBasedMovement()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2F
    if(CurrentCamMode != none)
    {
        return CurrentCamMode.HasCameraBasedMovement();
    }
    return false;
    //return ReturnValue;    
}

function GetHighestActiveLayerIndex()
{
    local /*0x043A0000-0x00000000*/ private int ReturnValue[92274689], LayerIdx;

    LayerIdx = Layers.Length - 1;
    J0x17:

    // End:0x6A [Loop If]
    if(LayerIdx >= 0)
    {
        // End:0x5C
        if(Layers[LayerIdx].CurrentCamMode != none)
        {
            return LayerIdx;
        }
        --LayerIdx;
        // [Loop Continue]
        goto J0x17;
    }
    return -1;
    //return ReturnValue;    
}

function IsHighestActiveLayer()
{
    local /*0x043A0000-0x00000000*/ private name LayerName[8388609];
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x043A0000-0x00000000*/ private int LayerIdx;

    LayerIdx = GetHighestActiveLayerIndex();
    return (LayerIdx >= 0) && Layers[LayerIdx].LayerName == LayerName;
    //return ReturnValue;    
}

function GetHighestActiveLayerName()
{
    local /*0x043A0000-0x00000000*/ private name ReturnValue[92274689];
    local /*0x043A0000-0x00000000*/ private int highestActiveLayerIdx;

    highestActiveLayerIdx = GetHighestActiveLayerIndex();
    // End:0x4D
    if(highestActiveLayerIdx >= 0)
    {
        return Layers[highestActiveLayerIdx].LayerName;        
    }
    else
    {
        return 'None';
    }
    //return ReturnValue;    
}

final function FindCameraModeByClass()
{
    local /*0x043A0000-0x00000000*/ private name ClassName[8388609];
    local /*0x043A0000-0x00000000*/ private int LayerIdx[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x043A0000-0x00000000*/ private int I;

    // End:0x136
    if((LayerIdx >= 0) && LayerIdx < Layers.Length)
    {
        I = 0;
        J0x34:

        // End:0x136 [Loop If]
        if(I < Layers[LayerIdx].Modes.Length)
        {
            // End:0x128
            if(Layers[LayerIdx].Modes[I].CameraMode.Class.Name == ClassName)
            {
                return Layers[LayerIdx].Modes[I].CameraMode;
            }
            ++I;
            // [Loop Continue]
            goto J0x34;
        }
    }
    return none;
    //return ReturnValue;    
}

function FindLayerByName()
{
    local /*0x043A0000-0x00000000*/ private name LayerName[8388609];
    local /*0x043A0000-0x00000000*/ private int ReturnValue[92274689], LayerIdx;

    // End:0x2B
    if((LayerName == 'None') && Layers.Length > 0)
    {
        return 0;
    }
    LayerIdx = 0;
    J0x36:

    // End:0x9A [Loop If]
    if(LayerIdx < Layers.Length)
    {
        // End:0x8C
        if(Layers[LayerIdx].LayerName == LayerName)
        {
            return LayerIdx;
        }
        ++LayerIdx;
        // [Loop Continue]
        goto J0x36;
    }
    // End:0xC5
    if((Layers.Length > 0) && LayerName == 'Default')
    {
        return 0;
    }
    // End:0xD2
    if(bWarnAboutUnknownLayers)
    {
    }
    return -1;
    //return ReturnValue;    
}

simulated function SwitchToBestCameraMode()
{
    local /*0x043A0000-0x00000000*/ private int LayerIdx, highestActiveLayerIdx;
    local /*0x043A0000-0x00000000*/ private @NULL NewMode, VT;

    highestActiveLayerIdx = GetHighestActiveLayerIndex();
    LayerIdx = 0;
    J0x1F:

    // End:0x4BD [Loop If]
    if(LayerIdx < Layers.Length)
    {
        // End:0x4AF
        if(Layers[LayerIdx].PendingMode.ModeParam != none)
        {
            NewMode = FindCameraModeByClass(Layers[LayerIdx].PendingMode.ModeParam.CameraModeClass.Name, LayerIdx);
            // End:0x439
            if(NewMode != none)
            {
                NewMode.InitPendingMode(Layers[LayerIdx].PendingMode);
                // End:0x209
                if(CurrentCamMode != none)
                {
                    // End:0x209
                    if(CurrentCamMode.CFD != NewMode.CFD)
                    {
                        CurrentCamMode.GetCurrentViewTarget(VT);
                        NewMode.SyncViewTarget(VT);
                        NewMode.IgnoreBlend();
                    }
                }
                // End:0x3B0
                if(LayerIdx >= highestActiveLayerIdx)
                {
                    // End:0x3AD
                    if(Layers[LayerIdx].PendingMode.TransitionModeParam != none)
                    {
                        // End:0x2C4
                        if(Layers[LayerIdx].PendingMode.TransitionModeParam.bTickBothModes)
                        {
                            PreviousCamMode = CurrentCamMode;
                        }
                        BeginTransition(Layers[LayerIdx].PendingMode.TransitionModeParam);
                        // End:0x3AD
                        if(Layers[LayerIdx].PendingMode.TransitionModeParam.bCutDestMode)
                        {
                            NewMode.CFD.Resync();
                            NewMode.IgnoreBlend();
                        }
                    }                    
                }
                else
                {
                    NewMode.CFD.Resync();
                }
                Layers[LayerIdx].CurrentCamMode = NewMode;
                // End:0x436
                if(PreviousCamMode == CurrentCamMode)
                {
                    PreviousCamMode = none;
                }                
            }
            Layers[LayerIdx].PendingMode.ModeParam = none;
            Layers[LayerIdx].PendingMode.TransitionModeParam = none;
        }
        ++LayerIdx;
        // [Loop Continue]
        goto J0x1F;
    }
    LayerIdx = GetHighestActiveLayerIndex();
    NewMode = ((LayerIdx >= 0) ? Layers[LayerIdx].CurrentCamMode : none);
    // End:0x5A3
    if(NewMode != none)
    {
        // End:0x559
        if(CurrentCamMode != none)
        {
            CurrentCamMode.OnBecomeInActive(NewMode);
        }
        // End:0x590
        if(NewMode != none)
        {
            NewMode.OnBecomeActive(CurrentCamMode);
        }
        CurrentCamMode = NewMode;
    }
    //return;    
}

simulated function Update()
{
    local /*0x043A0000-0x00000000*/ private @NULL VT[25165825];
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL NewTVT, PC, tgtPawn;
    local /*0x043A0000-0x00000000*/ private bool bGlobalFilterActive;
    local /*0x043A0000-0x00000000*/ private float xprogress;
    local /*0x043A0000-0x00000000*/ private @NULL priorLinearVelocity, timedTransitionParam, CFD;

    // End:0x33
    if((CurrentCamMode == none) || CurrentCamMode.DoesRequireTarget())
    {
    }
    // End:0x55
    if(!bIsFullyInitialized)
    {
        InitTarget(VT);
    }
    // End:0x66
    if(CurrentCamMode == none)
    {
        return;
    }
    CFD = CurrentCamMode.CFD;
    CameraMgr.Targeting.HandleFocalPoint(CFD.IdealVT.CameraLoc());
    // End:0x124
    if(bRecenterCameraNextFrame)
    {
        RecenterCamera();
        TransitionCut();
        bRecenterCameraNextFrame = false;
    }
    CameraMgr.Targeting.SetTarget(VT.Target);
    PC = SPPlayerController(VT.Target);
    // End:0x221
    if(PC == none)
    {
        tgtPawn = Pawn(VT.Target);
        // End:0x221
        if(tgtPawn != none)
        {
            PC = SPPlayerController(tgtPawn.Controller);
        }
    }
    // End:0x31B
    if(((PC != none) && PC.myHUD != none) && PC.myHUD.SizeY > float(0))
    {
        VT.AspectRatio = PC.myHUD.SizeX / PC.myHUD.SizeY;        
    }
    else
    {
        // End:0x36A
        if(VT.AspectRatio <= 0.0000000)
        {
            VT.AspectRatio = 16.0000000 / 9.0000000;
        }
    }
    CameraMgr.Targeting.AspectRatio = VT.AspectRatio;
    bCutHappened = bCutHappened || SPCameraBlendCut(Transition) != none;
    // End:0x45C
    if(!bCutHappened && CurrentCamMode.ShouldBlendEyeLocation())
    {
        CameraMgr.Targeting.BlendTargetLoc(DeltaTime);        
    }
    CFD.IdealVT.FOV = CameraMgr.DefaultFOV;
    CFD.IdealVT.AspectRatio = VT.AspectRatio;
    CurrentCamMode.Update(DeltaTime);
    CFD.IdealVT.CheckValid();
    // End:0x628
    if(DeltaTime > 0.0005000)
    {
        priorLinearVelocity = PrevLinearVelocity;
        PrevLinearVelocity = (CFD.CurrentVT.CameraLoc() - CFD.PreviousVT.CameraLoc()) / DeltaTime;
        PrevLinearAcceleration = (PrevLinearVelocity - priorLinearVelocity) / DeltaTime;
    }
    // End:0xB82
    if(!UpdateTransition(DeltaTime, NewTVT))
    {
        // End:0x80F
        if(((TransitionParams != none) && TransitionParams.bMaintainSmoothVelocity) && Transition != none)
        {
            xprogress = Transition.GetProgress();
            timedTransitionParam = SPCameraTransitionTimedParam(TransitionParams);
            // End:0x711
            if(timedTransitionParam != none)
            {
                xprogress *= FMax(1.0000000, timedTransitionParam.Duration);
            }
            xprogress += xprogress;
            xprogress = FMin(1.0000000, xprogress);
            StartVT.POV.Location += (StartLinearVelocity * (DeltaTime * (1.0000000 - ((xprogress * xprogress) * (3.0000000 - (2.0000000 * xprogress))))));
            StartLinearVelocity += (StartLinearAcceleration * (DeltaTime * (1.0000000 - ((xprogress * xprogress) * (3.0000000 - (2.0000000 * xprogress))))));
        }
        bGlobalFilterActive = bUseGlobalFilter || CurrentCamMode.ForceUseGlobalFilter();
        // End:0x86F
        if(bGlobalFilterCutHappened)
        {
            bGlobalFilterCutHappened = !bGlobalFilterActive;            
        }
        else
        {
            // End:0xB76
            if(bGlobalFilterActive && !CameraMgr.Targeting.IsTargetOnPlatform())
            {
                GlobalFilter.Update(DeltaTime);
                NewTVT.POV.Location = GlobalFilter.BlendVector(OldVT.POV.Location, OldVT.POV.Location, NewTVT.POV.Location);
                NewTVT.POV.Rotation = GlobalFilter.BlendRotator(OldVT.POV.Rotation, OldVT.POV.Rotation, NewTVT.POV.Rotation);
                NewTVT.POV.FOV = GlobalFilter.BlendFloat(OldVT.POV.FOV, OldVT.POV.FOV, NewTVT.POV.FOV);                
            }
            else
            {
                bGlobalFilterCutHappened = true;
            }
        }
    }
    bCutHappened = false;
    OldVT.POV = NewTVT.POV;
    VT.POV = NewTVT.POV;
    //return;    
}

function FinalConstraints()
{
    local /*0x043A0000-0x00000000*/ private @NULL VT[25165825];
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL D;

    // End:0x155
    if(CurrentCamMode != none)
    {
        D = CFD();
        D.DesiredVT.CopyFrom(D.IdealVT);
        CurrentCamMode.SyncViewTargetExceptBase(VT);
        CurrentCamMode.FinalConstraints(DeltaTime);
        D.IdealVT.ConvertToTViewTarget(VT);
        D.IdealVT.CopyFrom(D.DesiredVT);
    }
    //return;    
}

function SetCameraMode()
{
    local /*0x043A0000-0x00000000*/ private @NULL ModeParam[8388609], InTransitionParam;
    local /*0x043A0000-0x00000000*/ private name LayerName[9437185];
    local /*0x043A0000-0x00000000*/ private bool bDisregardIfSame[9437185], bDontCopyParams;
    local /*0x043A0000-0x00000000*/ private @NULL NewModeParam, NewTransitionParam, NewMode;
    local /*0x043A0000-0x00000000*/ private int LayerIdx;

    'Default'
    false
    false
    LayerIdx = FindLayerByName(LayerName);
    // End:0x46
    if(LayerIdx < 0)
    {
        return;
    }
    // End:0xB6
    if((ModeParam == none) || ModeParam.IsA(DefaultCameraParamClass.Name))
    {
        NewModeParam = DefaultCameraParam;
        // End:0xB3
        if(NewModeParam == none)
        {
            return;
        }        
    }
    else
    {
        // End:0xEC
        if(bDontCopyParams)
        {
            NewModeParam = ModeParam;
            NewTransitionParam = InTransitionParam;            
        }
        else
        {
            NewModeParam = CopyCameraModeParams(ModeParam);
            NewTransitionParam = CopyCameraTransitionParams(InTransitionParam);
        }
    }
    NewMode = FindCameraModeByClass(NewModeParam.CameraModeClass.Name, LayerIdx);
    // End:0x187
    if(NewMode == none)
    {
        return;
    }
    // End:0x1CC
    if(bDisregardIfSame && NewMode == Layers[LayerIdx].CurrentCamMode)
    {
        return;
    }
    Layers[LayerIdx].PendingMode.ModeParam = NewModeParam;
    Layers[LayerIdx].PendingMode.TransitionModeParam = NewTransitionParam;
    SwitchToBestCameraMode();
    //return;    
}

function ClearCameraMode()
{
    local /*0x043A0000-0x00000000*/ private name LayerName[8388609];
    local /*0x043A0000-0x00000000*/ private int LayerIdx;

    LayerIdx = FindLayerByName(LayerName);
    // End:0xC9
    if(LayerIdx > 0)
    {
        // End:0xC6
        if(Layers[LayerIdx].CurrentCamMode != none)
        {
            Layers[LayerIdx].CurrentCamMode.OnClearCameraMode();
            Layers[LayerIdx].CurrentCamMode = none;
            SwitchToBestCameraMode();
        }        
    }
    else
    {
        // End:0xD6
        if(bWarnAboutUnknownLayers)
        {
        }
    }
    //return;    
}

function Reset()
{
    local /*0x043A0000-0x00000000*/ private int LayerIdx;

    LayerIdx = 1;
    J0x0B:

    // End:0x59 [Loop If]
    if(LayerIdx < Layers.Length)
    {
        Layers[LayerIdx].CurrentCamMode = none;
        ++LayerIdx;
        // [Loop Continue]
        goto J0x0B;
    }
    SetCameraMode(DefaultCameraParam, none);
    Transition = none;
    TransitionParams = none;
    //return;    
}

function RecenterCamera()
{
    local /*0x043A0000-0x00000000*/ private bool bLater[9437185];

    false
    // End:0x20
    if(bLater)
    {
        bRecenterCameraNextFrame = true;
        return;
    }
    // End:0x86
    if(CurrentCamMode != none)
    {
        // End:0x5E
        if(!CurrentCamMode.RecenterCamera(TempVT))
        {
            return;
        }
        TempVT.ConvertToTViewTarget(SavedVT);
    }
    RecenterTransition.Reset();
    BeginStaticTransition(RecenterTransition, RecenterTransitionParams, false, false, true);
    //return;    
}

function ForceCameraDirectionStatic()
{
    local /*0x043A0000-0x00000000*/ private @NULL facing[8388609], transitionParm;

    TempVT.CopyFrom(CFD().IdealVT);
    TempVT.Rotation = Rotator(facing);
    TempVT.Orbit = RotatorToSpherical(TempVT.Rotation);
    TempVT.ConvertToTViewTarget(SavedVT);
    BeginStaticTransition(transitionParm.MakeBlend(self), transitionParm, true, false, true);
    //return;    
}

function PreProcessInput()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL SPInput[8388609];

    // End:0x51
    if((SPInput != none) && CurrentCamMode != none)
    {
        CurrentCamMode.PreProcessInput(DeltaTime, SPInput);
    }
    //return;    
}

simulated function DisplayDebug()
{
    local /*0x043A0000-0x00000000*/ private @NULL HUD[8388609];
    local /*0x043A0000-0x00000000*/ private float out_YL[25165825], out_YPos;
    local /*0x043A0000-0x00000000*/ private @NULL Canvas, CamMod;

    Canvas = HUD.Canvas;
    Canvas.DrawText("CameraType:" @ string(self), true);
    out_YPos = Canvas.CurY;
    // End:0xCE
    if(CurrentCamMode != none)
    {
        CurrentCamMode.DisplayDebug(HUD, out_YL, out_YPos);
    }
    Canvas.SetPos(Canvas.CurX, out_YPos);
    // End:0x214
    if(IsInTransition())
    {
        Canvas.SetDrawColor(255, 224, 128);
        Canvas.DrawText("       StartVT" @ Class'SPViewTarget'.static.TViewTargetString(StartVT), true);
        // End:0x214
        if(Transition != none)
        {
            Canvas.DrawText(("  Transition:" @ string(Transition)) @ Transition.DebugString(), true);
        }
    }
    Canvas.SetDrawColor(255, 224, 160);
    Canvas.DrawText(string(CameraMgr.ModifierList.Length) @ "camera modifiers", true);
    // End:0x2ED
    foreach CameraMgr.ModifierList(CamMod)
    {
        Canvas.DrawText(string(CamMod), true);        
    }    
    out_YPos = HUD.Canvas.CurY;
    //return;    
}

defaultproperties
{
    bEnableInputDuringTransition=true
    bUseGlobalFilter=true
    bGlobalFilterCutHappened=true
    bCutHappened=true
    DefaultCameraParamClass=Class'SPCameraModeDefaultParam'
    DefaultCameraModeParamClass=Class'SPCameraModeTestParam'
    // Reference: SPCameraBlendCut'Default__SPCameraTypeBase.CutTransitionObj'
    begin object name=CutTransitionObj class=Class'SPCameraBlendCut'
    end object
    CutTransition=CutTransitionObj
    // Reference: SPCameraTransitionCutParam'Default__SPCameraTypeBase.CutTransitionParamsObj'
    begin object name=CutTransitionParamsObj class=Class'SPCameraTransitionCutParam'
    end object
    CutTransitionParams=CutTransitionParamsObj
    // Reference: SPCameraBlendLowPassFilter'Default__SPCameraTypeBase.GlobalFilterObj'
    begin object name=GlobalFilterObj class=Class'SPCameraBlendLowPassFilter'
        Rate=3.0000000
    end object
    GlobalFilter=GlobalFilterObj
    // Reference: SPCameraBlendCubic'Default__SPCameraTypeBase.RecenterTransitionObj'
    begin object name=RecenterTransitionObj class=Class'SPCameraBlendCubic'
        TotalSeconds=0.5000000
    end object
    RecenterTransition=RecenterTransitionObj
    // Reference: SPCameraTransitionCubicParam'Default__SPCameraTypeBase.RecenterTransitionParamsObj'
    begin object name=RecenterTransitionParamsObj class=Class'SPCameraTransitionCubicParam'
    end object
    RecenterTransitionParams=RecenterTransitionParamsObj
    OldVT=(Target=none,Controller=none,POV=(Location=(X=0.0000000,Y=0.0000000,Z=0.0000000),Rotation=(Pitch=0,Yaw=0,Roll=0),FOV=90.0000000),AspectRatio=0.0000000,PRI=none)
    StartVT=(Target=none,Controller=none,POV=(Location=(X=0.0000000,Y=0.0000000,Z=0.0000000),Rotation=(Pitch=0,Yaw=0,Roll=0),FOV=90.0000000),AspectRatio=0.0000000,PRI=none)
    SavedVT=(Target=none,Controller=none,POV=(Location=(X=0.0000000,Y=0.0000000,Z=0.0000000),Rotation=(Pitch=0,Yaw=0,Roll=0),FOV=90.0000000),AspectRatio=0.0000000,PRI=none)
}