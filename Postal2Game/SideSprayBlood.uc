///////////////////////////////////////////////////////////////////////////////
// SideSprayBlood
///////////////////////////////////////////////////////////////////////////////
class SideSprayBlood extends P2Emitter;

const SPRAY_SPEED		= 400;
const SPRAY_SPEED_RAND	= 80;
const SPRAY_INDEX		=	0;
const LINE_RANGE		= 50;

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
function SetSpray(vector dir)
{
	local vector umin, umax;

	umax = (SPRAY_SPEED + Rand(SPRAY_SPEED_RAND))*dir;
	umin = (SPRAY_SPEED)*dir;

	// Only give a direction to the first group
	Emitters[SPRAY_INDEX].StartVelocityRange.X.Max=umax.x;
	Emitters[SPRAY_INDEX].StartVelocityRange.Y.Max=umax.y;
	Emitters[SPRAY_INDEX].StartVelocityRange.Z.Max+=umax.z;
	Emitters[SPRAY_INDEX].StartVelocityRange.X.Min=umin.x;
	Emitters[SPRAY_INDEX].StartVelocityRange.Y.Min=umin.y;
	Emitters[SPRAY_INDEX].StartVelocityRange.Z.Min+=umin.z;
	// Make the spray happen over a line instead of just a point
	SuperSpriteEmitter(Emitters[SPRAY_INDEX]).LineStart = Location - LINE_RANGE*dir;
	SuperSpriteEmitter(Emitters[SPRAY_INDEX]).LineEnd = Location + LINE_RANGE*dir;
}


// Decompiled with UE Explorer.
defaultproperties
{
    Emitters[0]=SuperSpriteEmitter'SuperSpriteEmitter66'
    Emitters[1]=SpriteEmitter'SpriteEmitter17'
    Emitters[2]=SpriteEmitter'SpriteEmitter10'
    AutoDestroy=true
    SoundRadius=20.0000000
    SoundVolume=80
    SoundPitch=128
}