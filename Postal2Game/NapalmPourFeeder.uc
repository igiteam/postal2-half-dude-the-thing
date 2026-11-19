///////////////////////////////////////////////////////////////////////////
// NapalmPourFeeder
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Feeder that attaches to other objects to be poured out
///////////////////////////////////////////////////////////////////////////
class NapalmPourFeeder extends GasPourFeeder;


const TIME_TILL_DEAD = 2.0;

// Kamek 5-1
// Count how many people we burn with this one can
var int PeopleBurned;

///////////////////////////////////////////////////////////////////////////
// STUB this out so the owner doesn't care when he's hit by the liquid
// (it has a tendency to hit you anyway, it's flies around all over hte place)
///////////////////////////////////////////////////////////////////////////
function HittingOwner(vector Dir)
{
	// Intentional stub.
}

///////////////////////////////////////////////////////////////////////////
// Coming from Urine feeder, this function puts out fires! We don't
// want it to do anything.
///////////////////////////////////////////////////////////////////////////
function int FeederHitActor(Actor Other, vector HitLocation, vector HitNormal,
						vector FeederStart, vector FeederEnd, float DeltaTime)
{
	// Intentional stub.
	return 0;
}

///////////////////////////////////////////////////////////////////////////
// The fluid is hitting a pawn, but he should be on fire soon enough
///////////////////////////////////////////////////////////////////////////
function HittingPawn(FPSPawn fpawn, vector HitLocation)
{
	local LambController lambc;

	lambc = LambController(fpawn.Controller);

	// Only happens if guy is still alive
	if(lambc != None)
	{
		// Set me to dripping in pee
		lambc.HitWithFluid(MyType, HitLocation);

		lambc.BodyJuiceSquirtedOnMe(P2Pawn(MyOwner), false);
	}

	// Sets them to flammable, dead or alive
	fpawn.bExtraFlammable = true;

	/*
	// Don't count if they're already dead.
	if (fpawn.Health > 0)
		PeopleBurned++;
	//debuglog(self@"peopleburned"@peopleburned);
	*/

		// Catch it on fire, no matter what
	fpawn.TakeDamage(10, P2Pawn(MyOwner), fpawn.Location, VRand(), class'NapalmDamage');
}
/*
///////////////////////////////////////////////////////////////////////////
// Make the emitter shoot out of Rotation
// but don't use the owner vel
///////////////////////////////////////////////////////////////////////////
function SetDir(vector startdir, optional float velmag, optional bool bInitArc)
{
	local int i;
	local vector dir;
	local float addzmag, usevelmag;
	local vector ownervel;

	dir = Normal(startdir);

	// find a factor of how inline with velocity motion, this direction is
	usevelmag = VSize(MyOwner.Velocity);
	if(usevelmag > 0)
		addzmag = ((VEL_Z_DOT_PLUS*(MyOwner.Velocity Dot dir))/usevelmag);
	else
		addzmag = 0;
	addzmag+= InitialSpeedZPlus;
	
//	ownervel = Normal(vector(StartRotation))*(MyOwner.Velocity);
//	OwnerVelocity = -MyOwner.Velocity;//VSize(MyOwner.Velocity)*(vector(StartRotation + rotator(MyOwner.Velocity)));
//	log("MyOwner.Velocity "$MyOwner.Velocity);
//	log("Owner vel "$OwnerVelocity);
//	ownervel = -0.2*VSize(MyOwner.Velocity)*(vector(StartRotation + rotator(MyOwner.Velocity)));
//	ownervel = -0.8*MyOwner.Velocity;//VSize(MyOwner.Velocity)*(vector(StartRotation + rotator(MyOwner.Velocity)));

	// record velocity for collision particles
	CollisionVelocity = InitialPourSpeed*dir - ownervel;
	CollisionVelocity.z+= addzmag;

//	log("ownervel "$ownervel);
	dir = Normal(startdir);

	// make it wobble a little
	dir += VaryDir;

	for(i=0; i<Emitters.length; i++)
	{
		Emitters[i].StartVelocityRange.X.Max = 	InitialPourSpeed*dir.x + -ownervel.x ;
		Emitters[i].StartVelocityRange.X.Min = 	Emitters[i].StartVelocityRange.X.Max;
		Emitters[i].StartVelocityRange.Y.Max = 	InitialPourSpeed*dir.y + -ownervel.y ;
		Emitters[i].StartVelocityRange.Y.Min = 	Emitters[i].StartVelocityRange.Y.Max;
		Emitters[i].StartVelocityRange.Z.Max = 	InitialPourSpeed*dir.z + -ownervel.z + addzmag;
		Emitters[i].StartVelocityRange.Z.Min = 	Emitters[i].StartVelocityRange.Z.Max;
	}
	for(i=1; i<Emitters.length; i++)
	{
		Emitters[i].StartVelocityRange.X.Max += (SpeedVariance);
		Emitters[i].StartVelocityRange.X.Min -= (SpeedVariance);
		Emitters[i].StartVelocityRange.Y.Max += (SpeedVariance);
		Emitters[i].StartVelocityRange.Y.Min -= (SpeedVariance);
		Emitters[i].StartVelocityRange.Z.Max += (SpeedVariance);
		Emitters[i].StartVelocityRange.Z.Min -= (SpeedVariance);
	}

	// Check for hitting the owner here, since we have the direction of flow
	dir = Normal(startdir);

	HittingOwner(dir);

	if(bInitArc)
		EstimateArc();
}
*/
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
// actually pouring, but on the way to dying
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
state PouringAndDying
{
	function Timer()
	{
		Destroy();
	}
	function BeginState()
	{
		// Don't show us while this is happening--we get moved away from the
		// wall artificially to keep pouring to complete the stream from the impact point.
		bHidden=true;
		SetTimer(TIME_TILL_DEAD, false);
	}
}


// Decompiled with UE Explorer.
defaultproperties
{
    InitialPourSpeed=100.0000000
    InitialSpeedZPlus=75.0000000
    SplashClass=none
    TrailClass=Class'NapalmTrail'
    TrailStarterClass=none
    PuddleClass=none
    MyType=8
    Quantity=40.0000000
    Emitters[0]=StripEmitter'StripEmitter40'
    Emitters[1]=SpriteEmitter'SpriteEmitter239'
    Emitters[2]=SpriteEmitter'SpriteEmitter185'
}