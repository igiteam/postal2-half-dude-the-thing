//=============================================================================
// ChemHurtEmitter.
//=============================================================================
class ChemHurtEmitter extends P2Emitter;

const START_OFFSET = 20.0;
const SPEED_MAG = 30.0;
const SPEED_ADD = 15.0;

///////////////////////////////////////////////////////////////////////////////
// Dir here is our additional velocity
///////////////////////////////////////////////////////////////////////////////
function SetDirection(vector Dir, float Dist)
{
	local vector usedir, usevel;
	local int i;

	usedir = vector(Rotation);

	for(i=0; i<Emitters.Length; i++)
	{
		Emitters[i].StartLocationOffset = START_OFFSET*usedir;
		Emitters[i].StartVelocityRange.X.Max += Dir.x;
		Emitters[i].StartVelocityRange.X.Min += Dir.x;
		Emitters[i].StartVelocityRange.Y.Max += Dir.y;
		Emitters[i].StartVelocityRange.Y.Min += Dir.y;
		Emitters[i].StartVelocityRange.Z.Max += Dir.z;
		Emitters[i].StartVelocityRange.Z.Min += Dir.z;
	}
}


// Decompiled with UE Explorer.
defaultproperties
{
    Emitters[0]=SuperSpriteEmitter'SuperSpriteEmitter6'
    Emitters[1]=SuperSpriteEmitter'SuperSpriteEmitter207'
    AutoDestroy=true
}