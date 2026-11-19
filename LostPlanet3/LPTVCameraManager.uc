class LPTVCameraManager extends SPObject;

enum ETVCameraTrackingMode
{
    ETVCameraTrackingMode_OFF,      // 0
    ETVCameraTrackingMode_SpecificTarget,// 1
    ETVCameraTrackingMode_InterestingVolume,// 2
    ETVCameraTrackingMode_MAX       // 3
};

enum ETVCameraTrackingInstructions
{
    ETVCameraTrackingInstructions_Shutdown,// 0
    ETVCameraTrackingInstructions_RemainInVolume,// 1
    ETVCameraTrackingInstructions_FindSomethingElse,// 2
    ETVCameraTrackingInstructions_MAX// 3
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array MasterVolumeList;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Owner;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte MyTeamNumber;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte TrackingMode;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte Instructions;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DirectorCamParams;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DirectorTransitionParam;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentVolume;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentCamera;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentTrackingTarget;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastCameraChangeTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinCameraChangeTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ForceChangeToInterestingAfterTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bForceVolumeEvaluation;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __CompareVolumeInterestIndex__Delegate;

delegate CompareVolumeInterestIndex()
{
    local /*0x97E50000-0x00000000*/ private @NULL A[8388609], B;
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return ((A.InterestingIndex < B.InterestingIndex) ? -1 : 0);
    //return ReturnValue;    
}

simulated function PostBeginPlay()
{
    local /*0x97E50000-0x00000000*/ private @NULL Own[8388609];

    Owner = Own;
    MasterVolumeList.Length = 0;
    //return;    
}

simulated function BuildVolumeList()
{
    local /*0x97E50000-0x00000000*/ private @NULL Own[8388609], Vol;

    Owner = Own;
    // End:0x38
    if((MasterVolumeList.Length > 0) && MasterVolumeList[0] != none)
    {
        return;
    }
    MasterVolumeList.Length = 0;
    MyTeamNumber = Owner.GetTeamNum();
    // End:0x10C
    foreach Owner.WorldInfo.AllActors(Class'LPTVCameraVolume', Vol)
    {
        // End:0x10B
        if(Vol.Cameras.Length > 0)
        {
            Vol.MyManager = self;
            MasterVolumeList.AddItem(Vol);            
        }        
    }    
    SleepCollision(true);
    //return;    
}

simulated function CalculateVolumeInterests()
{
    local /*0x97E50000-0x00000000*/ private @NULL Vol;

    // End:0x37
    foreach MasterVolumeList(Vol)
    {
        Vol.EvaluateMyInterestIndex();        
    }    
    MasterVolumeList.Sort(CompareVolumeInterestIndex);    
    //return;    
}

simulated function EnableTVCamera()
{
    local /*0x97E50000-0x00000000*/ private byte Mode[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ViewTarget[9437185];
    local /*0x97E50000-0x00000000*/ private byte OnFocusLoss[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Cam, Vol;
    local /*0x97E50000-0x00000000*/ private int iIndex;
    local /*0x97E50000-0x00000000*/ private bool bOk;

    none
    2
    // End:0x2E
    if(MasterVolumeList.Length <= 0)
    {
        BuildVolumeList(Owner);
    }
    // End:0x41
    if(MasterVolumeList.Length <= 0)
    {        
    }
    else
    {
        // End:0x15C
        if(int(Mode) == int(1))
        {
            // End:0x67
            if(ViewTarget == none)
            {
                // [Explicit Continue]
                goto J0x275;
            }
            SleepCollision(false);
            Vol = FindViewTarget(ViewTarget);
            // End:0xA2
            if(Vol == none)
            {
                // [Explicit Continue]
                goto J0x275;
            }
            Cam = Vol.FindBestCamera(ViewTarget);
            // End:0xE6
            if(Cam == none)
            {
                // [Explicit Continue]
                goto J0x275;
            }
            EnableCamera(Vol, Cam, ViewTarget);
            TrackingMode = Mode;
            Instructions = OnFocusLoss;
            Owner.SetTimer(0.1000000, false, 'Tick', self);
            return true;
        }
        SleepCollision(false);
        CalculateVolumeInterests();
        iIndex = 0;
        J0x17C:

        // End:0x275 [Loop If]
        if(iIndex < MasterVolumeList.Length)
        {
            Cam = MasterVolumeList[iIndex].FindBestCamera();
            // End:0x267
            if(Cam != none)
            {
                bOk = EnableCamera(MasterVolumeList[iIndex], Cam);
                // End:0x267
                if(bOk)
                {
                    TrackingMode = Mode;
                    Instructions = OnFocusLoss;
                    Owner.SetTimer(0.1000000, false, 'Tick', self);
                    return true;
                }
            }
            ++iIndex;
            // [Loop Continue]
            goto J0x17C;
        }
    }
    J0x275:

    SleepCollision(true);
    return false;
    //return ReturnValue;    
}

simulated function CameraChangeAllowed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float CurrentTime, ChangeDelay;

    // End:0x2A
    if(int(TrackingMode) == int(1))
    {
        ChangeDelay = MinCameraChangeTime;        
    }
    else
    {
        // End:0x51
        if(int(TrackingMode) == int(2))
        {
            ChangeDelay = ForceChangeToInterestingAfterTime;
        }
    }
    CurrentTime = Owner.WorldInfo.TimeSeconds;
    // End:0xB2
    if((LastCameraChangeTime + ChangeDelay) > CurrentTime)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

simulated function EnableCamera()
{
    local /*0x97E50000-0x00000000*/ private @NULL Vol[8388609], Cam, ViewTarget;
    local /*0x97E50000-0x00000000*/ private bool bForceVisibilityCheck[9437185], ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL Target;
    local /*0x97E50000-0x00000000*/ private float CurrentTime;

    none
    false
    CurrentTime = Owner.WorldInfo.TimeSeconds;
    // End:0x69
    if((Vol == none) || Cam == none)
    {
        return false;
    }
    // End:0x8E
    if(ViewTarget != none)
    {
        Target = ViewTarget;        
    }
    else
    {
        Target = Vol.MostInterestingActor;
    }
    // End:0xED
    if(Target == none)
    {
        Target = Cam.DefaultLookAtTarget;
    }
    // End:0x10F
    if(Target == none)
    {
        Target = Vol;
    }
    // End:0x14B
    if(bForceVisibilityCheck)
    {
        // End:0x14B
        if(!Cam.IsActorVisible(Target))
        {
            return false;
        }
    }
    DirectorCamParams.PositionTarget = Cam;
    DirectorCamParams.LookAtTarget = Target;
    Owner.SetViewTarget(Target);
    Owner.ChangeCameraMode(DirectorCamParams, DirectorTransitionParam);
    DirectorCamParams.PositionTarget = none;
    DirectorCamParams.LookAtTarget = none;
    CurrentVolume = Vol;
    CurrentCamera = Cam;
    CurrentTrackingTarget = Target;
    LastCameraChangeTime = CurrentTime;
    bForceVolumeEvaluation = false;
    return true;
    //return ReturnValue;    
}

simulated function DisableTVCamera()
{
    Owner.SetViewTarget(((Owner.Pawn != none) ? Owner.Pawn : Owner));
    Owner.ClearAnimatedCamera();
    Owner.SetDefaultCam();
    TrackingMode = 0;
    Owner.ClearTimer('Tick', self);
    CurrentVolume = none;
    CurrentCamera = none;
    SleepCollision(true);
    //return;    
}

simulated function FindViewTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL A[8388609], ExcludeThis, ReturnValue, Vol;

    none
    // End:0x16
    if(A == none)
    {
        return none;
    }
    // End:0x3A
    if(A.bTearOff)
    {
        return none;
    }
    // End:0xC5
    foreach MasterVolumeList(Vol)
    {
        // End:0xC4
        if((Vol.bEnabled && Vol != ExcludeThis) && Vol.IsActorInside(A))
        {            
            return Vol;
        }        
    }    
    return none;
    //return ReturnValue;    
}

simulated function Tick()
{
    local /*0x97E50000-0x00000000*/ private @NULL Cam, Vol;
    local /*0x97E50000-0x00000000*/ private bool bOk;

    // End:0x23
    if((CurrentCamera == none) || CurrentVolume == none)
    {        
    }
    else
    {
        // End:0x46C
        if(int(TrackingMode) == int(1))
        {
            // End:0x10C
            if((CurrentTrackingTarget == none) || ClassIsChildOf(CurrentTrackingTarget.Class, Class'Engine.Volume'))
            {
                // End:0x87
                if(!CameraChangeAllowed())
                {
                    // [Explicit Continue]
                    goto J0x61D;
                }
                // End:0x109
                if((LastCameraChangeTime + ForceChangeToInterestingAfterTime) <= Owner.WorldInfo.TimeSeconds)
                {
                    CurrentTrackingTarget = none;
                    bOk = PerformTargetInstructions();
                    // End:0x106
                    if(bOk)
                    {
                        goto J0x61D;                        
                    }
                    else
                    {
                        // [Explicit Continue]
                        goto J0x647;
                    }
                }
                // [Explicit Continue]
                goto J0x61D;
            }
            // End:0x179
            if(!CurrentVolume.IsActorInside(CurrentTrackingTarget))
            {
                // End:0x14B
                if(!CameraChangeAllowed())
                {
                    // [Explicit Continue]
                    goto J0x61D;
                }
                bOk = PerformTargetInstructions();
                // End:0x173
                if(bOk)
                {
                    goto J0x61D;                    
                }
                else
                {
                    goto J0x647;
                }                
            }
            else
            {
                // End:0x3FD
                if(!CurrentCamera.IsActorVisible(CurrentTrackingTarget) || bForceVolumeEvaluation)
                {
                    // End:0x1C7
                    if(!CameraChangeAllowed())
                    {
                        // [Explicit Continue]
                        goto J0x61D;
                    }
                    Vol = CurrentVolume;
                    Cam = Vol.FindBestCamera(CurrentTrackingTarget);
                    // End:0x29A
                    if((Cam != none) && Cam == CurrentCamera)
                    {
                        J0x234:

                        Cam = Vol.FindNextBestCamera();
                        // End:0x234
                        if(!((Cam == none) || EnableCamera(Vol, Cam, CurrentTrackingTarget, true)))
                            goto J0x234;                        
                    }
                    else
                    {
                        // End:0x2F5
                        if(Cam != none)
                        {
                            bOk = EnableCamera(Vol, Cam, CurrentTrackingTarget);
                            // End:0x2EA
                            if(bOk)
                            {
                                // [Explicit Continue]
                                goto J0x61D;
                            }
                            Cam = none;
                        }
                    }
                    // End:0x3F7
                    if(Cam == none)
                    {
                        Vol = FindViewTarget(CurrentTrackingTarget, CurrentVolume);
                        // End:0x3CC
                        if(Vol != none)
                        {
                            Cam = Vol.FindBestCamera(CurrentTrackingTarget);
                            // End:0x3A3
                            if(Cam == none)
                            {
                                Cam = Vol.PickRandomCamera();
                            }
                            EnableCamera(Vol, Cam, CurrentTrackingTarget);
                            // [Explicit Continue]
                            goto J0x61D;
                        }
                        bOk = PerformTargetInstructions();
                        // End:0x3F4
                        if(bOk)
                        {
                            goto J0x61D;                            
                        }
                        else
                        {
                            // [Explicit Continue]
                            goto J0x647;
                        }
                    }
                    goto J0x61D;                    
                }
                else
                {
                    // End:0x469
                    if(!bForceVolumeEvaluation && (LastCameraChangeTime + ForceChangeToInterestingAfterTime) <= Owner.WorldInfo.TimeSeconds)
                    {
                        bForceVolumeEvaluation = true;
                        // [Explicit Continue]
                        goto J0x61D;
                    }
                }
            }            
        }
        else
        {
            // End:0x47E
            if(!CameraChangeAllowed())
            {                
            }
            else
            {
                switch(Instructions)
                {
                    // End:0x499
                    case 0:
                        // End:0x647
                        break;
                    // End:0x4A1
                    case 1:
                        // End:0x61D
                        break;
                    // End:0x61A
                    case 2:
                        CalculateVolumeInterests();
                        // End:0x616
                        foreach MasterVolumeList(Vol)
                        {
                            // End:0x4EF
                            if(!Vol.bEnabled)
                            {
                                continue;                                
                            }
                            else
                            {
                                Cam = Vol.FindBestCamera();
                                // End:0x600
                                if((Cam == CurrentCamera) || !EnableCamera(Vol, Cam))
                                {
                                    J0x555:

                                    // End:0x5FD [Loop If]
                                    if((Cam != none) || Cam == CurrentCamera)
                                    {
                                        Cam = Vol.FindNextBestCamera();
                                        bOk = EnableCamera(Vol, Cam);
                                        // End:0x5EC
                                        if(!bOk)
                                        {
                                            Cam = none;                                            
                                        }
                                        else
                                        {
                                            Vol = none;
                                            // [Explicit Break]
                                            goto J0x5FD;
                                        }
                                        // [Loop Continue]
                                        goto J0x555;
                                    }
                                    J0x5FD:
                                    
                                }
                                else
                                {
                                    goto J0x616;
                                }
                                // End:0x615
                                if(Vol == none)
                                {                                    
                                }
                                else
                                {                                    
                                }
                            }
                        }
                        J0x616:
                        
                        // End:0x61D
                        break;
                    // End:0xFFFF
                    default:
                        break;
                }
            }
        }
        J0x61D:

        Owner.SetTimer(0.1000000, false, 'Tick', self);
        return;
    // Failed to format nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests)
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile()
    // 1 & Type:Else Position:0x647
    J0x647:

    DisableTVCamera();
    // Failed to format nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests)
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile()
    // 1 & Type:Else Position:0x647
    return;
    // Failed to format nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests)
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile()
    // 1 & Type:Else Position:0x647
    //return;
    // Failed to format nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests)
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile()
    // 1 & Type:Else Position:0x647    
    // Failed to format nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests)
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile()
    // 1 & Type:Else Position:0x647
    // Failed to format remaining nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests)
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile()
    // 1 & Type:Else Position:0x647
}

simulated function PerformTargetInstructions()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Cam, Vol, Target;

    switch(Instructions)
    {
        // End:0x1A
        case 0:
            return false;
        // End:0x21
        case 1:
            return true;
        // End:0x243
        case 2:
            Vol = FindViewTarget(CurrentTrackingTarget);
            Cam = none;
            Target = CurrentTrackingTarget;
            // End:0x1B1
            if(Vol == none)
            {
                CalculateVolumeInterests();
                // End:0x19F
                foreach MasterVolumeList(Vol)
                {
                    // End:0xD3
                    if((Vol == CurrentVolume) || !Vol.bEnabled)
                    {
                        continue;                        
                    }
                    else
                    {
                        Target = Vol.FindMostInterestingActorInVolume();
                        // End:0x19E
                        if(Target != none)
                        {
                            Cam = Vol.FindBestCamera(Target);
                            // End:0x175
                            if(Cam == none)
                            {
                                Cam = Vol.PickRandomCamera();
                            }
                            EnableCamera(Vol, Cam, Target);                            
                            return true;
                        }                        
                    }
                }                
                // End:0x1B1
                if(Vol == none)
                {
                    return true;
                }
            }
            Cam = Vol.FindBestCamera(Target);
            // End:0x21B
            if(Cam == none)
            {
                Cam = Vol.PickRandomCamera();
            }
            EnableCamera(Vol, Cam, Target);
            return true;
        // End:0xFFFF
        default:
            return false;
            break;
    }
    //return ReturnValue;    
}

simulated function EnteredVolume()
{
    local /*0x97E50000-0x00000000*/ private @NULL Vol[8388609], A;

    // End:0x16
    if(int(TrackingMode) == int(0))
    {
        return;
    }
    // End:0x39
    if(CurrentTrackingTarget == A)
    {
        bForceVolumeEvaluation = true;
    }
    //return;    
}

simulated function LeftVolume()
{
    local /*0x97E50000-0x00000000*/ private @NULL Vol[8388609], A;

    //return;    
}

simulated function SleepCollision()
{
    local /*0x97E50000-0x00000000*/ private bool bDisableCollision[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Vol;

    // End:0x41
    foreach MasterVolumeList(Vol)
    {
        Vol.SleepCollision(bDisableCollision);        
    }    
    //return;    
}

defaultproperties
{
    // Reference: LPCameraModeDirectorParam'Default__LPTVCameraManager.DirectorCamParamObj'
    begin object name=DirectorCamParamObj class=Class'LPCameraModeDirectorParam'
    end object
    DirectorCamParams=DirectorCamParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPTVCameraManager.DirectorTransitionParamObj'
    begin object name=DirectorTransitionParamObj class=Class'LPCameraTransitionCutParam'
        bEnableInput=false
    end object
    DirectorTransitionParam=DirectorTransitionParamObj
    MinCameraChangeTime=0.5000000
    ForceChangeToInterestingAfterTime=5.0000000
}