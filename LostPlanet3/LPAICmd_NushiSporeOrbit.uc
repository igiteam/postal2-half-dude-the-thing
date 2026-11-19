class LPAICmd_NushiSporeOrbit extends LPAICmd_DefenderOrbit within LPAIControllerNushiSpore;

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

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

function GetMinAttackRange()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return GetDefaultAttackRange();
    //return ReturnValue;    
}

function GetMaxAttackRange()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return GetDefaultAttackRange();
    //return ReturnValue;    
}

function GetLaunchFromHiveSM()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_NushiSporeLaunchFromStalk';
    //return ReturnValue;    
}
