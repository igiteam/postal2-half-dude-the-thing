//=============================================================================
// The end point for the trail. No visuals involved, only collision and physics
//=============================================================================
class AnthTrailMidPoint extends AnthTrailPoint;

function PostBeginPlay()
{
	// Don't call super
	VelocityMax = Emitters[0].MaxAbsVelocity;
}


// Decompiled with UE Explorer.
defaultproperties
{
    Emitters[0]=SuperSpriteEmitter'SuperSpriteEmitter19'
    Emitters[1]=SuperSpriteEmitter'SuperSpriteEmitter166'
    Emitters[2]=SuperSpriteEmitter'SuperSpriteEmitter202'
}