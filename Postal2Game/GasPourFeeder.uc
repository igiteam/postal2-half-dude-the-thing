///////////////////////////////////////////////////////////////////////////
// Feeder that attaches to other objects to be poured out (like a gas tank)
///////////////////////////////////////////////////////////////////////////
class GasPourFeeder extends FluidPourFeederMP;//FluidPourFeeder;

///////////////////////////////////////////////////////////////////////////
// The fluid is hitting a pawn. 
///////////////////////////////////////////////////////////////////////////
function HittingPawn(FPSPawn fpawn, vector HitLocation)
{
	local LambController lambc;

	lambc = LambController(fpawn.Controller);

	// Only happens if guy is still alive
	if(lambc != None)
	{
		// Set me to dripping in gas
		lambc.HitWithFluid(MyType, HitLocation);
		// Tells them they're being splashed with gasoline
		lambc.GettingDousedInGas(P2Pawn(MyOwner));
	}

	// Sets them to flammable, dead or alive
	fpawn.bExtraFlammable = true;
}

///////////////////////////////////////////////////////////////////////////
// Feeder hit an actor other than a puddle
// Check to see if you hit some fire
///////////////////////////////////////////////////////////////////////////
function int FeederHitActor(Actor Other, vector HitLocation, vector HitNormal,
						vector FeederStart, vector FeederEnd, float DeltaTime)
{
	if(P2PowerupPickup(Other) != None)		// if it hits a pickup, then taint it
	{
		P2PowerupPickup(Other).Taint();
	}
	else if(PeoplePart(Other) != None)
	{
		PeoplePart(Other).HitByGas();
	}

	return 0;
}

///////////////////////////////////////////////////////////////////////////
// Manually check if you're hitting you're owner, since Trace won't let you
// and we can do it more cheaply. 
// Trace checks to not hit the owner, and besides, we don't need that
// sort of accurate collision for this
// Do this by checking direction of pouring
// This is merely for DETECTION of the collision, not for the splashing and all
///////////////////////////////////////////////////////////////////////////
function HittingOwner(vector Dir)
{
	local P2Player pplayer;
	local P2Pawn p2p;
	local vector toppos;

	p2p = P2Pawn(MyOwner);

	if(p2p != None)
	{
		// If it's getting poured/pushed upwards, then it's going to fall back
		// down and hit the owner
		if(Dir.z > UpwardsZMin)
		{
			toppos = p2p.Location;
			toppos.z += p2p.CollisionRadius;

			if(LambController(p2p.Controller) != None)
				HittingPawn(p2p, toppos);
			else
			{
				pplayer = P2Player(p2p.Controller);
				if(pplayer != None)
					pplayer.DousedHimselfInGas();
			}
		}
	}
}


// Decompiled with UE Explorer.
defaultproperties
{
    InitialPourSpeed=300.0000000
    InitialSpeedZPlus=100.0000000
    SpeedVariance=0.0000000
    bCanHitActors=true
    MomentumTransfer=0.3000000
    SplashClass=Class'GasSplashEmitterMed'
    TrailClass=Class'GasTrail'
    TrailStarterClass=Class'GasTrailStarter'
    PuddleClass=Class'GasPuddle'
    MyType=1
    Quantity=80.0000000
    Emitters[0]=StripEmitter'StripEmitter38'
    Emitters[1]=SpriteEmitter'SpriteEmitter2'
    Emitters[2]=SpriteEmitter'SpriteEmitter186'
    AutoDestroy=true
    bCollideActors=true
}