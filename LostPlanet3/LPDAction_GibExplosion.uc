class LPDAction_GibExplosion extends SPDAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(0.25_Pct) /*0x7CFC0000-0x00000000*/ private class GibClass[65537];
var(0.25_Pct) /*0x9F240000-0x00000400*/ private editfixedsize array GibTemplateOverrideData[65537];

event Run()
{
    local /*0x97E50000-0x00000000*/ private float ElapsedTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609], manager, DamageInfo;
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL tempDeathExplosionStatus, explosionActor, AsPawn;

    AsPawn = SPPawn(inActor);
    GibClass.static.DetermineDeathExplosionToSpawn(tempDeathExplosionStatus, AsPawn);
    explosionActor = inActor.Spawn(Class'LPExplosionActor',,, inActor.Location, inActor.Rotation);
    // End:0x1EB
    if(explosionActor != none)
    {
        explosionActor.TheWeaponThatSpawnedMe = inActor;
        explosionActor.Instigator = AsPawn;
        explosionActor.InstigatorController = ((AsPawn != none) ? AsPawn.Controller : none);
        explosionActor.bDrawDebug = false;
        explosionActor.ExplosionPhysMaterial = none;
        explosionActor.Explode(tempDeathExplosionStatus.DeathGibExplosionTemplate);
    }
    return 1;
    //return ReturnValue;    
}
