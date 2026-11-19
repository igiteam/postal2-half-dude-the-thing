class LPAIObjectiveAttackStalker extends LPAIObjectiveAttackActor within LPAIController
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

event GetNotCurrentEnemyPenalty()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x31
    if(LPAIControllerStalker(Outer).bMultiplayerMode)
    {
        return 0.0000000;
    }
    return super.GetNotCurrentEnemyPenalty();
    //return ReturnValue;    
}

static event @NULL GenerateObjectives()
{
    local /*0x97E50000-0x00000000*/ private @NULL OuterController[8388609], InObjectiveManager, InAttributes;

    // End:0x68
    if(int(Class'Engine.WorldInfo'.static.GetWorldInfo().NetMode) == int(NM_Standalone))
    {
        super.GenerateObjectives(OuterController, InObjectiveManager, InAttributes);        
    }
    else
    {
        GenerateSingleObjective(OuterController, InObjectiveManager, InAttributes);
    }
    //return;    
}

event IsValid()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(!super.IsValid())
    {
        return false;
    }
    // End:0x2C
    if(!IsEnemyAliveAndWell(GetEnemyPawn()))
    {
        return false;
    }
    // End:0x5A
    if(Outer.IsTooLongSinceEnemySeen(GetEnemyPawn()))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

defaultproperties
{
    AttackCmdTable=/* Array type was not detected. */
    bRangedAttack=true
}