class LPSM_ForkArmGrab_HoldSpitterTailNeutralToUpSpit extends LPSM_ForkArmGrab_HoldSpitterTailBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    StartTargetedSpit();
    //return;    
}

function StartInteraction()
{
    super(LPSM_ForkArmGrab_HoldStateBased).StartInteraction();
    //return;    
}

defaultproperties
{
    bIgnoreSpitDamage=false
    HoldState=ETemplateLogicHoldState.etlhsSpitterTail_NeutralToUpSpit
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldSpitterTailNeutralToUpSpit.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultGrabCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldSpitterTailNeutralToUpSpit.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    GrabCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPSM_ForkArmGrab_HoldSpitterTailNeutralToUpSpit.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    GrabTransitionInParam=GrabCamTransitionInParamObj
    Transitions=/* Array type was not detected. */
    AnimationTemplateNodeNames=/* Array type was not detected. */
}