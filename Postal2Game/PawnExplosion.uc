class PawnExplosion extends CatExplosion;


simulated function PostNetBeginPlay()
{
	local int i;

	Super.PostNetBeginPlay();

	// We don't want this to run on the server, but we can't
	// destroy it here because the client version will then never
	// get made, so we just turn it off,and the lifespan will clean
	// it up
	if(Level.NetMode == NM_DedicatedServer)
	{
		for(i=0; i<Emitters.Length; i++)
		{
			Emitters[i].Disabled=true;
		}
	}
}


// Decompiled with UE Explorer.
defaultproperties
{
    Emitters[0]=SpriteEmitter'SpriteEmitter245'
    Emitters[1]=MeshEmitter'MeshEmitter12'
    Emitters[2]=SpriteEmitter'SpriteEmitter246'
    LifeSpan=6.0000000
}