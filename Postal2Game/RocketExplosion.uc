///////////////////////////////////////////////////////////////////////////////
// RocketExpl
// 
// explosion for a rocket
///////////////////////////////////////////////////////////////////////////////
class RocketExplosion extends P2Explosion;

const	BLOOD_INDEX	=	2;

replication
{
	// server sends this to client if enough bandwidth 
	unreliable if(Role==ROLE_Authority)
		CheckForHitType;
}

///////////////////////////////////////////////////////////////////////////////
// Perhaps do something special if you hit a wall
///////////////////////////////////////////////////////////////////////////////
simulated function CheckForHitType(Actor Other)
{
	// Make bloody explosion, but only if it hit a person and we allow blood
	if(Pawn(Other) != None
		&& class'P2Player'.static.BloodMode())
	{
		Emitters[BLOOD_INDEX].Disabled=false;
	}
}


// Decompiled with UE Explorer.
defaultproperties
{
    ExplodingSound=Sound'WeaponSounds.rocket_explode'
    ExplosionMag=100000.0000000
    ExplosionDamage=180.0000000
    ExplosionRadius=750.0000000
    MyDamageType=Class'BaseFX.GrenadeDamage'
    Emitters[0]=SpriteEmitter'SpriteEmitter227'
    Emitters[1]=SpriteEmitter'SpriteEmitter228'
    Emitters[2]=SpriteEmitter'SpriteEmitter229'
    AutoDestroy=true
    LifeSpan=3.0000000
}