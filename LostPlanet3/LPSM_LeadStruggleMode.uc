class LPSM_LeadStruggleMode extends SPSM_LeaderPawnBase
    abstract
    config(Game);

enum EDodgeDir
{
    EDD_DodgeLeft,                  // 0
    EDD_DodgeRight,                 // 1
    EDD_MAX                         // 2
};

enum EPlayMode
{
    EPM_Choreography,               // 0
    EPM_FullBody,                   // 1
    EPM_Additive,                   // 2
    EPM_None,                       // 3
    EPM_MAX                         // 4
};

enum EPlayTarget
{
    EPT_Leader,                     // 0
    EPT_Follower,                   // 1
    EPT_MAX                         // 2
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PlayerPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLocalPlayer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFailed;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLeaderWonStruggleMode;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDamaged;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bStopOnBlendOutNotify;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSavedCanCrouch;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name PlayerCtrlStateName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL vsPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentPhaseIdx;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array StrugglePhases;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentWinPoints;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class TuneDataClass;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class ApplyDamageClass;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL SoundComponentLoop[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL StruggleCamParams[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StruggleTransitionInParam;

function GetAnimTemplateTreeForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], StruggleAnimTree;

    StruggleAnimTree = PlayerPawn.GetAnimTemplateTreeForStruggleMode();
    // End:0x42
    if(StruggleAnimTree != none)
    {
        return StruggleAnimTree;
    }
    return super(SPSpecialMove).GetAnimTemplateTreeForSpecialMove();
    //return ReturnValue;    
}

function IsLeaderPawnLocallyControlled()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2F
    if(PlayerPawn != none)
    {
        return PlayerPawn.IsLocallyControlled();
    }
    return false;
    //return ReturnValue;    
}

function InitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name InHandle[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL strugglePhase;
    local /*0x97E50000-0x00000000*/ private int I;

    PlayerPawn = LPBasePlayerPawn(inPawn);
    bLocalPlayer = IsLeaderPawnLocallyControlled();
    // End:0x71
    if((TuneData == none) && TuneDataClass != Class'LPTuneDataStruggle')
    {
        TuneData = new TuneDataClass;
    }
    // End:0x22B
    if(TuneData != none)
    {
        StrugglePhases.Length = 0;
        I = 0;
        J0x97:

        // End:0x17B [Loop If]
        if(I < TuneData.StrugglePhases.Length)
        {
            strugglePhase = new TuneData.StrugglePhases[I].GameClass;
            strugglePhase.TuneData = TuneData.StrugglePhases[I];
            StrugglePhases.AddItem(strugglePhase);            
            ++I;
            // [Loop Continue]
            goto J0x97;
        }
        // End:0x1EE
        if(ClassIsChildOf(StruggleTransitionInParam.Class, Class'SPCamera.SPCameraTransitionTimedParam'))
        {
            SPCameraTransitionTimedParam(StruggleTransitionInParam).Duration = TuneData.DurationCameraTransition;
        }
        StruggleCamParams.AnimatedFOV = TuneData.StruggleCameraFOV;
    }
    I = 0;
    J0x236:

    // End:0x286 [Loop If]
    if(I < StrugglePhases.Length)
    {
        StrugglePhases[I].InitObject(self);
        ++I;
        // [Loop Continue]
        goto J0x236;
    }
    super(SPSpecialMove).InitSpecialMove(inPawn, InHandle);
    //return;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];
    local /*0x97E50000-0x00000000*/ private int I;

    bLeaderWonStruggleMode = false;
    super.SpecialMoveStarted(bForced, PrevMove);
    bSavedCanCrouch = MySPPawn.bCanCrouch;
    MySPPawn.bCanCrouch = false;
    I = 0;
    J0x7F:

    // End:0xCF [Loop If]
    if(I < StrugglePhases.Length)
    {
        StrugglePhases[I].StartSm(self);
        ++I;
        // [Loop Continue]
        goto J0x7F;
    }
    // End:0x16B
    if((TuneData.DesiredSeparationFromVS > 0.0000000) || TuneData.PushAwayFromBlockingCamera)
    {
        // End:0x16A
        foreach PlayerPawn.WorldInfo.AllPawns(Class'LPVSPlayerPawn', vsPawn)
        {
            // End:0x16A
            break;            
        }        
    }
    // End:0x1D2
    if((vsPawn != none) && TuneData.PushAwayFromBlockingCamera)
    {
        vsPawn.CameraInteraction.bCameraIgnoreCylinder = false;
    }
    //return;    
}

