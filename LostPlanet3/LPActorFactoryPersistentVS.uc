class LPActorFactoryPersistentVS extends ActorFactory
    abstract
    config(Editor)
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(0.25_Pct) /*0x76D40000-0x00000000*/ private bool bForceSpawnAndOverrideSavedData[65537];
var(0.25_Pct) /*0x76D40000-0x00000000*/ private bool bRestorePersistentVSOnForceSpawn[65537];
var(0.25_Pct) /*0x76D40000-0x00000000*/ private bool bTeleportExistingPersistentVSToSpawnPoint[65537];

defaultproperties
{
    bPlaceable=false
    bKillSpawnedActorsOnUnload=false
    bAllowFailedSpawns=true
}