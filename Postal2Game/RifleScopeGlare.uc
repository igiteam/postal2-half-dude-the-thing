///////////////////////////////////////////////////////////////////////////////
// RifleScopeGlare
// 
// Glare from the sniper rifle scope in third person.
// 
///////////////////////////////////////////////////////////////////////////////
class RifleScopeGlare extends P2Emitter;

simulated function PostNetBeginPlay()
{
	local int i;

	Super.PostNetBeginPlay();

	// Don't make this effect on the client's machine that created it (so he's
	// not blinded by his own effect)
	if(Owner!= None
		&& Owner.Owner != None
		&& Owner.Owner.Owner != None
		&& ViewPort(PlayerController(Owner.Owner.Owner).Player) != None)
	{
		for(i=0; i<Emitters.Length; i++)
			Emitters[i].Disabled=true;
	}
}


// Decompiled with UE Explorer.
defaultproperties
{
    Emitters[0]=SpriteEmitter'SpriteEmitter58'
    Emitters[1]=SpriteEmitter'SpriteEmitter10'
    AutoDestroy=true
    bTrailerSameRotation=true
    bReplicateMovement=true
    Physics=10
    LifeSpan=3.0000000
    Mass=-80.0000000
}