//=============================================================================
// FireElephantEmitter.
//=============================================================================
class FireElephantEmitter extends FireTorsoEmitter;

const BONE_MIDDLE						= 'Bip01 Spine1';


///////////////////////////////////////////////////////////////////////////////
// setup my pawn and start one for the head too
///////////////////////////////////////////////////////////////////////////////
function SetPawns(FPSPawn newpawn, FPSPawn doerpawn)
{
	local FireElephantHeadEmitter fehe;

	Super.SetPawns(newpawn, doerpawn);

	// Also make fire for the giant head.
	fehe= Spawn(class'FireElephantHeadEmitter',,,newpawn.Location);
	fehe.SetFireType(bIsNapalm);
	fehe.SetPawns(newpawn, doerpawn);
}


///////////////////////////////////////////////////////////////////////////////
// Try to hurt actors around you, but don't hurt yourself, because
// we'll hurt you slowly as we want.
///////////////////////////////////////////////////////////////////////////////
function DealDamage(float DeltaTime)
{
	local actor Victims;
	local float dist;
	local vector dir;

	if( bHurtEntry )
		return;

	bHurtEntry = true;
	
	// Invoke non-scaling version of HurtRadius
	HurtRadiusEX(Damage*DeltaTime, CollisionRadius, MyDamageType, 0, Location, true);
	
	/*
	foreach VisibleCollidingActors( class 'Actor', Victims, CollisionRadius, Location )
	{
		if( (Victims != self) 
			&& Victims != MyPawn
			&& (Victims.Role == ROLE_Authority) )
		{
			dir = Normal(Victims.Location - Location);
			//damageScale = 1 - FMax(0,(dist - Victims.CollisionRadius)/DamageRadius);
			Victims.TakeDamage
			(
				Damage*DeltaTime,
				Instigator, 
				Victims.Location - Victims.CollisionRadius*dir,
				vect(0,0,0),
				MyDamageType
			);
		} 
	}
	*/
	
	bHurtEntry = false;
}

///////////////////////////////////////////////////////////////////////////////
// update location
///////////////////////////////////////////////////////////////////////////////
function Tick(float DeltaTime)
{
	local int UseDamage;
	SetLocation(MyPawn.Location + MyPawn.Velocity/12);

	Super.Tick(DeltaTime);

	// slowly hurt the guy you're burning
	PawnDamagePortion += DeltaTime*Damage;
	UseDamage = PawnDamagePortion;
	if(UseDamage > 0)
	{
		// Hurt him by that much
		MyPawn.TakeDamage
		(
			UseDamage,
			Instigator, 
			Location,
			vect(0, 0, 0),
			class'OnFireDamage'
		);
		// remove what we've used, but keep the rest for next tick
		PawnDamagePortion -= UseDamage;
	}

	//log(MyPawn$" my health "$MyPawn.health$" our damage  "$usedamage$" with extra "$pawndamageportion);

	// go out when he's dead
	if(MyPawn.Health <= 0)
		GotoState('Fading');

	//log("my owner "$Owner);
}

/*

///////////////////////////////////////////////////////////////////////////////
// Try to hurt actors around you
///////////////////////////////////////////////////////////////////////////////
function DealDamage(float DeltaTime)
{
	if(Damage != 0)
	{
		//log("deal damage "$self);
		//log("CollisionLoc "$CollisionLocation);
		//log("Location "$Location);
		// 0 here for momentumtransfer (second from end)
		// And project the hurting radius off the ground(the hitnormal) by the radius.
		HurtRadius(DeltaTime*Damage, CollisionRadius, MyDamageType, 0, Location );
	}
}
*/

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
// Fading
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
state Fading
{
	simulated function Timer()
	{
		GotoState('WaitAfterFade');
	}
	function Tick(float DeltaTime)
	{
		Emitters[0].StartSizeRange.X.Max+=(2*SizeChange*DeltaTime);
		Emitters[0].StartSizeRange.X.Min+=(SizeChange*DeltaTime);
		Emitters[0].StartVelocityRange.Z.Max+=(VelZChange*DeltaTime);
		Emitters[0].StartVelocityRange.Z.Min+=(VelZChange*DeltaTime);
		Emitters[0].InitialParticlesPerSecond+=EmissionChange*DeltaTime;
		Emitters[0].ParticlesPerSecond+=EmissionChange*DeltaTime;

		// Don't hurt stuff here, in this state
	}
	
	function BeginState()
	{
		MyPawn.AttachToBone(self, BONE_MIDDLE);
		//log("now fading");
		LifeSpan = FadeTime + WaitAfterFadeTime;
		SetTimer(FadeTime, false);
		SizeChange=-Emitters[0].StartSizeRange.X.Min/(2*FadeTime);
		VelZChange=-Emitters[0].StartVelocityRange.Z.Min/(FadeTime);
		EmissionChange = -(Emitters[0].ParticlesPerSecond)/(2*FadeTime);
	}
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
// Wait after the fade
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
state WaitAfterFade
{
}


// Decompiled with UE Explorer.
defaultproperties
{
    Damage=10.0000000
    Emitters[0]=SuperSpriteEmitter'SuperSpriteEmitter173'
    Emitters[1]=SuperSpriteEmitter'SuperSpriteEmitter174'
    bDynamicLight=true
    CollisionRadius=160.0000000
    CollisionHeight=200.0000000
}