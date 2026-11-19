///////////////////////////////////////////////////////////////////////////////
// AWBossEye
//
// Floating eye over cowbosses head, that blocks him from all damage.
// Maintained by the garyorbitheads. 
///////////////////////////////////////////////////////////////////////////////
class AWBossEye extends P2Emitter;

var int HeadCount;	// how many heads are feeding me
var bool bDying;
var vector BossOffset;	// from boss below
var class<P2Emitter> dblastclass;
var class<P2Emitter> dblastexplclass;
var float UpdateTime;
var class<ProjectileZap> dzapclass;

var Sound BlastBlockSound; //reflector wave thing blocks damage
var Sound ZapSound;			// eye zapping projectile to fall to ground

var class<P2Damage> ProjHitDamageClass; // damage class to simulate a projectile hitting us
var class<P2Damage> BigProjHitDamageClass; 

const PROJ_FALL_ACC	=	vect(0,0,-1000);

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
function Destroyed()
{
	RemoveGreatEyeFromBoss();
	Super.Destroyed();
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
function RemoveGreatEyeFromBoss()
{
	// If it's pointing to me, unhook it
	if(AWCowBossPawn(Owner) != None
		&& AWCowBossPawn(Owner).GreatEye == self)
		AWCowBossPawn(Owner).GreatEye = None;
}

///////////////////////////////////////////////////////////////////////////////
// Generate a broader pitch
///////////////////////////////////////////////////////////////////////////////
function float GenPitch()
{
	return 0.9+FRand()*0.4;
}

///////////////////////////////////////////////////////////////////////////////
// Zap an incoming object out of existence and make a spot where it hit
///////////////////////////////////////////////////////////////////////////////
function ZapActor(Actor Other)
{
	if(LauncherProjectile(Other) != None
		|| PlagueProjectile(Other) != None
		|| CowHeadProjectile(Other) != None)
		BlastSpot(Other.Location, BigProjHitDamageClass);
	else
		BlastSpot(Other.Location, ProjHitDamageClass);

	if(MacheteProjectile(Other) != None
		|| SledgeProjectile(Other) != None
		|| ScytheProjectile(Other) != None)
		Other.HitWall(-Normal(Velocity), Owner);
	else
		Other.Destroy();
}
/*
Old version not used anymore.. just keeping it around just in case
///////////////////////////////////////////////////////////////////////////////
// Zap an incoming projectile and make it fall to the ground
///////////////////////////////////////////////////////////////////////////////
function ZapProjectile(Projectile Other)
{
	local ProjectileZap dzap;
	local bool bBlowingItUp;

	if(dzapclass != None)
	{
		if(LauncherProjectile(Other) != None
			|| GrenadeAltProjectile(Other) != None
			|| MolotovAltProjectile(Other) != None)
			bBlowingItUp=true;
		// zaps spot
		dzap = spawn(dzapclass, Owner, , Location);
		dzap.PointHere(Other.Location, Other, bBlowingItUp);
		dzap.PlaySound(ZapSound, SLOT_Misc,1.0,,1000,GenPitch());
		// Projectile falls to ground or blows up
		// blow up alt-fired grenade, alt-fired molotov
		if(GrenadeAltProjectile(Other) != None
			|| MolotovAltProjectile(Other) != None)
			Other.TakeDamage(1000, AWCowBossPawn(Owner), Other.Location, vect(0,0,1), class'BludgeonDamage');
		else // Make rockets, flying grenades, flying molotovs
		{
			if(Other.Physics != PHYS_Projectile)
				Other.SetPhysics(PHYS_Projectile);
			// Make the grenade die faster
			if(GrenadeProjectile(Other) != None)
				GrenadeProjectile(Other).SetTimer(1.0, false);
			// Make all scissors stick next time
			if(ScissorsProjectile(Other) != None)
				ScissorsProjectile(Other).BounceMax=1;
			// Bounce or explode the rockets
			if(LauncherProjectile(Other) != None)
			{
				LauncherProjectile(Other).ForwardAccelerationMag=0;
				if(LauncherSeekingProjectileTrad(Other) != None)
					LauncherSeekingProjectileTrad(Other).SeekingAccelerationMag=0;
				LauncherProjectile(Other).HitWall(Normal(Other.Location - Location), Level);
			}
			else
			{
				Other.Velocity = vect(0,0,0);
				Other.Acceleration = PROJ_FALL_ACC;
			}
		}
	}
}
*/
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
function BlastSpot(vector hitloc, class<Damagetype> dtype)
{
	local P2Emitter dblast;

	if(dblastclass != None)
	{
		// do blasty wave reflector shield thing where the spot was blocked
		if(ClassIsChildOf(dtype, class'ExplodedDamage')
			&& dblastexplclass != None)
			dblast = spawn(dblastexplclass, Owner, , hitloc);
		else
			dblast = spawn(dblastclass, Owner, , hitloc);
		dblast.PlaySound(BlastBlockSound, SLOT_Misc,,,,GenPitch());
	}
}

///////////////////////////////////////////////////////////////////////////////
// Hard-coded scariness!
// Grow/shrink the eye effect with the number of heads, directly proportional
///////////////////////////////////////////////////////////////////////////////
function ScaleEffects()
{
	const SWIRL_I	= 0;
	const EYE_I		= 1;
	const LIGHT_I	= 2;

	const SWIRL_ADD=13;
	const SWIRL_BASE_MAX=40;
	const SWIRL_BASE_MIN=30;
	const EYE_BASE	= 10;
	const EYE_MAX	= 4;
	const EYE_MIN	= 3;
	const LIGHT_ADD = 50;

	if(Emitters.Length > LIGHT_I)
	{
		// swirling part
		Emitters[SWIRL_I].StartSizeRange.X.Max=SWIRL_BASE_MAX + HeadCount*SWIRL_ADD;
		Emitters[SWIRL_I].StartSizeRange.X.Min=SWIRL_BASE_MIN + HeadCount*SWIRL_ADD;
		// eyeball part
		Emitters[EYE_I].StartSizeRange.X.Max=EYE_BASE + HeadCount*EYE_MAX;
		Emitters[EYE_I].StartSizeRange.X.Min=EYE_BASE + HeadCount*EYE_MIN;
		// lightning part
        Emitters[LIGHT_I].StartVelocityRange.X.Max=  Emitters[SWIRL_I].StartSizeRange.X.Max + LIGHT_ADD;
        Emitters[LIGHT_I].StartVelocityRange.X.Min=-(Emitters[SWIRL_I].StartSizeRange.X.Min + LIGHT_ADD);
        Emitters[LIGHT_I].StartVelocityRange.Y.Max=  Emitters[SWIRL_I].StartSizeRange.Y.Max + LIGHT_ADD;
        Emitters[LIGHT_I].StartVelocityRange.Y.Min=-(Emitters[SWIRL_I].StartSizeRange.Y.Min + LIGHT_ADD);
        Emitters[LIGHT_I].StartVelocityRange.Z.Max=  Emitters[SWIRL_I].StartSizeRange.Z.Max + LIGHT_ADD;
        Emitters[LIGHT_I].StartVelocityRange.Z.Min=-(Emitters[SWIRL_I].StartSizeRange.Z.Min + LIGHT_ADD);
	}
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
function HeadAdded()
{
	HeadCount++;
	ScaleEffects();
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
function HeadRemoved()
{
	HeadCount--;
	ScaleEffects();
	if(HeadCount <= 0)
	{
		bDying=true;
		// Tell cow he no longer has a viable eye
		RemoveGreatEyeFromBoss();
		SelfDestroy();
		GotoState('');
	}
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
// Floating over cowboss
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
auto state Floating
{
	function SnapOverOwner()
	{
		local vector useloc;
		if(Owner != None)
		{
			useloc = Owner.Location + BossOffset;
			SetLocation(useloc);
		}
	}
Begin:
	Sleep(UpdateTime);
	SnapOverOwner();
	Goto('Begin');
}


// Decompiled with UE Explorer.
defaultproperties
{
    dblastclass=Class'AWEffects.DamageBlock'
    dblastexplclass=Class'AWEffects.DamageBlockExplosion'
    UpdateTime=0.2000000
    dzapclass=Class'ProjectileZap'
    BlastBlockSound=Sound'WeaponSounds.bullet_ricochet1'
    ZapSound=Sound'WeaponSounds.tazer_hit'
    ProjHitDamageClass=Class'BaseFX.BulletDamage'
    BigProjHitDamageClass=Class'BaseFX.ExplodedDamage'
    Emitters[0]=SpriteEmitter'SpriteEmitter145'
    Emitters[1]=SpriteEmitter'SpriteEmitter100'
    Emitters[2]=BeamEmitter'BeamEmitter6'
    AutoDestroy=true
}