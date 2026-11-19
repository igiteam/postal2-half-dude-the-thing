class LPAICmd_CarrierPushAwayStrikeFvs extends LPAICmd_CarrierPushAwayStrike within LPAIControllerCarrier;

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
    Outer.CarrierPawn.DoSpecialMove(Class'LPSM_CarrierPushBackStrikeFvs', true, false, On_CarrierPincerStrike_Finished);
    //return;    
}
