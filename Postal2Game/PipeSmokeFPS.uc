///////////////////////////////////////////////////////////////////////////////
// PipeSmokeFPS
// 
// Smoke from a smoking pipe to be seen in first person
//
///////////////////////////////////////////////////////////////////////////////
class PipeSmokeFPS extends P2Emitter;

const START_OFFSET = 20.0;
const SPEED_MAG = 20.0;
const SPEED_ADD = 3.0;

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
function SetDirection(vector addspeed, float pheight)
{
	local vector usedir, usevel;

	usedir = vector(Rotation);

	Emitters[0].StartLocationOffset = START_OFFSET*usedir;
	Emitters[0].StartLocationOffset.z += pheight;
	usevel = SPEED_MAG*usedir;
	Emitters[0].StartVelocityRange.X.Max = usevel.x + SPEED_ADD + addspeed.x;
	Emitters[0].StartVelocityRange.X.Min = usevel.x - SPEED_ADD + addspeed.x;
	Emitters[0].StartVelocityRange.Y.Max = usevel.y + SPEED_ADD + addspeed.y;
	Emitters[0].StartVelocityRange.Y.Min = usevel.y - SPEED_ADD + addspeed.y;
	Emitters[0].StartVelocityRange.Z.Max = usevel.z + SPEED_ADD + addspeed.z;
	Emitters[0].StartVelocityRange.Z.Min = usevel.z - SPEED_ADD + addspeed.z;
}

function TintIt(vector Tinting)
{
	local int i, j;

	for(i=0; i<Emitters.Length; i++)
	{
		Emitters[i].UseColorScale=True;

		for(j=0; j<Emitters[i].ColorScale.Length; j++)
		{
			Emitters[i].ColorScale[j].Color.R=Tinting.x;
			Emitters[i].ColorScale[j].Color.G=Tinting.y;
			Emitters[i].ColorScale[j].Color.B=Tinting.z;
		}
	}
}


// Decompiled with UE Explorer.
defaultproperties
{
    Emitters[0]=SpriteEmitter'SpriteEmitter37'
    AutoDestroy=true
}