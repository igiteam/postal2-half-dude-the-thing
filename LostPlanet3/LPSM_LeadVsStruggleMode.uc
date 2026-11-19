class LPSM_LeadVsStruggleMode extends LPSM_LeadStruggleMode
    abstract
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL vsPlayerPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DefaultVsStruggleCamParams;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL VsStruggleCamParams;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL VsStruggleTransitionInParam;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUsesFloatingAim;

function IsLeaderPawnLocallyControlled()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2F
    if(vsPlayerPawn != none)
    {
        return vsPlayerPawn.IsLocallyControlled();
    }
    return false;
    //return ReturnValue;    
}

function InitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name InHandle[8388609];

    vsPlayerPawn = LPVSPlayerPawn(inPawn);
    super.InitSpecialMove(inPawn, InHandle);
    //return;    
}

function GetLeadersController()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x37
    if(vsPlayerPawn != none)
    {
        return LPPlayerController(vsPlayerPawn.Controller);
    }
    return none;
    //return ReturnValue;    
}

function SetPawnsInitalInteractionValues()
{
    // End:0x92
    if(vsPlayerPawn != none)
    {
        vsPlayerPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        vsPlayerPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        vsPlayerPawn.InStruggleMode = true;
        UseVsStruggleCamera();
    }
    //return;    
}

function IsLeaderPawnIncapacitated()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2F
    if(vsPlayerPawn != none)
    {
        return vsPlayerPawn.bIncapacitated;
    }
    return false;
    //return ReturnValue;    
}

function SetPawnsFinalInteractionValues()
{
    // End:0x54
    if(vsPlayerPawn != none)
    {
        vsPlayerPawn.StopFullBodyAnim(0.5000000);
        vsPlayerPawn.InStruggleMode = false;
    }
    //return;    
}

function UseVsStruggleCamera()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC;

    LPC = GetLeadersController();
    // End:0x407
    if((IsLeaderPawnLocallyControlled()) && LPC != none)
    {
        VsStruggleCamParams.FloatingAimInputScaleX = DefaultVsStruggleCamParams.FloatingAimInputScaleX * vsPawn.RightArmPart.TuneDataVSParts.ForkArmGrab_FloatingAimInputScaleX;
        VsStruggleCamParams.FloatingAimInputScaleY = DefaultVsStruggleCamParams.FloatingAimInputScaleY * vsPawn.RightArmPart.TuneDataVSParts.ForkArmGrab_FloatingAimInputScaleY;
        // End:0x2F0
        if(bUsesFloatingAim)
        {
            VsStruggleCamParams.FloatingAimThresholdMinX = -vsPawn.RightArmPart.TuneDataVSParts.ForkArmGrab_FloatingAimX;
            VsStruggleCamParams.FloatingAimThresholdMaxX = vsPawn.RightArmPart.TuneDataVSParts.ForkArmGrab_FloatingAimX;
            VsStruggleCamParams.FloatingAimThresholdMinY = -vsPawn.RightArmPart.TuneDataVSParts.ForkArmGrab_FloatingAimY;
            VsStruggleCamParams.FloatingAimThresholdMaxY = vsPawn.RightArmPart.TuneDataVSParts.ForkArmGrab_FloatingAimY;            
        }
        else
        {
            VsStruggleCamParams.FloatingAimThresholdMinX = 0.0000000;
            VsStruggleCamParams.FloatingAimThresholdMaxX = 0.0000000;
            VsStruggleCamParams.FloatingAimThresholdMinY = 0.0000000;
            VsStruggleCamParams.FloatingAimThresholdMaxY = 0.0000000;
        }
        VsStruggleCamParams.FloatingAimForce = bUsesFloatingAim;
        VsStruggleCamParams.FloatingAimDontScale = bUsesFloatingAim;
        LPC.ChangeCameraMode(VsStruggleCamParams, VsStruggleTransitionInParam,, false);
    }
    //return;    
}

function GetGrabPointHoldSMClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    // End:0x58
    if(ClassIsChildOf(TuneData.Class, Class'LPTuneDataStruggleVsPlayerBase'))
    {
        return LPTuneDataStruggleVsPlayerBase(TuneData).SM_GrabAfterSuccessfulStruggleModeEnd;        
    }
    else
    {
        return none;
    }
    //return ReturnValue;    
}

function StartGrabedHold()
{
    local /*0x97E50000-0x00000000*/ private class Move[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL EnemyVsPawn[8388609], holdSM, curSM;

    // End:0x149
    if(MySPPawn.CanDoSpecialMove(Move))
    {
        // End:0x149
        if(int(MySPPawn.Role) != int(ROLE_SimulatedProxy))
        {
            MySPPawn.DoSpecialMove(Move,,,, EnemyVsPawn);
            curSM = MySPPawn.GetCurrentSpecialMoveInstance();
            holdSM = LPSM_ForkArmGrab_HoldVsLarocheBase(curSM);
            // End:0x149
            if(holdSM != none)
            {
                holdSM.ForkArmGrabInfo.GrabPoint.GrabPointIndex = LPTuneDataStruggleVsPlayerBase(TuneData).GrabPointIndexThatThisStruggleModeEndsOnWhenSuccessful;
            }
        }
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;
    local /*0x97E50000-0x00000000*/ private class Move;
    local /*0x97E50000-0x00000000*/ private @NULL EnemyVsPawn;

    // End:0x17
    if(bUsesFloatingAim)
    {
        UseDefaultCamera();
    }
    // End:0x4B
    if(bLeaderWonStruggleMode)
    {
        Move = GetGrabPointHoldSMClass();
        EnemyVsPawn = FollowerPawn;
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
    // End:0xA1
    if(bLeaderWonStruggleMode && Move != none)
    {
        StartGrabedHold(Move, EnemyVsPawn);
    }
    //return;    
}

function ChooseNextPhase()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    // End:0x9D
    if((FollowerPawn != none) && LPPawn(FollowerPawn) != none)
    {
        // End:0x9D
        if(LPPawn(FollowerPawn).CheckToSeeIfPhaseActionWillResultInLeaderFailingMode(StrugglePhases[CurrentPhaseIdx].TuneData.PhaseName))
        {
            bFailed = true;
        }
    }
    return super.ChooseNextPhase();
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_LeadVsStruggleMode.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj class=Class'LPCameraModeAimControlGrabParam'
    end object
    DefaultVsStruggleCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_LeadVsStruggleMode.GrabCamParamObj'
    begin object name=GrabCamParamObj class=Class'LPCameraModeAimControlGrabParam'
    end object
    VsStruggleCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPSM_LeadVsStruggleMode.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj class=Class'LPCameraTransitionCubicParam'
        Duration=0.1000000
    end object
    VsStruggleTransitionInParam=GrabCamTransitionInParamObj
    bUsesFloatingAim=true
    // Reference: LPCameraModeAimControlAnimatedParam'Default__LPSM_LeadVsStruggleMode.StruggleCamParamObj'
    begin object name=StruggleCamParamObj
    end object
    StruggleCamParams=StruggleCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPSM_LeadVsStruggleMode.StruggleCamTransitionInParamObj'
    begin object name=StruggleCamTransitionInParamObj
    end object
    StruggleTransitionInParam=StruggleCamTransitionInParamObj
}