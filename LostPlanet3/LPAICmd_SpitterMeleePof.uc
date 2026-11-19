class LPAICmd_SpitterMeleePof extends LPAICmd_SpitterMelee within LPAIControllerSpitter;

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

    return Outer.SpitterPawn.AttackSeperation_SpitAttackPof.Min;
    //return ReturnValue;    
}

function GetMaxAttackRange()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.SpitterPawn.AttackSeperation_SpitAttackPof.Max;
    //return ReturnValue;    
}

function AttackEnemy()
{
    Outer.CmdSpitStrike(EnemyForAttack, 0.0000000, false,, 1);
    //return;    
}

function CanStrike()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x33
    if(super(LPAICmd_Melee).CanStrike() && Outer.bTailIntact)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

state StrikeWithClearence
{
    function ShouldContinueToStrike()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x0F
        if(super.ShouldContinueToStrike())
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }
    stop;    
}

state MoveToAttackRangeWithClearence
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PrevStateName[8388609];

        super(SPStateObject).BeginState(PrevStateName);
        Outer.Focus = EnemyForAttack;
        //return;        
    }
    stop;    
}
