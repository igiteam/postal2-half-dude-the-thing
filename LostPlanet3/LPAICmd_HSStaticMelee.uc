class LPAICmd_HSStaticMelee extends LPAICmd_CoverAIStaticMelee within LPAIControllerHumanSoldier;

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

event SPAborted()
{
    super.SPAborted();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

function GetMinTimeTimer()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    return 'HSMinTimeNoAttack';
    //return ReturnValue;    
}
