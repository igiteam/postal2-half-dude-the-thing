class LPSM_ForkArmGrab_HoldCrabClaw_LToH extends LPSM_ForkArmGrab_HoldCrabClawBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function StartInteraction()
{
    super.StartInteraction();
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    // End:0x61
    if(NextMove.Class == Class'LPSM_ForkArmGrab_HoldCrabClaw_High')
    {
        MySPPawn.TriggerEventClass(Class'LPSeqEvent_VitalSuitCombat', FollowerPawn, 2);
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

defaultproperties
{
    HoldState=ETemplateLogicHoldState.etlhsCrabClaw_LowToHigh
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldCrabClaw_LToH.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultGrabCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldCrabClaw_LToH.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    GrabCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPSM_ForkArmGrab_HoldCrabClaw_LToH.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    GrabTransitionInParam=GrabCamTransitionInParamObj
    Transitions=/* Array type was not detected. */
    AnimationTemplateNodeNames=/* Array type was not detected. */
}