function GetLeadersController()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x37
    if(PlayerPawn != none)
    {
        return LPPlayerController(PlayerPawn.Controller);
    }
    return none;
    //return ReturnValue;    
}

function GetDamagePawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return MySPPawn;
    //return ReturnValue;    
}

function SetPawnsInitalInteractionValues()
{
    // End:0x4F
    if(PlayerPawn != none)
    {
        PlayerPawn.ZeroMovementVariables();
        PlayerPawn.InStruggleMode = true;
    }
    //return;    
}

function IsLeaderPawnIncapacitated()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2F
    if(PlayerPawn != none)
    {
        return PlayerPawn.bIncapacitated;
    }
    return false;
    //return ReturnValue;    
}

function StartInteraction()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerCtrl;

    super(SPSM_LeaderFollowerBase).StartInteraction();
    PlayerCtrl = GetLeadersController();
    // End:0x92
    if(((PlayerCtrl != none) && PlayerCtrlStateName != 'None') && !PlayerCtrl.IsInState(PlayerCtrlStateName))
    {
        PlayerCtrl.GotoState(PlayerCtrlStateName);
    }
    SetPawnsInitalInteractionValues();
    // End:0x132
    if((TuneData.bShowKnife && !TuneData.bShowKnifeOnAnimNotify) && PlayerPawn != none)
    {
        PlayerPawn.ShowKnife(TuneData.KnifeSocket);
    }
    // End:0x15E
    if(TuneData.bUseStruggleCamera)
    {
        UseStruggleCamera();
    }
    // End:0x1E5
    if(TuneData.SoundModeName != 'None')
    {
        PlayerCtrl.ActivateSoundMode(TuneData.SoundModeName, Class'LPSoundModeManager'.default.PRI_StruggleMode);
    }
    CurrentWinPoints = 0;
    bFailed = false;
    bDamaged = false;
    CurrentPhaseIdx = 0;
    // End:0x271
    if(TuneData.StartPhaseName != 'None')
    {
        CurrentPhaseIdx = GetPhaseIndex(TuneData.StartPhaseName);
    }
    StrugglePhases[CurrentPhaseIdx].Start('None');
    PlayerPawn.TriggerEventClass(Class'LPSeqEvent_StruggleMode', FollowerPawn, 0);
    //return;    
}

