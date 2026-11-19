class LPSM_ForkArmGrab_HoldCarrierTop extends LPSM_ForkArmGrab_HoldFIXED
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
    local /*0x97E50000-0x00000000*/ private @NULL CarrierPawn;

    super.StartInteraction();
    CarrierPawn = LPAIPawnCarrier(FollowerPawn);
    // End:0x99
    if(CarrierPawn != none)
    {
        CarrierPawn.SetCoreSkelControlStrengthByName('MainCoreFront1Ctrl', 0.0000000, 0.0000000);
        CarrierPawn.SetCoreSkelControlStrengthByName('MainCoreFront2Ctrl', 0.0000000, 0.0000000);
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, CarrierPawn;

    CarrierPawn = LPAIPawnCarrier(FollowerPawn);
    // End:0x8F
    if(CarrierPawn != none)
    {
        CarrierPawn.SetCoreSkelControlStrengthByName('MainCoreFront1Ctrl', 1.0000000, 0.0000000);
        CarrierPawn.SetCoreSkelControlStrengthByName('MainCoreFront2Ctrl', 1.0000000, 0.0000000);
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

defaultproperties
{
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldCarrierTop.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultGrabCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldCarrierTop.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    GrabCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPSM_ForkArmGrab_HoldCarrierTop.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    GrabTransitionInParam=GrabCamTransitionInParamObj
    AnimationTemplateNodeNames=/* Array type was not detected. */
}