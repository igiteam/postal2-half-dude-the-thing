class LPAIObjectiveAttackSpitterBase extends LPAIObjectiveAttackActor within LPAIControllerSpitter
    abstract
    config(AI)
    hidecategories(Object,Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CmdSpitterAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsFormationBlocked[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWasFormationBlocked[536870913];

function UpdateTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL InInfo[8388609];

    UpdateFormationParameters();
    super.UpdateTarget(InInfo);
    //return;    
}

function CmdAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyPawn[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    Outer.CmdStatus_Attack
    0
    myCommand = super.CmdAttack(EnemyPawn, CmdStatus, CmdOption);
    // End:0xC1
    if(LPAIObjectiveAttackSpitter_MP(self) == none)
    {
        CmdSpitterAttack = LPAICmd_SpitterAttack(myCommand);
        bIsFormationBlocked = TestForBlockedFormation();
        bWasFormationBlocked = bIsFormationBlocked;
        SetCommandParameters(bIsFormationBlocked);
    }
    return myCommand;
    //return ReturnValue;    
}

function UpdateFormationParameters()
{
    bIsFormationBlocked = TestForBlockedFormation();
    // End:0x57
    if(bIsFormationBlocked != bWasFormationBlocked)
    {
        bWasFormationBlocked = bIsFormationBlocked;
        SetCommandParameters(bIsFormationBlocked);
    }
    //return;    
}

function SetCommandParameters()
{
    local /*0x97E50000-0x00000000*/ private bool bIsBlocked[8388609];

    // End:0xB2
    if((IsActive()) && CmdSpitterAttack != none)
    {
        // End:0x70
        if(bIsBlocked)
        {
            CmdSpitterAttack.bCanStrikeBeforeReachingMeleeSlot = true;
            CmdSpitterAttack.bDisableStrafing = true;            
        }
        else
        {
            CmdSpitterAttack.bCanStrikeBeforeReachingMeleeSlot = true;
            CmdSpitterAttack.bDisableStrafing = false;
        }
    }
    //return;    
}

function OnCommandFinished()
{
    super.OnCommandFinished();
    bWasFormationBlocked = false;
    bIsFormationBlocked = false;
    Outer.SpitterPawn.DisableTailIKImmediate();
    //return;    
}

protected event CanHaveAttackAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bStrikePossible;

    // End:0x36
    if(bIsFormationBlocked)
    {
        bStrikePossible = CanHaveStrikeAccessForActor(inActor);
        return bStrikePossible;
    }
    return super.CanHaveAttackAccess(inActor);
    //return ReturnValue;    
}

protected function TestForBlockedFormation()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.IsFormationBlockedByPawns(GetEnemyPawn());
    //return ReturnValue;    
}
