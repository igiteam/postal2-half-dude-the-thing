class LPAICmd_CarrierComboBashStrikeVs extends LPAICmd_CarrierComboBashStrike within LPAIControllerCarrier;

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
    bMeleeTalonBashFinished = false;
    Outer.CarrierPawn.DoSpecialMove(Class'LPSM_CarrierComboBashStrikeVs', true, false, On_CarrierTalonBashStrike_Finished, EnemyForStrike);
    //return;    
}
