//=============================================================================
// A camera, used in UnrealEd.
//=============================================================================
class Camera extends PlayerController
	native;

// Sprite.
#exec Texture Import File=Textures\S_Camera.pcx Name=S_Camera Mips=Off MASKED=1


// Decompiled with UE Explorer.
defaultproperties
{
    Location=(X=-500.0000000,Y=-300.0000000,Z=300.0000000)
    Texture=Texture'S_Camera'
    CollisionRadius=16.0000000
    CollisionHeight=39.0000000
    LightBrightness=100.0000000
    LightRadius=16.0000000
    bDirectional=true
}