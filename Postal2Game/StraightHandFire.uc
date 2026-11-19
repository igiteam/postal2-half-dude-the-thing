///////////////////////////////////////////////////////////////////////////////
// StraightHandFire
// Just visual--no actual burning
// Goes into hand throwing straight shot for cowboss
///////////////////////////////////////////////////////////////////////////////
class StraightHandFire extends P2Emitter;

var float BurnTime;

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
auto state Burning
{
Begin:
	Sleep(BurnTime);
	SelfDestroy();
}


// Decompiled with UE Explorer.
defaultproperties
{
    BurnTime=1.0000000
    Emitters[0]=SuperSpriteEmitter'SuperSpriteEmitter38'
    AutoDestroy=true
    Physics=10
    AmbientSound=Sound'WeaponSounds.fire_large'
    SoundRadius=40.0000000
    SoundVolume=255
    TransientSoundVolume=255.0000000
    TransientSoundRadius=40.0000000
}