function SetPawnsFinalInteractionValues()
{
    // End:0x78
    if(PlayerPawn != none)
    {
        // End:0x57
        if(PlayerPawn.Health > 0)
        {
            PlayerPawn.StopFullBodyAnim(0.5000000);
        }
        PlayerPawn.InStruggleMode = false;
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, PlayerCtrl;
    local /*0x97E50000-0x00000000*/ private float MinHealthAfterStruggle;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private editfixedsize array ActivateIndices;

    MySPPawn.bCanCrouch = bSavedCanCrouch;
    // End:0x6F
    if(CurrentPhaseIdx != -1)
    {
        StrugglePhases[CurrentPhaseIdx].Stop('None');
    }
    Class'SPEngine.SPUtil'.static.SetIntegrateButtonSubSamples(true);
    // End:0x105
    if((TuneData.bShowKnife || TuneData.bShowKnifeOnAnimNotify) && PlayerPawn != none)
    {
        PlayerPawn.HideKnife();
    }
    // End:0x131
    if(TuneData.bUseStruggleCamera)
    {
        UseDefaultCamera();
    }
    PlayerCtrl = GetLeadersController();
    // End:0x1A1
    if(((PlayerCtrl != none) && !IsLeaderPawnIncapacitated()) && PlayerCtrlStateName != 'None')
    {
        PlayerCtrl.GotoState('PlayerWalking');
    }
    // End:0x21B
    if((PlayerCtrl != none) && TuneData.SoundModeName != 'None')
    {
        PlayerCtrl.DeactivateSoundModeByName(TuneData.SoundModeName);
    }
    SetPawnsFinalInteractionValues();
    I = 0;
    J0x230:

    // End:0x27F [Loop If]
    if(I < StrugglePhases.Length)
    {
        StrugglePhases[I].StopSM();
        ++I;
        // [Loop Continue]
        goto J0x230;
    }
    ActivateIndices[0] = 7;
    // End:0x330
    if(bLeaderWonStruggleMode)
    {
        ActivateIndices[1] = 8;
        LPPawn(MySPPawn).NotifyWonStruggleMode(LPPawn(FollowerPawn), self);
        // End:0x32D
        if(FollowerPawn != none)
        {
            LPPawn(FollowerPawn).NotifyLostStruggleMode(LPPawn(MySPPawn), self);
        }        
    }
    else
    {
        ActivateIndices[1] = 9;
        LPPawn(MySPPawn).NotifyLostStruggleMode(LPPawn(FollowerPawn), self);
        // End:0x3C3
        if(FollowerPawn != none)
        {
            LPPawn(FollowerPawn).NotifyWonStruggleMode(LPPawn(MySPPawn), self);
        }
    }
    // End:0x609
    if(FollowerPawn != none)
    {
        // End:0x4DB
        if(TuneData.bWaitForFollowerToFinish && FollowerPawn.PawnChoreographyParams.OtherTargetSequence.GetTimeLeft() > 0.1000000)
        {
            StopAnimationChoreography(MySPPawn);
            FollowerPawn.LockMeshTranslationZ(FollowerPawn.LockedMeshTranslationZ);
            FollowerPawn.SetDesiredRotation(FollowerPawn.Rotation, true, false);            
        }
        else
        {
            // End:0x5E1
            if(((MySPPawn.Health > 0) && FollowerPawn.Health > 0) && TuneData.bKillFollowerOnWin)
            {
                FollowerPawn.TakeDamage(FollowerPawn.Health + 100000, MySPPawn.Controller, FollowerPawn.Location, vect(0.0000000, 0.0000000, 0.0000000), Class'LPDamageTypePlayerStruggle');
            }
            FollowerPawn.EndCurrentSpecialMove(FollowerSMInstance);
        }
    }
    // End:0x6F7
    if((MySPPawn.Health > 0) && TuneData.MinPercentageHealthAfterStruggle > float(0))
    {
        MinHealthAfterStruggle = float(MySPPawn.HealthMax) * TuneData.MinPercentageHealthAfterStruggle;
        // End:0x6F7
        if(float(MySPPawn.Health) < MinHealthAfterStruggle)
        {
            MySPPawn.SetHealth(int(MinHealthAfterStruggle));
        }
    }
    // End:0x798
    if(MySPPawn.WorldInfo.Game.GameSpeed < 1.0000000)
    {
        MySPPawn.WorldInfo.Game.SetGameSpeed(1.0000000);
    }
    // End:0x7FF
    if((vsPawn != none) && TuneData.PushAwayFromBlockingCamera)
    {
        vsPawn.CameraInteraction.bCameraIgnoreCylinder = true;
    }
    PlayerPawn.ActivateEventClass(Class'LPSeqEvent_StruggleMode', FollowerPawn, PlayerPawn.GeneratedEvents, ActivateIndices);
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function EndFollowerSpecialMove()
{
    // End:0x75
    if(FollowerPawn != none)
    {
        FollowerPawn.EndCurrentSpecialMove();
        // End:0x75
        if(IsValidSMFinishedDelegate(SMFinishedDelegate))
        {
            OnSpecialMoveFinished(self, none);
            SMFinishedDelegate = None;
        }
    }
    //return;    
}

function OnAnimNotifyStartBlendOut()
{
    local /*0x97E50000-0x00000000*/ private @NULL Notify[8388609];
    local /*0x97E50000-0x00000000*/ private float Duration[8388609];

    // End:0x96
    if(bStopOnBlendOutNotify)
    {
        // End:0x6E
        if(Notify.bKeepMomentum)
        {
            MySPPawn.DesiredSpeed = VSize(MySPPawn.Velocity);
        }
        MySPPawn.EndSpecialMove(Class);
    }
    //return;    
}

event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool bPhaseFinished;

    super.Tick(DeltaTime);
    // End:0x11B
    if(bLocalPlayer || MySPPawn.bTearOff)
    {
        UpdateDesiredDistance();
        bPhaseFinished = StrugglePhases[CurrentPhaseIdx].Update(DeltaTime);
        // End:0xA2
        if(bPhaseFinished)
        {
            GotoNextPhase();
        }
        // End:0x11B
        if(((FollowerPawn != none) && FollowerPawn.Health <= 0) && MySPPawn.Health > 0)
        {
            GotoPhase(GetPhaseIndex(GetWinPhaseName()));
        }
    }
    //return;    
}

simulated function NotifyCameraColliding()
{
    local /*0x97E50000-0x00000000*/ private @NULL CameraForward[8388609];
    local /*0x97E50000-0x00000000*/ private float BlockedDistance[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CameraDesiredLoc[8388609];

    // End:0x10A
    if(TuneData.PushAwayFromBlockingCamera)
    {
        // End:0x97
        if(CameraDesiredLoc.Z < (MySPPawn.Location.Z - MySPPawn.GetCollisionHeight()))
        {
            return;
        }
        CameraForward.Z = 0.0000000;
        MySPPawn.PushPawn(CameraForward, BlockedDistance / TuneData.TimeAdjustToDesiredDistance);
    }
    //return;    
}

simulated function PushAwayFromVS()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private float DesiredDistance[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL DirPush;
    local /*0x97E50000-0x00000000*/ private float SeparationTOVS, SpeedAdjust;

    SeparationTOVS = VSize2D(inPawn.Location - vsPawn.Location) - vsPawn.CylinderComponent.CollisionRadius;
    // End:0x1A1
    if(SeparationTOVS < TuneData.DesiredSeparationFromVS)
    {
        DirPush = inPawn.Location - vsPawn.Location;
        DirPush.Z = 0.0000000;
        SpeedAdjust = (TuneData.DesiredSeparationFromVS - SeparationTOVS) / TuneData.TimeAdjustToDesiredDistance;
        inPawn.PushPawn(DirPush, SpeedAdjust);
    }
    //return;    
}

simulated function PushAwayFromWorldGeometry()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private float DesiredDistance[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL DirPush, TestLocation, FindSpotExtent;
    local /*0x97E50000-0x00000000*/ private float SpeedAdjust;

    TestLocation = inPawn.Location;
    FindSpotExtent = ((vect(1.0000000, 1.0000000, 0.0000000) * DesiredDistance) * 2.0000000) + vect(0.0000000, 0.0000000, 10.0000000);
    // End:0x162
    if(PlayerPawn.FindSpot(FindSpotExtent, TestLocation))
    {
        DirPush = TestLocation - inPawn.Location;
        DirPush.Z = 0.0000000;
        SpeedAdjust = VSize(DirPush) / TuneData.TimeAdjustToDesiredDistance;
        // End:0x162
        if(SpeedAdjust > 0.1000000)
        {
            inPawn.PushPawn(DirPush, SpeedAdjust);
        }
    }
    //return;    
}

simulated function UpdateDesiredDistance()
{
    // End:0x9B
    if((TuneData.DesiredSeparationFromVS > 0.0000000) && vsPawn != none)
    {
        PushAwayFromVS(MySPPawn, TuneData.DesiredSeparationFromVS);
        PushAwayFromVS(FollowerPawn, TuneData.DesiredSeparationFromVS);
    }
    // End:0x125
    if(TuneData.DesiredSeparationFromWorldGeometry > 0.0000000)
    {
        PushAwayFromWorldGeometry(MySPPawn, TuneData.DesiredSeparationFromWorldGeometry);
        PushAwayFromWorldGeometry(FollowerPawn, TuneData.DesiredSeparationFromWorldGeometry);
    }
    //return;    
}

function GotoNextPhase()
{
    GotoPhase(ChooseNextPhase());
    //return;    
}

function CheckWinning()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return CurrentWinPoints >= TuneData.NumPointsToWin;
    //return ReturnValue;    
}

function ChooseNextPhase()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private name NextPhase;

    // End:0x7B
    if(((bFailed && FollowerPawn != none) && FollowerPawn.Health <= 0) && PlayerPawn != none)
    {
        PlayerPawn.OnPlayRagDollDeath();
        return -1;
    }
    // End:0xA9
    if(bFailed)
    {
        bFailed = false;
        return GetPhaseIndex(GetFailPhaseName());
    }
    // End:0xE2
    if(CheckWinning())
    {
        bLeaderWonStruggleMode = true;
        CurrentWinPoints = 0;
        return GetPhaseIndex(GetWinPhaseName());
    }
    NextPhase = StrugglePhases[CurrentPhaseIdx].GetNextPhase();
    // End:0x140
    if(NextPhase != 'None')
    {
        return GetPhaseIndex(NextPhase);
    }
    // End:0x1AD
    if(!StrugglePhases[CurrentPhaseIdx].TuneData.bFinishingPhase && (CurrentPhaseIdx + 1) < StrugglePhases.Length)
    {
        return CurrentPhaseIdx + 1;
    }
    return -1;
    //return ReturnValue;    
}

