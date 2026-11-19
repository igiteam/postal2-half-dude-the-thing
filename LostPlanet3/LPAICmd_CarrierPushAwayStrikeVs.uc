class LPAICmd_CarrierPushAwayStrikeVs extends LPAICmd_CarrierPushAwayStrike within LPAIControllerCarrier;

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    //return;    
}

function StartMeleeStrikeSM()
{
    bMeleePincerFinished = false;
    Outer.CarrierPawn.DoSpecialMove(Class'LPSM_CarrierPushBackStrikeVs', true, false, On_CarrierPincerStrike_Finished, EnemyForStrike);
    //return;    
}
