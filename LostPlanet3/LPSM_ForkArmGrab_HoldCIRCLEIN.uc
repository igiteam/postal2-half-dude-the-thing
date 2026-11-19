class LPSM_ForkArmGrab_HoldCIRCLEIN extends LPSM_ForkArmGrab_Hold
    config(Game);

enum ETargetCircleSuccess
{
    etcsInnerMiss,                  // 0
    etcsInnerGlance,                // 1
    etcsPerfect,                    // 2
    etcsOuterGlance,                // 3
    etcsOuterMiss,                  // 4
    ETargetCircleSuccess_MAX        // 5
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DelayStartDuration;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StrongGrabCircleSpeed;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float WeakGrabCircleSpeed;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumAttemptsLeft;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TargetCircleScale;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TargetCircleMaxScale;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TargetCircleScaleRate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array TargetCircleResultRanges;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAllowDrillDamage;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHasPressedButton;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHasProcessedSuccess;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte SuccessLevel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DelayTimeToResult;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float InitialDelayTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int BullsEyeBaseWidth;

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    GrabCamParams.FloatingAimThresholdMinX = 0.0000000;
    GrabCamParams.FloatingAimThresholdMaxX = 0.0000000;
    GrabCamParams.FloatingAimThresholdMinY = 0.0000000;
    GrabCamParams.FloatingAimThresholdMaxY = 0.0000000;
    bHasProcessedSuccess = false;
    bHasPressedButton = false;
    DelayTimeToResult = default.DelayTimeToResult;
    HydraulicPressureLeft = 100.0000000;
    MaxHydraulicPressure = HydraulicPressureLeft;
    bAllowDrillUse = false;
    ProcessSMMessage(Class'LPSMMTypes'.default.SMM_VSRightArmPartEnd, self, 0);
    DelayStartDuration = default.DelayStartDuration;
    InitialDelayTime = default.InitialDelayTime;
    NumAttemptsLeft = default.NumAttemptsLeft;
    // End:0x1B2
    if(ForkArmGrabInfo.GrabPoint.bFirmGrab)
    {
        TargetCircleScaleRate = StrongGrabCircleSpeed;        
    }
    else
    {
        TargetCircleScaleRate = WeakGrabCircleSpeed;
    }
    // End:0x1EA
    if((NumAttemptsLeft % 2) == 0)
    {
        TargetCircleScale = 0.0000000;        
    }
    else
    {
        TargetCircleScale = TargetCircleMaxScale;
        TargetCircleScaleRate = -TargetCircleScaleRate;
    }
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
        // End:0x70
        case Class'LPSMMTypes'.default.SMM_GrabGameplayTest:
            // End:0x6E
            if(!bHasPressedButton && InitialDelayTime <= float(0))
            {
                SuccessLevel = 2;
                bHasPressedButton = true;
            }
            return true;
        // End:0x10E
        case Class'LPSMMTypes'.default.SMM_VSRightArmPartStart:
            // End:0x10C
            if(!bHasPressedButton && InitialDelayTime <= float(0))
            {
                SuccessLevel = GetSuccessLevel();
                // End:0x100
                if((int(SuccessLevel) == int(0)) || int(SuccessLevel) == int(4))
                {
                    DelayTimeToResult = 0.0000000;
                }
                bHasPressedButton = true;
            }
            return true;
        // End:0x141
        case Class'LPSMMTypes'.default.SMM_VSRightArmPartEnd:
            // End:0x13E
            if(bHasPressedButton)
            {
                return true;
            }
            // End:0x177
            break;
        // End:0x174
        case Class'LPSMMTypes'.default.SMM_ForkArmGrabReleased:
            // End:0x171
            if(bHasPressedButton)
            {
                return true;
            }
            // End:0x177
            break;
        // End:0xFFFF
        default:
            break;
    }
    return super.ProcessSMMessage(MessageName, Sender, Data);
    //return ReturnValue;    
}

function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super.Tick(DeltaTime);
    // End:0x6E
    if(bHasPressedButton && !bHasProcessedSuccess)
    {
        DelayTimeToResult -= DeltaTime;
        // End:0x6E
        if(DelayTimeToResult <= 0.0000000)
        {
            ProcessSuccessLevel();
            bHasProcessedSuccess = true;
        }
    }
    //return;    
}

function GetCoreScreenLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL H[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private name BoneName;
    local /*0x97E50000-0x00000000*/ private @NULL TargetPoint, TargetScreenPoint, ScreenLoc;

    BoneName = GetVulnerableCoreBone();
    TargetPoint = FollowerPawn.Mesh.GetBoneLocation(BoneName);
    TargetScreenPoint = H.Canvas.Project(TargetPoint);
    ScreenLoc.X = TargetScreenPoint.X;
    ScreenLoc.Y = TargetScreenPoint.Y;
    return ScreenLoc;
    //return ReturnValue;    
}

