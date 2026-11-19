///////////////////////////////////////////////////////////////////////////////
// SmokePuddleCeiling. 
// Emits on the ceiling above a SmokePuddle
///////////////////////////////////////////////////////////////////////////////
class SmokePuddleCeiling extends SmokeEmitter;

var	int		OrigLifeSpan;

const EMISSION_RATIO = 0.10;
const PARTICLE_RATIO = 0.23;
const MIN_PARTICLE_USE=10;

replication
{
	// functions server sends to client
	unreliable if(Role == ROLE_Authority)
		ClientSquishZ;
}

///////////////////////////////////////////////////////////////////////////////
// A wall has been detected in a certain direction, restrict spawning in that dir
///////////////////////////////////////////////////////////////////////////////
function InitialWallHitX(float X)
{
	if(X > 0)
	{
		Emitters[0].StartLocationRange.X.Max = 0;
		Emitters[0].StartVelocityRange.X.Max = 0;
	}
	else
	{
		Emitters[0].StartLocationRange.X.Min = 0;
		Emitters[0].StartVelocityRange.X.Min = 0;
	}
}
function InitialWallHitY(float Y)
{
	if(Y > 0)
	{
		Emitters[0].StartLocationRange.Y.Max = 0;
		Emitters[0].StartVelocityRange.Y.Max = 0;
	}
	else
	{
		Emitters[0].StartLocationRange.Y.Min = 0;
		Emitters[0].StartVelocityRange.Y.Min = 0;
	}
}

function PrepSize(float UseRadius)
{
	local float count;

	count = UseRadius*PARTICLE_RATIO;
	count+=MIN_PARTICLE_USE;
	// Decrease smoke detail 
	count = P2GameInfo(Level.Game).ModifyBySmokeDetail(count);
	ClientPrepSize(UseRadius, count);
}

simulated function ClientPrepSize(float UseRadius, float count)
{
	Emitters[0].SphereRadiusRange.Max = UseRadius;
	if(count != 0)
	{
		SuperSpriteEmitter(Emitters[0]).SetMaxParticles(count);
		Emitters[0].ParticlesPerSecond = Emitters[0].MaxParticles*EMISSION_RATIO;
		if(Emitters[0].ParticlesPerSecond < 0)
			Emitters[0].ParticlesPerSecond=1;
		Emitters[0].InitialParticlesPerSecond = Emitters[0].ParticlesPerSecond;
		SuperSpriteEmitter(Emitters[0]).LocationShapeExtend=PTLSE_Circle;
		WindCheckDist = 3*UseRadius;
		//log("set WindCheckDist to "$WindCheckDist);
		CheckWallsForWind();
	}
	else
		Emitters[0].Disabled=true;
}

simulated function ClientSquishZ(float newz)
{
	Emitters[0].StartLocationRange.Z.Min = newz;
}


// Decompiled with UE Explorer.
defaultproperties
{
    Emitters[0]=SuperSpriteEmitter'SuperSpriteEmitter210'
    AutoDestroy=true
    LifeSpan=30.0000000
}