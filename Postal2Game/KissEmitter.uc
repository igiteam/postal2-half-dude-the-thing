///////////////////////////////////////////////////////////////////////////////
// KissEmitter
// Smoochy smoochy stuff for valentines day <3
///////////////////////////////////////////////////////////////////////////////
class KissEmitter extends P2Emitter;

var() sound KissSound;

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
auto state Exploding
{
Begin:
	PlaySound(KissSound,,1.0,,,GetRandPitch(),true);
	Sleep(1.5);
	GotoState('Fading');
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
state Fading
{
	event BeginState()
	{
		local int i;
		
		for (i=0; i<Emitters.Length; i++)
		{
			Emitters[i].ParticlesPerSecond=0;
			Emitters[i].InitialParticlesPerSecond=0;
		}
	}
	
Begin:
	Sleep(1.0);
	Destroy();
}


// Decompiled with UE Explorer.
defaultproperties
{
    KissSound=Sound'MiscSounds.People.Kissing'
    Emitters[0]=SpriteEmitter'PinkFX2'
    Emitters[1]=SpriteEmitter'HeartsFX2'
    AutoDestroy=true
}