function GotoPhase()
{
    local /*0x97E50000-0x00000000*/ private int NextPhaseIdx[8388609];
    local /*0x97E50000-0x00000000*/ private name CurrentPhaseName, NextPhaseName;

    // End:0x19
    if(NextPhaseIdx == CurrentPhaseIdx)
    {
        return;
    }
    NextPhaseName = 'None';
    // End:0x86
    if(NextPhaseIdx != -1)
    {
        NextPhaseName = StrugglePhases[NextPhaseIdx].TuneData.PhaseName;
    }
    StrugglePhases[CurrentPhaseIdx].Stop(NextPhaseName);
    // End:0x131
    if(NextPhaseIdx == -1)
    {
        CurrentPhaseIdx = -1;
        // End:0x10F
        if(bLocalPlayer)
        {
            PlayerPawn.ServerSetStrugglePhaseIdx(CurrentPhaseIdx);
        }
        PlayerPawn.EndCurrentSpecialMove(self);
        return;
    }
    CurrentPhaseName = StrugglePhases[CurrentPhaseIdx].TuneData.PhaseName;
    StrugglePhases[NextPhaseIdx].Start(CurrentPhaseName);
    CurrentPhaseIdx = NextPhaseIdx;
    // End:0x1F2
    if(bLocalPlayer)
    {
        PlayerPawn.ServerSetStrugglePhaseIdx(CurrentPhaseIdx);
    }
    //return;    
}

