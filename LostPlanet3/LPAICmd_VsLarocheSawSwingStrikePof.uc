class LPAICmd_VsLarocheSawSwingStrikePof extends LPAICmd_VsLarocheSawSwingStrike within LPAIControllerVsLaroche;

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
    Outer.VsLarochePawn.DoSpecialMove(Class'LPSM_VsLarocheSawArmSawing', true, false, On_VsLarochePincerStrike_Finished);
    //return;    
}

defaultproperties
{
    bInterruptible=false
}