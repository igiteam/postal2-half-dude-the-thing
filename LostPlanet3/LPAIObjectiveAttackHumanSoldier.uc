class LPAIObjectiveAttackHumanSoldier extends LPAIObjectiveAttackActor within LPAIController
    config(AI)
    hidecategories(Object,Object);

protected event CanHaveAttackAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

protected function PerformObjective()
{
    Outer.AISetMainEnemy(SPPawn(EnemyInfo.Info.Actor));
    super.PerformObjective();
    //return;    
}

defaultproperties
{
    AttackCmdTable=/* Array type was not detected. */
    bRangedAttack=true
}