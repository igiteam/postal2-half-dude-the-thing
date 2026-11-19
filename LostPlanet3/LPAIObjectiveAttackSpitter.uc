class LPAIObjectiveAttackSpitter extends LPAIObjectiveAttackSpitterBase within LPAIControllerSpitter
    config(AI)
    hidecategories(Object,Object);

event OnCommandAborted()
{
    super(SPAIObjective).OnCommandAborted();
    MyObjectiveManager.ImportantObjectiveAdded();
    Outer.SpitterPawn.DisableTailIKImmediate();
    //return;    
}

event OnCommandFinished()
{
    OnCommandAborted();
    MyObjectiveManager.ImportantObjectiveAdded();
    Outer.SpitterPawn.DisableTailIKImmediate();
    //return;    
}

defaultproperties
{
    AttackCmdTable=/* Array type was not detected. */
    Attribute=(GameType=SPAIObjectiveGameType.SPAI_OBJ_GAMETYPE_SINGLE_PLAYER)
}