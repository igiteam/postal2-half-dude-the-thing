class Texture2DComposite extends Texture
    hidecategories(Object);

struct native SourceTexture2DRegion
{
    var(*) /*0x35EA0000-0x00000000*/ private int OffsetX;
    var(*) /*0x35EA0000-0x00000000*/ private int OffsetY;
    var(*) /*0x35EA0000-0x00000000*/ private int SizeX;
    var(*) /*0x35EA0000-0x00000000*/ private int SizeY;
    var(*) /*0x35EA0000-0x00000000*/ private int DestOffsetX;
    var(*) /*0x35EA0000-0x00000000*/ private int DestOffsetY;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Texture2D;

    structdefaultproperties
    {
        OffsetX=0
        OffsetY=0
        SizeX=0
        SizeY=0
        DestOffsetX=0
        DestOffsetY=0
        Texture2D=none
    }
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array SourceRegions;
var(*) /*0x35EA0000-0x00000000*/ private int MaxTextureSize;
var(*) /*0x35EA0000-0x00000000*/ private int DestSizeX;
var(*) /*0x35EA0000-0x00000000*/ private int DestSizeY;

// Export UTexture2DComposite::execSourceTexturesFullyStreamedIn(FFrame&, void* const)
native final function SourceTexturesFullyStreamedIn()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UTexture2DComposite::execUpdateCompositeTexture(FFrame&, void* const)
native final function UpdateCompositeTexture()
{
    local /*0x35EA0000-0x00000000*/ private int NumMipsToGenerate[8388609];


}

// Export UTexture2DComposite::execResetSourceRegions(FFrame&, void* const)
native final function ResetSourceRegions();
