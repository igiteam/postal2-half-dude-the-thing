class LPGFxUIElementReticle_VS extends LPGFxUIElementReticle
    config(UI);

enum VSReticleStates
{
    VSReticleState_Normal,          // 0
    VSReticleState_Grab,            // 1
    VSReticleState_Drill,           // 2
    VSReticleState_Winch,           // 3
    VSReticleState_Taser,           // 4
    VSReticleState_Weld,            // 5
    VSReticleState_Invisible,       // 6
    VSReticleState_MAX              // 7
};

struct native AimedInteractionPointInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Point;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL WorldPos;

    structdefaultproperties
    {
        Point=none
        WorldPos=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL VSReticleMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL VSReticleFiligreeMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL VSReticleMidgroundMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL VSReticleForegroundMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TWinchProjectile;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float WinchDistanceUpdateFrame;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFadedOut;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTest3DEffect[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTutorialText_RightTrigger_IsOn[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTutorialText_RightBumper_IsOn[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTutorialText_LeftTrigger_IsOn[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTutorialText_LeftBumper_IsOn[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRadarIsShowingEnemies;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHasInteractionPoint;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShouldBeVisible;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPrevShouldBeVisible;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxDeltaRot[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MidgroundRadius[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ForegroundRadius[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ReticleTimeoutTime[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string VSWinchTutorialString;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string VSLeftArmTutorialString;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string VSShieldBlockTutorialString;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string VSRightArmTutorialString;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string WeldString;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string CurrentReticleType;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte ExternalState;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte InternalState;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte ReticleState;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array AimedInteractionPoints;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeoutTime;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609], DI, AimSizeMC;

    super.Init(MP);
    ReticleRoot = "_root.stagePanel.panel_VSreticle";
    // End:0x143
    if(MoviePlayer != none)
    {
        VSReticleMC = MoviePlayer.GetVariableObject(ReticleRoot $ ".VSreticle");
        // End:0x143
        if(VSReticleMC != none)
        {
            AimSizeMC = VSReticleMC.GetObject("arcElement");
            AimHalfWidth = AimSizeMC.GetFloat("_width") / float(2);
            AimHalfHeight = AimSizeMC.GetFloat("_height") / float(2);
        }
    }
    // End:0x444
    if(bTest3DEffect)
    {
        VSReticleFiligreeMC = MoviePlayer.GetVariableObject(ReticleRoot $ ".VSreticle.VSreticleFilligree");
        // End:0x245
        if(VSReticleFiligreeMC != none)
        {
            DI = VSReticleFiligreeMC.GetDisplayInfo();
            DI.Visible = true;
            DI.Alpha = 100.0000000;
            VSReticleFiligreeMC.SetDisplayInfo(DI);
        }
        VSReticleMidgroundMC = MoviePlayer.GetVariableObject(ReticleRoot $ ".VSreticle.VSreticleFilligree.midGround");
        // End:0x344
        if(VSReticleMidgroundMC != none)
        {
            DI = VSReticleMidgroundMC.GetDisplayInfo();
            DI.Visible = true;
            DI.Alpha = 100.0000000;
            VSReticleMidgroundMC.SetDisplayInfo(DI);
        }
        VSReticleForegroundMC = MoviePlayer.GetVariableObject(ReticleRoot $ ".VSreticle.VSreticleFilligree.foreGround");
        // End:0x444
        if(VSReticleForegroundMC != none)
        {
            DI = VSReticleForegroundMC.GetDisplayInfo();
            DI.Visible = true;
            DI.Alpha = 100.0000000;
            VSReticleForegroundMC.SetDisplayInfo(DI);
        }
    }
    SetVSReticle("grab");
    bFadedOut = false;
    bShouldBeVisible = false;
    bPrevShouldBeVisible = false;
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, ViewLocation, ViewRotation;
    local /*0x97E50000-0x00000000*/ private bool bShouldBeActive;
    local /*0x97E50000-0x00000000*/ private int CurrentWinchDistance;
    local /*0x97E50000-0x00000000*/ private float Pitch;
    local /*0x97E50000-0x00000000*/ private byte DesiredState;
    local /*0x97E50000-0x00000000*/ private bool bShowTheReticle, bShouldBeInvisible;
    local /*0x97E50000-0x00000000*/ private @NULL VSP, VSIP;

    bShouldBeActive = super.Update(DeltaTime);
    // End:0x507
    if(bShouldBeActive)
    {
        LPPC = GetLPPC();
        // End:0x7F
        if(LPPC != none)
        {
            VSP = LPVSPlayerPawn(LPPC.Pawn);
        }
        // End:0xA5
        if(bShouldBeActive && bTest3DEffect)
        {
            Update3DPos();
        }
        // End:0x171
        if((CurrentReticleType == "weld") && LPPC != none)
        {
            LPPC.GetPlayerViewPoint(ViewLocation, ViewRotation);
            Pitch = (0.0000959 * 57.2957800) * float(ViewRotation.Pitch);
            // End:0x15C
            if(Pitch < float(0))
            {
                Pitch = 360.0000000 + Pitch;
            }
            SetVSWelderFilligreePitch(int(Pitch));
        }
        // End:0x280
        if(TWinchProjectile != none)
        {
            WinchDistanceUpdateFrame += DeltaTime;
            // End:0x280
            if((WinchDistanceUpdateFrame > 0.1000000) && VSP != none)
            {
                CurrentWinchDistance = int((VSP.GetWinchRange() - VSize(VSP.GetWinchPos() - TWinchProjectile.Location)) * 0.1000000);
                // End:0x247
                if(CurrentWinchDistance < 0)
                {
                    CurrentWinchDistance = 0;
                }
                SetWinchDistance(float(CurrentWinchDistance));
                SetEjectedWinchRopeLength(float(CurrentWinchDistance));
                WinchDistanceUpdateFrame = 0.0000000;
            }
        }
        UpdateAimedInteractionPoints();
        bHasInteractionPoint = false;
        // End:0x30D
        if(VSP != none)
        {
            VSIP = VSP.GetVSInteractionPoint();
            // End:0x30D
            if((VSIP != none) && VSIP.bEnabled)
            {
                bHasInteractionPoint = true;
            }
        }
        bRadarIsShowingEnemies = false;
        // End:0x368
        if(LPPC != none)
        {
            bRadarIsShowingEnemies = LPPC.myLPHUD.IsRadarShowingEnemies(true);
        }
        // End:0x396
        if((bHasInteractionPoint == false) && bRadarIsShowingEnemies == false)
        {
            bShouldBeInvisible = true;
        }
        // End:0x3C5
        if(bShouldBeInvisible && int(InternalState) == int(0))
        {
            SetInternalState(6);
        }
        DesiredState = GetDesiredReticleState();
        // End:0x408
        if(int(DesiredState) != int(ReticleState))
        {
            SetReticleState(DesiredState);
        }
        bShowTheReticle = int(ReticleState) != int(6);
        // End:0x440
        if(bShowTheReticle)
        {
            bShouldBeVisible = true;            
        }
        else
        {
            // End:0x473
            if(bShouldBeVisible && TimeoutTime <= float(0))
            {
                TimeoutTime = ReticleTimeoutTime;
            }
        }
        // End:0x4C4
        if(TimeoutTime > float(0))
        {
            TimeoutTime -= DeltaTime;
            // End:0x4C4
            if(TimeoutTime <= float(0))
            {
                TimeoutTime = 0.0000000;
                bShouldBeVisible = false;
            }
        }
        // End:0x507
        if(bShouldBeVisible != bPrevShouldBeVisible)
        {
            Show(bShouldBeVisible);
            bPrevShouldBeVisible = bShouldBeVisible;
        }
    }
    ResetAimedInteractionPoints();
    return bShouldBeActive;
    //return ReturnValue;    
}

function Update3DPos()
{
    local /*0x97E50000-0x00000000*/ private @NULL P, CameraRot, CameraLoc, DeltaRot;
    local /*0x97E50000-0x00000000*/ private int deltaThreshold;
    local /*0x97E50000-0x00000000*/ private @NULL V;

    // End:0x11
    if(!bTest3DEffect)
    {
        return;
    }
    P = LPVSPlayerPawn(GetLPPC().Pawn);
    // End:0x534
    if(P != none)
    {
        GetLPPC().GetPlayerViewPoint(CameraLoc, CameraRot);
        DeltaRot.Yaw = CameraRot.Yaw - P.Rotation.Yaw;
        DeltaRot.Pitch = CameraRot.Pitch - P.PitchControl.PitchSkelController.BoneRotation.Pitch;
        DeltaRot.Yaw = int(FClamp(float(DeltaRot.Yaw), -MaxDeltaRot, MaxDeltaRot));
        DeltaRot.Pitch = int(FClamp(float(DeltaRot.Pitch), -MaxDeltaRot, MaxDeltaRot));
        deltaThreshold = 10;
        // End:0x2AC
        if((DeltaRot.Yaw > -deltaThreshold) && DeltaRot.Yaw < deltaThreshold)
        {
            DeltaRot.Yaw = 0;
        }
        // End:0x322
        if((DeltaRot.Pitch > -deltaThreshold) && DeltaRot.Pitch < deltaThreshold)
        {
            DeltaRot.Pitch = 0;
        }
        V.X = MidgroundRadius;
        V.Y = 0.0000000;
        V.Z = 0.0000000;
        V = V >> DeltaRot;
        VSReticleMidgroundMC.SetFloat("_x", -V.Y);
        VSReticleMidgroundMC.SetFloat("_y", V.Z);
        V.X = ForegroundRadius;
        V.Y = 0.0000000;
        V.Z = 0.0000000;
        V = V >> DeltaRot;
        VSReticleForegroundMC.SetFloat("_x", -V.Y);
        VSReticleForegroundMC.SetFloat("_y", V.Z);
    }
    //return;    
}

// Export ULPGFxUIElementReticle_VS::execSetPosition(FFrame&, void* const)
native function SetPosition()
{
    local /*0x97E50000-0x00000000*/ private float PosX[8388609], PosY;


}

event SetActive()
{
    local /*0x97E50000-0x00000000*/ private bool bSet[8388609], bImmediate;

    // End:0x20
    if(bSet == false)
    {
        bShouldBeVisible = false;        
    }
    else
    {
        bShouldBeVisible = bPrevShouldBeVisible;
    }
    super(SPGFxUIElement).SetActive(bSet, bImmediate);
    //return;    
}

protected function Show()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609], bImmediate;
    local /*0x97E50000-0x00000000*/ private @NULL DI;

    // End:0x12
    if(VSReticleMC == none)
    {
        return;
    }
    bShow = bShouldBeVisible;
    // End:0xEF
    if(bShow)
    {
        DI = VSReticleMC.GetDisplayInfo();
        DI.Visible = bShow;
        VSReticleMC.SetDisplayInfo(DI);
        InitGrabState();
        // End:0xEC
        if(!bImmediate || bFadedOut)
        {
            ShowVSReticle(true);
            bFadedOut = false;
        }        
    }
    else
    {
        // End:0x178
        if(bImmediate)
        {
            DI = VSReticleMC.GetDisplayInfo();
            DI.Visible = bShow;
            VSReticleMC.SetDisplayInfo(DI);            
        }
        else
        {
            ShowVSReticle(false);
            bFadedOut = true;
        }
    }
    //return;    
}

function ShowVSReticle()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    // End:0x3D
    if(MoviePlayer != none)
    {
        MoviePlayer.ActionScriptVoid("ShowVSReticle");
    }
    //return;    
}

function SetVSReticle()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReticleName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInternalSetting[9437185];
    local /*0x97E50000-0x00000000*/ private byte NewState;

    false
    switch(ReticleName)
    {
        // End:0x31
        case "drill":
            NewState = 2;
            // End:0x64
            break;
        // End:0x49
        case "weld":
            NewState = 5;
            // End:0x64
            break;
        // End:0x52
        case "grab":
        // End:0xFFFF
        default:
            NewState = 0;
            // End:0x64
            break;
            break;
    }
    ((bInternalSetting) ? SetInternalState(NewState) : SetExternalState(NewState));
    //return;    
}

function ASSetVSReticle()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReticleName[8388609];

    CurrentReticleType = ReticleName;
    // End:0x7A
    if(MoviePlayer != none)
    {
        MoviePlayer.ActionScriptVoid("setVSReticleType");
        // End:0x7A
        if(ReticleName == "weld")
        {
            SetWeldText(WeldString);
        }
    }
    //return;    
}

function InitGrabState()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, LPVSPlayer;
    local /*0x97E50000-0x00000000*/ private bool bFoundGrabbedPawn;

    // End:0xDC
    if(MoviePlayer != none)
    {
        LPPC = GetLPPC();
        // End:0xDC
        if(LPPC.Pawn != none)
        {
            LPVSPlayer = LPVSPlayerPawn(LPPC.Pawn);
            // End:0xC2
            if(LPVSPlayer != none)
            {
                // End:0xC2
                if(LPVSPlayer.GrabbedPawn != none)
                {
                    SetVSReticleGrabState(true);
                    bFoundGrabbedPawn = true;
                }
            }
            // End:0xDC
            if(!bFoundGrabbedPawn)
            {
                SetVSReticleGrabState(false);
            }
        }
    }
    //return;    
}

function ShowVSGrabIndicator()
{
    local /*0x97E50000-0x00000000*/ private bool bOn[8388609];

    // End:0x43
    if(MoviePlayer != none)
    {
        MoviePlayer.ActionScriptVoid("showVSGrabIndicator");
    }
    //return;    
}

function SetVSGrabIndicator()
{
    local /*0x97E50000-0x00000000*/ private float InValue[8388609];

    // End:0x42
    if(MoviePlayer != none)
    {
        MoviePlayer.ActionScriptVoid("SetVSGrabIndicator");
    }
    //return;    
}

function PlayVSGrabSuccess()
{
    MoviePlayer.ActionScriptVoid("playVSGrabSuccess");
    //return;    
}

function VSGrabSuccessComplete()
{
    //return;    
}

function SetVSReticleGrabState()
{
    local /*0x97E50000-0x00000000*/ private bool bOn[8388609];

    // End:0x39
    if(MoviePlayer != none)
    {
        MoviePlayer.ActionScriptVoid("setVSGrab");
    }
    //return;    
}

function SetVSReticleQuickGrab()
{
    // End:0x49
    if(MoviePlayer != none)
    {
        SetVSReticleGrabState(true);
        MoviePlayer.ActionScriptVoid("setVSQuickGrab");
    }
    //return;    
}

function SetVSReticleDrillSpeed()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string NewSpeed[8388609];

    // End:0x3F
    if(MoviePlayer != none)
    {
        MoviePlayer.ActionScriptVoid("setVSDrillSpeed");
    }
    //return;    
}

function ShowVSShockMeter()
{
    local /*0x97E50000-0x00000000*/ private bool bShowIt[8388609], bInternalSetting;
    local /*0x97E50000-0x00000000*/ private byte NewState;

    false
    NewState = ((bShowIt) ? 4 : 0);
    ((bInternalSetting) ? SetInternalState(NewState) : SetExternalState(NewState));
    // End:0x7A
    if(!bInternalSetting)
    {
        ASShowVSShockMeter(bShowIt);
    }
    //return;    
}

function ASShowVSShockMeter()
{
    local /*0x97E50000-0x00000000*/ private bool bShowIt[8388609];

    MoviePlayer.ActionScriptVoid("bShowVSShockMeter");
    //return;    
}

function SetVSShockMeterLevel()
{
    local /*0x97E50000-0x00000000*/ private float val[8388609];

    MoviePlayer.ActionScriptVoid("setVSShockMeter");
    //return;    
}

function SetVSShockHelp()
{
    local /*0x97E50000-0x00000000*/ private bool bShockHelp[8388609];

    // End:0x1C
    if(bShockHelp)
    {
        SetVSShockMeterLevel(0.0000000);
    }
    //return;    
}

function SetVSShockActive()
{
    local /*0x97E50000-0x00000000*/ private bool bShockActive[8388609];

    MoviePlayer.ActionScriptVoid("bShockerIsActive");
    //return;    
}

function SetVSShockCharging()
{
    local /*0x97E50000-0x00000000*/ private bool bShockCharging[8388609];

    MoviePlayer.ActionScriptVoid("bShockerIsCharging");
    //return;    
}

function ShowWeldCompletionMeter()
{
    local /*0x97E50000-0x00000000*/ private bool bShowIt[8388609];

    MoviePlayer.ActionScriptVoid("bShowWeldCompletionMeter");
    //return;    
}

function SetWeldText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    MoviePlayer.ActionScriptVoid("setWeldText");
    //return;    
}

