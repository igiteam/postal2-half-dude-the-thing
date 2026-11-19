///////////////////////////////////////////////////////////////////////////////
// CowFinishDust
///////////////////////////////////////////////////////////////////////////////
class CowFinishDust extends P2Emitter;

const DUST_RANGE	= 50;

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
function SetVel(vector vel)
{
	if(Emitters.Length > 0)
	{
		Emitters[0].StartVelocityRange.X.Min = vel.x - DUST_RANGE;
		Emitters[0].StartVelocityRange.X.Max = vel.x + DUST_RANGE;
		Emitters[0].StartVelocityRange.Y.Min = vel.y - DUST_RANGE;
		Emitters[0].StartVelocityRange.Y.Max = vel.y + DUST_RANGE;
		//Emitters[0].StartVelocityRange.Z.Min = vel.z;
		//Emitters[0].StartVelocityRange.Z.Max = vel.z + DUST_RANGE;
	}
}


// Decompiled with UE Explorer.
defaultproperties
{
    Emitters[0]=SpriteEmitter'SpriteEmitter97'
    AutoDestroy=true
}