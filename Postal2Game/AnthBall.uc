//=============================================================================
// Persitant, small cloud of deadly gas, that doesn't get blown away by wind
//=============================================================================
class AnthBall extends Anth;

state WaitAndFade
{
	ignores Timer, Tick;
	// Don't hurt stuff here, in this state
	simulated function BeginState()
	{
		local int i;
		for(i=0; i<Emitters.length; i++)
		{
			AutoDestroy=true;
			Emitters[i].ParticlesPerSecond=0;
			Emitters[i].RespawnDeadParticles=false;
		}
	}
}


// Decompiled with UE Explorer.
defaultproperties
{
    DamageDistMag=50.0000000
    Emitters[0]=SpriteEmitter'SpriteEmitter193'
    AutoDestroy=true
    bTrailerSameRotation=true
    bReplicateMovement=true
    Physics=10
    LifeSpan=200.0000000
    CollisionRadius=50.0000000
    CollisionHeight=50.0000000
}