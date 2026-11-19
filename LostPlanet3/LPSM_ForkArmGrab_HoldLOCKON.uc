class LPSM_ForkArmGrab_HoldLOCKON extends LPSM_ForkArmGrab_Hold
    config(Game);

enum ELockOnType
{
    elotCoreLineCheck,              // 0
    elotScreenCenter,               // 1
    elotScreenCore,                 // 2
    ELockOnType_MAX                 // 3
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLockOnToDrill;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bStartDrillTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LockOnTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LockOnTimeFactor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LockOffTimeFactor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float RequiredLockOnTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CappedLockOnTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte LockOnType;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ScreenLockOnExtent;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array LockOnBoxesScale;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LockOnPoint;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AspectCorrection;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DrillTimeLeft;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DrillActiveLockOffTimeFactor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DrillActiveLockOnTimeFactor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LockOnStrongGrabDuration;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LockOnWeakGrabDuration;

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    // End:0x66
    if(ForkArmGrabInfo.GrabPoint.bFirmGrab)
    {
        HydraulicPressureLeft = LockOnStrongGrabDuration;        
    }
    else
    {
        HydraulicPressureLeft = LockOnWeakGrabDuration;
    }
    MaxHydraulicPressure = HydraulicPressureLeft;
    LockOnTime = 0.0000000;
    bAllowDrillUse = false;
    bStartDrillTime = false;
    ProcessSMMessage(Class'LPSMMTypes'.default.SMM_VSRightArmPartEnd, self, 0);
    //return;    
}

function StartHoldAnimation()
{
    LPBaseVSPlayerPawn(MySPPawn).TemplateLogicData.bFirmGrab = true;
    StartChoreographedAnimationLooped(MySPPawn, FollowerPawn, 2);
    //return;    
}

function ProcessSMMessage()
{
    local /*0x97E50000-0x00000000*/ private name MessageName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int Data[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    switch(MessageName)
    {
        // End:0xCA
        case Class'LPSMMTypes'.default.SMM_VSRightArmPartStart:
            // End:0xC7
            if(bAllowDrillUse)
            {
                bDrillInUse = true;
                LPVSPlayerPawn(MySPPawn).StartRightArmPartAction(0, 2, true,,,, false);
                StartAnimationChoreography(MySPPawn, FollowerPawn, 5, false, DrillStartCB);
                bStartDrillTime = true;
                return true;
            }
            // End:0x15A
            break;
        // End:0x157
        case Class'LPSMMTypes'.default.SMM_VSRightArmPartEnd:
            // End:0x154
            if(bDrillInUse)
            {
                StartAnimationChoreography(MySPPawn, FollowerPawn, 7, false, DrillEndCB);
                return super.ProcessSMMessage(MessageName, Sender, Data);
            }
            // End:0x15A
            break;
        // End:0xFFFF
        default:
            break;
    }
    return super.ProcessSMMessage(MessageName, Sender, Data);
    //return ReturnValue;    
}

function DrillStartCB()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    StartChoreographedAnimationLooped(MySPPawn, FollowerPawn, 6);
    //return;    
}

function DrillEndCB()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    StartChoreographedAnimationLooped(MySPPawn, FollowerPawn, 2);
    //return;    
}

function WelderStartCB()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    StartChoreographedAnimationLooped(MySPPawn, FollowerPawn, 6);
    //return;    
}

function WelderEndCB()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    StartChoreographedAnimationLooped(MySPPawn, FollowerPawn, 2);
    //return;    
}

function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super.Tick(DeltaTime);
    //return;    
}

function UpdateLockOnTime()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL H[8388609];
    local /*0x97E50000-0x00000000*/ private bool bIsLockedOn;

    // End:0x11
    if(!bLockOnToDrill)
    {
        return;
    }
    bIsLockedOn = IsLockedOn(H);
    // End:0xF4
    if(!bAllowDrillUse)
    {
        // End:0x6D
        if(bIsLockedOn)
        {
            LockOnTime += (DeltaTime * LockOnTimeFactor);            
        }
        else
        {
            LockOnTime += (DeltaTime * LockOffTimeFactor);
        }
        LockOnTime = FClamp(LockOnTime, 0.0000000, CappedLockOnTime);
        // End:0xF1
        if(LockOnTime >= RequiredLockOnTime)
        {
            bAllowDrillUse = true;
            DrillTimeLeft = default.DrillTimeLeft;
            bStartDrillTime = false;
        }        
    }
    else
    {
        // End:0x1E7
        if(bStartDrillTime)
        {
            HydraulicPressureLeft += DeltaTime;
            // End:0x144
            if(bIsLockedOn)
            {
                DrillTimeLeft += (DeltaTime * DrillActiveLockOnTimeFactor);                
            }
            else
            {
                DrillTimeLeft += (DeltaTime * DrillActiveLockOffTimeFactor);
            }
            DrillTimeLeft = FClamp(DrillTimeLeft, 0.0000000, default.DrillTimeLeft);
            // End:0x1E7
            if(DrillTimeLeft <= float(0))
            {
                LockOnTime = 0.0000000;
                bAllowDrillUse = false;
                ProcessSMMessage(Class'LPSMMTypes'.default.SMM_VSRightArmPartEnd, self, 0);
                FinishGrabGraceful(false);
            }
        }
    }
    //return;    
}

