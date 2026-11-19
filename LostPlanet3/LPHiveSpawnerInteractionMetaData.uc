class LPHiveSpawnerInteractionMetaData extends LPActorInteractionMetaData
    editinlinenew
    hidecategories(Object);

simulated function IsActorEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyActor[8388609], WhoWantsToKnow;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Hive;

    Hive = LPHiveSpawnPoint(MyActor);
    // End:0x2D
    if(Hive == none)
    {
        return false;
    }
    // End:0x53
    if(Hive.Health <= 0)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}
