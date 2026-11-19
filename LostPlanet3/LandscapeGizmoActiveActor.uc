class LandscapeGizmoActiveActor extends LandscapeGizmoActor
    notplaceable
    hidecategories(AnimDependency,Navigation);

enum ELandscapeGizmoType
{
    LGT_None,                       // 0
    LGT_Height,                     // 1
    LGT_Weight,                     // 2
    LGT_MAX                         // 3
};

struct native GizmoSelectData
{
    var(*) /*0x35EA0000-0x00000000*/ private float Ratio;
    var(*) /*0x35EA0000-0x00000000*/ private float HeightData;
    var(*) /*0x35EA0000-0x00000000*/ private map{VOID,VOID} WeightDataMap[268435457];

    structdefaultproperties
    {
        Ratio=0.0000000
        HeightData=0.0000000
    }
};

var(*) /*0x35EA0000-0x00000000*/ private byte DataType[536870913];
var(*) /*0x35EA0000-0x00000000*/ private map{VOID,VOID} SelectedData[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL GizmoTexture;
var(*) /*0x35EA0000-0x00000000*/ private @NULL TextureScale;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array SampledHeight;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array SampledNormal;
var(*) /*0x35EA0000-0x00000000*/ private int SampleSizeX;
var(*) /*0x35EA0000-0x00000000*/ private int SampleSizeY;
var(*) /*0x35EA0000-0x00000000*/ private float CachedWidth;
var(*) /*0x35EA0000-0x00000000*/ private float CachedHeight;
var(*) /*0x35EA0000-0x00000000*/ private float CachedScaleXY;
var(*) /*0x35EA0000-0x00000000*/ private @NULL FrustumVerts[536870920];
var(*) /*0x35EA0000-0x00000000*/ private @NULL GizmoMaterial;
var(*) /*0x35EA0000-0x00000000*/ private @NULL GizmoDataMaterial;
var(*) /*0x35EA0000-0x00000000*/ private @NULL GizmoMeshMaterial;
var(*) /*0x35EA0000-0x00000000*/ private @NULL GizmoMeshMaterial2;
var(*) /*0x2D9F0000-0x00000000*/ private const editfixedsize array LayerNames[65537];

defaultproperties
{
    bEditable=true
}