function SetWeldProgress()
{
    local /*0x97E50000-0x00000000*/ private float val[8388609];

    MoviePlayer.ActionScriptVoid("setWeldProgress");
    //return;    
}

function SetVSWelderFilligreePitch()
{
    local /*0x97E50000-0x00000000*/ private int newpitch[8388609];

    MoviePlayer.ActionScriptVoid("setVSWelderFilligreePitch");
    //return;    
}

function SetVSReticleWelderState()
{
    local /*0x97E50000-0x00000000*/ private bool WeldingOn[8388609];

    // End:0x53
    if(MoviePlayer != none)
    {
        MoviePlayer.ActionScriptVoid("setVSWelder");
        // End:0x53
        if(WeldingOn)
        {
            SetVSWelderFilligreePitch(0);
        }
    }
    //return;    
}

function SetWinchMechanicalError()
{
    local /*0x97E50000-0x00000000*/ private bool bShowIt[8388609];

    MoviePlayer.ActionScriptVoid("setWinchMechanicalError");
    //return;    
}

function SetEjectedWinchRopeLength()
{
    local /*0x97E50000-0x00000000*/ private float NewLength[8388609];

    // End:0x49
    if(MoviePlayer != none)
    {
        MoviePlayer.ActionScriptVoid("setWinchEjectedRopeLength");
    }
    //return;    
}

