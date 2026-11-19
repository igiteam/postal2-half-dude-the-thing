class LPAICmd_CrabBaseStrike extends LPAICmd_Strike within LPAIControllerBaseSnowCrab;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL EnemyTurret;

function TurnOnCollisionForTurrets()
{
    // End:0x55
    if((EnemyTurret != none) && !Class'SPEngine.SPUtil'.static.IsSinglePlayerGame())
    {
        EnemyTurret.EnableCollisionWithActors(true);
    }
    //return;    
}

function TurnOffCollisionForTurrets()
{
    // End:0x55
    if((EnemyTurret != none) && !Class'SPEngine.SPUtil'.static.IsSinglePlayerGame())
    {
        EnemyTurret.EnableCollisionWithActors(false);
    }
    //return;    
}

function SetDesiredEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];

    EnemyTurret = LPAIPawnTurret(InEnemy);
    TurnOnCollisionForTurrets();
    super.SetDesiredEnemy(InEnemy);
    //return;    
}

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    Outer.SetTimeOfFirstAttackOnEnemy();
    TurnOffCollisionForTurrets();
    super.Popped();
    //return;    
}

event SPAborted()
{
    Outer.SetTimeOfFirstAttackOnEnemy();
    super.SPAborted();
    //return;    
}

state StateCmdActive
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        //return;        
    }
    stop;    
}
