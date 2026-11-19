// ====================================================================
// ====================================================================
class xCTFBase extends CTFBase;

simulated event PostBeginPlay()
{
	local vector Offset;

	Super.PostBeginPlay();

	// Position babe on surface and start her moving
	// (this must occur on the client side!)
	Offset.Z = 27.0;
	SetLocation(Location + Offset);
	PlayAnim('home');
}

simulated function AnimEnd(int Channel)
{
	if ( Level.NetMode == NM_Client || Level.NetMode == NM_ListenServer )
	{
		if (Channel == 0)
		{
			if (FRand() < 0.8)
				PlayAnim('home');
			else
				PlayAnim('home2');
		}
	}
}


// Decompiled with UE Explorer.
defaultproperties
{
    DrawType=2
    Mesh=SkeletalMesh'MP_Strippers.MP_PostalBabe_Jeans'
    AmbientGlow=100
    CollisionRadius=120.0000000
    CollisionHeight=40.0000000
}