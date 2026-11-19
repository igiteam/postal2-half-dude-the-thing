class LPAIObjectiveAttackIceCrab_MP extends LPAIObjectiveAttackIceCrab within LPAIControllerBaseSnowCrab
    config(AI)
    hidecategories(Object,Object);

event GetCost_Summed()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAttackTarget[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL CurrentEnemyPawn;
    local /*0x97E50000-0x00000000*/ private float BaseCost;

    // End:0x4E
    if(Outer.CrabPawn.MP_LargeAreaCrab)
    {
        return super(LPAIObjectiveAttack).GetCost_Summed(InAttackTarget);        
    }
    else
    {
        BaseCost = 20000.0000000;
        // End:0xFF
        if(Outer.WantsNewEnemy())
        {
            CurrentEnemyPawn = LPPawn(Outer.Enemy);
            // End:0xFF
            if(InAttackTarget.Info.Actor == CurrentEnemyPawn)
            {
                BaseCost += float(5000);
            }
        }
        return BaseCost;
    }
    //return ReturnValue;    
}

static event @NULL GenerateObjectives()
{
    local /*0x97E50000-0x00000000*/ private @NULL OuterController[8388609], InObjectiveManager, InAttributes;

    // End:0x68
    if(int(Class'Engine.WorldInfo'.static.GetWorldInfo().NetMode) == int(NM_Standalone))
    {
        super(LPAIObjectiveAttackActor).GenerateObjectives(OuterController, InObjectiveManager, InAttributes);        
    }
    else
    {
        GenerateSingleObjective(OuterController, InObjectiveManager, InAttributes);
    }
    //return;    
}

defaultproperties
{
    AttackRange=500.0000000
    CostFactor_HumanFlagBearer=0.7500000
    MinimumAttackTimeBeforeSwitchingEnemies=5.0000000
    CostFactor_TimePassedSinceLastAttack=0.1000000
    MaxTimeFor_CostFactor_TimePassedSinceLastAttack=20.0000000
    AttackCmdTable=/* Array type was not detected. */
    EnemyDamagingMeBonus=500.0000000
    Attribute=(GameType=SPAIObjectiveGameType.SPAI_OBJ_GAMETYPE_MULTI_PLAYER)
}