class LPSM_CarrierTalonFlurryStrikePOF extends LPSM_AIBasePlayFullBodyAnimSeq
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], MyCarrierPawn;

    MyCarrierPawn = LPAIPawnCarrier(MySPPawn);
    // End:0x139
    if((MyCarrierPawn != none) && MyCarrierPawn.MyCarrierController != none)
    {
        // End:0xE6
        if(int(MyCarrierPawn.MyCarrierController.GetCurrentCarrierMacroCombatState()) == int(4))
        {
            PlayBackRate = MyCarrierPawn.TuneDataCarrier.PlayRateForLoopFlurryStrikeWhenBerserkAttackPof.GetValue();            
        }
        else
        {
            PlayBackRate = MyCarrierPawn.TuneDataCarrier.PlayRateForLoopFlurryStrikeWhenDirectAttackPof.GetValue();
        }
    }
    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function GetDesiredAnimIndex()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL CarrierPawn;

    CarrierPawn = LPAIPawnCarrier(MySPPawn);
    // End:0x54
    if(CarrierPawn != none)
    {
        // End:0x52
        if(CarrierPawn.bAllHiveCellsDestroyed)
        {
            return 1;            
        }
        else
        {
            return 0;
        }
    }
    return 0;
    //return ReturnValue;    
}

defaultproperties
{
    bShouldLoop=true
    AnimationTemplateNodeNames=/* Array type was not detected. */
}