class LPSM_VSIP_WristTurning_Base extends LPSM_VSIPBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL WristTurnIP;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DesiredRotation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TargetInitialRotation;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL TwistLoopSound[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float OldAngle;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float OldDelta;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float adjustedDelta;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SoundLevel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShouldPause;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsPaused;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPlayingClockwise;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAllowClockwise;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAllowCounterClockwise;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bResetOnAbort;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bResetOnComplete;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShouldEnableLeftWristIK;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LinkedActor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MomentumFactor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float RotationInterpSpeed;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float InitialMomentum;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MomentumDecay;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumRotationsForCompletion;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxRotationAngle;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int InitialMeshRoll;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StruggleMoment[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StruggleMomentDirection[536870913];

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    WristTurnIP = LPVSInteractionPoint_WristTurning_Base(vsPawn.GetVSInteractionPoint());
    LinkedActor = WristTurnIP.AttachedSkelMeshActor;
    NumRotationsForCompletion = int(WristTurnIP.NumRotationForCompleteMove);
    bAllowClockwise = WristTurnIP.bAllowClockwiseRotation;
    bAllowCounterClockwise = WristTurnIP.bAllowCounterClockwiseRotation;
    bResetOnAbort = WristTurnIP.bAllowResetOnAbort;
    bResetOnComplete = WristTurnIP.bAllowResetOnComplete;
    MomentumFactor = WristTurnIP.MomentumFactor;
    RotationInterpSpeed = WristTurnIP.RotationInterpTime;
    InitialMomentum = WristTurnIP.InitialMomentum;
    MomentumDecay = WristTurnIP.MomentumDecay;
    SoundLevel = 0.0000000;
    OldDelta = 0.0000000;
    bIsPlayingInteractAnim = false;
    bPlayingClockwise = true;
    bPlayOuttro = false;
    OldDelta = 0.0000000;
    OldAngle = 0.0000000;
    MaxRotationAngle = WristTurnIP.MaxRotationAngle;
    StruggleMoment = 0.0000000;
    StruggleMomentDirection = 0.0000000;
    super.SpecialMoveStarted(bForced, PrevMove);
    MaxDistancePlaybackOverride.PlaybackDistanceOverride.OverrideType = 2;
    MaxDistancePlaybackOverride.PlaybackDistanceOverride.OverrideValue = 100000000000000000.0000000;
    TwistLoopSound = AkComponent(MySPPawn.TuneDataPawnSoundEventBindings.PlayEventSoundLocallyEx('VSGateOpenerTwistLoop', 'None', MySPPawn, none, MaxDistancePlaybackOverride));
    SetupAkComponent(TwistLoopSound, 'JO_Torso');
    TwistLoopSound.SetRTPCValue("RotationSpeed", 0.0000000);
    // End:0x425
    if(!bRegisterToInteractionPoint)
    {
        MySPPawn.RegisterDestinationAndOrientation(PlayInteractAnim(), GetIdealLocation(), VSIP.Rotation, 0.0000000, 0.5000000, true, false);
    }
    //return;    
}

function GetWristAngle()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL WinchRot;

    WinchRot = QuatToRotator(vsPawn.Mesh.GetBoneQuaternion(vsPawn.WinchProjBoneName, 0));
    return float((WinchRot.Roll * 360) / 65536);
    //return ReturnValue;    
}

function EnableLeftWristIK()
{
    local /*0x97E50000-0x00000000*/ private @NULL WinchPos, WinchRot;

    vsPawn.CCDControl_LeftArm.SetIgnoreBoneConstraint('JO_L_WristOsc', true);
    vsPawn.ForkArmSkelControl.bApplyRotation = true;
    vsPawn.ForkArmSkelControl.bApplyTranslation = false;
    vsPawn.ForkArmSkelControl.ControlStrength = 1.0000000;
    vsPawn.ForkArmSkelControl.BoneTranslationSpace = 0;
    vsPawn.ForkArmSkelControl.BoneRotationSpace = 0;
    vsPawn.ForkArmSkelControl.bAddTranslation = false;
    vsPawn.ForkArmSkelControl.bAddRotation = false;
    WinchPos = vsPawn.Mesh.GetBoneLocation(vsPawn.WinchProjBoneName, 0);
    WinchRot = QuatToRotator(vsPawn.Mesh.GetBoneQuaternion(vsPawn.WinchProjBoneName, 0));
    GetDestinationFromBoneAnimation(vsPawn, vsPawn.WinchProjBoneName, VSIP.HoldAnimationName, WinchPos, WinchRot, -1.0000000);
    DesiredRotation = WinchRot;
    TargetInitialRotation = WinchRot;
    vsPawn.ForkArmSkelControl.BoneTranslation = WinchPos;
    vsPawn.ForkArmSkelControl.BoneRotation = WinchRot;
    //return;    
}

