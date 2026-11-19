///////////////////////////////////////////////////////////////////////////////
// MolotovBreak
// 
// Fire and glass effects for start of molotov breaking
//
///////////////////////////////////////////////////////////////////////////////
class MolotovBreak extends P2Emitter;

const VEL_MAX			=   300;

function FitToNormal(vector HNormal)
{
	Emitters[0].StartVelocityRange.X.Max=(HNormal.x+1)*VEL_MAX;
	Emitters[0].StartVelocityRange.X.Min=(HNormal.x-1)*VEL_MAX;
	Emitters[0].StartVelocityRange.Y.Max=(HNormal.y+1)*VEL_MAX;
	Emitters[0].StartVelocityRange.Y.Min=(HNormal.y-1)*VEL_MAX;
	Emitters[0].StartVelocityRange.Z.Max=(HNormal.z+1)*VEL_MAX;
	Emitters[0].StartVelocityRange.Z.Min=(HNormal.z-1)*VEL_MAX;
}


// Decompiled with UE Explorer.
defaultproperties
{
    Emitters[0]=SpriteEmitter'SpriteEmitter40'
    AutoDestroy=true
}