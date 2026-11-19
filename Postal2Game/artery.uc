//=============================================================================
// artery.
//=============================================================================
class artery extends P2Emitter;

// external 
var() int NumPumps; // 0 for infinite pumps

// internal
var int StartZRangeMax;
var int StartZRangeMin;
var int StartMaxParticles;
var int StartParticlesPerSecond;
var int ZRangeDelta;
var int ZRangeMinBeforeChange;

function PostBeginPlay()
{
	// Don't call super
	ZRangeDelta = Emitters[0].StartVelocityRange.Z.Max/15;
	ZRangeMinBeforeChange = Emitters[0].StartVelocityRange.Z.Max/2;

	StartMaxParticles = Emitters[0].MaxParticles;
	StartParticlesPerSecond = Emitters[0].ParticlesPerSecond;
	StartZRangeMax = Emitters[0].StartVelocityRange.Z.Max;
	StartZRangeMin = Emitters[0].StartVelocityRange.Z.Min;
}

auto state PumpingHigh
{
	function Timer()
	{
		Emitters[0].StartVelocityRange.Z.Max -= ZRangeDelta;
		Emitters[0].StartVelocityRange.Z.Min -= ZRangeDelta; 
		if(Emitters[0].StartVelocityRange.Z.Min < ZRangeMinBeforeChange)
			GotoState('PumpingWait');
	}
	function BeginState()
	{
		SetTimer(0.1, true);
//		Emitters[0].MaxParticles=StartMaxParticles;
		Emitters[0].ParticlesPerSecond=StartParticlesPerSecond;
		Emitters[0].InitialParticlesPerSecond=StartParticlesPerSecond;
		Emitters[0].StartVelocityRange.Z.Max=StartZRangeMax;
		Emitters[0].StartVelocityRange.Z.Min=StartZRangeMin;
	}
}
/*
state PumpingLow
{
	function Timer()
	{
		Emitters[0].StartVelocityRange.Z.Max-=50;//700;
		Emitters[0].StartVelocityRange.Z.Min-=50;//650;
		if(Emitters[0].StartVelocityRange.Z.Min < 500)
			GotoState('PumpingWait');
	}
	function BeginState()
	{
		SetTimer(0.3, true);
//		Emitters[0].ParticlesPerSecond=15;
//		Emitters[0].InitialParticlesPerSecond=15;
//		Emitters[0].AutomaticInitialSpawning=true;
	}
}
*/

state PumpingWait
{
	function Timer()
	{
		GotoState('PumpingHigh');
		// if you're not supposed to pump an infinite number of times then decrement each time you finish
		if(NumPumps > 0)
		{
			NumPumps--;
			// out of pumps, get rid of the thing
			if(NumPumps <= 0)
				Destroy();
		}
	}
	function BeginState()
	{
		SetTimer(0.3, false);
		// turn off the emitter for a small period of time
//		Emitters[0].MaxParticles=1;
		Emitters[0].ParticlesPerSecond=0;
		Emitters[0].InitialParticlesPerSecond=Emitters[0].ParticlesPerSecond;
	}
}


// Decompiled with UE Explorer.
defaultproperties
{
    Emitters[0]=SpriteEmitter'SpriteEmitter256'
    AutoDestroy=true
    Physics=10
    RemoteRole=0
}