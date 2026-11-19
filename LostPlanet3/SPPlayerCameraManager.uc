class SPPlayerCameraManager extends SPPlayerCamera
    transient
    hidecategories(AnimDependency,Navigation);

enum ECameraShakeAttackDirection
{
    ecsadDefault,                   // 0
    ecsadHorizontal,                // 1
    ecsadVertical,                  // 2
    ECameraShakeAttackDirection_MAX // 3
};

struct native CameraTypeStruct
{
    var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private class CameraTypeClass;
    var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL Camera;

    structdefaultproperties
    {
        CameraTypeClass=none
        Camera=none
    }
};

struct native SPCameraDamageParams
{
    var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private int Damage;
    var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL HitLocation;
    var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private byte AttackDirection;
    var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL InstigatedByPawn;
    var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private float Scale;

    structdefaultproperties
    {
        Damage=0
        HitLocation=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        AttackDirection=ECameraShakeAttackDirection.ecsadDefault
        InstigatedByPawn=none
        Scale=0.0000000
    }
};

var(__Filter1__Delegate) /*0x05AE0000-0x00000400*/ private @NULL CurrentCamType[536936449];
var(__Filter1__Delegate) /*0x05AE0000-0x00000400*/ private @NULL Targeting[536936449];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private class TargetingClass[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private name DefaultCameraStyle[131073];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL DefaultCameraParam;
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private editfixedsize array CameraTypes;
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private bool bIsFullyInitialized[536870913];
var(__Filter1__Delegate) /*0x06450000-0x00000000*/ private @NULL TuneDataCameraManager[65537];

// Export USPPlayerCameraManager::execGetCameraRotationInput(FFrame&, void* const)
native function GetCameraRotationInput()
{
    local /*0x043A0000-0x00000000*/ private float TurnInput[25165825], LookInput;


}

// Export USPPlayerCameraManager::execGetCameraMode(FFrame&, void* const)
native final function GetCameraMode()
{
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USPPlayerCameraManager::execProcessViewRotationNative(FFrame&, void* const)
protected native function ProcessViewRotationNative()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL OutViewRotation[25165825], OutDeltaRot;


}

// Export USPPlayerCameraManager::execIsCheatFlying(FFrame&, void* const)
native final function IsCheatFlying()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPPlayerCameraManager::execHasCameraBasedMovement(FFrame&, void* const)
native function HasCameraBasedMovement()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPPlayerCameraManager::execNeedsInputBasisFiltering(FFrame&, void* const)
native function NeedsInputBasisFiltering()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPPlayerCameraManager::execIsUsingCameraAdjustedInputValues(FFrame&, void* const)
native function IsUsingCameraAdjustedInputValues()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPPlayerCameraManager::execIsCameraFirstPerson(FFrame&, void* const)
native function IsCameraFirstPerson()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPPlayerCameraManager::execShouldPlayerFaceView(FFrame&, void* const)
native final function ShouldPlayerFaceView()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPPlayerCameraManager::execGetPawnRotationType(FFrame&, void* const)
native function GetPawnRotationType()
{
    local /*0x043A0000-0x00000000*/ private byte ReturnValue[92274689];


}

function GetBestCameraType()
{
    local /*0x043A0000-0x00000000*/ private @NULL CameraTarget[8388609], ReturnValue;

    return CameraTypes[0].Camera;
    //return ReturnValue;    
}

function PostBeginPlay()
{
    super(Camera).PostBeginPlay();
    //return;    
}

simulated event Destroyed()
{
    CurrentCamType.Destroyed();
    super(Camera).Destroyed();
    //return;    
}

simulated function InitTuneData()
{
    local /*0x043A0000-0x00000000*/ private @NULL TuneData[8388609];

    super(Actor).InitTuneData(TuneData);
    TuneDataCameraManager = SPTuneDataBaseCameraManager(TuneData);
    // End:0x66
    if(TuneDataCameraManager != none)
    {
        DefaultFOV = TuneDataCameraManager.FOV;
    }
    //return;    
}

simulated event GetMasterTuneDataReference()
{
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];

    return TuneDataCameraManager;
    //return ReturnValue;    
}

function Init()
{
    local /*0x043A0000-0x00000000*/ private @NULL ATarget[8388609];
    local /*0x043A0000-0x00000000*/ private int I;

    Test();
    Targeting = new (self) TargetingClass;
    Targeting.SetTarget(ATarget);
    I = 0;
    J0x55:

    // End:0xD2 [Loop If]
    if(I < CameraTypes.Length)
    {
        CameraTypes[I].Camera = CreateSPCamera(CameraTypes[I].CameraTypeClass);
        ++I;
        // [Loop Continue]
        goto J0x55;
    }
    //return;    
}

