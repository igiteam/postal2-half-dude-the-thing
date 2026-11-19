class LPAICmd_VsLarocheDoubleArmSmashStrike extends LPAICmd_VsLarocheStrikeBase within LPAIControllerVsLaroche;

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

function GetSmForStrike()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_VsLarocheSawArmSwingTwoHandBash';
    //return ReturnValue;    
}

defaultproperties
{
    bInterruptible=false
}