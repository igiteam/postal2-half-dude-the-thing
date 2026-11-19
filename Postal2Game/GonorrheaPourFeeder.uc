///////////////////////////////////////////////////////////////////////////
// Feeder that attaches to other objects to be poured out
///////////////////////////////////////////////////////////////////////////
class GonorrheaPourFeeder extends UrinePourFeeder;

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
		// Set me to dripping in pee
		lambc.HitWithFluid(MyType, HitLocation);

		// True at the end, will ensure that everyone hit by this will 
		// throw up, if they can.
		lambc.BodyJuiceSquirtedOnMe(P2Pawn(MyOwner), true);
	}

	if(fpawn.MyBodyFire != None)
	{
		MakeSteam();
		MySteam.SetLocation(HitLocation);

		// Put out the fire
		fpawn.MyBodyFire.TakeDamage
		(
			PAWN_PUT_OUT*Quantity,
			Pawn(MyOwner),
			HitLocation,
			vect(0, 0, 0),
			class'ExtinguishDamage'
		);
	}
}

///////////////////////////////////////////////////////////////////////////
// No variance in gonorrhea
///////////////////////////////////////////////////////////////////////////
function VaryStream(float DeltaTime)
{
}


// Decompiled with UE Explorer.
defaultproperties
{
    QuantityPerHit=10.0000000
    SplashClass=Class'PukeSplashEmitter'
    TrailClass=Class'PukeTrail'
    TrailStarterClass=Class'PukeTrailStarter'
    PuddleClass=Class'pukepuddle'
    TimeToMakePuddle=0.1000000
    MyType=6
    Quantity=40.0000000
    Emitters[0]=StripEmitter'StripEmitter32'
    Emitters[1]=SpriteEmitter'SpriteEmitter178'
}