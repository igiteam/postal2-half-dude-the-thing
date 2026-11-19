///////////////////////////////////////////////////////////////////////////////
// SizableWoof is a FireWoof. (mushroom cloud of fire that makes the sound 'WOOF')
//
// that can be comfortably sized for different explosions (like for cars and barrels and kactors)
//
///////////////////////////////////////////////////////////////////////////////
class SizeableWoof extends FireWoof;

const PARTICLE_MAX_RATIO = 0.45;
const RADIUS_MAX_RATIO	 = 0.7;

function SetSize(float Radius)
{
	local float newmax;
	local float userad;

	newmax = Radius*PARTICLE_MAX_RATIO;
	userad = Radius*RADIUS_MAX_RATIO;
	// Decrease fire detail 
	newmax = P2GameInfo(Level.Game).ModifyByFireDetail(newmax);
	SuperSpriteEmitter(Emitters[0]).SetMaxParticles(newmax);
	Emitters[0].InitialParticlesPerSecond = 4*Emitters[0].MaxParticles;
	Emitters[0].StartLocationRange.X.Max = userad;
	Emitters[0].StartLocationRange.X.Min = -userad;
	Emitters[0].StartLocationRange.Y.Max = userad;
	Emitters[0].StartLocationRange.Y.Min = -userad;
//	Emitters[0].StartLocationRange.Z.Max += Radius/8;
}


// Decompiled with UE Explorer.
defaultproperties
{
    Emitters[0]=SuperSpriteEmitter'SuperSpriteEmitter208'
}