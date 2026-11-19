///////////////////////////////////////////////////////////////////////////////
// TrailingFireEmitter
// 
// fire particles just time out, they don't move.. trailer does the moving
//
///////////////////////////////////////////////////////////////////////////////
class TrailingFireEmitter extends P2Emitter;
/*
const WAIT_TIME = 5.0;

function Timer()
{
	if(!AutoDestroy)
	{
		AutoDestroy=true;
		// Stop the emitter from emitting
		if(Emitters[0] != None)
		{
			Emitters[0].RespawnDeadParticles=False;
			Emitters[0].ParticlesPerSecond=0;
		}
	}
}

auto state Burn
{
Begin:
	SetTimer(LifeSpan - WAIT_TIME, false);
}
*/

// Decompiled with UE Explorer.
defaultproperties
{
    Emitters[0]=SpriteEmitter'SpriteEmitter13'
    Physics=10
    LifeSpan=20.0000000
}