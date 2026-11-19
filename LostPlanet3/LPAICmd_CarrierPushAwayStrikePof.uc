class LPAICmd_CarrierPushAwayStrikePof extends LPAICmd_CarrierPushAwayStrike within LPAIControllerCarrier;

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
    Outer.CarrierPawn.DoSpecialMove(Class'LPSM_CarrierPushBackStrikePof', true, false, On_CarrierPincerStrike_Finished, EnemyForStrike);
    //return;    
}
