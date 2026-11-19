///////////////////////////////////////////////////////////////////////////////
// StumpBlood
///////////////////////////////////////////////////////////////////////////////
class StumpBlood extends P2Emitter;

var float spewtime;		// time (plus half random of it) it spews before petering out

const BLOOD_DIST=250;
const SQUIRT_TIME_BASE = 0.2;
const SQUIRT_TIME_RAND = 0.8;

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
function MakeBloodSplat()
{
	local vector HitNormal, HitLocation;
	local vector endpt, dir;
	local Actor HitActor;

	// Change by NickP: MP fix
	if (Level.NetMode != NM_StandAlone)
		return;
	// End

	dir = vector(Rotation) + 0.1*Vrand();
	// make sure it always point downward some, unless it's already pointing upwards a lot
	if(dir.z < 0.7)
		dir.z -= 0.4;
	endpt = BLOOD_DIST*dir + Location;
	HitActor = Trace(HitLocation, HitNormal, endpt, Location, true);
	if ( HitActor != None
		&& HitActor.bWorldGeometry)
	{
		spawn(class'BloodDripSplatMaker',self,,HitLocation,rotator(HitNormal));
	}
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
function Timer()
{
	SelfDestroy();
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
auto simulated state Spew
{
	// Change by NickP: MP fix
	simulated function BeginState()
	{
		Super.BeginState();
		if (Role < ROLE_Authority)
		{
			SelfDestroy(true);
			LifeSpan = 0.1;
		}
	}
	// End

begin:
	SetTimer(SpewTime+0.5*SpewTime*Frand(), false);
squirt:
	Sleep(SQUIRT_TIME_BASE + SQUIRT_TIME_RAND*Frand());
	MakeBloodSplat();
	goto('squirt');
}

// Kamek edit for log despam
event Tick(float Delta)
{
//	log(self@"tick super");
	Super.Tick(Delta);
//	log(self@"tick; base is"@base@"owner is"@owner);
	if (!AutoDestroy
		&& (Base == None || Owner == None || Base.bDeleteMe || Owner.bDeleteMe)
		)
	{
//		log(self@"destroying");
		SelfDestroy();
	}
}


// Decompiled with UE Explorer.
defaultproperties
{
    spewtime=5.0000000
    Emitters[0]=SpriteEmitter'SpriteEmitter14'
    AutoDestroy=true
    bTrailerSameRotation=true
    Physics=10
    AmbientSound=Sound'WeaponSounds.blood_squirt_loop'
    SoundRadius=20.0000000
    SoundVolume=80
    SoundPitch=128
    Mass=40.0000000
}