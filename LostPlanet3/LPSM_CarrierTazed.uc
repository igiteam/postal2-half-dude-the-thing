class LPSM_CarrierTazed extends LPSM_CarrierDefaultStandingStun
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], CarrierPawn, LCC;

    super.SpecialMoveStarted(bForced, PrevMove);
    MySPPawn.ZeroMovementVariables();
    CarrierPawn = LPAIPawnCarrier(MySPPawn);
    LCC = LPAIControllerCarrier(MySPPawn.Controller);
    LCC.StartArbitraryDefenderLaunch(LCC.GetNumOfDefenderToSquirtOutWhenTazing(), CarrierPawn.TemplateLogicData.TargetPawn, false, false, 0.0000000, LCC.GetMinDelayBeforeProtectingTheCellsWhenTazing(), LCC.GetMaxDelayBeforeProtectingTheCellsWhenTazing(), LCC.GetMinDelayBeforeUnclaimingCellsWhenTazing(), LCC.GetMaxDelayBeforeUnclaimingCellsWhenTazing(), -1, false, true);
    //return;    
}

function GetAnimTemplateTreeForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return MySPPawn.HitReactLogicAnimTree;
    //return ReturnValue;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    MySPPawn.ZeroMovementVariables();
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}