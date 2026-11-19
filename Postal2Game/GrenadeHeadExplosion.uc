///////////////////////////////////////////////////////////////////////////////
// GrenadeHeadExplosion
// 
// explosion for a grenade when it's in the dude's mouth before a suicide
///////////////////////////////////////////////////////////////////////////////
class GrenadeHeadExplosion extends P2Explosion;


// Decompiled with UE Explorer.
defaultproperties
{
    ExplosionMag=60000.0000000
    ExplosionDamage=1000.0000000
    ExplosionRadius=800.0000000
    MyDamageType=Class'BaseFX.DudeSuicideDamage'
    Emitters[0]=SpriteEmitter'SpriteEmitter30'
    AutoDestroy=true
    LifeSpan=3.0000000
    TransientSoundRadius=900.0000000
}