function StruggleFailed()
{
    bFailed = true;
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
        // End:0x72
        case Class'LPSMMTypes'.default.SMM_StruggleStabAttempt:
            // End:0x70
            if(CurrentPhaseIdx != -1)
            {
                StrugglePhases[CurrentPhaseIdx].StruggleStabAttempt();
            }
            return true;
        // End:0xD1
        case Class'LPSMMTypes'.default.SMM_StruggleButton:
            // End:0xCF
            if(CurrentPhaseIdx != -1)
            {
                StrugglePhases[CurrentPhaseIdx].StruggleButton();
            }
            return true;
        // End:0xFE
        case Class'LPSMMTypes'.default.SMM_StrugglePlayerDying:
            StruggleFailed();
            return true;
        // End:0x149
        case Class'LPSMMTypes'.default.SMM_StrugglePhaseChanged:
            GotoPhase(PlayerPawn.StrugglePhaseIdx);
            return true;
        // End:0x18C
        case Class'LPSMMTypes'.default.SMM_StruggleTakeDamage:
            GetCurrentPhase().StruggleTakeDamage();
            return true;
        // End:0x1CF
        case Class'LPSMMTypes'.default.SMM_StrugglePlayCameraAnim:
            GetCurrentPhase().StrugglePlayCameraAnim();
            return true;
        // End:0x21D
        case Class'LPSMMTypes'.default.SMM_StruggleDodgeButton:
            GetCurrentPhase().StruggleDodge(byte(Data));
            return true;
        // End:0x27C
        case Class'LPSMMTypes'.default.SMM_StruggleVsBlockAttempt:
            // End:0x27A
            if(CurrentPhaseIdx != -1)
            {
                StrugglePhases[CurrentPhaseIdx].StruggleVsBlockAttempt();
            }
            return true;
        // End:0xFFFF
        default:
            // End:0x282
            break;
            break;
    }
    return super(SPSpecialMove).ProcessSMMessage(MessageName, Sender, Data);
    //return ReturnValue;    
}

