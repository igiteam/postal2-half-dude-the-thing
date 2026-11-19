class ShadowBitmapMaterial extends BitmapMaterial
	native;

#exec Texture Import file=Textures\blobshadow.tga Name=BlobTexture Mips=On UCLAMPMODE=CLAMP VCLAMPMODE=CLAMP DXT=3

var const transient int	TextureInterfaces[2];

var Actor	ShadowActor;
var vector	LightDirection;
var float	LightDistance,
			LightFOV;
var bool	Dirty,
			Invalid,
			bBlobShadow;
var float   CullDistance;
var byte	ShadowDarkness;

var BitmapMaterial	BlobShadow;


//
//	Default properties
//


// Decompiled with UE Explorer.
defaultproperties
{
    Dirty=true
    ShadowDarkness=255
    BlobShadow=Texture'BlobTexture'
    Format=5
    UClampMode=1
    VClampMode=1
    UBits=7
    VBits=7
    USize=128
    VSize=128
    UClamp=128
    VClamp=128
}