class HeadStartBlast extends P2Emitter;


const BURN_TIME = 4.0;

auto simulated state Burning
{
	// Change by NickP: MP fix
	simulated function BeginState()
	{
		Super.BeginState();
		if (Role < ROLE_Authority)
		{
			SelfDestroy();
		}
	}
	// End

Begin:
	Sleep(BURN_TIME);
	SelfDestroy();
}


// Decompiled with UE Explorer.
defaultproperties
{
    Emitters[0]=SpriteEmitter'SpriteEmitter89'
    Emitters[1]=SpriteEmitter'SpriteEmitter88'
    AutoDestroy=true
    AmbientSound=Sound'LevelSoundsToo.Napalm.napalmBallRoll'
    SoundRadius=600.0000000
    SoundVolume=200
    SoundPitch=1
    TransientSoundVolume=100.0000000
    TransientSoundRadius=600.0000000
}