function UseStruggleCamera()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC;

    StruggleCamParams.MyPawn = PlayerPawn;
    LPC = GetLeadersController();
    // End:0xCA
    if(bLocalPlayer && LPC != none)
    {
        LPC.ChangeCameraMode(StruggleCamParams, StruggleTransitionInParam);
        SPInventoryWeapon(PlayerPawn.Weapon).RecoilEnd();
    }
    // End:0xF9
    if(FollowerPawn != none)
    {
        FollowerPawn.SetCameraCollision(false);
    }
    //return;    
}

function UseDefaultCamera()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC;

    LPC = GetLeadersController();
    // End:0x52
    if(bLocalPlayer && LPC != none)
    {
        LPC.SetDefaultCam();
    }
    // End:0x80
    if(FollowerPawn != none)
    {
        FollowerPawn.RestoreCameraCollision();
    }
    //return;    
}

function AddWinPoints()
{
    local /*0x97E50000-0x00000000*/ private int Points[8388609];

    CurrentWinPoints += Points;
    //return;    
}

function GetWinPhaseName()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    // End:0x9E
    if((CurrentPhaseIdx != -1) && StrugglePhases[CurrentPhaseIdx].TuneData.OverwriteWinPhaseName != 'None')
    {
        return StrugglePhases[CurrentPhaseIdx].TuneData.OverwriteWinPhaseName;
    }
    // End:0xFA
    if(!bDamaged && TuneData.PerfectWinPhaseName != 'None')
    {
        return TuneData.PerfectWinPhaseName;
    }
    return TuneData.WinPhaseName;
    //return ReturnValue;    
}

function GetFailPhaseName()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689], failPhaseName;

    failPhaseName = 'None';
    // End:0x6D
    if(CurrentPhaseIdx != -1)
    {
        failPhaseName = StrugglePhases[CurrentPhaseIdx].TuneData.OverwriteFailPhaseName;
    }
    // End:0xAC
    if(failPhaseName == 'None')
    {
        failPhaseName = TuneData.failPhaseName;
    }
    return failPhaseName;
    //return ReturnValue;    
}

