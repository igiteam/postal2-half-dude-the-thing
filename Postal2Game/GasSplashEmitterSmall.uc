//=============================================================================
// Small gas splash for a stream of gasoline pouring on a surface
//=============================================================================
class GasSplashEmitterSmall extends FluidSplashEmitter;

const VEL_MAX		=   100;
const VEL_Z_MAX		=	80;

function FitToNormal(vector HNormal)
{
	Emitters[0].StartVelocityRange.X.Max=(HNormal.x+1)*VEL_MAX;
	Emitters[0].StartVelocityRange.X.Min=(HNormal.x-1)*VEL_MAX;
	Emitters[0].StartVelocityRange.Y.Max=(HNormal.y+1)*VEL_MAX;
	Emitters[0].StartVelocityRange.Y.Min=(HNormal.y-1)*VEL_MAX;
	Emitters[0].StartVelocityRange.Z.Max=(HNormal.z+1)*VEL_Z_MAX;
	Emitters[0].StartVelocityRange.Z.Min=(HNormal.z-1)*VEL_MAX/2;
}


// Decompiled with UE Explorer.
defaultproperties
{
    Emitters[0]=SuperSpriteEmitter'SuperSpriteEmitter148'
    Emitters[1]=SuperSpriteEmitter'SuperSpriteEmitter18'
    AutoDestroy=true
}