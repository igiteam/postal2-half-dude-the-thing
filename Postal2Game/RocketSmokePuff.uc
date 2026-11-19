///////////////////////////////////////////////////////////////////////////////
// RocketSmokePuff
// 
// Puff to occur when rocket has problems or spurts
///////////////////////////////////////////////////////////////////////////////
class RocketSmokePuff extends P2Emitter;

///////////////////////////////////////////////////////////////////////////////
// Scale the effect down or down
///////////////////////////////////////////////////////////////////////////////
function ScaleEffect(float UseScale)
{
	local int i;

	for(i=0; i<Emitters.Length; i++)
	{
		// scale size
		Emitters[i].StartSizeRange.X.Min*=UseScale;
		Emitters[i].StartSizeRange.X.Max*=UseScale;
		// scale time
		Emitters[i].LifetimeRange.Min*=UseScale;
		Emitters[i].LifetimeRange.Max*=UseScale;
		// velocity
		Emitters[i].StartVelocityRange.X.Min*=UseScale;
		Emitters[i].StartVelocityRange.X.Max*=UseScale;
		Emitters[i].StartVelocityRange.Y.Min*=UseScale;
		Emitters[i].StartVelocityRange.Y.Max*=UseScale;
		Emitters[i].StartVelocityRange.Z.Min*=UseScale;
		Emitters[i].StartVelocityRange.Z.Max*=UseScale;
	}
}


// Decompiled with UE Explorer.
defaultproperties
{
    Emitters[0]=SpriteEmitter'SpriteEmitter21'
    AutoDestroy=true
}