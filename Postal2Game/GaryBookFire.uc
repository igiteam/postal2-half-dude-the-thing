///////////////////////////////////////////////////////////////////////////////
// GaryBookFire
// Just visual--no actual burning
// Particles move up, as the book just sits there, like normal fire.
// Unholy green color, to get your attention, also.
///////////////////////////////////////////////////////////////////////////////
class GaryBookFire extends P2Emitter;


// Decompiled with UE Explorer.
defaultproperties
{
    Emitters[0]=SuperSpriteEmitter'SuperSpriteEmitter34'
    AutoDestroy=true
    Physics=10
    AmbientSound=Sound'WeaponSounds.fire_large'
    SoundRadius=40.0000000
    SoundVolume=255
    TransientSoundVolume=255.0000000
    TransientSoundRadius=40.0000000
}