function DisableLeftWristIK()
{
    vsPawn.CCDControl_LeftArm.SetIgnoreBoneConstraint('JO_L_WristOsc', false);
    vsPawn.AdditiveAnimInfo.AnimNodeSlot.StopCustomAnim(0.0000000);
    vsPawn.ForkArmSkelControl.bApplyRotation = false;
    vsPawn.ForkArmSkelControl.bApplyTranslation = false;
    vsPawn.ForkArmSkelControl.BlendOutTime = 0.3000000;
    vsPawn.ForkArmSkelControl.SetSkelControlActive(false);
    //return;    
}

function StruggleButtonPressed()
{
    local /*0x97E50000-0x00000000*/ private @NULL PC;

    // End:0x11
    if(!bIsHolding)
    {
        return;
    }
    PC = PlayerController(MySPPawn.Controller);
    // End:0xB2
    if(((PC == none) || PC.PlayerInput == none) || PC.PlayerInput.bUsingGamepad)
    {
        return;
    }
    // End:0x110
    if(WristTurnIP.bUsefulCW)
    {
        StruggleMoment = -WristTurnIP.MaxRotationPerFrame;
        StruggleMomentDirection = -1.0000000;        
    }
    else
    {
        // End:0x16C
        if(WristTurnIP.bUsefulCCW)
        {
            StruggleMoment = WristTurnIP.MaxRotationPerFrame;
            StruggleMomentDirection = 1.0000000;            
        }
        else
        {
            return;
        }
    }
    //return;    
}