simulated function DrawHUD()
{
    local /*0x97E50000-0x00000000*/ private @NULL H[8388609];
    local /*0x97E50000-0x00000000*/ private float DeltaTime;
    local /*0x97E50000-0x00000000*/ private @NULL centerLoc;

    super(SPSpecialMove).DrawHUD(H);
    DeltaTime = MySPPawn.WorldInfo.DeltaSeconds;
    DelayStartDuration -= DeltaTime;
    // End:0x79
    if(DelayStartDuration > 0.0000000)
    {
        return;
    }
    centerLoc = GetCoreScreenLocation(H);
    DrawBullsEye(H, centerLoc);
    UpdateTargetCircle(H, centerLoc, DeltaTime);
    DrawTargetCircle(H, centerLoc);
    //return;    
}

function UpdateTargetCircle()
{
    local /*0x97E50000-0x00000000*/ private @NULL H[8388609], centerLoc;
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    // End:0x0F
    if(bHasPressedButton)
    {
        return;
    }
    InitialDelayTime -= DeltaTime;
    // End:0x38
    if(InitialDelayTime > 0.0000000)
    {
        return;
    }
    InitialDelayTime = 0.0000000;
    TargetCircleScale += (TargetCircleScaleRate * DeltaTime);
    // End:0xBB
    if((TargetCircleScaleRate < 0.0000000) && TargetCircleScale <= 0.0000000)
    {
        TargetCircleScale = 0.0000000;
        NumAttemptsLeft--;
        TargetCircleScaleRate *= -1.0000000;        
    }
    else
    {
        // End:0x115
        if((TargetCircleScaleRate > 0.0000000) && TargetCircleScale >= TargetCircleMaxScale)
        {
            TargetCircleScale = TargetCircleMaxScale;
            NumAttemptsLeft--;
            TargetCircleScaleRate *= -1.0000000;
        }
    }
    // End:0x12F
    if(NumAttemptsLeft <= 0)
    {
        FinishGrabGraceful(false);
    }
    //return;    
}

final function DrawBoxWithLineWidth()
{
    local /*0x97E50000-0x00000000*/ private @NULL H[8388609];
    local /*0x97E50000-0x00000000*/ private float Width[8388609], Height;
    local /*0x97E50000-0x00000000*/ private int LineWidth[9437185], X, Y;

    2
    X = int(H.Canvas.CurX);
    Y = int(H.Canvas.CurY);
    H.Canvas.SetPos(float(X), float(Y));
    H.Canvas.DrawRect(float(LineWidth), Height);
    H.Canvas.SetPos((float(X) + Width) - float(LineWidth), float(Y));
    H.Canvas.DrawRect(float(LineWidth), Height);
    H.Canvas.SetPos(float(X + LineWidth), float(Y));
    H.Canvas.DrawRect(Width - float(2 * LineWidth), float(LineWidth));
    H.Canvas.SetPos(float(X + LineWidth), (float(Y) + Height) - float(LineWidth));
    H.Canvas.DrawRect(Width - float(2 * LineWidth), float(LineWidth));
    H.Canvas.SetPos(float(X), float(Y));
    //return;    
}

function DrawBullsEye()
{
    local /*0x97E50000-0x00000000*/ private @NULL H[8388609], centerLoc;
    local /*0x97E50000-0x00000000*/ private float LineWidth, BoxWidth, InnerAlpha, PerfectAlpha, OuterAlpha, DefaultAlpha;

    DefaultAlpha = 100.0000000;
    InnerAlpha = DefaultAlpha;
    PerfectAlpha = DefaultAlpha;
    OuterAlpha = DefaultAlpha;
    // End:0x10A
    if(bHasPressedButton)
    {
        switch(SuccessLevel)
        {
            // End:0x9D
            case 2:
                PerfectAlpha = 255.0000000;
                InnerAlpha = 0.0000000;
                OuterAlpha = 0.0000000;
                // End:0x10A
                break;
            // End:0xD2
            case 1:
                InnerAlpha = 255.0000000;
                PerfectAlpha = 0.0000000;
                OuterAlpha = 0.0000000;
                // End:0x10A
                break;
            // End:0x107
            case 3:
                OuterAlpha = 255.0000000;
                PerfectAlpha = 0.0000000;
                InnerAlpha = 0.0000000;
                // End:0x10A
                break;
            // End:0xFFFF
            default:
                break;
        }
    }
    else
    {
        H.Canvas.SetDrawColor(0, 255, 0, byte(InnerAlpha));
        BoxWidth = TargetCircleResultRanges[1] * float(BullsEyeBaseWidth);
        LineWidth = (0.5000000 * (TargetCircleResultRanges[1] - TargetCircleResultRanges[0])) * float(BullsEyeBaseWidth);
        H.Canvas.SetPos(centerLoc.X - (BoxWidth * 0.5000000), centerLoc.Y - (BoxWidth * 0.5000000));
        DrawBoxWithLineWidth(H, BoxWidth, BoxWidth, int(LineWidth));
        H.Canvas.SetDrawColor(0, 0, 255, byte(PerfectAlpha));
        BoxWidth = TargetCircleResultRanges[2] * float(BullsEyeBaseWidth);
        LineWidth = (0.5000000 * (TargetCircleResultRanges[2] - TargetCircleResultRanges[1])) * float(BullsEyeBaseWidth);
        H.Canvas.SetPos(centerLoc.X - (BoxWidth * 0.5000000), centerLoc.Y - (BoxWidth * 0.5000000));
        DrawBoxWithLineWidth(H, BoxWidth, BoxWidth, int(LineWidth));
        H.Canvas.SetDrawColor(0, 255, 0, byte(OuterAlpha));
        BoxWidth = TargetCircleResultRanges[3] * float(BullsEyeBaseWidth);
        LineWidth = (0.5000000 * (TargetCircleResultRanges[3] - TargetCircleResultRanges[2])) * float(BullsEyeBaseWidth);
        H.Canvas.SetPos(centerLoc.X - (BoxWidth * 0.5000000), centerLoc.Y - (BoxWidth * 0.5000000));
        DrawBoxWithLineWidth(H, BoxWidth, BoxWidth, int(LineWidth));
        //return;        
    }
}

