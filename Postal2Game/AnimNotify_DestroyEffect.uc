class AnimNotify_DestroyEffect extends AnimNotify
	native;

var() name DestroyTag;			// Tag of effect to destroy
var() bool bExpireParticles;	// If true, lets particles expire before destroying



// Decompiled with UE Explorer.
defaultproperties
{
    bExpireParticles=true
}