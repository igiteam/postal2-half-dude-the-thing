///////////////////////////////////////////////////////////////////////////////
// BossMilkTrail 
// 
// goes with bossmilkprojectile
///////////////////////////////////////////////////////////////////////////////
class BossMilkTrail extends P2Emitter;

const LONG_STREAM_INDEX = 2;
const STREAM_RANGE = 5;

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
function UpdateLongStream(vector vel)
{
	if(Emitters.Length > LONG_STREAM_INDEX)
	{
		Emitters[LONG_STREAM_INDEX].StartVelocityRange.X.Max=vel.x + STREAM_RANGE;
		Emitters[LONG_STREAM_INDEX].StartVelocityRange.X.Min=vel.x - STREAM_RANGE;
		Emitters[LONG_STREAM_INDEX].StartVelocityRange.Y.Max=vel.y + STREAM_RANGE;
		Emitters[LONG_STREAM_INDEX].StartVelocityRange.Y.Min=vel.y - STREAM_RANGE;
		Emitters[LONG_STREAM_INDEX].StartVelocityRange.Z.Max=vel.z + STREAM_RANGE;
		Emitters[LONG_STREAM_INDEX].StartVelocityRange.Z.Min=vel.z - STREAM_RANGE;
	}
}


// Decompiled with UE Explorer.
defaultproperties
{
    Emitters[0]=SpriteEmitter'SpriteEmitter33'
    Emitters[1]=SpriteEmitter'SpriteEmitter100'
    Emitters[2]=SpriteEmitter'SpriteEmitter34'
    AutoDestroy=true
    bTrailerSameRotation=true
    bReplicateMovement=true
    Physics=10
    LifeSpan=25.0000000
}