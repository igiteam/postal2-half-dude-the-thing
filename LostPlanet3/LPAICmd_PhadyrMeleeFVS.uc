class LPAICmd_PhadyrMeleeFVS extends LPAICmd_PhadyrMelee within LPAIControllerPhadyr;

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

function CanStrike()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x0F
    if(super(LPAICmd_Melee).CanStrike())
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function HasAccessToStartAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function GetStrikeAccessIfRequiredBeforeAttack()
{
    //return;    
}

function AttackEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResLoc;

    // End:0x10A
    if(Outer.PhadyrPawn != none)
    {
        ResLoc = none;
        // End:0x98
        if(Outer.HaveMeleeAccess())
        {
            ResLoc = LPAIResSurroundLocation(Outer.MeleeAccess.GetResource());
        }
        Outer.bMeleeFinished = false;
        Outer.CmdContinuousAttackPof(EnemyForAttack, ResLoc, Outer.CmdStatus_PhadyrAttack, 1);
    }
    //return;    
}

state StartAttackFromMeleeSlot
{Begin:

    AttackEnemy();
    Outer.PopCommand(self);
    stop;        
}
