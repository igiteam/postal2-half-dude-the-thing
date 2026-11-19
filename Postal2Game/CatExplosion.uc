class CatExplosion extends MeatExplosion;


const DIST_FOR_FULL_BLAST	=	150;
const VEL_MAX = 300;


///////////////////////////////////////////////////////////////////////////////
// Based on how close the hurting thing was to the cat that made this explosion
// like a shotgun blast, change the explosiveness of the effect,
// farther away==less explosive
///////////////////////////////////////////////////////////////////////////////
function ReduceMagBasedOnProx(vector FiringLoc, float mag)
{
	local int i;
	local float pct, dist;

	dist = VSize(Location - FiringLoc)/mag;

	if(dist < DIST_FOR_FULL_BLAST)
		pct = 1.0;
	else
		pct = DIST_FOR_FULL_BLAST/dist;

	for(i=0; i<Emitters.Length; i++)
	{
		Emitters[i].StartVelocityRange.X.Max*=pct;
		Emitters[i].StartVelocityRange.X.Min*=pct;
		Emitters[i].StartVelocityRange.Y.Max*=pct;
		Emitters[i].StartVelocityRange.Y.Min*=pct;
		Emitters[i].StartVelocityRange.Z.Max*=pct;
		Emitters[i].StartVelocityRange.Z.Min*=pct;
		Emitters[i].LifetimeRange.Max*=pct;
		Emitters[i].LifetimeRange.Min*=pct;
	}
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
function FitToNormal(vector HNormal)
{
	local int i;

	// Don't do this to the last one
	for(i=0; i<Emitters.Length-1; i++)
	{
		Emitters[i].StartVelocityRange.X.Max+=HNormal.x*VEL_MAX;
		Emitters[i].StartVelocityRange.Y.Max+=HNormal.y*VEL_MAX;
		Emitters[i].StartVelocityRange.Z.Max+=HNormal.z*VEL_MAX;
		Emitters[i].StartVelocityRange.X.Min-=HNormal.x*VEL_MAX;
		Emitters[i].StartVelocityRange.Y.Min-=HNormal.y*VEL_MAX;
		Emitters[i].StartVelocityRange.Z.Min-=HNormal.z*VEL_MAX;
/*
		Emitters[0].VelocityLossRange.X.Max=abs(HNormal.x*VEL_LOSS);
		Emitters[0].VelocityLossRange.X.Min=Emitters[0].VelocityLossRange.X.Max;
		Emitters[0].VelocityLossRange.Y.Max=abs(HNormal.y*VEL_LOSS);
		Emitters[0].VelocityLossRange.Y.Min=Emitters[0].VelocityLossRange.Y.Max;
		Emitters[0].VelocityLossRange.Z.Max=abs(HNormal.z*VEL_LOSS);
		Emitters[0].VelocityLossRange.Z.Min=Emitters[0].VelocityLossRange.Z.Max;
		*/
	}
}


// Decompiled with UE Explorer.
defaultproperties
{
    Emitters[0]=SpriteEmitter'SpriteEmitter243'
    Emitters[1]=MeshEmitter'MeshEmitter11'
    Emitters[2]=SpriteEmitter'SpriteEmitter244'
    AutoDestroy=true
}