function Test()
{
    //return;    
}

private final function CreateSPCamera()
{
    local /*0x043A0000-0x00000000*/ private class CameraTypeClass[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689], NewCam;

    NewCam = new (self) CameraTypeClass;
    NewCam.CameraMgr = self;
    NewCam.Init();
    return NewCam;
    //return ReturnValue;    
}

function ProcessViewRotation()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL OutViewRotation[25165825], OutDeltaRot;

    super(Camera).ProcessViewRotation(DeltaTime, OutViewRotation, OutDeltaRot);
    ProcessViewRotationNative(DeltaTime, OutViewRotation, OutDeltaRot);
    //return;    
}

function UpdateViewTarget()
{
    local /*0x043A0000-0x00000000*/ private @NULL OutVT[25165825];
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL CamActor;

    CamActor = CameraActor(OutVT.Target);
    // End:0x52
    if(CamActor != none)
    {
        ClearCameraMode('Cinematic');
    }
    super.UpdateViewTarget(OutVT, DeltaTime);
    //return;    
}

function DebugCamUpdate()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];

    // End:0xDC
    if(CurrentCamType != none)
    {
        // End:0xDC
        if(CurrentCamType.CurrentCamMode != none)
        {
            // End:0xDC
            if(CurrentCamType.CurrentCamMode.Rig != none)
            {
                CurrentCamType.CurrentCamMode.Rig.Collide(Targeting.Target, DeltaTime);
            }
        }
    }
    //return;    
}

function Tick()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];

    super(Actor).Tick(DeltaTime);
    // End:0x5B
    if((PCOwner != none) && PCOwner.Player == none)
    {
        DebugCamUpdate(DeltaTime);
    }
    //return;    
}

function UserUpdateViewTarget()
{
    local /*0x043A0000-0x00000000*/ private @NULL OutVT[25165825];
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL NewCameraType, PC;

    // End:0x37
    if((PCOwner != none) && !PCOwner.IsLocalPlayerController())
    {
        return;
    }
    PC = PlayerController(OutVT.Target);
    // End:0xB0
    if(PC != none)
    {
        OutVT.Target = PC.Pawn;
    }
    // End:0x123
    if((OutVT.Target == none) && int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        OutVT.Target = PCOwner;
    }
    // End:0x147
    if(OutVT.Target == none)
    {
        return;
    }
    // End:0x188
    if(!bIsFullyInitialized)
    {
        Init(OutVT.Target);
        bIsFullyInitialized = true;
    }
    OutVT.POV.FOV = DefaultFOV;
    NewCameraType = GetBestCameraType(OutVT.Target);
    // End:0x277
    if(NewCameraType != CurrentCamType)
    {
        // End:0x236
        if(CurrentCamType != none)
        {
            CurrentCamType.OnBecomeInActive();
        }
        // End:0x264
        if(NewCameraType != none)
        {
            NewCameraType.OnBecomeActive();
        }
        CurrentCamType = NewCameraType;
    }
    CurrentCamType.Update(OutVT, DeltaTime);
    Move(OutVT.POV.Location - Location);
    SetRotation(OutVT.POV.Rotation);
    //return;    
}

function ApplyFinalConstraints()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL VT[25165825];

    // End:0x37
    if((PCOwner != none) && !PCOwner.IsLocalPlayerController())
    {
        return;
    }
    VT.POV.FOV = Abs(VT.POV.FOV);
    // End:0xD8
    if(CurrentCamType != none)
    {
        CurrentCamType.FinalConstraints(VT, DeltaTime);
    }
    //return;    
}

simulated function ResetInterpolation()
{
    CurrentCamType.TransitionCut();
    //return;    
}

