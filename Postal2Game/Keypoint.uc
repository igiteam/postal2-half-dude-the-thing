//=============================================================================
// Keypoint, the base class of invisible actors which mark things.
//=============================================================================
class Keypoint extends Actor
	abstract
	placeable
	native;

// Sprite.
#exec Texture Import File=Textures\keypoint.bmp Name=S_Keypoint Mips=Off MASKED=1


// Decompiled with UE Explorer.
defaultproperties
{
    bStatic=true
    bHidden=true
    Texture=Texture'S_Keypoint'
    DrawScale=0.2500000
    SoundVolume=0
    CollisionRadius=10.0000000
    CollisionHeight=10.0000000
}