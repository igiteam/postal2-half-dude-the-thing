class LPSM_ForkArmGrab_HoldVsLarocheAfterStruggleBase extends LPSM_ForkArmGrab_HoldVsLarocheBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PawnVsLaroche;

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    PawnVsLaroche = LPAIPawnVsLaroche(FollowerPawn);
    // End:0xE9
    if((PawnVsLaroche != none) && PawnVsLaroche.CurrentStruggleModeCoreTagForFlagForDestroyOnAnimNotify != none)
    {
        PawnVsLaroche.TurnOnCoreFlagsForDestroyOnAnimNotify(PawnVsLaroche.CurrentStruggleModeCoreTagForFlagForDestroyOnAnimNotify, PawnVsLaroche.bCurrentStruggleModeFlagCoreGibForDestroyOnAnimNotify, PawnVsLaroche.bCurrentStruggleModeFlagCoreDamageActionForDestroyOnAnimNotify);
    }
    // End:0x13D
    if(vsPawn != none)
    {
        vsPawn.SetPitchControllerTarget(0, 0.1000000);
        vsPawn.SetPitchControllerLock(true);
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
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    // End:0xB0
    if((PawnVsLaroche != none) && PawnVsLaroche.CurrentStruggleModeCoreTagForFlagForDestroyOnAnimNotify != none)
    {
        PawnVsLaroche.TurnOffCoreFlagsForDestroyOnAnimNotify(PawnVsLaroche.CurrentStruggleModeCoreTagForFlagForDestroyOnAnimNotify, PawnVsLaroche.bCurrentStruggleModeFlagCoreGibForDestroyOnAnimNotify, PawnVsLaroche.bCurrentStruggleModeFlagCoreDamageActionForDestroyOnAnimNotify);
    }
    // End:0xDF
    if(vsPawn != none)
    {
        vsPawn.SetPitchControllerLock(false);
    }
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
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldVsLarocheAfterStruggleBase.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultGrabCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldVsLarocheAfterStruggleBase.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    GrabCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPSM_ForkArmGrab_HoldVsLarocheAfterStruggleBase.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    GrabTransitionInParam=GrabCamTransitionInParamObj
    bFirstMove=true
    AnimationTemplateNodeNames=/* Array type was not detected. */
}