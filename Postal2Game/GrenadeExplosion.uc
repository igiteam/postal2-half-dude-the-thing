///////////////////////////////////////////////////////////////////////////////
// GrenadeExplosion
// 
// explosion for a grenade
///////////////////////////////////////////////////////////////////////////////
class GrenadeExplosion extends P2Explosion;

var bool bGroundHit;
const	FIRE_INDEX	=	0;
const	DIRT_INDEX	=	1;
const	DUST_INDEX	=	2;
const	BLOOD_INDEX	=	3;
var Sound  GrenadeExplodeAir;
var Sound  GrenadeExplodeGround;

replication
{
	// server sends this to client if enough bandwidth 
	unreliable if(Role==ROLE_Authority)
		ClientMakeBlood, ClientMakeAir;
}

///////////////////////////////////////////////////////////////////////////////
// Perhaps do something special if you hit a wall
///////////////////////////////////////////////////////////////////////////////
function CheckForHitType(Actor Other)
{
	local vector endpt;

	// Make bloody explosion
	if(Pawn(Other) != None)
	{
		ClientMakeBlood();
	}
	else
	{
		endpt = Location;
		endpt.z -= CollisionRadius;
		if(FastTrace(endpt, Location))
		// We *didn't* hit ground, so turn *off* dirt effects
		{
			ClientMakeAir();
		}
	}
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
simulated function ClientMakeAir()
{
	Emitters[DIRT_INDEX].Disabled=true;
	Emitters[DUST_INDEX].Disabled=true;
	bGroundHit=false;
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
simulated function ClientMakeBlood()
{
	Emitters[DIRT_INDEX].Disabled=true;
	Emitters[DUST_INDEX].Disabled=true;
	// Only if we allow blood
	if(class'P2Player'.static.BloodMode())
		Emitters[BLOOD_INDEX].Disabled=false;
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
auto state Exploding
{
Begin:
	if(bGroundHit)
 		PlaySound(GrenadeExplodeGround,,1.0,,,,true);
	else
		PlaySound(GrenadeExplodeAir,,1.0,,,,true);
	Sleep(DelayToHurtTime);

	CheckHurtRadius(ExplosionDamage, ExplosionRadius, MyDamageType, ExplosionMag, Location);
	NotifyPawns();
}


// Decompiled with UE Explorer.
defaultproperties
{
    bGroundHit=true
    GrenadeExplodeAir=Sound'WeaponSounds.grenade_explodeair'
    GrenadeExplodeGround=Sound'WeaponSounds.grenade_explodeground'
    ExplosionMag=60000.0000000
    ExplosionDamage=130.0000000
    ExplosionRadius=450.0000000
    MyDamageType=Class'BaseFX.GrenadeDamage'
    Emitters[0]=SpriteEmitter'SpriteEmitter207'
    Emitters[1]=SpriteEmitter'SpriteEmitter208'
    Emitters[2]=SpriteEmitter'SpriteEmitter209'
    Emitters[3]=SpriteEmitter'SpriteEmitter210'
    AutoDestroy=true
    LifeSpan=5.0000000
    TransientSoundRadius=600.0000000
}