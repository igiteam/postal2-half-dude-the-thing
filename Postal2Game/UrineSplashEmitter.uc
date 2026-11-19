
//=============================================================================
// Urine splash for a stream of wee pouring on a surface
//=============================================================================
class UrineSplashEmitter extends FluidSplashEmitter;

const VEL_MAX			=   40;

function FitToNormal(vector HNormal)
{
	if(Emitters.Length > 0)
	{
		Emitters[0].StartVelocityRange.X.Max=(HNormal.x+1)*VEL_MAX;
		Emitters[0].StartVelocityRange.X.Min=(HNormal.x-1)*VEL_MAX;
		Emitters[0].StartVelocityRange.Y.Max=(HNormal.y+1)*VEL_MAX;
		Emitters[0].StartVelocityRange.Y.Min=(HNormal.y-1)*VEL_MAX;
		Emitters[0].StartVelocityRange.Z.Max=(HNormal.z+1)*VEL_MAX;
		Emitters[0].StartVelocityRange.Z.Min=(HNormal.z-1)*VEL_MAX;
		//SpriteEmitter(Emitters[1]).ProjectionNormal = HNormal;
	}
}


// Decompiled with UE Explorer.
defaultproperties
{
    Emitters[0]=SuperSpriteEmitter'SuperSpriteEmitter7'
    AutoDestroy=true
}