function SetWinchDistance()
{
    local /*0x97E50000-0x00000000*/ private float newdist[8388609];

    // End:0x40
    if(MoviePlayer != none)
    {
        MoviePlayer.ActionScriptVoid("setWinchDistance");
    }
    //return;    
}

function SetMaxWinchDistance()
{
    local /*0x97E50000-0x00000000*/ private float newdist[8388609];

    // End:0x43
    if(MoviePlayer != none)
    {
        MoviePlayer.ActionScriptVoid("setMaxWinchDistance");
    }
    //return;    
}

function NotifyWinchProjectileRetracting()
{
    SetWinchGearDirection("incoming");
    //return;    
}

function NotifyWinchProjectileRetracted()
{
    SetWinchDistance(0.0000000);
    ShowWinchGear(false);
    //return;    
}

function ShowWinchGear()
{
    local /*0x97E50000-0x00000000*/ private bool bOn[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL WinchProjectile[9437185];
    local /*0x97E50000-0x00000000*/ private bool bInternalSetting[9437185];
    local /*0x97E50000-0x00000000*/ private byte NewState;

    false
    NewState = ((bOn) ? 3 : 0);
    ((bInternalSetting) ? SetInternalState(NewState) : SetExternalState(NewState));
    // End:0x78
    if(bOn)
    {
        TWinchProjectile = WinchProjectile;
    }
    //return;    
}

function ASShowWinchGear()
{
    local /*0x97E50000-0x00000000*/ private bool bOn[8388609];

    MoviePlayer.ActionScriptVoid("showWinchGear");
    // End:0x52
    if(bOn)
    {
        SetWinchGearDirection("outgoing");        
    }
    else
    {
        SetWinchGearDirection("incoming");
    }
    //return;    
}

function SetWinchGearDirection()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Dir[8388609];

    MoviePlayer.ActionScriptVoid("setWinchGearDirection");
    //return;    
}

