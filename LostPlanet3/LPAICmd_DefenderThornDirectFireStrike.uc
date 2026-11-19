class LPAICmd_DefenderThornDirectFireStrike extends LPAICmd_MedFlyerBasicDirectFireStrike within LPAIControllerDefender;

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    Outer.NotifyCombatManagerOfStrikeCompleted(5);
    super.Popped();
    //return;    
}
