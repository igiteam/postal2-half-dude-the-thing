class LPAIObjectiveAttackFireWasp_MP extends LPAIObjectiveAttackFireWasp within LPAIControllerMedFlyer
    config(AI)
    hidecategories(Object,Object);

function IsValid()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL EnemyPawn, MyWasp;

    // End:0x11
    if(!super(LPAIObjectiveAttackActor).IsValid())
    {
        return false;
    }
    EnemyPawn = GetEnemyPawn();
    // End:0xEE
    if(EnemyPawn != none)
    {
        MyWasp = LPAIPawnFireWasp(Outer.myAIPawn);
        // End:0xEE
        if((MyWasp != none) && Outer.TimeSinceLastSeenEnemy(EnemyPawn) > MyWasp.TuneDataFireWasp.MaxTimeToKeepUnseenEnemy.GetValue())
        {
            return false;
        }
    }
    return true;
    //return ReturnValue;    
}

defaultproperties
{
    AttackCmdTable=/* Array type was not detected. */
    Attribute=(GameType=SPAIObjectiveGameType.SPAI_OBJ_GAMETYPE_MULTI_PLAYER)
}