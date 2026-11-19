class LPAICmd_DefenderHiveLaunchDefenders extends LPAICmd_CarrierLaunchDefenders within LPAIControllerDefenderHive;

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.ResetRotationRate();
    //return;    
}

event SPAborted()
{
    super.SPAborted();
    Outer.ResetRotationRate();
    //return;    
}

function SetDesiredEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];

    EnemyForStrike = InEnemy;
    // End:0xBC
    if(EnemyForStrike != none)
    {
        MyEnemyRadius = Class'LPAIUtils'.static.KynapseAdjustedRadius(EnemyForStrike);
        MyEnemyHeight = EnemyForStrike.CylinderComponent.CollisionHeight;
        Outer.MyLPEnemy = EnemyForStrike;        
    }
    else
    {
        MyEnemyRadius = -1.0000000;
        MyEnemyHeight = -1.0000000;
    }
    //return;    
}

function HandleStartOfCommandFocusSetting()
{
    Outer.Focus = none;
    //return;    
}

function HandleStartOfSpawningDefendersFocusSetting()
{
    Outer.Focus = none;
    //return;    
}

function StartRaiseInToLaunchPosition()
{
    TimeLastSpecialMoveStarted = -1.0000000;
    //return;    
}

function StartLoopingLaunchSM()
{
    TimeLastSpecialMoveStarted = -1.0000000;
    //return;    
}

function StartLoweringOutOfLaunchPos()
{
    TimeLastSpecialMoveStarted = -1.0000000;
    NotifyAnimReadyToLaunchDefenders();
    //return;    
}

state StateCmdActive
{
    event PoppedState()
    {
        super.PoppedState();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super.EndState(NextStateName);
        //return;        
    }

    function AreFacingTarget()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }
    stop;    
}
