class LPSM_ForkArmGrab_HoldVsLarocheRightShoulder extends LPSM_ForkArmGrab_HoldVsLarocheBase
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
    local /*0x97E50000-0x00000000*/ private @NULL larocheVsPawn, larocheVsCtrl;

    larocheVsPawn = LPAIPawnVsLaroche(FollowerPawn);
    // End:0xA7
    if(larocheVsPawn != none)
    {
        larocheVsCtrl = LPAIControllerVsLaroche(larocheVsPawn.Controller);
        // End:0xA7
        if((larocheVsCtrl != none) && vsPawn != none)
        {
            larocheVsCtrl.CmdStruggleVsPlayerDrillingMainSawGenResponse(vsPawn,, 0);
        }
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function ProcessSMMessage()
{
    local /*0x97E50000-0x00000000*/ private name MessageName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int Data[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return super(LPSM_ForkArmGrab_HoldStateBased).ProcessSMMessage(MessageName, Sender, Data);
    //return ReturnValue;    
}

defaultproperties
{
    bLoopAnimation=true
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldVsLarocheRightShoulder.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultGrabCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldVsLarocheRightShoulder.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    GrabCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPSM_ForkArmGrab_HoldVsLarocheRightShoulder.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    GrabTransitionInParam=GrabCamTransitionInParamObj
    AnimationTemplateNodeNames=/* Array type was not detected. */
}