function IsLockedOn()
{
    local /*0x97E50000-0x00000000*/ private @NULL H[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    switch(LockOnType)
    {
        // End:0x2C
        case 0:
            return IsLockedOn_CoreLineCheck(H);
        // End:0x45
        case 1:
            return IsLockedOn_ScreenCenter(H);
        // End:0x5E
        case 2:
            return IsLockedOn_ScreenCore(H);
        // End:0xFFFF
        default:
            //return ReturnValue;
            break;
    }    
}

function IsLockedOn_CoreLineCheck()
{
    local /*0x97E50000-0x00000000*/ private @NULL H[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL CameraMgr, AimController, akrid;
    local /*0x97E50000-0x00000000*/ private editfixedsize array Hits;
    local /*0x97E50000-0x00000000*/ private name BoneName;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL CurrentViewLoc, Dir, CurrentAimPoint, TargetPoint, TargetScreenPoint, CurrentViewRot;

    CameraMgr = SPPlayerCameraManager(LPPlayerController(MySPPawn.Controller).PlayerCamera);
    // End:0x360
    if(CameraMgr != none)
    {
        CameraMgr.GetCameraViewPoint(CurrentViewLoc, CurrentViewRot);
        AimController = LPPawn(MySPPawn).GetAimController();
        CurrentAimPoint = AimController.GetAimCollisionPoint();
        Dir = Normal(CurrentAimPoint - CurrentViewLoc);
        BoneName = GetVulnerableCoreBone();
        akrid = LPAIPawnAkrid(FollowerPawn);
        akrid.TraceAllPhysicsAssetInteractions(akrid.Mesh, CurrentViewLoc + (Dir * 5000.0000000), CurrentViewLoc, Hits);
        TargetPoint = FollowerPawn.Mesh.GetBoneLocation(BoneName);
        TargetScreenPoint = H.Canvas.Project(TargetPoint);
        LockOnPoint.X = TargetScreenPoint.X / H.SizeX;
        LockOnPoint.Y = TargetScreenPoint.Y / H.SizeY;
        I = 0;
        J0x2F1:

        // End:0x360 [Loop If]
        if(I < Hits.Length)
        {
            // End:0x352
            if(Hits[I].HitInfo.BoneName == BoneName)
            {
                return true;
            }
            I++;
            // [Loop Continue]
            goto J0x2F1;
        }
    }
    return false;
    //return ReturnValue;    
}

function IsLockedOn_ScreenCenter()
{
    local /*0x97E50000-0x00000000*/ private @NULL H[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    LockOnPoint.X = 0.5000000;
    LockOnPoint.Y = 0.5000000;
    return IsLockedOn_ScreenPoint(H);
    //return ReturnValue;    
}

function IsLockedOn_ScreenCore()
{
    local /*0x97E50000-0x00000000*/ private @NULL H[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private name BoneName;
    local /*0x97E50000-0x00000000*/ private @NULL TargetPoint, TargetScreenPoint;

    BoneName = GetVulnerableCoreBone();
    TargetPoint = FollowerPawn.Mesh.GetBoneLocation(BoneName);
    TargetScreenPoint = H.Canvas.Project(TargetPoint);
    LockOnPoint.X = TargetScreenPoint.X / H.SizeX;
    LockOnPoint.Y = TargetScreenPoint.Y / H.SizeY;
    return IsLockedOn_ScreenPoint(H);
    //return ReturnValue;    
}

function IsLockedOn_ScreenPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL H[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL AimController, CurrentAimPoint, ScreenAimPoint, NormalizedAimPoint;

    AimController = LPPawn(MySPPawn).GetAimController();
    CurrentAimPoint = AimController.GetAimCollisionPoint();
    ScreenAimPoint = H.Canvas.Project(CurrentAimPoint);
    NormalizedAimPoint.X = ScreenAimPoint.X / H.SizeX;
    NormalizedAimPoint.Y = ScreenAimPoint.Y / H.SizeY;
    // End:0x1B4
    if(LockOnPoint.X < (NormalizedAimPoint.X - ScreenLockOnExtent.X))
    {
        return false;        
    }
    else
    {
        // End:0x214
        if(LockOnPoint.X > (NormalizedAimPoint.X + ScreenLockOnExtent.X))
        {
            return false;            
        }
        else
        {
            // End:0x274
            if(LockOnPoint.Y < (NormalizedAimPoint.Y - ScreenLockOnExtent.Y))
            {
                return false;                
            }
            else
            {
                // End:0x2D1
                if(LockOnPoint.Y > (NormalizedAimPoint.Y + ScreenLockOnExtent.Y))
                {
                    return false;
                }
            }
        }
    }
    return true;
    //return ReturnValue;    
}

simulated function DrawHUD()
{
    local /*0x97E50000-0x00000000*/ private @NULL H[8388609], TargetScreenPoint;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private float CurWidth, CurHeight, LockOnPercent;
    local /*0x97E50000-0x00000000*/ private byte Alpha;

    AspectCorrection = H.SizeX / H.SizeY;
    ScreenLockOnExtent.Y = default.ScreenLockOnExtent.Y * AspectCorrection;
    super(SPSpecialMove).DrawHUD(H);
    // End:0x672
    if((LPBaseVSPlayerPawn(MySPPawn) != none) && MySPPawn.IsLocallyControlled())
    {
        // End:0x672
        if(bLockOnToDrill)
        {
            UpdateLockOnTime(MySPPawn.WorldInfo.DeltaSeconds, H);
            TargetScreenPoint.X = LockOnPoint.X * H.SizeX;
            TargetScreenPoint.Y = LockOnPoint.Y * H.SizeY;
            H.Canvas.SetDrawColor(155, 155, 155, 200);
            CurWidth = (ScreenLockOnExtent.X * float(2)) * H.SizeX;
            CurHeight = (ScreenLockOnExtent.Y * float(2)) * H.SizeY;
            H.Canvas.SetPos(TargetScreenPoint.X - (CurWidth * 0.5000000), TargetScreenPoint.Y - (CurHeight * 0.5000000));
            H.Canvas.DrawBox(CurWidth, CurHeight);
            // End:0x3C1
            if(bAllowDrillUse)
            {
                Alpha = byte(float(255) * (DrillTimeLeft / default.DrillTimeLeft));                
            }
            else
            {
                Alpha = 100;
            }
            LockOnPercent = LockOnTime / RequiredLockOnTime;
            // End:0x444
            if(LockOnPercent < 1.0000000)
            {
                H.Canvas.SetDrawColor(255, 0, 0, Alpha);                
            }
            else
            {
                H.Canvas.SetDrawColor(0, 255, 0, Alpha);
            }
            I = 0;
            J0x492:

            // End:0x672 [Loop If]
            if(I < LockOnBoxesScale.Length)
            {
                // End:0x664
                if(LockOnPercent >= LockOnBoxesScale[I])
                {
                    CurWidth = ((ScreenLockOnExtent.X * LockOnBoxesScale[I]) * float(2)) * H.SizeX;
                    CurHeight = ((ScreenLockOnExtent.Y * LockOnBoxesScale[I]) * float(2)) * H.SizeY;
                    H.Canvas.SetPos(TargetScreenPoint.X - (CurWidth * 0.5000000), TargetScreenPoint.Y - (CurHeight * 0.5000000));
                    H.Canvas.DrawBox(CurWidth, CurHeight);
                }
                I++;
                // [Loop Continue]
                goto J0x492;
            }
        }
    }
    //return;    
}

function HandleDismemberment()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    bDrillInUse = false;
    LPVSPlayerPawn(MySPPawn).StopRightArmPartAction(0);
    return super(LPSM_ForkArmGrab_Base).HandleDismemberment();
    //return ReturnValue;    
}

defaultproperties
{
    bLockOnToDrill=true
    LockOnTimeFactor=1.0000000
    LockOffTimeFactor=-0.5000000
    RequiredLockOnTime=1.2500000
    CappedLockOnTime=2.0000000
    LockOnType=ELockOnType.elotScreenCore
    ScreenLockOnExtent=(X=0.0500000,Y=0.0500000)
    LockOnBoxesScale=/* Array type was not detected. */
    DrillTimeLeft=3.0000000
    DrillActiveLockOffTimeFactor=-1.0000000
    DrillActiveLockOnTimeFactor=-0.5000000
    LockOnStrongGrabDuration=5.0000000
    LockOnWeakGrabDuration=2.7500000
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldLOCKON.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultGrabCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldLOCKON.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    GrabCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPSM_ForkArmGrab_HoldLOCKON.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    GrabTransitionInParam=GrabCamTransitionInParamObj
    bAllowDrillUse=false
    AnimationTemplateNodeNames=/* Array type was not detected. */
}