final function FindCameraTypeByClass()
{
    local /*0x043A0000-0x00000000*/ private name ClassName[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x043A0000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x98 [Loop If]
    if(I < CameraTypes.Length)
    {
        // End:0x8A
        if(CameraTypes[I].Camera.IsA(ClassName))
        {
            return CameraTypes[I].Camera;
        }
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    return none;
    //return ReturnValue;    
}

function RecenterCamera()
{
    local /*0x043A0000-0x00000000*/ private bool bLater[9437185];

    false
    CurrentCamType.RecenterCamera(bLater);
    //return;    
}

function ForceCameraDirectionStatic()
{
    local /*0x043A0000-0x00000000*/ private @NULL facing[8388609], transitionParm;

    CurrentCamType.ForceCameraDirectionStatic(facing, transitionParm);
    //return;    
}

function ForceCameraDirectionDynamic()
{
    local /*0x043A0000-0x00000000*/ private @NULL Direction[8388609], TransitionParams, modeParams;
    local /*0x043A0000-0x00000000*/ private name activeCameraLayerName;

    activeCameraLayerName = CurrentCamType.GetHighestActiveLayerName();
    // End:0xF6
    if(activeCameraLayerName != 'None')
    {
        modeParams = CurrentCamType.CurrentCamMode.Params;
        SetCameraMode(modeParams, TransitionParams, activeCameraLayerName, false, true);
        CurrentCamType.CurrentCamMode.Rig.LookDir(Direction);
    }
    //return;    
}

function PostProcessInput()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL SPInput[8388609];

    SetCameraRotationInput(SPInput.aTurn, SPInput.aLookUp);
    //return;    
}

function SetCameraRotationInput()
{
    local /*0x043A0000-0x00000000*/ private float TurnInput[8388609], LookInput;
    local /*0x043A0000-0x00000000*/ private @NULL StickInput, CameraMode;

    // End:0xD0
    if(Targeting != none)
    {
        StickInput = vect2d(TurnInput, LookInput);
        CameraMode = GetCameraMode();
        // End:0x80
        if(CameraMode != none)
        {
            CameraMode.AdjustLookInputs(StickInput);
        }
        Targeting.LookInput = Multiply_Vector2DFloat(StickInput, WorldInfo.TimeDilation);
    }
    //return;    
}

function SetMouseSensitivity()
{
    local /*0x043A0000-0x00000000*/ private float MouseSensitivity[8388609];

    // End:0x4C
    if(PCOwner != none)
    {
        PCOwner.PlayerInput.SetSensitivity(MouseSensitivity);
    }
    //return;    
}

function GetMouseSensitivity()
{
    local /*0x043A0000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x15
    if(Targeting == none)
    {
        return 1.0000000;
    }
    return Targeting.Params.MouseSensitivity;
    //return ReturnValue;    
}

function SetLookScale()
{
    local /*0x043A0000-0x00000000*/ private float LookRightScale[8388609], LookUpScale;

    // End:0xAF
    if((PCOwner != none) && PCOwner.PlayerInput != none)
    {
        PCOwner.PlayerInput.LookRightScale = LookRightScale;
        PCOwner.PlayerInput.LookUpScale = LookUpScale;
    }
    //return;    
}

function AllowLookAround()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    return CurrentCamType.AllowLookAround();
    //return ReturnValue;    
}

function Reset()
{
    Targeting.Reset();
    CurrentCamType.Reset();
    //return;    
}

event SetCameraMode()
{
    local /*0x043A0000-0x00000000*/ private @NULL ModeParam[8388609], TransitionParam;
    local /*0x043A0000-0x00000000*/ private name LayerName[9437185];
    local /*0x043A0000-0x00000000*/ private bool bDisregardIfSame[9437185], bDontCopyParams;
    local /*0x043A0000-0x00000000*/ private int I;
    local /*0x043A0000-0x00000000*/ private @NULL CurrVTActor;

    'Default'
    false
    false
    // End:0x4F
    if(PCOwner != none)
    {
        CurrVTActor = PCOwner.ViewTarget;
    }
    // End:0x7D
    if(!bIsFullyInitialized)
    {
        Init(CurrVTActor);
        bIsFullyInitialized = true;
    }
    // End:0xF1
    if((bIsFullyInitialized && Targeting != none) && Targeting.Target != CurrVTActor)
    {
        Targeting.SetTarget(CurrVTActor);
    }
    I = 0;
    J0xFC:

    // End:0x23F [Loop If]
    if(I < CameraTypes.Length)
    {
        // End:0x231
        if(CameraTypes[I].Camera != none)
        {
            // End:0x1C6
            if(!CameraTypes[I].Camera.IsFullyInitialized())
            {
                CameraTypes[I].Camera.InitTarget(ViewTarget);
            }
            CameraTypes[I].Camera.SetCameraMode(ModeParam, TransitionParam, LayerName, bDisregardIfSame, bDontCopyParams);
        }
        ++I;
        // [Loop Continue]
        goto J0xFC;
    }
    //return;    
}

