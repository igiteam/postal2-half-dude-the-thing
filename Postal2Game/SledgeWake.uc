///////////////////////////////////////////////////////////////////////////////
// SledgeWake
// 
// Blurry effect of particles behind the spinning sledgehammer
//
///////////////////////////////////////////////////////////////////////////////
class SledgeWake extends P2Emitter;

///////////////////////////////////////////////////////////////////////////////
// Set the projection normal that the particles fit to
///////////////////////////////////////////////////////////////////////////////
function ChangeDirection(vector NewNormal)
{
	if(Emitters.Length > 0)
		if(SpriteEmitter(Emitters[0]) != None)
			SpriteEmitter(Emitters[0]).ProjectionNormal=NewNormal;
}


// Decompiled with UE Explorer.
defaultproperties
{
    Emitters[0]=SpriteEmitter'SpriteEmitter22'
    AutoDestroy=true
    RemoteRole=0
}