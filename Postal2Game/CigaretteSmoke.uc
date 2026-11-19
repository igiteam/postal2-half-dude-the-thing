//=============================================================================
// CigaretteSmoke.
//=============================================================================
class CigaretteSmoke extends P2Emitter;

#exec TEXTURE IMPORT File=Textures\CigGlow.dds
#exec TEXTURE IMPORT File=Textures\CigSmoke3.dds
/*
var float SizeChange;

auto state Rise
{
	function Tick(float DeltaTime)
	{
		Emitters[0].StartSizeRange.X.Max+=(SizeChange*DeltaTime);
		Emitters[0].StartSizeRange.X.Min+=(SizeChange*DeltaTime);
	}
	
	function BeginState()
	{
		SizeChange=-(2*Emitters[0].StartSizeRange.X.Max)/(LifeSpan+1);
	}
}
*/

// Decompiled with UE Explorer.
defaultproperties
{
    Emitters[0]=SpriteEmitter'SpriteEmitter62'
    Emitters[1]=SpriteEmitter'SpriteEmitter63'
    DrawScale=0.0250000
}