//////////////////////////////////////////////////////////////////////////////
// Grenade Launcher Projectile
///////////////////////////////////////////////////////////////////////////////
class GrenadeLauncherProjectile extends GrenadeProjectile;

///////////////////////////////////////////////////////////////////////////////
// Vars, structs, consts, enums...
///////////////////////////////////////////////////////////////////////////////
var StaticMesh GrenadeMesh;
var float	ThrowMod;
var bool 	bExplodeOnContact;		// If you should blow up on the first thing you hit

//var int	  	BounceCount;			// Number of times we've bounced.
//const BOUNCE_MAX	= 3;

///////////////////////////////////////////////////////////////////////////////
// Send it with a certain speed and arm it
///////////////////////////////////////////////////////////////////////////////
function SetupShot(bool bHandGrenade, bool bAltFire, bool bPlayer)
{
	if(!bPlayer)
		SlowDown();
	
	if ( Role == ROLE_Authority )
	{
		Velocity = GetThrownVelocity(Instigator, Rotation, ThrowMod);
		RandSpin(StartSpinMag);
	}
	
	MakeSmokeTrail();
	bExplodeOnContact = !bAltFire;

	if(bHandGrenade)
		SetStaticMesh(GrenadeMesh);
}

function SlowDown()
{
	Speed=default.Speed/2;
	MaxSpeed=default.MaxSpeed/2;
}

///////////////////////////////////////////////////////////////////////////////
// We can hurt ourselves with this if it's bounced once.
// Otherwise, it hurts everyone else all the same
///////////////////////////////////////////////////////////////////////////////
simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
	local SmokeHitPuff smoke1;
	local vector HitNormal;
	
	log(Self$" ProcessTouch()");
	
	if (Pawn(Other) != None
		&& Pawn(Other).Health > 0
		&& !RelatedToMe(Pawn(Other)))
	{
		GenExplosion(HitLocation,Normal(HitLocation-Other.Location), Other);
	}
	else
	{
		// Bounce off static things
		if(Other.bStatic)
		{
			// Throw out some hit effects, like dust or sparks
			smoke1 = spawn(class'Fx.SmokeHitPuffMelee',Owner,,Location,rotator(Normal(HitLocation-Other.Location)));
			// play a noise
			smoke1.PlaySound(GrenadeBounce,,,,TransientSoundRadius,GetRandPitch());
			BounceRecoil(-Normal(Velocity));
		}
		else
			Other.Bump(self);	
	}
}

///////////////////////////////////////////////////////////////////////////////
// Bounces off walls or Explodes on contact
///////////////////////////////////////////////////////////////////////////////
simulated function HitWall( vector HitNormal, actor Wall )
{
	if( bExplodeOnContact ) //|| BounceCount > BOUNCE_MAX )
	{
		GenExplosion(Location, HitNormal, Wall);
		return;
	}
	else
	{
		Super.HitWall(HitNormal, Wall);
		//BounceCount++;
		SlowDown();
	}
}

///////////////////////////////////////////////////////////////////////////////
// Blow up and generate effects
///////////////////////////////////////////////////////////////////////////////
simulated function GenExplosion(vector HitLocation, vector HitNormal, Actor Other)
{
	local GrenadeExplosion exp;
	local vector WallHitPoint;

	if(Role == ROLE_Authority)
	{
		exp = spawn(class'GrenadeExplosion',,,HitLocation);
		exp.CheckForHitType(Other);
		exp.ShakeCamera(exp.ExplosionDamage);
	}
 	Destroy();
}

///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    GrenadeMesh=StaticMesh'TP_Weapons.Grenade3'
    ThrowMod=0.4000000
    bExplodeOnContact=true
    DetonateTime=2.0000000
    speed=4000.0000000
    MaxSpeed=6000.0000000
    TossZ=0.0000000
    Acceleration=(X=0.0000000,Y=0.0000000,Z=-3000.0000000)
    StaticMesh=StaticMesh'ED_TPMeshes.Emitter.mesh_nadem79'
    DrawScale=2.0000000
}