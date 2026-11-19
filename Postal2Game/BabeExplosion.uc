//=============================================================================
// BabeExplosion
// 
// Effect to accompany arrival of postal babes in MP when they dance around 
// the winner.
//=============================================================================
class BabeExplosion extends P2Emitter;

var Sound ExplodingSound;

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
auto state Exploding
{
Begin:
	PlaySound(ExplodingSound,,1.0,,,,true);
}


// Decompiled with UE Explorer.
defaultproperties
{
    ExplodingSound=Sound'WeaponSounds.rocket_explode'
    Emitters[0]=SpriteEmitter'SpriteEmitter260'
    Emitters[1]=SpriteEmitter'SpriteEmitter31'
    Emitters[2]=SpriteEmitter'SpriteEmitter64'
    AutoDestroy=true
    LifeSpan=6.0000000
}