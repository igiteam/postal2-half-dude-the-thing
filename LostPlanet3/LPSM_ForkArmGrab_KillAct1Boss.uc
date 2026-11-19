class LPSM_ForkArmGrab_KillAct1Boss extends LPSM_ForkArmGrab_Kill
    config(Game);

function KillFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    MySPPawn.StopFullBodyAnim();
    IfVsDoesNotHaveDriverKillItsVelocity();
    FollowerPawn.EndCurrentSpecialMove(none);
    LPAIPawnAct1Boss(FollowerPawn).KismetNotifyCoreDestroyed(true);
    MySPPawn.EndCurrentSpecialMove(self);
    //return;    
}

defaultproperties
{
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_KillAct1Boss.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultGrabCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_KillAct1Boss.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    GrabCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPSM_ForkArmGrab_KillAct1Boss.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    GrabTransitionInParam=GrabCamTransitionInParamObj
    bEndSpecialMoveOnInvalidVictim=false
}