simulated function SetUpChoreography()
{
    local /*0x97E50000-0x00000000*/ private @NULL Leader[8388609], MySeq, Follower, OtherSeq, ChoreoMetaData;

    local /*0x97E50000-0x00000000*/ private byte AlignmentType[8388609];
    local /*0x97E50000-0x00000000*/ private bool bLeaveCollisionOnOther[8388609], bIgnoreCollisionBetweenLeaderAndFollower;
    local /*0x97E50000-0x00000000*/ private float PreferredOtherMovementPercent[9437185];
    local /*0x97E50000-0x00000000*/ private byte ZMatchType[9437185], RotationMode;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    0
    0
    return super(SPSM_LeaderFollowerBase).SetUpChoreography(Leader, MySeq, Follower, OtherSeq, ChoreoMetaData, AlignmentType, bLeaveCollisionOnOther, bIgnoreCollisionBetweenLeaderAndFollower, PreferredOtherMovementPercent, 1, RotationMode);
    //return ReturnValue;    
}

function GetPhaseIndex()
{
    local /*0x97E50000-0x00000000*/ private name inPhaseName[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], phaseIdx;

    phaseIdx = 0;
    J0x0B:

    // End:0x86 [Loop If]
    if(phaseIdx < StrugglePhases.Length)
    {
        // End:0x78
        if(StrugglePhases[phaseIdx].TuneData.PhaseName == inPhaseName)
        {
            return phaseIdx;
        }
        ++phaseIdx;
        // [Loop Continue]
        goto J0x0B;
    }
    return -1;
    //return ReturnValue;    
}

function GetPhase()
{
    local /*0x97E50000-0x00000000*/ private name inPhaseName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int phaseIdx;

    phaseIdx = GetPhaseIndex(inPhaseName);
    // End:0x44
    if(phaseIdx != -1)
    {
        return StrugglePhases[phaseIdx];
    }
    return none;
    //return ReturnValue;    
}

function PlaySoundEvent()
{
    local /*0x97E50000-0x00000000*/ private name SoundEventName[8388609];

    // End:0x19
    if(SoundComponentLoop != none)
    {
        ClearSoundLoop();
    }
    SoundComponentLoop = FollowerPawn.TuneDataPawnSoundEventBindings.PlayEventSoundLocallyEx(SoundEventName, 'None', PlayerPawn, none, none, SoundComponentLoop);
    //return;    
}

function ClearSoundLoop()
{
    // End:0x43
    if(SoundComponentLoop != none)
    {
        SoundComponentLoop.FadeOut(0.5000000, 0.0000000);
        SoundComponentLoop = none;
    }
    //return;    
}

function GetCurrentPhase()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return StrugglePhases[CurrentPhaseIdx];
    //return ReturnValue;    
}

simulated function DrawHUD()
{
    local /*0x97E50000-0x00000000*/ private @NULL H[8388609];

    // End:0x45
    if(CurrentPhaseIdx != -1)
    {
        StrugglePhases[CurrentPhaseIdx].DrawHUD(H);
    }
    //return;    
}

function DrawDebug()
{
    local /*0x97E50000-0x00000000*/ private @NULL H[8388609];

    // End:0x45
    if(CurrentPhaseIdx != -1)
    {
        StrugglePhases[CurrentPhaseIdx].DrawDebug(H);
    }
    //return;    
}