function UpdateJoystick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PC, PInput;
    local /*0x97E50000-0x00000000*/ private float newAngle, objectAngle;
    local /*0x97E50000-0x00000000*/ private bool bAnyMotion;

    // End:0x20
    if(bForkArmLocked || !bIsHolding)
    {
        return;
    }
    PC = LPPlayerController(MySPPawn.Controller);
    // End:0x95C
    if(PC != none)
    {
        PInput = LPPlayerInput(PC.PlayerInput);
        // End:0xA2
        if(PInput == none)
        {
            return;
        }
        // End:0x189
        if(!PInput.bUsingGamepad)
        {
            adjustedDelta = (StruggleMoment * float(30)) * DeltaTime;
            StruggleMoment -= (StruggleMomentDirection * (WristTurnIP.MaxRotationPerFrame / float(30)));
            // End:0x16D
            if((adjustedDelta * StruggleMomentDirection) < float(0))
            {
                adjustedDelta = 0.0000000;
                StruggleMoment = 0.0000000;
                StruggleMomentDirection = 0.0000000;
            }
            bAnyMotion = adjustedDelta != float(0);            
        }
        else
        {
            StruggleMoment = 0.0000000;
            StruggleMomentDirection = 0.0000000;
            newAngle = Vector2DToDegrees(PInput.FilteredMovementStick);
            // End:0x204
            if(newAngle < float(0))
            {
                newAngle = 360.0000000 + newAngle;
            }
            // End:0x31D
            if(V2DSize(PInput.UnfilteredMovementStick) > 0.9000000)
            {
                // End:0x290
                if((newAngle > float(270)) && OldAngle < float(90))
                {
                    adjustedDelta = -1.0000000 * ((OldAngle + float(360)) - newAngle);                    
                }
                else
                {
                    // End:0x2E3
                    if((newAngle < float(90)) && OldAngle > float(270))
                    {
                        adjustedDelta = (newAngle + float(360)) - OldAngle;                        
                    }
                    else
                    {
                        adjustedDelta = newAngle - OldAngle;
                    }
                }
                bAnyMotion = adjustedDelta != float(0);                
            }
            else
            {
                bAnyMotion = false;
            }
        }
        // End:0x8DE
        if(bAnyMotion)
        {
            OldDelta += MomentumFactor;
            OldDelta = FClamp(OldDelta, InitialMomentum, WristTurnIP.MaxRotationPerFrame);
            adjustedDelta = FClamp(adjustedDelta, -OldDelta, OldDelta);
            // End:0x407
            if(adjustedDelta < float(0))
            {
                // End:0x404
                if(!bAllowClockwise || !WristTurnIP.bUsefulCW)
                {
                    adjustedDelta = 0.0000000;
                }                
            }
            else
            {
                // End:0x45C
                if(adjustedDelta > float(0))
                {
                    // End:0x45C
                    if(!bAllowCounterClockwise || !WristTurnIP.bUsefulCCW)
                    {
                        adjustedDelta = 0.0000000;
                    }
                }
            }
            SoundLevel = Abs(adjustedDelta);
            // End:0x870
            if(((Abs(adjustedDelta) > float(5)) || (adjustedDelta > 1.2500000) && bPlayingClockwise) || (adjustedDelta < -1.2500000) && !bPlayingClockwise)
            {
                DesiredRotation = vsPawn.ForkArmSkelControl.BoneRotation;
                DesiredRotation.Roll -= int((adjustedDelta * 182.0444000) * WristTurnIP.RotationSpeedScale);
                objectAngle = float(DesiredRotation.Roll) * 0.0054932;
                // End:0x679
                if((MaxRotationAngle > float(0)) && MaxRotationAngle <= float(180))
                {
                    objectAngle -= 90.0000000;
                    // End:0x5FE
                    if(objectAngle > float(0))
                    {
                        // End:0x5FB
                        if(objectAngle > MaxRotationAngle)
                        {
                            objectAngle = MaxRotationAngle;
                        }                        
                    }
                    else
                    {
                        // End:0x63A
                        if(objectAngle < (MaxRotationAngle * float(-1)))
                        {
                            objectAngle = MaxRotationAngle * float(-1);
                        }
                    }
                    objectAngle += 90.0000000;
                    DesiredRotation.Roll = int(objectAngle * 182.0444000);
                }
                bShouldPause = false;
                // End:0x7BB
                if(bIsPaused)
                {
                    // End:0x72A
                    if(adjustedDelta < float(0))
                    {
                        // End:0x6F3
                        if(!bPlayingClockwise)
                        {
                            WristTurnIP.TriggerEventClass(Class'LPSeqEvent_Twist', MySPPawn, 3);
                            bPlayingClockwise = true;
                        }
                        WristTurnIP.TriggerEventClass(Class'LPSeqEvent_Twist', MySPPawn, 0);                        
                    }
                    else
                    {
                        // End:0x778
                        if(bPlayingClockwise)
                        {
                            WristTurnIP.TriggerEventClass(Class'LPSeqEvent_Twist', MySPPawn, 3);
                            bPlayingClockwise = false;
                        }
                        WristTurnIP.TriggerEventClass(Class'LPSeqEvent_Twist', MySPPawn, 1);
                    }
                    bIsPaused = false;                    
                }
                else
                {
                    // End:0x81F
                    if(adjustedDelta < float(0))
                    {
                        // End:0x81C
                        if(!bPlayingClockwise)
                        {
                            WristTurnIP.TriggerEventClass(Class'LPSeqEvent_Twist', MySPPawn, 3);
                            bPlayingClockwise = true;
                        }                        
                    }
                    else
                    {
                        // End:0x86D
                        if(bPlayingClockwise)
                        {
                            WristTurnIP.TriggerEventClass(Class'LPSeqEvent_Twist', MySPPawn, 3);
                            bPlayingClockwise = false;
                        }
                    }
                }                
            }
            else
            {
                bShouldPause = true;
                // End:0x8DB
                if(bShouldPause && !bIsPaused)
                {
                    WristTurnIP.TriggerEventClass(Class'LPSeqEvent_Twist', MySPPawn, 2);
                    bIsPaused = true;
                }
            }            
        }
        else
        {
            bShouldPause = true;
            // End:0x949
            if(bShouldPause && !bIsPaused)
            {
                WristTurnIP.TriggerEventClass(Class'LPSeqEvent_Twist', MySPPawn, 2);
                bIsPaused = true;
            }
        }
        OldAngle = newAngle;
    }
    //return;    
}

function PlayInteractAnim()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], PlayingAnim;

    PlayingAnim = super.PlayInteractAnim();
    // End:0x2B
    if(bShouldEnableLeftWristIK)
    {
        EnableLeftWristIK();
    }
    // End:0xFE
    if(VSIP.Mesh != none)
    {
        InitialMeshRoll = (VSIP.Mesh.Rotation.Roll - DesiredRotation.Roll) % 65536;
        DesiredRotation.Roll += InitialMeshRoll;
        TargetInitialRotation = DesiredRotation;
    }
    return PlayingAnim;
    //return ReturnValue;    
}

function PlayHoldLoop()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    bIsPlayingInteractAnim = false;
    // End:0x1B
    if(bInterrupted)
    {
        return;
    }
    // End:0x34
    if(bWantsRelease)
    {
        PlayReleaseAnim();
        return;
    }
    OldAngle = 0.0000000;
    super.PlayHoldLoop(Node, InUserData, bInterrupted);
    bShouldPause = true;
    //return;    
}

function StartResetClaw()
{
    vsPawn.ForkArmSkelControl.BlendOutTime = 0.9000000;
    vsPawn.ForkArmSkelControl.SetSkelControlActive(false);
    //return;    
}

