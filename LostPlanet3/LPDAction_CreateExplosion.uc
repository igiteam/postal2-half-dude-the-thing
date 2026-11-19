class LPDAction_CreateExplosion extends SPDAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(0.25_Pct) /*0xC9E70000-0x00000400*/ private editfixedsize @NULL ExplosionTemplate[589825];
var(0.25_Pct) /*0x7CF70000-0x00000000*/ private @NULL PhysicalMaterialOveride[65537];
var(0.25_Pct) /*0x7CF70000-0x00000000*/ private name OptionalOriginSocketName[65537];
var(0.25_Pct) /*0x7CF70000-0x00000000*/ private bool bDrawDebug[65537];

event Run()
{
    local /*0x97E50000-0x00000000*/ private float ElapsedTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Actor[8388609], manager, DamageInfo;
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL explosionActor, ExplosionLoc;

    ExplosionLoc = GetExplosionLocation(Actor);
    explosionActor = manager.Spawn(Class'LPExplosionActor',,, ExplosionLoc, Rotator(vect(0.0000000, 0.0000000, 1.0000000)));
    // End:0x195
    if(explosionActor != none)
    {
        explosionActor.TheWeaponThatSpawnedMe = Actor;
        explosionActor.Instigator = Pawn(Actor);
        explosionActor.InstigatorController = Pawn(Actor).Controller;
        explosionActor.bDrawDebug = bDrawDebug;
        explosionActor.ExplosionPhysMaterial = PhysicalMaterialOveride;
        explosionActor.Explode(ExplosionTemplate);
    }
    return 1;
    //return ReturnValue;    
}

function array GetExplosionLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609], ReturnValue, ExplosionLoc, SkelMeshComp;
    local /*0x97E50000-0x00000400*/ private editfixedsize array ComponentArray;
    local /*0x97E50000-0x00000000*/ private @NULL Rot;

    ExplosionLoc = inActor.Location;
    // End:0x115
    if(OptionalOriginSocketName != 'None')
    {
        inActor.GetComponentsOfClass(Class'Engine.SkeletalMeshComponent', ComponentArray);
        // End:0x9E
        if(ComponentArray.Length > 0)
        {
            SkelMeshComp = SkeletalMeshComponent(ComponentArray[0]);
        }
        // End:0x115
        if(SkelMeshComp != none)
        {
            // End:0x115
            if(!SkelMeshComp.GetSocketWorldLocationAndRotation(OptionalOriginSocketName, ExplosionLoc, Rot))
            {
                ExplosionLoc = inActor.Location;
            }
        }
    }
    return ExplosionLoc;
    //return ReturnValue;    
}
