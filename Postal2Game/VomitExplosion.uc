///////////////////////////////////////////////////////////////////////////////
// VomitExplosion
// 
// Explosion for a vomit projectile from zombies
///////////////////////////////////////////////////////////////////////////////
class VomitExplosion extends P2Explosion;

///////////////////////////////////////////////////////////////////////////////
// Blow up in the air, so make it carry
///////////////////////////////////////////////////////////////////////////////
function AddVelocity(vector vel)
{
	local int i;

	if(Emitters.Length > 0)
	{
		for(i=0; i<Emitters.Length; i++)
		{
			Emitters[i].StartVelocityRange.X.Min += vel.x;
			Emitters[i].StartVelocityRange.X.Max += vel.x;
			Emitters[i].StartVelocityRange.Y.Min += vel.y;
			Emitters[i].StartVelocityRange.Y.Max += vel.y;
			Emitters[i].StartVelocityRange.Z.Min += vel.z;
			Emitters[i].StartVelocityRange.Z.Max += vel.z;
		}
	}
}


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
    ExplodingSound=Sound'WeaponSounds.bullet_hitflesh1'
    ExplosionMag=5000.0000000
    ExplosionDamage=30.0000000
    ExplosionRadius=100.0000000
    MyDamageType=Class'BaseFX.VomitDamage'
    Emitters[0]=SpriteEmitter'SpriteEmitter73'
    Emitters[1]=MeshEmitter'MeshEmitter10'
    Emitters[2]=MeshEmitter'MeshEmitter5'
    AutoDestroy=true
    LifeSpan=5.0000000
    TransientSoundRadius=200.0000000
}