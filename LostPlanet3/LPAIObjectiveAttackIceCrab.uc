class LPAIObjectiveAttackIceCrab extends LPAIObjectiveAttackActor within LPAIControllerBaseSnowCrab
    config(AI)
    hidecategories(Object,Object);

protected function PerformObjective()
{
    super.PerformObjective();
    Outer.SetWantsNewEnemy(false);
    //return;    
}

defaultproperties
{
    AttackRange=600.0000000
    MinimumAttackTimeBeforeSwitchingEnemies=4.0000000
    AttackCmdTable=/* Array type was not detected. */
    Attribute=(GameType=SPAIObjectiveGameType.SPAI_OBJ_GAMETYPE_SINGLE_PLAYER)
}