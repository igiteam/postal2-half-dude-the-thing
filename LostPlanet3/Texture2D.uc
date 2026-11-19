class Texture2D extends Texture
    hidecategories(Object);

struct native Texture2DMipMap
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Data[268435457];
    var(*) /*0x35EA0000-0x00000000*/ private int SizeX[268435457];
    var(*) /*0x35EA0000-0x00000000*/ private int SizeY[268435457];
};

struct TextureLinkedListMirror
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Element[268566529];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Next[268566529];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL PrevLink[268566529];
};

var(*) /*0x35EA0000-0x00000000*/ private @NULL Mips[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL CachedPVRTCMips[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL CachedATITCMips[268566529];
var(*) /*0x35EA0000-0x00000000*/ private int CachedFlashMipsMaxResolution[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL CachedFlashMips[268566529];
var(*) /*0x35EA0000-0x00000000*/ private int SizeX[131073];
var(*) /*0x35EA0000-0x00000000*/ private int SizeY[131073];
var(*) /*0x35EA0000-0x00000000*/ private int OriginalSizeX[131073];
var(*) /*0x35EA0000-0x00000000*/ private int OriginalSizeY[131073];
var(*) /*0x35EA0000-0x00000000*/ private byte Format[131073];
var(*) /*0x4C150000-0x00000000*/ private byte AddressX[65537];
var(*) /*0x4C150000-0x00000000*/ private byte AddressY[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bIsStreamable[537001985];
var(*) /*0x35EA0000-0x00000000*/ private bool bHasCancelationPending[537001985];
var(*) /*0x35EA0000-0x00000000*/ private bool bHasBeenLoadedFromPersistentArchive[537001985];
var(*) /*0x35EA0000-0x00000000*/ private bool bForceMiplevelsToBeResident[536870913];
var(*) /*0x4C150000-0x00000000*/ private bool bGlobalForceMipLevelsToBeResident[196609];
var(*) /*0x4C150000-0x00000000*/ private bool bIsCompositingSource[196609];
var(*) /*0x35EA0000-0x00000000*/ private bool bHasBeenPaintedInEditor;
var(*) /*0x35EA0000-0x00000000*/ private float ForceMipLevelsToBeResidentTimestamp[536870913];
var(*) /*0x35EA0000-0x00000000*/ private name TextureFileCacheName;
var(*) /*0x35EA0000-0x00000000*/ private @NULL TextureFileCacheGuid[268566529];
var(*) /*0x35EA0000-0x00000000*/ private int RequestedMips[537001985];
var(*) /*0x35EA0000-0x00000000*/ private int ResidentMips[537001985];
var(*) /*0x4C150000-0x00000000*/ private int MipsToRemoveOnCompress[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL PendingMipChangeRequestStatus[805437441];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array SystemMemoryData;
var(*) /*0x35EA0000-0x00000100*/ private @NULL StreamableTexturesLink[268566529];
var(*) /*0x35EA0000-0x00000000*/ private int StreamingIndex[537001985];
var(*) /*0x35EA0000-0x00000000*/ private int MipTailBaseIdx[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ResourceMem[805437441];
var(*) /*0x35EA0000-0x00000000*/ private int FirstResourceMemMip[131073];
var(*) /*0x35EA0000-0x00000000*/ private float Timer[805437441];

// Export UTexture2D::execSetForceMipLevelsToBeResident(FFrame&, void* const)
native final function SetForceMipLevelsToBeResident()
{
    local /*0x35EA0000-0x00000000*/ private float Seconds[8388609];
    local /*0x35EA0000-0x00000000*/ private int CinematicTextureGroups[9437185];

    0                
}

// Export UTexture2D::execCreate(FFrame&, void* const)
native static final function Create()
{
    local /*0x35EA0000-0x00000000*/ private int InSizeX[8388609], InSizeY;
    local /*0x35EA0000-0x00000000*/ private byte InFormat[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    2                    
}

defaultproperties
{
    StreamingIndex=-1
}