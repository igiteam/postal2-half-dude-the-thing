///////////////////////////////////////////////////////////////////////////////
// Chunks that rain down after a cow's head blows up. The first emitter has
// a range high up, the second one is the splats the pieces make
///////////////////////////////////////////////////////////////////////////////
class CowHeadChunkFall extends P2Emitter;

const Z_CHECK	= 630;
const Z_BUFFER	= 30;
const Z_MIN		= 200;

///////////////////////////////////////////////////////////////////////////////
// Reach up and find a ceiling if there is one
// If so, move the emitter range up to that, the one that drops the big
// chunks
///////////////////////////////////////////////////////////////////////////////
function bool SetupHeight()
{
	local Actor HitActor;
	local vector HitLocation, HitNormal, checkpoint;
	local float offz;

	checkpoint = Location;
	checkpoint.z+=Z_CHECK;

	HitActor = Trace(HitLocation, HitNormal, checkpoint, Location);
	if(HitActor == None)
		HitLocation = checkpoint;
	// move down from 'ceiling'
	HitLocation.z -= Z_BUFFER;
	offz = HitLocation.z - Location.z;
	if(offz > Z_MIN)
	{
		// Move first emitter range up
		if(Emitters.Length > 0)
		{
			Emitters[0].StartLocationOffset.Z+=offz;
		}
		return true;
	}
	return false;
}


// Decompiled with UE Explorer.
defaultproperties
{
    Emitters[0]=MeshEmitter'MeshEmitter1'
    Emitters[1]=SpriteEmitter'SpriteEmitter123'
    AutoDestroy=true
    LifeSpan=20.0000000
}