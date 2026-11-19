//=============================================================================
// FireElephantHeadEmitter.
//=============================================================================
class FireElephantHeadEmitter extends FireTorsoEmitter;

const BONE_MIDDLE						= 'Bip01 Head';


///////////////////////////////////////////////////////////////////////////////
// setup my pawn and link my bone
///////////////////////////////////////////////////////////////////////////////
function SetPawns(FPSPawn newpawn, FPSPawn doerpawn)
{
	Super.SetPawns(newpawn, doerpawn);

	MyPawn.AttachToBone(self, BONE_MIDDLE);
}

///////////////////////////////////////////////////////////////////////////////
// doesn't hurt things, only the head part
///////////////////////////////////////////////////////////////////////////////
function DealDamage(float DeltaTime)
{
	// STUB
}

///////////////////////////////////////////////////////////////////////////////
// update location
// doesn't really hurt things
///////////////////////////////////////////////////////////////////////////////
function Tick(float DeltaTime)
{
	// go out when he's dead
	if(MyPawn.Health <= 0)
		GotoState('Fading');
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
		//MyPawn.AttachToBone(self, BONE_MIDDLE);
		//log("now fading");
		LifeSpan = FadeTime + WaitAfterFadeTime;
		SetTimer(FadeTime, false);
		SizeChange=-Emitters[0].StartSizeRange.X.Min/(2*FadeTime);
		VelZChange=-Emitters[0].StartVelocityRange.Z.Min/(FadeTime);
		EmissionChange = -(Emitters[0].ParticlesPerSecond)/(2*FadeTime);
	}
}


// Decompiled with UE Explorer.
defaultproperties
{
    Emitters[0]=SuperSpriteEmitter'SuperSpriteEmitter175'
    Emitters[1]=SuperSpriteEmitter'SuperSpriteEmitter176'
    bDynamicLight=true
    CollisionRadius=100.0000000
    CollisionHeight=100.0000000
}