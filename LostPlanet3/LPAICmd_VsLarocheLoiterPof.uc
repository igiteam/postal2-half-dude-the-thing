class LPAICmd_VsLarocheLoiterPof extends LPAICmd_VsLarocheLoiter within LPAIControllerVsLaroche;

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

function AttackEnemy()
{
    super(LPAICmd_Melee).AttackEnemy();
    //return;    
}

function CanStrike()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

defaultproperties
{
    MinAttackRange=70.0000000
    MaxAttackRange=80.0000000
}