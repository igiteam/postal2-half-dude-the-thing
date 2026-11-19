//=============================================================================
// FireStarterFeeder
//=============================================================================
class FireStarterFeeder extends FireStarterFollow;
// Fire starter specifically for a feeder

var int ArcIndex;
const VEL_MAG = 900;

function Tick(float DeltaTime)
{
	local vector v1;
	local FluidPosFeeder fposf;

	// check to stop the flame if it hasn't been stopped yet
	if(GasSource != None)
	{
		fposf = FluidPosFeeder(GasSource);
		//log("my loc "$Location);
		//log("gas type "$GasSource);
		//log("gas loc "$ff.ArcPos[ff.LastArcIndex]);
		v1 = fposf.ArcPos[fposf.LastArcIndex] - Location;
		Velocity = VEL_MAG*Normal(v1);
		//log("new vel "$Velocity);
		if(VSize(v1) < CollisionRadius)
		{
			//log("killing gassource");
			fposf.Exploding(Location);
			StopStarter(true);
		}
	}
	Super.Tick(DeltaTime);
}

function Destroyed()
{
	TriggerNextPuddle();
	Super.Destroyed();
}

function TriggerNextPuddle()
{
	// STUB OUT  because we don't want it any more (use 'ignore'??)
}

function StopStarter(bool TriggerNext)
{
	if(AutoDestroy == false)
	{
		log("stop starter feeder ");
		LifeSpan = WAIT_TIME;
		Super.StopStarter(TriggerNext);
	}
}
/*
simulated event RenderOverlays( canvas Canvas )
{

	//local vector endline;
	local color tempcolor;

		// show collision radius
		//endline = Location + vect(200, 0, 200);
		tempcolor.G=255;
		Canvas.DrawColor = tempcolor;
		Canvas.Draw3Circle(Location, CollisionRadius*10*FRand(), 0);
		//log("damage dist "$DamageDistMag);
		//Location, endline, 0);
}
*/


// Decompiled with UE Explorer.
defaultproperties
{
    SpawnClass=Class'FireStreak'
    Emitters[0]=SuperSpriteEmitter'SuperSpriteEmitter217'
    LifeSpan=2000.0000000
    CollisionRadius=30.0000000
}