function ClearCameraMode()
{
    local /*0x043A0000-0x00000000*/ private name LayerName[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL Transition[9437185];
    local /*0x043A0000-0x00000000*/ private int I;

    none
    // End:0x6A
    if((CurrentCamType != none) && CurrentCamType.IsHighestActiveLayer(LayerName))
    {
        CurrentCamType.BeginTransition(Transition);
    }
    I = 0;
    J0x75:

    // End:0x10C [Loop If]
    if(I < CameraTypes.Length)
    {
        // End:0xFE
        if(CameraTypes[I].Camera != none)
        {
            CameraTypes[I].Camera.ClearCameraMode(LayerName);
        }
        ++I;
        // [Loop Continue]
        goto J0x75;
    }
    // End:0x13A
    if(Targeting != none)
    {
        Targeting.ClearCameraIncludePoint();
    }
    //return;    
}

function OnSetCameraMode()
{
    local /*0x043A0000-0x00000000*/ private @NULL Action[8388609], ModeParam, TransitionParam, DirectorAction;
    local /*0x043A0000-0x00000000*/ private int Idx;
    local /*0x043A0000-0x00000000*/ private editfixedsize array objVars;
    local /*0x043A0000-0x00000000*/ private @NULL PositionTarget, LookAtTarget, ControlTarget;

    // End:0x3D7
    if(Action.InputLinks[0].bHasImpulse)
    {
        ModeParam = Action.CameraModeParam;
        TransitionParam = Action.CameraTransitionParam;
        // End:0xD4
        if(ModeParam == none)
        {
            SetCameraMode(DefaultCameraParam, TransitionParam, Action.Layer);
            return;
        }
        Action.GetObjectVars(objVars, "Position Target");
        Idx = 0;
        J0x118:

        // End:0x175 [Loop If]
        if((Idx < objVars.Length) && PositionTarget == none)
        {
            PositionTarget = Actor(objVars[Idx]);
            ++Idx;
            // [Loop Continue]
            goto J0x118;
        }
        ModeParam.PositionTarget = PositionTarget;
        objVars.Length = 0;
        Action.GetObjectVars(objVars, "LookAt Target");
        Idx = 0;
        J0x1EB:

        // End:0x248 [Loop If]
        if((Idx < objVars.Length) && LookAtTarget == none)
        {
            LookAtTarget = Actor(objVars[Idx]);
            ++Idx;
            // [Loop Continue]
            goto J0x1EB;
        }
        ModeParam.LookAtTarget = LookAtTarget;
        DirectorAction = SPCameraSeqAct_SetDirectorCameraMode(Action);
        // End:0x39B
        if(DirectorAction != none)
        {
            objVars.Length = 0;
            DirectorAction.GetObjectVars(objVars, "Control Target");
            Idx = 0;
            J0x2EA:

            // End:0x347 [Loop If]
            if((Idx < objVars.Length) && ControlTarget == none)
            {
                ControlTarget = Actor(objVars[Idx]);
                ++Idx;
                // [Loop Continue]
                goto J0x2EA;
            }
            // End:0x39B
            if(ModeParam.IsA('SPCameraModeDirectorParam'))
            {
                SPCameraModeDirectorParam(ModeParam).ControlTarget = ControlTarget;
            }
        }
        SetCameraMode(ModeParam, TransitionParam, Action.Layer);
    }
    //return;    
}

function OnSetDirectorCameraMode()
{
    local /*0x043A0000-0x00000000*/ private @NULL Action[8388609];

    OnSetCameraMode(Action);
    //return;    
}

function OnSetCameraFocus()
{
    local /*0x043A0000-0x00000000*/ private @NULL Action[8388609];
    local /*0x043A0000-0x00000000*/ private int Idx;
    local /*0x043A0000-0x00000000*/ private editfixedsize array objVars;
    local /*0x043A0000-0x00000000*/ private @NULL FocusTarget;

    // End:0x1B1
    if(Action.InputLinks[0].bHasImpulse)
    {
        objVars.Length = 0;
        Action.GetObjectVars(objVars, "Focus Target");
        Idx = 0;
        J0x84:

        // End:0xE1 [Loop If]
        if((Idx < objVars.Length) && FocusTarget == none)
        {
            FocusTarget = Actor(objVars[Idx]);
            ++Idx;
            // [Loop Continue]
            goto J0x84;
        }
        Targeting.FocalDelay = float(Max(0, int(Action.DelaySeconds)));
        Targeting.FocusUseTargetDir = Action.bUseTargetOrientationOnly;
        Targeting.SetCameraFocusPoint(FocusTarget, Action.AttractionStrength * 0.0100000);
    }
    //return;    
}

function OnResyncCamera()
{
    local /*0x043A0000-0x00000000*/ private @NULL Action[8388609];
    local /*0x043A0000-0x00000000*/ private int Idx;
    local /*0x043A0000-0x00000000*/ private editfixedsize array objVars;
    local /*0x043A0000-0x00000000*/ private @NULL SyncTarget, CamActor, TVT;

    // End:0x37C
    if(Action.InputLinks[0].bHasImpulse)
    {
        objVars.Length = 0;
        Action.GetObjectVars(objVars, "Sync Target");
        Idx = 0;
        J0x83:

        // End:0xE0 [Loop If]
        if((Idx < objVars.Length) && SyncTarget == none)
        {
            SyncTarget = Actor(objVars[Idx]);
            ++Idx;
            // [Loop Continue]
            goto J0x83;
        }
        TVT.POV.Location = Class'SPCameraTargeting'.static.ActorEyeLoc(SyncTarget);
        TVT.POV.Rotation = SyncTarget.Rotation;
        TVT.Target = Targeting.Target;
        CamActor = CameraActor(SyncTarget);
        // End:0x23D
        if(CamActor != none)
        {
            TVT.POV.FOV = CamActor.FOVAngle;            
        }
        else
        {
            TVT.POV.FOV = CurrentCamType.CFD().IdealVT.FOV;
        }
        CurrentCamType.CFD().IdealVT.ConvertFromTViewTarget(TVT);
        CurrentCamType.CFD().Resync();
        CurrentCamType.TransitionCut();
        Targeting.ResetLook();
    }
    //return;    
}

simulated event SetCameraViewPoint()
{
    local /*0x043A0000-0x00000000*/ private @NULL InViewTarget[8388609], InCamLoc, InCamRot;
    local /*0x043A0000-0x00000000*/ private float InFov[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL TVT, CamActor;

    TVT.POV.Location = InCamLoc;
    TVT.POV.Rotation = InCamRot;
    // End:0xAA
    if(InViewTarget != none)
    {
        TVT.Target = InViewTarget;        
    }
    else
    {
        TVT.Target = Targeting.Target;
    }
    CamActor = CameraActor(TVT.Target);
    // End:0x174
    if(CamActor != none)
    {
        TVT.POV.FOV = CamActor.FOVAngle;        
    }
    else
    {
        // End:0x1C1
        if(InFov > float(0))
        {
            TVT.POV.FOV = InFov;            
        }
        else
        {
            TVT.POV.FOV = CurrentCamType.CFD().IdealVT.FOV;
        }
    }
    CurrentCamType.CFD().IdealVT.ConvertFromTViewTarget(TVT);
    CurrentCamType.CFD().Resync();
    CurrentCamType.TransitionCut();
    Targeting.ResetLook();
    //return;    
}

function OnClearCameraLayer()
{
    local /*0x043A0000-0x00000000*/ private @NULL Action[8388609];

    ClearCameraMode(Action.Layer, Action.CameraTransitionParam);
    //return;    
}

event PreProcessInput()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL SPInput[8388609];

    super.PreProcessInput(DeltaTime, SPInput);
    // End:0x6D
    if((SPInput != none) && CurrentCamType != none)
    {
        CurrentCamType.PreProcessInput(DeltaTime, SPInput);
    }
    //return;    
}

simulated function DisplayDebug()
{
    local /*0x043A0000-0x00000000*/ private @NULL HUD[8388609];
    local /*0x043A0000-0x00000000*/ private float out_YL[25165825], out_YPos;

    super.DisplayDebug(HUD, out_YL, out_YPos);
    HUD.Canvas.SetDrawColor(255, 192, 32);
    // End:0xA9
    if(CurrentCamType != none)
    {
        CurrentCamType.DisplayDebug(HUD, out_YL, out_YPos);
    }
    // End:0xF2
    if(Targeting != none)
    {
        Targeting.DisplayDebug(HUD, out_YL, out_YPos);
    }
    //return;    
}

defaultproperties
{
    TargetingClass=Class'SPCameraTargeting'
    DefaultCameraStyle="UserStyle"
    CameraStyle="UserStyle"
}