function ShowVSReticle_Winch_Tutorial()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    // End:0x6A
    if(bTutorialText_LeftBumper_IsOn != bShow)
    {
        bTutorialText_LeftBumper_IsOn = bShow;
        ShowVSReticle_LeftBumper_TutorialText(bShow, MoviePlayer.GetLocalizedString(VSWinchTutorialString));
    }
    //return;    
}

function ShowVSReticle_LeftBumper_TutorialText()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    ShowVSReticle_TutorialText("left_BumperPrompt", bShow, Text);
    //return;    
}

function ShowVSReticle_LeftArm_Tutorial()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    // End:0x6A
    if(bTutorialText_LeftTrigger_IsOn != bShow)
    {
        bTutorialText_LeftTrigger_IsOn = bShow;
        ShowVSReticle_LeftTrigger_TutorialText(bShow, MoviePlayer.GetLocalizedString(VSLeftArmTutorialString));
    }
    //return;    
}

function ShowVSReticle_LeftTrigger_TutorialText()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    ShowVSReticle_TutorialText("left_TriggerPrompt", bShow, Text);
    //return;    
}

function ShowVSReticle_ShieldBlock_Tutorial()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    // End:0x6A
    if(bTutorialText_RightBumper_IsOn != bShow)
    {
        bTutorialText_RightBumper_IsOn = bShow;
        ShowVSReticle_RightBumper_TutorialText(bShow, MoviePlayer.GetLocalizedString(VSShieldBlockTutorialString));
    }
    //return;    
}

