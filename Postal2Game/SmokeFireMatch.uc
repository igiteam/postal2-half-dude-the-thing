//=============================================================================
// SmokeFireMatch.
//=============================================================================
class SmokeFireMatch extends Wemitter;

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


// Decompiled with UE Explorer.
defaultproperties
{
    Emitters[0]=StripEmitter'StripEmitter1'
    AutoDestroy=true
    LifeSpan=20.0000000
}