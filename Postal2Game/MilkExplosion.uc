///////////////////////////////////////////////////////////////////////////////
// MilkExplosion
// 
// Explosion for a milk projectile from cowboss
///////////////////////////////////////////////////////////////////////////////
class MilkExplosion extends P2Explosion;

///////////////////////////////////////////////////////////////////////////////
// Just a little randomness for the pitch, around 1.0
///////////////////////////////////////////////////////////////////////////////
function float GetRandPitch()
{
	return (0.94 + FRand()*0.08);
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
auto state Exploding
{
Begin:
	PlaySound(ExplodingSound,,1.0,,,GetRandPitch(),true);
	Sleep(DelayToHurtTime);

	if(Level.Game != None
		&& FPSGameInfo(Level.Game).bIsSinglePlayer)
		CheckHurtRadius(ExplosionDamage, ExplosionRadius, MyDamageType, ExplosionMag, ForceLocation);
	else
		CheckHurtRadius(ExplosionDamageMP, ExplosionRadiusMP, MyDamageType, ExplosionMagMP, ForceLocation);

	Sleep(DelayToNotifyTime);
	NotifyPawns();
}


// Decompiled with UE Explorer.
defaultproperties
{
    ExplodingSound=Sound'levelsoundstrois.Weather.Splash2'
    ExplosionMag=5000.0000000
    ExplosionDamage=40.0000000
    ExplosionRadius=180.0000000
    MyDamageType=Class'BaseFX.AcidMilkDamage'
    Emitters[0]=SpriteEmitter'SpriteEmitter63'
    Emitters[1]=SpriteEmitter'SpriteEmitter250'
    Emitters[2]=SpriteEmitter'SpriteEmitter65'
    AutoDestroy=true
    LifeSpan=5.0000000
    TransientSoundRadius=200.0000000
}