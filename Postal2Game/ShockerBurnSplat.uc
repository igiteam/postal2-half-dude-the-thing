///////////////////////////////////////////////////////////////////////////////
// ShockerBurnSplat.
// dark spot from an electrical burn
///////////////////////////////////////////////////////////////////////////////
class ShockerBurnSplat extends Splat;

simulated function PostBeginPlay()
{
	SetDrawScale(DrawScale + Frand()/3);
	Super.PostBeginPlay();
}


// Decompiled with UE Explorer.
defaultproperties
{
    ProjTexture=FinalBlend'nathans.Skins.tazerhitblend'
    DrawScale=0.2500000
}