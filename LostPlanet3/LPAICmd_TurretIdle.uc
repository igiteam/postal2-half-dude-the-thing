class LPAICmd_TurretIdle extends LPAICommand within LPAIController;

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    Outer.myAIPawn.EndSpecialMove(Class'LPSM_TurretScanForEnemies');
    super.Popped();
    //return;    
}

function Paused()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewCommand[8388609];

    super.Paused(NewCommand);
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

state StateCmdActive
{Begin:

    Outer.myAIPawn.DoSpecialMove(Class'LPSM_TurretScanForEnemies', true, false);
    stop;            
}
