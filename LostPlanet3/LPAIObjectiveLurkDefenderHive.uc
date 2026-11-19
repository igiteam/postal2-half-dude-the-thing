class LPAIObjectiveLurkDefenderHive extends LPAIObjectiveAttackActor within LPAIControllerDefenderHive
    config(AI)
    hidecategories(Object,Object);

event IsValid()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL EnemyActor, EnemyPawn;

    EnemyActor = GetEnemy();
    // End:0x9E
    if((EnemyActor != none) && !EnemyActor.IsPendingKill())
    {
        EnemyPawn = GetEnemyPawn();
        // End:0x9C
        if(EnemyPawn != none)
        {
            // End:0x99
            if(Outer.CanBeMyEnemy(EnemyPawn))
            {
                return true;
            }            
        }
        else
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

protected event CanHaveAttackAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

defaultproperties
{
    AttackCmdTable=/* Array type was not detected. */
}