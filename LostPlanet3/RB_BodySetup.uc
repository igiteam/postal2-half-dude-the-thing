class RB_BodySetup extends KMeshProps
    hidecategories(Object);

enum ESleepFamily
{
    SF_Normal,                      // 0
    SF_Sensitive,                   // 1
    SF_MAX                          // 2
};

struct KCachedConvexDataElement
{
    var(*) /*0x35EA0000-0x00000000*/ private array ConvexElementData[268435457];
};

struct KCachedConvexData
{
    var(*) /*0x35EA0000-0x00000000*/ private array CachedConvexElements[268435457];
};

var(*) /*0x3FDB0000-0x00000000*/ private byte SleepFamily[65537];
var(*) /*0x3FDB0000-0x00000000*/ private const name BoneName[65537];
var(*) /*0x3FDB0000-0x00000000*/ private bool bFixed[65537];
var(*) /*0x3FDB0000-0x00000000*/ private bool bNoCollision[65537];
var(*) /*0x3FDB0000-0x00000000*/ private bool bBlockZeroExtent[65537];
var(*) /*0x3FDB0000-0x00000000*/ private bool bBlockNonZeroExtent[65537];
var(*) /*0x3FDB0000-0x00000000*/ private bool bEnableContinuousCollisionDetection[65537];
var(*) /*0x3FDB0000-0x00000000*/ private bool bAlwaysFullAnimWeight[65537];
var(*) /*0x3FDB0000-0x00000000*/ private bool bConsiderForBounds[65537];
var(*) /*0x3FDB0000-0x00000000*/ private @NULL PhysMaterial[65537];
var(*) /*0x3FDB0000-0x00000000*/ private float MassScale[65537];
var(*) /*0x35EA0000-0x00000000*/ private array CollisionGeom[268566529];
var(*) /*0x35EA0000-0x00000000*/ private array CollisionGeomScale3D[268566529];
var(*) /*0x3FDB0000-0x00000000*/ private editfixedsize array PreCachedPhysScale[196609];
var(*) /*0x35EA0000-0x00000000*/ private array PreCachedPhysData[268566529];
var(*) /*0x35EA0000-0x00000000*/ private int PreCachedPhysDataVersion[131073];

defaultproperties
{
    bBlockZeroExtent=true
    bBlockNonZeroExtent=true
    bConsiderForBounds=true
    MassScale=1.0000000
}