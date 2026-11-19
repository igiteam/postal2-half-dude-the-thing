///////////////////////////////////////////////////////////////////////////
// Feeder that attaches to other objects to be poured out (like a gas tank)
///////////////////////////////////////////////////////////////////////////
class BloodPourFeeder extends UrinePourFeeder;


///////////////////////////////////////////////////////////////////////////
// Feeder hit an actor other than a puddle
// Check to see if you hit some fire
///////////////////////////////////////////////////////////////////////////
function int FeederHitActor(Actor Other, vector HitLocation, vector HitNormal,
						vector FeederStart, vector FeederEnd, float DeltaTime)
{
	// STUB, for speed purposes.
	return 0;
}


// Decompiled with UE Explorer.
defaultproperties
{
    QuantityPerHit=6.0000000
    SplashClass=Class'BloodSplashEmitter'
    TrailClass=Class'BloodTrail'
    TrailStarterClass=Class'BloodTrailStarter'
    PuddleClass=Class'BloodPuddle'
    MyType=3
    Quantity=20.0000000
    Emitters[0]=StripEmitter'StripEmitter28'
    Emitters[1]=SpriteEmitter'SpriteEmitter174'
}