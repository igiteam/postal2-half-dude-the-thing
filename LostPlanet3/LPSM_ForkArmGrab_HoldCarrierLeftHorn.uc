class LPSM_ForkArmGrab_HoldCarrierLeftHorn extends LPSM_ForkArmGrab_HoldCarrierHornBase
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
    // End:0x241
    if(!CarrierPawn.DoesHaveVulnerableCellsOnSide(1))
    {
        CarrierPawn.MyCarrierController.StartArbitraryDefenderLaunch(int(CarrierPawn.TuneDataCarrier.NumCellsToExposeFrom_NormalMelee.GetValue()), LPPawn(MySPPawn), true, CarrierPawn.TuneDataCarrier.bShouldBiasLaunchedDefendersTowardsTopOfHiveWhenTakingTakingVsMeleeHit, 0.0000000, CarrierPawn.TuneDataCarrier.MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingVsMeleeHit.GetValue(), CarrierPawn.TuneDataCarrier.MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingVsMeleeHit.GetValue(), CarrierPawn.TuneDataCarrier.MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingVsMeleeHit.GetValue(), CarrierPawn.TuneDataCarrier.MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingVsMeleeHit.GetValue());        
    }
    else
    {
        CarrierPawn.ExtendVulnerableCellTime(CarrierPawn.TuneDataCarrier.VulnerableCellDurationBoostWhenGrabbed, 1);
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

    return super.ProcessSMMessage(MessageName, Sender, Data);
    //return ReturnValue;    
}

defaultproperties
{
    bLoopAnimation=true
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldCarrierLeftHorn.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultGrabCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldCarrierLeftHorn.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    GrabCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPSM_ForkArmGrab_HoldCarrierLeftHorn.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    GrabTransitionInParam=GrabCamTransitionInParamObj
    AnimationTemplateNodeNames=/* Array type was not detected. */
}