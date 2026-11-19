class LPSM_ForkArmGrab_HoldCrabClaw_Low extends LPSM_ForkArmGrab_HoldCrabClawBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], LPPC;

    super.SpecialMoveStarted(bForced, PrevMove);
    LPPC = LPPlayerController(MySPPawn.Controller);
    // End:0x7F
    if(LPPC != none)
    {
        LPPC.SetTutorialMode(13);
    }
    //return;    
}

function StartInteraction()
{
    super.StartInteraction();
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, LPPC;

    LPPC = LPPlayerController(MySPPawn.Controller);
    // End:0x9E
    if((NextMove != none) && NextMove.Class == Class'LPSM_ForkArmGrab_HoldCrabClaw_LToH')
    {
        // End:0x9E
        if(LPPC != none)
        {
            LPPC.CompletedTutorialMode(13);
        }
    }
    LPPC.SetTutorialMode(0);
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

defaultproperties
{
    bLoopAnimation=true
    HoldState=ETemplateLogicHoldState.etlhsCrabClaw_Low
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldCrabClaw_Low.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultGrabCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldCrabClaw_Low.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    GrabCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPSM_ForkArmGrab_HoldCrabClaw_Low.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    GrabTransitionInParam=GrabCamTransitionInParamObj
    Transitions=/* Array type was not detected. */
    AnimationTemplateNodeNames=/* Array type was not detected. */
}