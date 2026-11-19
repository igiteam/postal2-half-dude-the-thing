//=============================================================================
// LookTarget
//
// A convenience actor that you can point a matinee camera at.
//
// Isn't bStatic so you can attach these to movers and such.
//
//=============================================================================
class LookTarget extends KeyPoint
	hidecategories(Collision,Lighting,LightColor,Karma,Force,Shadow,Sound)
	native;

// Sprite.
#exec Texture Import File=Textures\lookattarget.bmp Name=S_LookTarget Mips=Off MASKED=1
#exec Texture Import File=Textures\target.bmp Name=S_Target Mips=Off MASKED=1


// Decompiled with UE Explorer.
defaultproperties
{
    bStatic=false
    bNoDelete=true
    Texture=Texture'S_Target'
}