function PlayReleaseAnim()
{
    local /*0x97E50000-0x00000000*/ private @NULL AnimSeq;

    bIsReleasing = true;
    vsPawn.SetTimer(1.6000000, false, 'StartResetClaw', self);
    vsPawn.CCDControl_LeftArm.BlendOutTime = 1.0000000;
    vsPawn.CCDControl_LeftArm.SetSkelControlActive(false);
    CleanupAudioComponent(TwistLoopSound);
    TwistLoopSound = none;
    AnimSeq = MySPPawn.PlayFullBodyAnimation(VSIP.RetractAnimationName, EndSpecialMove,, 1.0000000, 0.2000000, 0.1000000, false, true, 2, 2, true);
    AnimSeq.SetIssueAnimFinishedCallbackOnInterruption(true);
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
        // End:0x41
        case Class'LPSMMTypes'.default.SMM_VSInteractionPointDisable:
            DoOuttroAnimation();
            // End:0xB4
            break;
        // End:0x65
        case Class'LPSMMTypes'.default.SMM_VSInteractionPointEnable:
            // End:0xB4
            break;
        // End:0xB1
        case Class'LPSMMTypes'.default.SMM_StruggleButton:
            // End:0xAE
            if(bIsHolding && !bIsReleasing)
            {
                StruggleButtonPressed();
            }
            // End:0xB4
            break;
        // End:0xFFFF
        default:
            break;
    }
    return super.ProcessSMMessage(MessageName, Sender, Data);
    //return ReturnValue;    
}

function DoOuttroAnimation()
{
    //return;    
}

function FinisherDoneCB()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    bPlayOuttro = false;
    DoForkArmReleaseAction();
    //return;    
}

function DoForkArmReleaseAction()
{
    // End:0x0F
    if(bPlayOuttro)
    {
        return;
    }
    // End:0x55
    if(!bForkArmLocked)
    {
        // End:0x3C
        if(!bIsHolding)
        {
            bWantsRelease = true;            
        }
        else
        {
            // End:0x55
            if(!bIsReleasing)
            {
                PlayReleaseAnim();
            }
        }
    }
    //return;    
}

function EndSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    // End:0x4D
    if(bIsReleasing)
    {
        vsPawn.NotifyInteractionPoint(Class'LPVSInteractionPoint'.default.IPM_Aborted);        
    }
    else
    {
        // End:0xF8
        if(bForkArmLocked)
        {
            vsPawn.NotifyInteractionPoint(Class'LPVSInteractionPoint'.default.IPM_Finished);
            // End:0xF8
            if(VSIP.NumSuccessfulInteractions == VSIP.MaxSuccessfulInteractions)
            {
                VSIP.SetEnabled(false);
            }
        }
    }
    DisableLeftWristIK();
    super.EndSpecialMove(Node, InUserData, bInterrupted);
    //return;    
}

function CheckCanReach()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function GetIdealLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], WinchPos, DeltaLoc, idealStart, Offset, WinchRot;

    WristTurnIP = LPVSInteractionPoint_WristTurning_Base(vsPawn.GetVSInteractionPoint());
    VSIP = WristTurnIP;
    GetDestinationFromBoneAnimation(vsPawn, vsPawn.WinchProjBoneName, VSIP.GrabAnimationName, WinchPos, WinchRot, -1.0000000);
    DeltaLoc = WinchPos - MySPPawn.Location;
    Offset = WristTurnIP.Location - MySPPawn.Location;
    Offset.Z = 0.0000000;
    Offset = Normal(Offset);
    idealStart = (MatrixGetOrigin(WristTurnIP.Mesh.LocalToWorld) - DeltaLoc) - (Offset * WristTurnIP.InitialLocationOffset);
    return idealStart;
    //return ReturnValue;    
}

defaultproperties
{
    bShouldEnableLeftWristIK=true
    MaxRotationAngle=-1.0000000
    // Reference: SPTuneDataEventDefSoundBase'Default__LPSM_VSIP_WristTurning_Base.MaxDistancePlaybackOverrideObj'
    begin object name=MaxDistancePlaybackOverrideObj
        PlaybackDistanceOverride=(OverrideType=SPFloatScaleOverrideType.SPFSOverride_None,OverrideValue=0.0000000)
    end object
    MaxDistancePlaybackOverride=MaxDistancePlaybackOverrideObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_VSIP_WristTurning_Base.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultGrabCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_VSIP_WristTurning_Base.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    GrabCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPSM_VSIP_WristTurning_Base.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    GrabTransitionInParam=GrabCamTransitionInParamObj
}