function ShowVSReticle_RightBumper_TutorialText()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    ShowVSReticle_TutorialText("right_BumperPrompt", bShow, Text);
    //return;    
}

function ShowVSReticle_RightArm_Tutorial()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    // End:0x6A
    if(bTutorialText_RightTrigger_IsOn != bShow)
    {
        bTutorialText_RightTrigger_IsOn = bShow;
        ShowVSReticle_RightTrigger_TutorialText(bShow, MoviePlayer.GetLocalizedString(VSRightArmTutorialString));
    }
    //return;    
}

function ShowVSReticle_RightTrigger_TutorialText()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    ShowVSReticle_TutorialText("right_TriggerPrompt", bShow, Text);
    //return;    
}

function ShowVSReticle_TutorialText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string textFieldName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];

    // End:0x4A
    if(MoviePlayer != none)
    {
        MoviePlayer.ActionScriptVoid("ShowVSReticle_TutorialText");
    }
    //return;    
}

function SetAimedInteractionPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL Point[8388609], WorldPos, pointInfo;

    pointInfo.Point = Point;
    pointInfo.WorldPos = WorldPos;
    AimedInteractionPoints.AddItem(pointInfo);    
    //return;    
}

function UpdateAimedInteractionPoints()
{
    local /*0x97E50000-0x00000000*/ private @NULL ClosestPoint;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;
    local /*0x97E50000-0x00000000*/ private float ClosestDistSq, DistSq;
    local /*0x97E50000-0x00000000*/ private @NULL MyLocation;
    local /*0x97E50000-0x00000000*/ private byte NewState;

    ClosestPoint = none;
    // End:0x46
    if(AimedInteractionPoints.Length == 1)
    {
        ClosestPoint = AimedInteractionPoints[0].Point;        
    }
    else
    {
        // End:0x1A0
        if(AimedInteractionPoints.Length > 1)
        {
            LPPC = GetLPPC();
            MyLocation = LPPC.Pawn.Location;
            ClosestDistSq = -1.0000000;
            ClosestPoint = none;
            I = 0;
            J0xCC:

            // End:0x1A0 [Loop If]
            if(I < AimedInteractionPoints.Length)
            {
                DistSq = VSizeSq(AimedInteractionPoints[I].WorldPos - MyLocation);
                // End:0x192
                if((ClosestDistSq == float(-1)) || DistSq < ClosestDistSq)
                {
                    ClosestDistSq = DistSq;
                    ClosestPoint = AimedInteractionPoints[I].Point;
                }
                I++;
                // [Loop Continue]
                goto J0xCC;
            }
        }
    }
    NewState = 0;
    // End:0x28A
    if(ClosestPoint != none)
    {
        // End:0x1E2
        if(LPGFxUIElementVSDrillPoint(ClosestPoint) != none)
        {
            NewState = 2;            
        }
        else
        {
            // End:0x209
            if(LPGFxUIElementVSGrabPoint(ClosestPoint) != none)
            {
                NewState = 1;                
            }
            else
            {
                // End:0x230
                if(LPGFxUIElementVSTaserPoint(ClosestPoint) != none)
                {
                    NewState = 4;                    
                }
                else
                {
                    // End:0x257
                    if(LPGFxUIElementVSWeldPoint(ClosestPoint) != none)
                    {
                        NewState = 5;                        
                    }
                    else
                    {
                        // End:0x27E
                        if(LPGFxUIElementVSWinchPoint(ClosestPoint) != none)
                        {
                            NewState = 3;                            
                        }
                        else
                        {
                            NewState = 1;
                        }
                    }
                }
            }
        }
    }
    SetInternalState(NewState);
    //return;    
}

