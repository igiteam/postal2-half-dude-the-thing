///////////////////////////////////////////////////////////////////////////////
// FirePillar
// 
// Fire comes from an outside ring and forms into a quick pillar
//
///////////////////////////////////////////////////////////////////////////////
class FirePillar extends P2Emitter;

var float BallHeight;

const BALL_SIZE	= 100;	// average radius of the actual fireball

///////////////////////////////////////////////////////////////////////////////
// Look for a ceiling above us, and squish ourselves if there is one
///////////////////////////////////////////////////////////////////////////////
function CheckCeiling(vector UseNormal)
{
	local Actor HitActor;
	local vector HitLocation, HitNormal, endp;
	local float rat;

	// move away from the wall/ground a little
	endp = Location;
	endp.z += (BallHeight + BALL_SIZE);
	// Do check
	HitActor = Trace(HitLocation, HitNormal, endp, Location, true);
	// If you hit something, then stop there
	if(HitActor != None)
	{
		BallHeight = (HitLocation.z - Location.z) - BALL_SIZE;
		if(BallHeight < BALL_SIZE) 
			BallHeight = BALL_SIZE;
		rat = BallHeight/default.BallHeight;
		Emitters[0].StartVelocityRange.Z.Max*=rat;
		Emitters[0].StartVelocityRange.Z.Min*=rat;
	}
}


// Decompiled with UE Explorer.
defaultproperties
{
    BallHeight=250.0000000
    Emitters[0]=SuperSpriteEmitter'SuperSpriteEmitter14'
    AutoDestroy=true
}