function DrawTargetCircle()
{
    local /*0x97E50000-0x00000000*/ private @NULL H[8388609], centerLoc;
    local /*0x97E50000-0x00000000*/ private float LineWidth, BoxWidth, Alpha;

    // End:0x0F
    if(bHasPressedButton)
    {
        return;
    }
    Alpha = 255.0000000 - (InitialDelayTime / default.InitialDelayTime);
    H.Canvas.SetDrawColor(255, 0, 0, byte(Alpha));
    BoxWidth = TargetCircleScale * float(BullsEyeBaseWidth);
    LineWidth = 4.0000000;
    H.Canvas.SetPos(centerLoc.X - (BoxWidth * 0.5000000), centerLoc.Y - (BoxWidth * 0.5000000));
    DrawBoxWithLineWidth(H, BoxWidth, BoxWidth, int(LineWidth));
    //return;    
}

function ProcessSuccessLevel()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayed, bAllowZoneDamageMinigame;

    switch(SuccessLevel)
    {
        // End:0x74
        case 2:
            bAllowDrillDamage = true;
            bAllowZoneDamageMinigame = true;
            bPlayed = StartAnimationChoreography(MySPPawn, FollowerPawn, 12, false, DrillHitCB);
            // End:0x150
            break;
        // End:0x79
        case 1:
        // End:0xCE
        case 3:
            bAllowDrillDamage = true;
            bPlayed = StartAnimationChoreography(MySPPawn, FollowerPawn, 11, false, DrillGlanceCB);
            // End:0x150
            break;
        // End:0xD3
        case 0:
        // End:0xD8
        case 4:
        // End:0xFFFF
        default:
            bAllowDrillDamage = false;
            bPlayed = StartAnimationChoreography(MySPPawn, FollowerPawn, 10, false, DrillMissCB, FollowerSMInstance.EndAnimationFinished);
            // End:0x150
            break;
            break;
    }
    // End:0x1A8
    if(bPlayed)
    {
        bDrillInUse = true;
        LPVSPlayerPawn(MySPPawn).StartRightArmPartAction(0, 2, true,,,, false, bAllowZoneDamageMinigame);
    }
    //return;    
}

function GetSuccessLevel()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x5E [Loop If]
    if(I < TargetCircleResultRanges.Length)
    {
        // End:0x50
        if(TargetCircleScale < TargetCircleResultRanges[I])
        {
            return byte(I);
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    return 4;
    //return ReturnValue;    
}

function DrillHitCB()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    bHasPressedButton = false;
    ProcessSMMessage(Class'LPSMMTypes'.default.SMM_VSRightArmPartEnd, self, 0);
    FinishGrabGraceful(false);
    //return;    
}

function DrillGlanceCB()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    bHasPressedButton = false;
    ProcessSMMessage(Class'LPSMMTypes'.default.SMM_VSRightArmPartEnd, self, 0);
    FinishGrabGraceful(false);
    //return;    
}

function DrillMissCB()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    bHasPressedButton = false;
    ProcessSMMessage(Class'LPSMMTypes'.default.SMM_VSRightArmPartEnd, self, 0);
    MySPPawn.EndCurrentSpecialMove(self);
    //return;    
}

defaultproperties
{
    StrongGrabCircleSpeed=5.0000000
    WeakGrabCircleSpeed=7.5000000
    NumAttemptsLeft=3
    TargetCircleMaxScale=5.0000000
    TargetCircleResultRanges=/* Array type was not detected. */
    DelayTimeToResult=0.5000000
    InitialDelayTime=0.7500000
    BullsEyeBaseWidth=150
    bDrawHydraulicBar=true
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldCIRCLEIN.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultGrabCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldCIRCLEIN.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    GrabCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPSM_ForkArmGrab_HoldCIRCLEIN.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    GrabTransitionInParam=GrabCamTransitionInParamObj
    bAllowDrillUse=false
    AnimationTemplateNodeNames=/* Array type was not detected. */
}