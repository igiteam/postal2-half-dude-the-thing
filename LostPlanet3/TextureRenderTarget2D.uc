class TextureRenderTarget2D extends TextureRenderTarget
    hidecategories(Object,Texture);

var(*) /*0x4C4F0000-0x00000000*/ private int SizeX[196609];
var(*) /*0x4C4F0000-0x00000000*/ private int SizeY[196609];
var(*) /*0x35EA0000-0x00000000*/ private byte Format[131073];
var(*) /*0x4C4F0000-0x00000000*/ private byte AddressX[65537];
var(*) /*0x4C4F0000-0x00000000*/ private byte AddressY[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ClearColor[131073];
var(*) /*0x4C4F0000-0x00000000*/ private bool bForceLinearGamma[537067521];

// Export UTextureRenderTarget2D::execCreate(FFrame&, void* const)
native static final function Create()
{
    local /*0x35EA0000-0x00000000*/ private int InSizeX[8388609], InSizeY;
    local /*0x35EA0000-0x00000000*/ private byte InFormat[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL InClearColor[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bOnlyRenderOnce[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    2                                    
}

defaultproperties
{
    Format=EPixelFormat.PF_A8R8G8B8
    ClearColor=(R=0.0000000,G=1.0000000,B=0.0000000,A=1.0000000)
}