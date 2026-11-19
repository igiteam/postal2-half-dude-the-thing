class LPSM_ForkArmGrab_HoldSpitterTailRightSpit extends LPSM_ForkArmGrab_HoldSpitterTailBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    LPVSPlayerPawn(MySPPawn).RightArmPartInfo.IKType = GetIKAssistanceType();
    LPVSPlayerPawn(MySPPawn).RightArmPartInfo.IKTargetPawn = LPPawn(FollowerPawn);
    LPVSPlayerPawn(MySPPawn).RightArmPartInfo.IKTargetDepthSocket = GetIKTargetDepthSocket();
    LPVSPlayerPawn(MySPPawn).RightArmPartInfo.IKTargetAssistSocket = GetIKTargetAssistSocket();
    //return;    
}

function GetIKTargetDepthSocket()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    return 'IKSpitTarget';
    //return ReturnValue;    
}

function GetIKAssistanceType()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    return 2;
    //return ReturnValue;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function GetVictimVulnerableCoreID()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return 3;
    //return ReturnValue;    
}

defaultproperties
{
    bCanDamageFollower=true
    bLoopAnimation=true
    HoldState=ETemplateLogicHoldState.etlhsSpitterTail_RightSpit
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldSpitterTailRightSpit.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultGrabCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldSpitterTailRightSpit.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    GrabCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPSM_ForkArmGrab_HoldSpitterTailRightSpit.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    GrabTransitionInParam=GrabCamTransitionInParamObj
    Transitions=/* Array type was not detected. */
    AnimationTemplateNodeNames=/* Array type was not detected. */
}