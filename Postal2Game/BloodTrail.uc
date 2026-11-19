//=============================================================================
// a trail of blood on a surface
//=============================================================================
class BloodTrail extends FluidTrail;

const LOCATION_RANGE_MAX=   5;

function FitToNormal(vector HNormal)
{
	local int i;

	HNormal.x = 1-abs(HNormal.x);
	HNormal.y = 1-abs(HNormal.y);
	HNormal.z = 1-abs(HNormal.z);

	for(i=0; i<Emitters.Length; i++)
	{
		Emitters[i].StartLocationRange.X.Max=HNormal.x*LOCATION_RANGE_MAX;
		Emitters[i].StartLocationRange.X.Min=-Emitters[i].StartLocationRange.X.Max;
		Emitters[i].StartLocationRange.Y.Max=HNormal.y*LOCATION_RANGE_MAX;
		Emitters[i].StartLocationRange.Y.Min=-Emitters[i].StartLocationRange.Y.Max;
		Emitters[i].StartLocationRange.Z.Max=HNormal.z*LOCATION_RANGE_MAX;
		Emitters[i].StartLocationRange.Z.Min=-Emitters[i].StartLocationRange.Z.Max;
	}
}


// Decompiled with UE Explorer.
defaultproperties
{
    DripTrailClass=Class'BloodDripTrail'
    UseColRadius=40.0000000
    MyType=3
    Emitters[0]=SuperSpriteEmitter'SuperSpriteEmitter155'
    AutoDestroy=true
    LifeSpan=30.0000000
}