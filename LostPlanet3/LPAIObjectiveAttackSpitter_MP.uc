class LPAIObjectiveAttackSpitter_MP extends LPAIObjectiveAttackSpitterBase within LPAIControllerSpitter
    config(AI)
    hidecategories(Object,Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CostFactor_ForResinedEnemy[1073741825];

function CmdAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyPawn[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand, SpitterAttack;

    Outer.CmdStatus_Attack
    0
    myCommand = super.CmdAttack(EnemyPawn, CmdStatus, CmdOption);
    SpitterAttack = LPAICmd_SpitterAttack(myCommand);
    // End:0xC4
    if(SpitterAttack != none)
    {
        SpitterAttack.bCanStrikeBeforeReachingMeleeSlot = true;
        SpitterAttack.bDisableStrafing = true;
    }
    return myCommand;
    //return ReturnValue;    
}

event GetCostFactorForOffMesh()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 1.0000000;
    //return ReturnValue;    
}

event GetNotCurrentEnemyPenalty()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return super(LPAIObjectiveAttackActor).GetNotCurrentEnemyPenalty();
    //return ReturnValue;    
}

event CanBeActivated()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x39
    if(Outer.myAIPawn.GetIfGettingBirthed())
    {
        return false;
    }
    // End:0x48
    if(IsSuspended())
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

event IsValid()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(!super(LPAIObjectiveAttackActor).IsValid())
    {
        return false;
    }
    // End:0x37
    if(!Outer.IsTailIntact())
    {
        return false;
    }
    // End:0x65
    if(Outer.IsTooLongSinceEnemySeen(GetEnemyPawn()))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

static event @NULL GenerateObjectives()
{
    local /*0x97E50000-0x00000000*/ private @NULL OuterController[8388609], InObjectiveManager, InAttributes;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL Obj, EnemyCandidate, MyController, CurrCmd;

    // End:0x27
    if(OuterController.TargetList.Length <= 0)
    {
        return;
    }
    Obj = FindExistingObjectiveOfThisType(InObjectiveManager, InAttributes);
    // End:0x145
    if(Obj != none)
    {
        MyController = LPAIController(OuterController);
        CurrCmd = LPAICommand(Obj.CurrentCommand);
        // End:0x143
        if(MyController.WantsNewEnemy() && (CurrCmd == none) || CurrCmd.IsInterruptible())
        {
            // End:0x143
            if(Obj.AttemptToFindNewEnemy(false))
            {
                MyController.SetWantsNewEnemy(false);
            }
        }
        return;
    }
    I = 0;
    J0x150:

    // End:0x304 [Loop If]
    if(I < OuterController.TargetList.Length)
    {
        EnemyCandidate = Pawn(OuterController.TargetList[I].Actor);
        // End:0x2F6
        if((((EnemyCandidate != none) && OuterController.IsEnemyVisible(EnemyCandidate)) && OuterController.CanBeMyEnemy(EnemyCandidate)) && (FindAttackCommandFor(EnemyCandidate)) != none)
        {
            Obj = CreateNewObjectiveForEnemy(InObjectiveManager, InAttributes, OuterController.TargetList[I]);
            // End:0x2F3
            if((Obj != none) && OuterController.TargetList.Length > 1)
            {
                Obj.AttemptToFindNewEnemy(true);
            }
            // [Explicit Break]
            goto J0x304;
        }
        ++I;
        // [Loop Continue]
        goto J0x150;
    }
    J0x304:

    //return;    
}

defaultproperties
{
    CostFactor_ForResinedEnemy=5.0000000
    AttackCmdTable=/* Array type was not detected. */
    bRangedAttack=true
}