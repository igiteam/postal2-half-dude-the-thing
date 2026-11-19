///////////////////////////////////////////////////////////////////////////
// Feeder that attaches to other objects to be poured out (like a gas tank)
///////////////////////////////////////////////////////////////////////////
class PukePourFeeder extends UrinePourFeeder;

var Sound SplashingSound;
var BodyPart HeadOwner;

const VEL_Z_DOT_PLUS = 20;

replication
{
	reliable if(Role == ROLE_Authority)
		HeadOwner;
}

simulated function Destroyed()
{
	// Null out head's puke stream
	if (HeadOwner != None)
		HeadOwner.ZeroPukeFeeder(Self);

// Change by Man Chrzan: Fix to keep puking after removing head, 
// just as it was in v1409 and previous versions.
//	Super.Destroyed();
	Super(FluidPourFeederMP).Destroyed();
}

///////////////////////////////////////////////////////////////////////////
// The fluid is hitting a pawn. 
///////////////////////////////////////////////////////////////////////////
function HittingPawn(FPSPawn fpawn, vector HitLocation)
{
	if(LambController(fpawn.Controller) != None)
	{
		LambController(fpawn.Controller).BodyJuiceSquirtedOnMe(P2Pawn(MyOwner), true);
	}
}

///////////////////////////////////////////////////////////////////////////
// Don't make them dirty things or put out fires.. it's too confusing
// and people won't get it
///////////////////////////////////////////////////////////////////////////
function int FeederHitActor(Actor Other, vector HitLocation, vector HitNormal,
						vector FeederStart, vector FeederEnd, float DeltaTime)
{
	return 0;
}

///////////////////////////////////////////////////////////////////////////
// Too costly for very little gain
///////////////////////////////////////////////////////////////////////////
function HittingOwner(vector Dir)
{
}

///////////////////////////////////////////////////////////////////////////
// Make the emitter shoot out of Rotation
///////////////////////////////////////////////////////////////////////////
simulated function SetDir(vector newloc, vector startdir, optional float velmag, optional bool bInitArc)
{
	local int i;
	local vector dir;
	local float addzmag, usevelmag;
	local vector ownervel;
	local coords checkcoords; // Change by NickP: MP fix

	// Change by NickP: MP fix
	if(Level.NetMode != NM_Standalone && HeadOwner != None && !HeadOwner.bDeleteMe)
	{
		checkcoords = HeadOwner.GetBoneCoords('lower_lip');
		SetLocation(checkcoords.Origin);
		newloc = checkcoords.Origin;
		startdir = checkcoords.YAxis;
	}
	// End

	// Save our collision location each time--could be different than our visual location
	CollisionStart = newloc;

	dir = Normal(startdir);

	// find a factor of how inline with velocity motion, this direction is
	usevelmag = VSize(MyOwner.Velocity);
	if(usevelmag > 0)
		addzmag = ((VEL_Z_DOT_PLUS*(MyOwner.Velocity Dot dir))/usevelmag);
	else
		addzmag = 0;
	addzmag+= InitialSpeedZPlus;
	
	ownervel = -0.8*MyOwner.Velocity;//VSize(MyOwner.Velocity)*(vector(StartRotation + rotator(MyOwner.Velocity)));
	// record velocity for collision particles
	CollisionVelocity = InitialPourSpeed*dir - ownervel;
	CollisionVelocity.z+= addzmag;

	for(i=0; i<Emitters.length; i++)
	{
		Emitters[i].StartVelocityRange.X.Max = 	InitialPourSpeed*dir.x + -ownervel.x ;
		Emitters[i].StartVelocityRange.X.Min = 	Emitters[i].StartVelocityRange.X.Max;
		Emitters[i].StartVelocityRange.Y.Max = 	InitialPourSpeed*dir.y + -ownervel.y ;
		Emitters[i].StartVelocityRange.Y.Min = 	Emitters[i].StartVelocityRange.Y.Max;
		Emitters[i].StartVelocityRange.Z.Max = 	InitialPourSpeed*dir.z + -ownervel.z + addzmag;
		Emitters[i].StartVelocityRange.Z.Min = 	Emitters[i].StartVelocityRange.Z.Max;
	}
	
	if(Emitters.Length > 1)
	{
		Emitters[1].StartVelocityRange.X.Max += (SpeedVariance);
		Emitters[1].StartVelocityRange.X.Min -= (SpeedVariance);
		Emitters[1].StartVelocityRange.Y.Max += (SpeedVariance);
		Emitters[1].StartVelocityRange.Y.Min -= (SpeedVariance);
		Emitters[1].StartVelocityRange.Z.Max += (SpeedVariance);
		Emitters[1].StartVelocityRange.Z.Min -= (SpeedVariance);
	}

	if(bInitArc)
		EstimateArc();
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
function ToggleFlow(float TimeToStop, bool bIsOn)
{
	//log(self@"toggle flow",'Debug');
	if(!bIsOn)
		AmbientSound=None;

	Super.ToggleFlow(TimeToStop, bIsOn);
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
// starting up
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
auto simulated state Starting
{
	ignores CheckForFluidHit;

	simulated function Timer()
	{
		AmbientSound=SplashingSound;

		Super.Timer();
	}
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
// fading out
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
state Dying
{
	ignores Tick;

	function Timer()
	{
		//SeverLinks();
		//log("KILLING THIS FEEDER "$self);
		Destroy();
	}

	function BeginState()
	{
		SetTimer(2.0, false); // time to kill off this actor
	}
}


// Decompiled with UE Explorer.
defaultproperties
{
    SplashingSound=Sound'MiscSounds.People.vomit_loop'
    InitialPourSpeed=300.0000000
    InitialSpeedZPlus=0.0000000
    ArcMax=5
    SplashClass=Class'PukeSplashEmitter'
    TrailClass=Class'PukeTrail'
    TrailStarterClass=Class'PukeTrailStarter'
    PuddleClass=Class'pukepuddle'
    TimeToMakePuddle=0.1000000
    MyType=4
    Emitters[0]=StripEmitter'StripEmitter35'
    Emitters[1]=SpriteEmitter'SpriteEmitter181'
    LifeSpan=8.0000000
}