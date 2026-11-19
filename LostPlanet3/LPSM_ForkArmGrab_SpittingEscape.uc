class LPSM_ForkArmGrab_SpittingEscape extends LPSM_ForkArmGrab_Escape
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SpitterPawn[536870913];

function StartReleaseAnimation()
{
    StartAnimationChoreography(MySPPawn, FollowerPawn, 17, false, ReleaseFinished, FollowerSMInstance.EndAnimationFinished);
    //return;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super(LPSM_ForkArmGrab_Release).SpecialMoveStarted(bForced, PrevMove);
    SpitterPawn = LPAIPawnSpitter(FollowerPawn);
    // End:0x98
    if(SpitterPawn != none)
    {
        SpitterPawn.SetSpitTarget(MySPPawn);
        SpitterPawn.TargetedSocket = 'CenterGlass';
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    SpitterPawn.SetSpitTarget(none);
    super(LPSM_ForkArmGrab_Release).SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

defaultproperties
{
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_SpittingEscape.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultGrabCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_SpittingEscape.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    GrabCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPSM_ForkArmGrab_SpittingEscape.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    GrabTransitionInParam=GrabCamTransitionInParamObj
}