function PlayFullBody()
{
    local /*0x97E50000-0x00000000*/ private byte PlayTarget[8388609];
    local /*0x97E50000-0x00000000*/ private int Index[8388609];
    local /*0x97E50000-0x00000000*/ private bool bHoldLastFrame[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> EndDelegate[8388609];
    local /*0x97E50000-0x00000000*/ private bool bRestartIfPlaying[9437185];
    local /*0x97E50000-0x00000000*/ private float BlendTime[9437185], PlayRate;
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], PlayAnimPawn, PlayAnimSequence;
    local /*0x97E50000-0x00000000*/ private float BlendOutTime;

    true
    0.2500000
    1.0000000
    // End:0x5E
    if(int(PlayTarget) == int(0))
    {
        PlayAnimPawn = MySPPawn;
        PlayAnimSequence = GetBestSequenceTemplateByIndex(Index);        
    }
    else
    {
        // End:0xB7
        if(int(PlayTarget) == int(1))
        {
            PlayAnimPawn = FollowerPawn;
            PlayAnimSequence = FollowerSMInstance.GetBestSequenceTemplateByIndex(Index);
        }
    }
    BlendOutTime = ((bHoldLastFrame == true) ? -1.0000000 : 0.2500000);
    return PlayAnimPawn.PlayFullBodyAnimationSequence(PlayAnimSequence, EndDelegate,, PlayRate, BlendTime, BlendOutTime,, bRestartIfPlaying, 2, 2, true);
    //return ReturnValue;    
}

function PlayFullBodyLooped()
{
    local /*0x97E50000-0x00000000*/ private byte PlayTarget[8388609];
    local /*0x97E50000-0x00000000*/ private int Index[8388609];
    local /*0x97E50000-0x00000000*/ private float BlendTime[9437185], PlayRate;
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], PlayAnimPawn, PlayAnimSequence;

    0.2500000
    1.0000000
    // End:0x59
    if(int(PlayTarget) == int(0))
    {
        PlayAnimPawn = MySPPawn;
        PlayAnimSequence = GetBestSequenceTemplateByIndex(Index);        
    }
    else
    {
        // End:0xB2
        if(int(PlayTarget) == int(1))
        {
            PlayAnimPawn = FollowerPawn;
            PlayAnimSequence = FollowerSMInstance.GetBestSequenceTemplateByIndex(Index);
        }
    }
    return PlayAnimPawn.PlayFullBodyAnimationSequence(PlayAnimSequence,,, PlayRate, BlendTime, 0.2500000, true);
    //return ReturnValue;    
}

function PlayAdditive()
{
    local /*0x97E50000-0x00000000*/ private byte PlayTarget[8388609];
    local /*0x97E50000-0x00000000*/ private int AnimIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float PlayRate[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], PlayAnimPawn, PlayAnimSequence;

    1.0000000
    // End:0x50
    if(int(PlayTarget) == int(0))
    {
        PlayAnimPawn = MySPPawn;
        PlayAnimSequence = GetBestSequenceTemplateByIndex(AnimIndex);        
    }
    else
    {
        // End:0xA9
        if(int(PlayTarget) == int(1))
        {
            PlayAnimPawn = FollowerPawn;
            PlayAnimSequence = FollowerSMInstance.GetBestSequenceTemplateByIndex(AnimIndex);
        }
    }
    return PlayAnimPawn.PlayAdditiveAnimationSequence(PlayAnimSequence,,, PlayRate);
    //return ReturnValue;    
}

defaultproperties
{
    bStopOnBlendOutNotify=true
    CurrentPhaseIdx=-1
    TuneDataClass=Class'LPTuneDataStruggle'
    ApplyDamageClass=Class'LPDamageTypeNoHitReact'
    // Reference: LPCameraModeAimControlAnimatedParam'Default__LPSM_LeadStruggleMode.StruggleCamParamObj'
    begin object name=StruggleCamParamObj class=Class'LPCameraModeAimControlAnimatedParam'
        AnimatedFOV=75.0000000
        DisallowInvertedControls=true
    end object
    StruggleCamParams=StruggleCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPSM_LeadStruggleMode.StruggleCamTransitionInParamObj'
    begin object name=StruggleCamTransitionInParamObj class=Class'LPCameraTransitionCubicParam'
        Duration=0.5000000
    end object
    StruggleTransitionInParam=StruggleCamTransitionInParamObj
    bAllowFootPlacementControllers=false
}