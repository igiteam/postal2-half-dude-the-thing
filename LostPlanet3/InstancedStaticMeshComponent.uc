class InstancedStaticMeshComponent extends StaticMeshComponent
    editinlinenew
    hidecategories(Object);

struct native atomicwhencooked immutablewhencooked InstancedStaticMeshInstanceData
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Transform;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL LightmapUVBias;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL ShadowmapUVBias;

    structdefaultproperties
    {
        Transform=(XPlane=(W=0.0000000,X=0.0000000,Y=0.0000000,Z=0.0000000),YPlane=(W=0.0000000,X=0.0000000,Y=0.0000000,Z=0.0000000),ZPlane=(W=0.0000000,X=0.0000000,Y=0.0000000,Z=0.0000000),WPlane=(W=0.0000000,X=0.0000000,Y=0.0000000,Z=0.0000000))
        LightmapUVBias=(X=0.0000000,Y=0.0000000)
        ShadowmapUVBias=(X=0.0000000,Y=0.0000000)
    }
};

struct native InstancedStaticMeshMappingInfo
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Mapping[268435457];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL LightMap[268435457];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL LightmapTexture;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL ShadowmapTexture;

    structdefaultproperties
    {
        LightmapTexture=none
        ShadowmapTexture=none
    }
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize transient array PerInstanceData;
var(*) /*0x35EA0000-0x00000000*/ private array PerInstanceSMData[268435457];
var(*) /*0x35EA0000-0x00000000*/ private int NumPendingLightmaps[536870913];
var(*) /*0x35EA0000-0x00000000*/ private int ComponentJoinKey;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array CachedMappings[536870913];
var(*) /*0x2B260000-0x00000000*/ private int InstancingRandomSeed[65537];
var(*) /*0x15190000-0x00000000*/ private int InstanceStartCullDistance[65537];
var(*) /*0x15190000-0x00000000*/ private int InstanceEndCullDistance[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL SelectedInstances[268566529];
var(*) /*0x35EA0000-0x00000000*/ private bool bDontResolveInstancedLightmaps;
