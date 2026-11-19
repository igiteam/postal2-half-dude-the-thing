class LPSeqAct_SpawnExplosion extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x83480000-0x00000400*/ private editfixedsize @NULL ExplosionTemplate[589825];

event Activated()
{
    local /*0x97E50000-0x00000000*/ private @NULL TargetActor, explosionActor;
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x11B [Loop If]
    if(I < Targets.Length)
    {
        TargetActor = Actor(Targets[I]);
        explosionActor = TargetActor.Spawn(Class'LPExplosionActor',,, TargetActor.Location, Rotator(vect(0.0000000, 0.0000000, 1.0000000)));
        // End:0x10D
        if(explosionActor != none)
        {
            explosionActor.TheWeaponThatSpawnedMe = TargetActor;
            explosionActor.Explode(ExplosionTemplate);
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

defaultproperties
{
    ObjName="Spawn An Explosion (LP)"
}