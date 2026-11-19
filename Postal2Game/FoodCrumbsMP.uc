///////////////////////////////////////////////////////////////////////////////
// FoodCrumbsMP.
//
// Food crumbs made when some pawn eats something.
//
///////////////////////////////////////////////////////////////////////////////
class FoodCrumbsMP extends P2Emitter;

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
simulated function PostBeginPlay()
{
	local int i;
	local vector usevel;

	Super.PostBeginPlay();

	usevel.x = Rotation.Pitch;
	if(usevel.x > 32768)
		usevel.x-=65536;
	usevel.y = Rotation.Yaw;
	if(usevel.y > 32768)
		usevel.y-=65536;
	usevel.z = Rotation.Roll;
	if(usevel.z > 32768)
		usevel.z-=65536;
	for(i=0; i<Emitters.Length; i++)
	{
		Emitters[i].StartVelocityRange.X.Min+=usevel.x;
		Emitters[i].StartVelocityRange.X.Max+=usevel.x;
		Emitters[i].StartVelocityRange.Y.Min+=usevel.y;
		Emitters[i].StartVelocityRange.Y.Max+=usevel.y;
		Emitters[i].StartVelocityRange.Z.Min+=usevel.z;
		Emitters[i].StartVelocityRange.Z.Max+=usevel.z;
	}
}


// Decompiled with UE Explorer.
defaultproperties
{
    Emitters[0]=SpriteEmitter'SpriteEmitter9'
    LifeSpan=10.0000000
}