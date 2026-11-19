class TerrainComponent extends PrimitiveComponent;

struct TerrainPatchBounds
{
    var(*) /*0x35EA0000-0x00000000*/ private float MinHeight;
    var(*) /*0x35EA0000-0x00000000*/ private float MaxHeight;
    var(*) /*0x35EA0000-0x00000000*/ private float MaxDisplacement;

    structdefaultproperties
    {
        MinHeight=0.0000000
        MaxHeight=0.0000000
        MaxDisplacement=0.0000000
    }
};

struct TerrainMaterialMask
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL BitMask;
    var(*) /*0x35EA0000-0x00000000*/ private int NumBits;

    structdefaultproperties
    {
        BitMask=none
        NumBits=0
    }
};

struct TerrainBVTree
{
    var(*) /*0x35EA0000-0x00000000*/ private array Nodes[268566529];
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ShadowMaps[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array IrrelevantLights[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL TerrainObject[805437441];
var(*) /*0x35EA0000-0x00000000*/ private int SectionBaseX[131073];
var(*) /*0x35EA0000-0x00000000*/ private int SectionBaseY[131073];
var(*) /*0x35EA0000-0x00000000*/ private int SectionSizeX[131073];
var(*) /*0x35EA0000-0x00000000*/ private int SectionSizeY[131073];
var(*) /*0x35EA0000-0x00000000*/ private int TrueSectionSizeX[131073];
var(*) /*0x35EA0000-0x00000000*/ private int TrueSectionSizeY[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL LightMap[268566529];
var(*) /*0x35EA0000-0x00000000*/ private array PatchBounds[805437441];
var(*) /*0x35EA0000-0x00000000*/ private array BatchMaterials[805437441];
var(*) /*0x35EA0000-0x00000000*/ private int FullBatch[805437441];
var(*) /*0x35EA0000-0x00000000*/ private @NULL BVTree[805437441];
var(*) /*0x35EA0000-0x00000000*/ private array CollisionVertices[805437441];
var(*) /*0x35EA0000-0x00000000*/ private @NULL RBHeightfield[268566529];
var(*) /*0x35EA0000-0x00000000*/ private bool bDisplayCollisionLevel[131073];
