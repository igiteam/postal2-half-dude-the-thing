class Texture2DDynamic extends Texture
    hidecategories(Object);

var(*) /*0x35EA0000-0x00000000*/ private int SizeX[805306369];
var(*) /*0x35EA0000-0x00000000*/ private int SizeY[805306369];
var(*) /*0x35EA0000-0x00000000*/ private byte Format[805306369];
var(*) /*0x35EA0000-0x00000000*/ private int NumMips[805306369];
var(*) /*0x35EA0000-0x00000000*/ private bool bIsResolveTarget[805306369];

// Export UTexture2DDynamic::execInit(FFrame&, void* const)
native final function Init()
{
    local /*0x35EA0000-0x00000000*/ private int InSizeX[8388609], InSizeY;
    local /*0x35EA0000-0x00000000*/ private byte InFormat[9437185];
    local /*0x35EA0000-0x00000000*/ private bool InIsResolveTarget[9437185];

    2
    false                        
}

// Export UTexture2DDynamic::execUpdateMip(FFrame&, void* const)
native function UpdateMip()
{
    local /*0x35EA0000-0x00000000*/ private int MipIdx[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array MipData[25296897];


}

// Export UTexture2DDynamic::execUpdateMipFromJPEG(FFrame&, void* const)
native function UpdateMipFromJPEG()
{
    local /*0x35EA0000-0x00000000*/ private int MipIdx[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array MipData[25296897];


}

// Export UTexture2DDynamic::execCreate(FFrame&, void* const)
native static final function Create()
{
    local /*0x35EA0000-0x00000000*/ private int InSizeX[8388609], InSizeY;
    local /*0x35EA0000-0x00000000*/ private byte InFormat[9437185];
    local /*0x35EA0000-0x00000000*/ private bool InIsResolveTarget[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    2
    false                        
}

defaultproperties
{
    NeverStream=true
}