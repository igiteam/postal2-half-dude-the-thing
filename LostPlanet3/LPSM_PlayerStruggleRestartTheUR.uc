class LPSM_PlayerStruggleRestartTheUR extends LPSM_LeadVsStruggleMode
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LeaderPawnHuman;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FollowerPawnVS;

function InitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name InHandle[8388609];

    LeaderPawnHuman = LPPlayerPawn(inPawn);
    TuneData = LeaderPawnHuman.TuneDataStrugglePlayerRestartTheUR;
    super.InitSpecialMove(inPawn, InHandle);
    //return;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super(LPSM_LeadStruggleMode).SpecialMoveStarted(bForced, PrevMove);
    FollowerPawnVS = LPVSPlayerPawn(LeaderPawnHuman.SpecialMoveState.CurSMInfo.InteractionActor);
    LeaderPawnHuman.ZeroMovementVariables();
    FollowerPawnVS.ZeroMovementVariables();
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function UseStruggleCamera()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC;

    StruggleCamParams.MyPawn = FollowerPawnVS;
    StruggleCamParams.CameraSocketName = 'CameraSocket';
    StruggleCamParams.CameraFOVBoneName = 'None';
    StruggleCamParams.FloatingAimThresholdMinX = 0.0000000;
    StruggleCamParams.FloatingAimThresholdMaxX = 0.0000000;
    StruggleCamParams.FloatingAimThresholdMinY = 0.0000000;
    StruggleCamParams.FloatingAimThresholdMaxY = 0.0000000;
    LPC = GetLeadersController();
    // End:0x16D
    if(bLocalPlayer && LPC != none)
    {
        LPC.ChangeCameraMode(StruggleCamParams, StruggleTransitionInParam);
    }
    //return;    
}

function GetLeadersController()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x37
    if(FollowerPawnVS != none)
    {
        return LPPlayerController(FollowerPawnVS.Controller);
    }
    return none;
    //return ReturnValue;    
}

function GetDamagePawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return FollowerPawnVS;
    //return ReturnValue;    
}

function IsLeaderPawnLocallyControlled()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_PlayerStruggleRestartTheUR.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultVsStruggleCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_PlayerStruggleRestartTheUR.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    VsStruggleCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPSM_PlayerStruggleRestartTheUR.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    VsStruggleTransitionInParam=GrabCamTransitionInParamObj
    PlayerCtrlStateName="VSLaRocheEMPShutdown"
    TuneDataClass=Class'LPTuneDataStrugglePlayerRestartTheUR'
    ApplyDamageClass=Class'LPDamageTypeVsLarocheEmpCockpitStruggle'
    // Reference: LPCameraModeAimControlAnimatedParam'Default__LPSM_PlayerStruggleRestartTheUR.CamParamObj'
    begin object name=CamParamObj class=Class'LPCameraModeAimControlAnimatedParam'
        AnimatedFOV=85.0000000
        bCollideCamera=false
        bConstrainPlayerInFOV=false
        bConstrainEnemyInFOV=false
    end object
    StruggleCamParams=CamParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPSM_PlayerStruggleRestartTheUR.CamTransitionCutParamObj'
    begin object name=CamTransitionCutParamObj class=Class'LPCameraTransitionCutParam'
    end object
    StruggleTransitionInParam=CamTransitionCutParamObj
    FollowerSpecialMoveClass=Class'LPSM_URRestartByPlayerStruggle'
}