function ResetAimedInteractionPoints()
{
    AimedInteractionPoints.Length = 0;
    //return;    
}

function SetExternalState()
{
    local /*0x97E50000-0x00000000*/ private byte NewState[8388609];

    ExternalState = NewState;
    //return;    
}

function SetInternalState()
{
    local /*0x97E50000-0x00000000*/ private byte NewState[8388609];

    InternalState = NewState;
    //return;    
}

function GetDesiredReticleState()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    // End:0x1E
    if(int(ExternalState) != int(0))
    {
        return ExternalState;
    }
    return InternalState;
    //return ReturnValue;    
}

function SetReticleState()
{
    local /*0x97E50000-0x00000000*/ private byte NewState[8388609];
    local /*0x97E50000-0x00000000*/ private bool bForce[9437185];

    // End:0x2F
    if((int(ReticleState) == int(NewState)) && !bForce)
    {
        return;
    }
    switch(ReticleState)
    {
        // End:0x55
        case 3:
            ASShowWinchGear(false);
            // End:0x58
            break;
        // End:0xFFFF
        default:
            break;
    }
    switch(NewState)
    {
        // End:0x70
        case 0:
        // End:0x75
        case 1:
        // End:0x8D
        case 4:
            ASSetVSReticle("grab");
            // End:0xE4
            break;
        // End:0xA6
        case 2:
            ASSetVSReticle("drill");
            // End:0xE4
            break;
        // End:0xC9
        case 3:
            ASSetVSReticle("grab");
            ASShowWinchGear(true);
            // End:0xE4
            break;
        // End:0xE1
        case 5:
            ASSetVSReticle("weld");
            // End:0xE4
            break;
        // End:0xFFFF
        default:
            break;
    }
    ReticleState = NewState;
    //return;    
}

defaultproperties
{
    MaxDeltaRot=1000.0000000
    MidgroundRadius=600.0000000
    ForegroundRadius=1200.0000000
    ReticleTimeoutTime=3.0000000
    VSWinchTutorialString="<InputCallOuts:GBA_WinchArm>"
    VSLeftArmTutorialString="<InputCallOuts:GBA_LeftArmAction>"
    VSShieldBlockTutorialString="<InputCallOuts:GBA_VSShieldBlock>"
    VSRightArmTutorialString="<InputCallOuts:GBA_RightArmAction>"
    WeldString="WELD"
}