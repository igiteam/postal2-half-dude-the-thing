class AnimNotify_Effect extends AnimNotify
	native;

var() class<Actor> EffectClass;
var() name Bone;
var() vector OffsetLocation;
var() rotator OffsetRotation;
var() bool Attach;
var() name Tag;
var() float DrawScale;
var() vector DrawScale3D;

var private transient Actor LastSpawnedEffect;	// Valid only in the editor.



// Decompiled with UE Explorer.
defaultproperties
{
    DrawScale=1.0000000
    DrawScale3D=(X=1.0000000,Y=1.0000000,Z=1.0000000)
}