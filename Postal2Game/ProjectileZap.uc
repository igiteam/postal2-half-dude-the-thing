///////////////////////////////////////////////////////////////////////////////
// ProjectileZap
// Lightning bolt that shoots out of the awbosseye and
// Makes projectiles fall the ground uselessly
// 
///////////////////////////////////////////////////////////////////////////////
class ProjectileZap extends P2Emitter;

var float HitTime;
var float HitRange;

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
function PointHere(vector useloc, Actor zapme, bool bNoActor)
{
	if(Emitters.Length > 0)
	{
		if(bNoActor)
		{
			BeamEmitter(Emitters[0]).DetermineEndPointBy = PTEP_OffsetAsAbsolute;
		}
		else
			BeamEmitter(Emitters[0]).BeamEndPoints[0].ActorTag = zapme.Tag;
		BeamEmitter(Emitters[0]).BeamEndPoints[0].Offset.X.Max = useloc.x + HitRange;
		BeamEmitter(Emitters[0]).BeamEndPoints[0].Offset.X.Min = useloc.x - HitRange;
		BeamEmitter(Emitters[0]).BeamEndPoints[0].Offset.Y.Max = useloc.y + HitRange;
		BeamEmitter(Emitters[0]).BeamEndPoints[0].Offset.Y.Min = useloc.y - HitRange;
		BeamEmitter(Emitters[0]).BeamEndPoints[0].Offset.Z.Max = useloc.z + HitRange;
		BeamEmitter(Emitters[0]).BeamEndPoints[0].Offset.Z.Min = useloc.z - HitRange;
	}
}

auto state Hitting
{
Begin:
	Sleep(HitTime);
	SelfDestroy();
}


// Decompiled with UE Explorer.
defaultproperties
{
    HitTime=0.5000000
    HitRange=30.0000000
    Emitters[0]=BeamEmitter'BeamEmitter4'
    AutoDestroy=true
}