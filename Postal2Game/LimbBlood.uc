class LimbBlood extends P2Emitter;

// Change by NickP: MP fix
auto simulated state AutoStart
{
	simulated function BeginState()
	{
		Super.BeginState();
		if (Role < ROLE_Authority)
		{
			SelfDestroy(true);
			LifeSpan = 0.1;
		}
	}
}
// End

// Kamek edit
event Tick(float Delta)
{
//	log(self@"tick super");
	Super.Tick(Delta);
//	log(self@"tick; base is"@base@"owner is"@owner);
	if (Base == None || Owner == None)
	{
//		log(self@"destroying");
		SelfDestroy();
		Destroy();
	}
}


// Decompiled with UE Explorer.
defaultproperties
{
    Emitters[0]=SpriteEmitter'SpriteEmitter126'
    AutoDestroy=true
    Mass=-25.0000000
}