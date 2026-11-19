class LPAICmd_VsLarocheSawSwingStrikeVs extends LPAICmd_VsLarocheSawSwingStrike within LPAIControllerVsLaroche;

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
    //return;    
}

defaultproperties
{
    bInterruptible=false
}