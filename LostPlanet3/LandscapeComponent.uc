class LandscapeComponent extends PrimitiveComponent
    hidecategories(Display,Attachment,Physics,Debug,Lighting,Collision,Movement,Rendering,PrimitiveComponent,Object);

struct native WeightmapLayerAllocationInfo
{
    var(*) /*0x35EA0000-0x00000000*/ private name LayerName;
    var(*) /*0x35EA0000-0x00000000*/ private byte WeightmapTextureIndex;
    var(*) /*0x35EA0000-0x00000000*/ private byte WeightmapTextureChannel;

    structdefaultproperties
    {
        LayerName="None"
        WeightmapTextureIndex=0
        WeightmapTextureChannel=0
    }
};

var(*) /*0x2D9D0000-0x00000000*/ private const int SectionBaseX[196609];
var(*) /*0x2D9D0000-0x00000000*/ private const int SectionBaseY[196609];
var(*) /*0x35EA0000-0x00000000*/ private int ComponentSizeQuads[131073];
var(*) /*0x35EA0000-0x00000000*/ private int SubsectionSizeQuads[131073];
var(*) /*0x35EA0000-0x00000000*/ private int NumSubsections[131073];
var(*) /*0x2D9D0000-0x00000000*/ private @NULL OverrideMaterial[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL MaterialInstance;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array WeightmapLayerAllocations[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array WeightmapTextures[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL WeightmapScaleBias;
var(*) /*0x35EA0000-0x00000000*/ private float WeightmapSubsectionOffset;
var(*) /*0x35EA0000-0x00000000*/ private @NULL HeightmapScaleBias;
var(*) /*0x35EA0000-0x00000000*/ private @NULL HeightmapTexture[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL CachedBoxSphereBounds[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL CachedLocalBox[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL LightingGuid[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ShadowMaps[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array IrrelevantLights[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL LightMap[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL EditToolRenderData[268435457];
var(*) /*0x35EA0000-0x00000000*/ private int CollisionMipLevel[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL PlatformData[268435457];
var(*) /*0x35EA0000-0x00000000*/ private int PlatformDataSize[268566529];
var(*) /*0x35EA0000-0x00000000*/ private bool bNeedPostUndo[536870913];
var(*) /*0x2F830000-0x00000000*/ private int ForcedLOD[65537];
var(*) /*0x35EA0000-0x00000000*/ private byte NeighborLOD[8];
var(*) /*0x35EA0000-0x00000000*/ private byte NeighborLODBias[8];
var(*) /*0x2F830000-0x00000000*/ private int LODBias[65537];
