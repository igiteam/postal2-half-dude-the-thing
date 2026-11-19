//=============================================================================
// MrDTNadeExplosion.
//=============================================================================
class MrDKNadeExplosion extends GrenadeExplosion;

#exec AUDIO IMPORT NAME=boom FILE=Sounds/boom.wav


// Decompiled with UE Explorer.
defaultproperties
{
    GrenadeExplodeAir=Sound'boom'
    GrenadeExplodeGround=Sound'boom'
    ExplosionMag=200000.0000000
    ExplosionDamage=320.0000000
    ExplosionRadius=1250.0000000
    MyDamageType=Class'MrDKNadeDamage'
    Emitters[0]=SpriteEmitter'SpriteEmitter239'
    Emitters[1]=SpriteEmitter'SpriteEmitter103'
    Emitters[2]=SpriteEmitter'SpriteEmitter104'
    Emitters[3]=SpriteEmitter'SpriteEmitter200'
}