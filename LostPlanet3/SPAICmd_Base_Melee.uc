class SPAICmd_Base_Melee extends SPAICommand_Base_Combat within SPAIController;

function StopMeleeAttack()
{
    //return;    
}

function IsValidMeleeTarget()
{
    local /*0x03A30000-0x00000000*/ private @NULL MyPawn[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function Pushed()
{
    super.Pushed();
    GotoState('InCombat');
    //return;    
}

function Popped()
{
    super.Popped();
    StopMeleeAttack();
    //return;    
}

state InCombat
{Begin:

    // End:0x55
    if(!IsValidMeleeTarget(SPPawn(Outer.Enemy)))
    {
        Outer.SelectEnemy();
    }
    // End:0x89
    if(IsValidMeleeTarget(SPPawn(Outer.Enemy)))
    {
    }
    goto 'Begin';
    stop;                    
}
